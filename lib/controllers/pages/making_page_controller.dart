import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/rendering.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image/image.dart' as img;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spacha_maker/models/models.dart';

part 'making_page_controller.freezed.dart';

@freezed
class MakingPageState with _$MakingPageState {
  const factory MakingPageState({
    Spacha? spacha,
    File? iconImage,
    @Default(false) bool isCorner,
    @Default(false) bool isSaving,
    @Default(true) bool isAblePdf,
    @Default(0) double spachaWidgetHeight,
  }) = _MakingPageState;
}

final makingPageProvider =
    StateNotifierProvider.autoDispose<MakingPageController, MakingPageState>(
        (ref) {
  return MakingPageController();
});

class MakingPageController extends StateNotifier<MakingPageState> {
  MakingPageController() : super(const MakingPageState()) {
    _init();
  }

  Future<void> _init() async {
    ///アプリのトラッキング
    final status = await AppTrackingTransparency.trackingAuthorizationStatus;
    if (status == TrackingStatus.notDetermined) {
      //ATTの許可/不許可がまだ得られていない場合
      await AppTrackingTransparency.requestTrackingAuthorization();
    }

    state = state.copyWith(
      spacha: const Spacha(
        name: '',
        price: 1000,
        message: '',
      ),
    );
  }

  Future<void> iconEdited() async {
    final picker = ImagePicker();
    final pickedImageFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImageFile == null) {
      return;
    }
    final croppedImageFile = await ImageCropper().cropImage(
      compressQuality: 80,
      sourcePath: pickedImageFile.path,
      cropStyle: CropStyle.circle,
      maxWidth: 1024,
      maxHeight: 1024,
    );
    if (croppedImageFile != null) {
      state = state.copyWith(iconImage: File(croppedImageFile.path));
    }
  }

  void decideIcon(File iconImage) {
    state = state.copyWith(iconImage: iconImage);
  }

  void nameEdited({required String name}) {
    state = state.copyWith(spacha: state.spacha?.copyWith(name: name));
  }

  void priceEdited({required int price}) {
    state = state.copyWith(spacha: state.spacha?.copyWith(price: price));
  }

  void setSpachaHeight({required double height}) {
    state = state.copyWith(spachaWidgetHeight: height);
  }

  void messageEdited({
    required String message,
  }) {
    state = state.copyWith(spacha: state.spacha?.copyWith(message: message));
  }

  Future<void> comparisonHeight({
    required double height,
    required double limitHeight,
  }) async {
    if (limitHeight < height && state.isAblePdf) {
      state = state.copyWith(isAblePdf: false);
    } else if (limitHeight >= height && !state.isAblePdf) {
      state = state.copyWith(isAblePdf: true);
    }
  }

  void switchCorner() {
    state = state.copyWith(isCorner: !state.isCorner);
  }

  void switchSaving() {
    state = state.copyWith(isSaving: !state.isSaving);
  }

  Future<Uint8List> exportToImage({
    required RenderRepaintBoundary boundary,
    required double pixelRatio,
    required bool isSave,
  }) async {
    final image = await boundary.toImage(pixelRatio: pixelRatio);
    final byteData = await image.toByteData(
      format: ui.ImageByteFormat.png,
    );
    final pngBytes = byteData!.buffer.asUint8List();
    if (isSave) {
      await ImageGallerySaver.saveImage(
        pngBytes,
        quality: 100,
      );
    }
    final decodeImage = img.decodeImage(pngBytes);
    if (decodeImage != null) {
      final rotatedImage = img.copyRotate(decodeImage, 90);
      return Uint8List.fromList(img.encodeJpg(rotatedImage));
    }
    return pngBytes;
  }
}
