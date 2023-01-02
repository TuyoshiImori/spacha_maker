import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
    state = state.copyWith(
      spacha: const Spacha(
        name: '',
        price: 100,
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

  void messageEdited({required String message}) {
    state = state.copyWith(spacha: state.spacha?.copyWith(message: message));
  }

  Future<void> exportToImage({required RenderRepaintBoundary boundary}) async {
    final image = await boundary.toImage(pixelRatio: 5);
    final byteData = await image.toByteData(
      format: ui.ImageByteFormat.png,
    );
    final pngBytes = byteData!.buffer.asUint8List();
    await ImageGallerySaver.saveImage(
      pngBytes,
      quality: 100,
    );
  }
}
