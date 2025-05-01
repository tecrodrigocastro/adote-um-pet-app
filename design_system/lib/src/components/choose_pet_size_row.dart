import 'package:flutter/material.dart';
import '../../design_system.dart';

class ChoosePetSizeRow extends StatefulWidget {
  const ChoosePetSizeRow({
    super.key,
    required this.label,
    required this.onChanged,
  });

  final String label;
  final ValueChanged<String> onChanged;

  @override
  State<ChoosePetSizeRow> createState() => _ChoosePetSizeRowState();
}

class _ChoosePetSizeRowState extends State<ChoosePetSizeRow> {
  Map<String, bool> buttonStates = {
    'pequeno': true,
    'medio': false,
    'grande': false,
    'enorme': false,
  };

  void toggleSelection(String selected) {
    setState(() {
      buttonStates.updateAll((key, value) => false);

      buttonStates[selected] = true;
    });
    widget.onChanged(selected);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          widget.label,
          style: theme.textTheme.titleSmall,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          child: Row(
            spacing: 10,
            children: [
              SelectableButtonDs(
                width: 100,
                height: 30,
                isSelected: buttonStates['pequeno']!,
                onPressed: () => toggleSelection('pequeno'),
                title: 'Pequeno',
              ),
              SelectableButtonDs(
                width: 100,
                height: 30,
                isSelected: buttonStates['medio']!,
                onPressed: () => toggleSelection('medio'),
                title: 'Médio',
              ),
              SelectableButtonDs(
                width: 100,
                height: 30,
                isSelected: buttonStates['grande']!,
                onPressed: () => toggleSelection('grande'),
                title: 'Grande',
              ),
              SelectableButtonDs(
                width: 100,
                height: 30,
                isSelected: buttonStates['enorme']!,
                onPressed: () => toggleSelection('enorme'),
                title: 'Enorme',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
