import 'package:flutter/material.dart';
import 'package:candle/utils/colors.dart';


enum TextType { sm, body, subtitle, title, xl }

const double fontSize = 14.0;
//Scale factors as found in VelocityX package
const double scaleFactorBase = 1;
const double scaleFactorLg = 1.120;
const double scaleFactorXl = 1.25;
const double scaleFactorXl2 = 1.5;
const double scaleFactorXl3 = 1.875;
const double scaleFactorXl4 = 2.25;
const double scaleFactorXl5 = 3;
const double scaleFactorXl6 = 4;

class AppText extends StatelessWidget {
  final String text;
  final TextType type;
  final Color color;
  final TextAlign align;
  final double scaleFactor;
  final FontWeight weight;
  final bool underline;

  const AppText(
      {@required this.text,
      @required this.type,
      this.color,
      this.align,
      this.scaleFactor,
      this.weight,
      this.underline = false,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            color: color ?? _colorByTextType(type),
            fontSize: fontSize,

            fontWeight: weight ?? FontWeight.normal,
            decoration: underline ? TextDecoration.underline : null),
        textScaleFactor: scaleFactor ?? _scaleFactorByTextType(type),
        textAlign: align ?? TextAlign.start);
  }

  Color _colorByTextType(TextType type) {
    Color _color = Colors.black87;

    switch (type) {
      case TextType.sm:
        _color = Colors.black87;
        break;
      case TextType.body:
        _color = Colors.black87;
        break;
      case TextType.subtitle:
        _color = Colors.black54;
        break;
      case TextType.title:
        _color = AppColors.kGreen;
        break;
      case TextType.xl:
        _color = Colors.black87;
        break;
      default:
        break;
    }

    return _color;
  }

  double _scaleFactorByTextType(TextType type) {
    double _factor = scaleFactorBase;

    switch (type) {
      case TextType.sm:
        _factor = scaleFactorBase;
        break;
      case TextType.body:
        _factor = scaleFactorLg;
        break;
      case TextType.subtitle:
        _factor = scaleFactorXl;
        break;
      case TextType.title:
        _factor = scaleFactorXl2;
        break;
      case TextType.xl:
        _factor = scaleFactorXl3;
        break;
      default:
        break;
    }

    return _factor;
  }
}
