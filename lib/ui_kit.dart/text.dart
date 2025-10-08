import 'package:flutter/material.dart' as M;
import 'package:flutter/widgets.dart';

enum TextFont { iranSans, yekan }

enum TextSize { s10, s11, s14, s16, s18, s48, s34, s24 }

enum TextWeight { regular, semiBold, medium, bold }

class Text extends M.StatelessWidget {
  final String text;
  final TextFont font;
  final bool lineThrough;
  final TextSize fontSize;
  final TextWeight weight;
  final M.Color? color;
  const Text(
    this.text, {
    super.key,
    this.lineThrough = false,
    this.font = TextFont.iranSans,
    this.weight = TextWeight.medium,
    this.fontSize = TextSize.s14,
    this.color,
  });
  String get _font {
    switch (font) {
      case TextFont.iranSans:
        return 'IranSans';
      case TextFont.yekan:
        return 'Yekan';
    }
  }

  double get _size {
    switch (fontSize) {
      case TextSize.s10:
        return 10;
      case TextSize.s11:
        return 11;
      case TextSize.s14:
        return 14;
      case TextSize.s16:
        return 16;
      case TextSize.s18:
        return 18;
      case TextSize.s48:
        return 48;
      case TextSize.s34:
        return 34;
      case TextSize.s24:
        return 34;
    }
  }

  FontWeight get _weight {
    switch (weight) {
      case TextWeight.regular:
        return FontWeight.w400;
      case TextWeight.semiBold:
        return FontWeight.w600;
      case TextWeight.medium:
        return FontWeight.w500;
      case TextWeight.bold:
        return FontWeight.w700;
    }
  }

  @override
  M.Widget build(M.BuildContext context) {
    return M.Text(
      text,
      style: M.TextStyle(
        fontFamily: _font,
        fontWeight: _weight,
        overflow: TextOverflow.fade,
        decoration:
            lineThrough ? TextDecoration.lineThrough : TextDecoration.none,
        color: color,
        fontSize: _size,
      ),
    );
  }
}
