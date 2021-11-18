import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:smart_home_app/controllers/LightsController.dart';
import 'package:smart_home_app/utils/AppAssets.dart';
import 'package:smart_home_app/utils/AppSpaces.dart';
import 'package:smart_home_app/widgets/buttons.dart';

class LightsScreen extends StatelessWidget {
  const LightsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LightsController>(
      init: LightsController(),
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(children: [
            TopSelectButton(),
            AppSpaces.vertical10,
            Container(
              height: (Get.width - 60) / 3,
              child: Obx(
                () => Row(children: [
                  HomeButton(
                    image: AppAssets.light,
                    isSelected: controller.index.value == 0,
                    text: 'Lights',
                    unSelectedImageColor: Colors.black,
                    onTap: () => controller.index.value = 0,
                    fontSize: 16,
                  ),
                  AppSpaces.horizontal10,
                  HomeButton(
                    image: AppAssets.temperature,
                    isSelected: controller.index.value == 1,
                    text: 'Tempature',
                    onTap: () => controller.index.value = 1,
                    unSelectedImageColor: Colors.black,
                    fontSize: 16,
                  ),
                  AppSpaces.horizontal10,
                  HomeButton(
                    image: AppAssets.humidity,
                    isSelected: controller.index.value == 2,
                    text: 'Humidity',
                    unSelectedImageColor: Colors.black,
                    onTap: () => controller.index.value = 2,
                    fontSize: 16,
                  ),
                ]),
              ),
            ),
            AppSpaces.vertical20,
            Text(
              'Intensity',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w200,
              ),
            ),
            AppSpaces.vertical10,
            Image.asset(
              AppAssets.sun,
              height: 40,
            ),
            AppSpaces.vertical10,
            Expanded(
              child: RotatedBox(
                quarterTurns: 3,
                child: SliderTheme(
                  data: SliderThemeData(
                    activeTrackColor: Get.theme.primaryColor,
                    inactiveTrackColor: Get.theme.disabledColor,
                    thumbColor: Colors.transparent,
                    overlayColor: Colors.transparent,
                    thumbSelector: (textDirection, values, tapValue, thumbSize, trackSize, dx) => Thumb.start,
                    thumbShape: RoundSliderThumbShape(
                      enabledThumbRadius: 1,
                      elevation: 0.0,
                    ),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 1),
                    trackHeight: Get.width / 3,
                    trackShape: CustomRoundedRectSliderTrackShape(Radius.circular(12)),
                  ),
                  child: Obx(
                    () => Slider(
                      onChanged: (value) => controller.sliderData.value = value,
                      min: 0,
                      max: 100,
                      value: controller.sliderData.value,
                    ),
                  ),
                ),
              ),
            ),
            AppSpaces.vertical20,
            Obx(
              () => FlutterSwitch(
                value: controller.switchData.value,
                onToggle: (value) => controller.switchData.value = value,
                inactiveColor: Get.theme.disabledColor,
                activeColor: Get.theme.disabledColor,
                padding: 0.0,
                toggleColor: Get.theme.primaryColor,
                toggleSize: 30.0,
                height: 30,
              ),
            ),
            AppSpaces.vertical20,
          ]),
        );
      },
    );
  }
}

class CustomRoundedRectSliderTrackShape extends SliderTrackShape with BaseSliderTrackShape {
  final Radius trackRadius;
  const CustomRoundedRectSliderTrackShape(this.trackRadius);

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required TextDirection textDirection,
    required Offset thumbCenter,
    bool isDiscrete = false,
    bool isEnabled = false,
    double additionalActiveTrackHeight = 2,
  }) {
    assert(sliderTheme.disabledActiveTrackColor != null);
    assert(sliderTheme.disabledInactiveTrackColor != null);
    assert(sliderTheme.activeTrackColor != null);
    assert(sliderTheme.inactiveTrackColor != null);
    assert(sliderTheme.thumbShape != null);
    if (sliderTheme.trackHeight == null || sliderTheme.trackHeight! <= 0) {
      return;
    }

    final ColorTween activeTrackColorTween =
        ColorTween(begin: sliderTheme.disabledActiveTrackColor, end: sliderTheme.activeTrackColor);
    final ColorTween inactiveTrackColorTween =
        ColorTween(begin: sliderTheme.disabledInactiveTrackColor, end: sliderTheme.inactiveTrackColor);
    final Paint leftTrackPaint = Paint()..color = activeTrackColorTween.evaluate(enableAnimation)!;
    final Paint rightTrackPaint = Paint()..color = inactiveTrackColorTween.evaluate(enableAnimation)!;

    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );

    var activeRect = RRect.fromLTRBAndCorners(
      trackRect.left,
      trackRect.top - (additionalActiveTrackHeight / 2),
      thumbCenter.dx,
      trackRect.bottom + (additionalActiveTrackHeight / 2),
      topLeft: trackRadius,
      bottomLeft: trackRadius,
    );
    var inActiveRect = RRect.fromLTRBAndCorners(
      thumbCenter.dx,
      trackRect.top,
      trackRect.right,
      trackRect.bottom,
      topRight: trackRadius,
      bottomRight: trackRadius,
    );
    var percent = ((activeRect.width / (activeRect.width + inActiveRect.width)) * 100).toInt();
    if (percent > 99) {
      activeRect = RRect.fromLTRBAndCorners(
        trackRect.left,
        trackRect.top - (additionalActiveTrackHeight / 2),
        thumbCenter.dx,
        trackRect.bottom + (additionalActiveTrackHeight / 2),
        topLeft: trackRadius,
        bottomLeft: trackRadius,
        bottomRight: trackRadius,
        topRight: trackRadius,
      );
    }

    if (percent < 1) {
      inActiveRect = RRect.fromLTRBAndCorners(
        thumbCenter.dx,
        trackRect.top,
        trackRect.right,
        trackRect.bottom,
        topRight: trackRadius,
        bottomRight: trackRadius,
        bottomLeft: trackRadius,
        topLeft: trackRadius,
      );
    }
    context.canvas.drawRRect(
      activeRect,
      leftTrackPaint,
    );

    context.canvas.drawRRect(
      inActiveRect,
      rightTrackPaint,
    );

    drawText(context.canvas, '%$percent', activeRect.center.dx, activeRect.center.dy, pi * 0.5, activeRect.width);
  }

  void drawText(Canvas context, String name, double x, double y, double angleRotationInRadians, double height) {
    context.save();
    var span = TextSpan(style: TextStyle(color: Colors.white, fontSize: height >= 24.0 ? 24.0 : height), text: name);
    var tp = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    tp.layout();
    context.translate((x + (tp.height * 0.5)), (y - (tp.width * 0.5)));
    context.rotate(angleRotationInRadians);
    tp.layout();
    tp.paint(context, new Offset(0.0, 0.0));
    context.restore();
  }
}
