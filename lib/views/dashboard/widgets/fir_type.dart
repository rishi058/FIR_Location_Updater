import 'package:flutter/material.dart';

import '../../../common/constants.dart';
import 'firtype_selector.dart';

class FirType extends StatelessWidget {
  const FirType({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding + 2),
      child: Row(
        children: [
          Text(
            'Fir Type: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          FirTypeSelector(),
        ],
      ),
    );
  }
}
