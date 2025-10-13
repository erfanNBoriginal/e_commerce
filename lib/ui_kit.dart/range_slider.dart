import 'package:flutter/material.dart' as M;
import 'ui_kit.dart' as U;
import 'package:e_commerce/tool_kit/tool_kit.dart' as T;

enum RangeSliderShowType { int, double, price }

class RangeSlider extends M.StatelessWidget {
  //
  final double minValue;

  final double maxValue;

  final double minRangeValue;

  final double maxRangeValue;

  final int? divisions;

  final RangeSliderShowType showType;

  final M.Widget? sign;

  final void Function(double min, double max) onChanged;

  const RangeSlider({
    super.key,
    required this.minValue,
    required this.maxValue,
    required this.minRangeValue,
    required this.maxRangeValue,
    required this.onChanged,
    this.showType = RangeSliderShowType.double,
    this.divisions,
    this.sign,
  });

  String get minRangeString {
    switch (showType) {
      case RangeSliderShowType.double:
        return minRangeValue.toString();
      case RangeSliderShowType.int:
        return minRangeValue.round().toString();
      case RangeSliderShowType.price:
        return T.Convertors.priceToText(minRangeValue.round());
    }
  }

  String get maxRangeString {
    switch (showType) {
      case RangeSliderShowType.double:
        return maxRangeValue.toString();
      case RangeSliderShowType.int:
        return maxRangeValue.toInt().toString();
      case RangeSliderShowType.price:
        return T.Convertors.priceToText(maxRangeValue.round());
    }
  }

  @override
  M.Widget build(M.BuildContext context) {
    return M.Column(
      children: [
        M.Row(
          children: [
            M.Expanded(
              child: M.RangeSlider(
                min: minValue,
                max: maxValue,
                divisions: divisions,
                activeColor: U.Theme.primary,
                inactiveColor: U.Theme.gray,
                values: M.RangeValues(minRangeValue, maxRangeValue),
                onChanged: (range) => onChanged(range.start, range.end),
              ),
            ),
          ],
        ),
        M.Padding(
          padding: const M.EdgeInsets.symmetric(horizontal: 22),
          child: M.Row(
            children: [
              U.Text('از $minRangeString'),
              if (sign != null) sign!,
              const M.Spacer(),
              U.Text('تا $maxRangeString'),
              if (sign != null) sign!,
            ],
          ),
        ),
      ],
    );
  }
}
