import 'package:flutter/material.dart';

class FloatingCustomActionButton extends StatelessWidget {
  final String label;
  final bool disabled;
  final void Function() onPressed;

  FloatingCustomActionButton({
    @required this.label,
    this.disabled = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) => FloatingActionButton.extended(
        label: Row(
          children: <Widget>[
            Container(
              child: const Icon(Icons.add),
              margin: EdgeInsets.only(right: !disabled ? 4.0 : 0),
            ),
            ...(!disabled ? [Text(label)] : [])
          ],
        ),
        backgroundColor: disabled ? Colors.grey : null,
        disabledElevation: 2,
        isExtended: !disabled,
        onPressed: !disabled ? onPressed : null,
      );
}
