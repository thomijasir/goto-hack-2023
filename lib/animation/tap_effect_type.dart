import 'package:asphalt_aloha/asphalt_aloha.dart';
import 'package:flutter/material.dart';

enum TapEffectType { tile, cta, row }

extension TapEffectTypeExtension on TapEffectType {
  AlohaBoxDecoration decoration(
    BuildContext context,
    BoxBorder? border,
    BorderRadiusGeometry? borderRadius,
  ) {
    switch (this) {
      case TapEffectType.tile:
      case TapEffectType.cta:
      case TapEffectType.row:
        return AlohaBoxDecoration(
          color: AlohaTheme.of(context).colors.fillBackgroundSecondary,
          border: border,
          borderRadius: borderRadius,
          gradient: AlohaTheme.of(context)
              .lightEffect
              .lightEffectDimHighIntensity
              .toLinearGradient(),
        );
    }
  }
}
