import 'package:flutter/material.dart';

import '../theme/theme.dart';

class AgeSlider extends StatefulWidget {
  const AgeSlider({super.key});

  @override
  _AgeSliderState createState() => _AgeSliderState();
}

class _AgeSliderState extends State<AgeSlider> {
  double _currentValue = 6; // Valor inicial em meses

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //! Label
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Idade',
            style: theme.textTheme.titleSmall,
          ),
        ),

        const SizedBox(height: 10),
        //! Slider
        Column(
          children: [
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.grey[300],
                inactiveTrackColor: Colors.grey[300],
                thumbColor: AppColors.primaryColor,
                overlayColor: AppColors.primaryColor.withOpacity(0.2),
                thumbShape:
                    const RoundSliderThumbShape(enabledThumbRadius: 12.0),
                trackHeight: 8.0,
              ),
              child: Slider(
                value: _currentValue,
                min: 6,
                max: 96, //?Equivale a 8 anos
                divisions: 4,
                onChanged: (value) {
                  setState(() {
                    _currentValue = value;
                  });
                },
              ),
            ),
            //! Intervalo
            Text(
              _currentValue >= 96
                  ? '(8 anos ou mais)' //
                  : '(${_formatAge(_currentValue)} - ${_formatAgeRange(_currentValue)})',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.textGreyColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('6 meses', style: theme.textTheme.bodySmall),
            Text('2 anos', style: theme.textTheme.bodySmall),
            Text('4 anos', style: theme.textTheme.bodySmall),
            Text('6 anos', style: theme.textTheme.bodySmall),
            Text('8 anos', style: theme.textTheme.bodySmall),
          ],
        ),
      ],
    );
  }

  //! Função para formatar o valor atual em meses ou anos
  String _formatAge(double value) {
    if (value < 12) {
      return '${value.round()} meses';
    } else {
      return '${(value / 12).round()} anos';
    }
  }

  //! Função para formatar o intervalo final
  String _formatAgeRange(double value) {
    if (value < 12) {
      return '2 anos';
    } else {
      return '${(value / 12).round() + 2} anos';
    }
  }
}
