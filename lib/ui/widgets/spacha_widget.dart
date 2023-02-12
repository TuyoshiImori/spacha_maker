import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spacha_maker/themes/app_colors.dart';
import 'package:spacha_maker/utils/theme_text.dart';

Widget spachaWidget({
  required BuildContext context,
  required String name,
  required int price,
  required String message,
  required bool isCorner,
  File? iconImage,
}) {
  Color widgetColor() {
    if (100 <= price && price <= 199) {
      return spachaBlue;
    } else if (200 <= price && price <= 499) {
      return spachaCyan;
    } else if (500 <= price && price <= 999) {
      return spachaGreen;
    } else if (1000 <= price && price <= 1999) {
      return spachaYellow;
    } else if (2000 <= price && price <= 4999) {
      return spachaOrange;
    } else if (5000 <= price && price <= 9999) {
      return spachaMagenta;
    } else if (10000 <= price) {
      return spachaRed;
    }
    return spachaBlue;
  }

  Color widgetLightColor() {
    if (200 <= price && price <= 499) {
      return spachaLightCyan;
    } else if (500 <= price && price <= 999) {
      return spachaLightGreen;
    } else if (1000 <= price && price <= 1999) {
      return spachaLightYellow;
    } else if (2000 <= price && price <= 4999) {
      return spachaLightOrange;
    } else if (5000 <= price && price <= 9999) {
      return spachaLightMagenta;
    } else if (10000 <= price) {
      return spachaLightRed;
    }
    return spachaBlue;
  }

  Color nameTextColor() {
    if ((100 <= price && price <= 499) || (2000 <= price)) {
      return white.withOpacity(0.6);
    } else if (500 <= price && price <= 1999) {
      return black.withOpacity(0.6);
    }
    return white.withOpacity(0.6);
  }

  Color messageTextColor() {
    if (price <= 4999) {
      return black;
    } else {
      return white;
    }
  }

  final formatter = NumberFormat('#,###');
  final width = MediaQuery.of(context).size.width - 32;
  final height = width * (2 * sqrt(2) - 1) / 3;
  return Column(
    children: [
      Container(
        height: 70,
        decoration: BoxDecoration(
          borderRadius: isCorner
              ? const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                )
              : null,
          color: widgetColor(),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Row(
            children: [
              iconImage != null
                  ? CircleAvatar(
                      child: ClipOval(
                        child: Image.file(
                          iconImage,
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : const CircleAvatar(
                      radius: 24,
                      backgroundColor: spachaLightYellow,
                      child: Headline6Text(
                        'S',
                        color: white,
                        textAlign: TextAlign.end,
                        bottomPadding: 0,
                      ),
                    ),
              SizedBox(
                width: width - 112,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Subtitle1Text(
                        name != '' ? name : '名前',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        color: nameTextColor(),
                      ),
                      Subtitle1Text(
                        '¥ ${formatter.format(price)}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      //if (price >= 200)
      ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: height - 70,
        ),
        child: Container(
          width: width,
          decoration: BoxDecoration(
            borderRadius: isCorner
                ? const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )
                : null,
            color: widgetLightColor(),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: BodyText1Text(
              message,
              //maxLines: 5,
              color: messageTextColor(),
              overflow: TextOverflow.fade,
            ),
          ),
        ),
      ),
    ],
  );
}
