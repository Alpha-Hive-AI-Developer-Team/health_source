import 'package:flutter/material.dart';

import '../widgets/help_tile.dart';
import '../widgets/settings_scaffold.dart';

class HelpSupportView extends StatelessWidget {
  const HelpSupportView({super.key});

  @override
  Widget build(BuildContext context) => SettingsScaffold(
    title: 'Help & Support',
    child: const Column(
      children: [
        HelpTile('How do I add a new patient?'),
        HelpTile('How can I update patient information?'),
        HelpTile('How do I start a new scan?'),
        HelpTile('How do I change my password?'),
      ],
    ),
  );
}
