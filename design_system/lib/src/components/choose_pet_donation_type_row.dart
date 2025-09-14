import 'package:flutter/material.dart';
import '../../design_system.dart';

class ChoosePetDonationTypeRow extends StatefulWidget {
  const ChoosePetDonationTypeRow({
    super.key,
    required this.label,
    required this.onChanged,
  });

  final String label;
  final ValueChanged<String> onChanged;

  @override
  State<ChoosePetDonationTypeRow> createState() =>
      _ChoosePetDonationTypeRowState();
}

class _ChoosePetDonationTypeRowState extends State<ChoosePetDonationTypeRow> {
  Map<String, bool> buttonStates = {
    'temporario': true,
    'permanente': false,
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
                isSelected: buttonStates['temporario']!,
                onPressed: () => toggleSelection('temporario'),
                title: 'Temporário',
              ),
              SelectableButtonDs(
                width: 100,
                height: 30,
                isSelected: buttonStates['permanente']!,
                onPressed: () => toggleSelection('permanente'),
                title: 'Permanente',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
