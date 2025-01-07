import 'package:erster_flutter_screen/model/settings_item.dart';
import 'package:flutter/material.dart';

final List<SettingsItem> settingsItems = [
  SettingsItem(
    category: SettingsCategory.account,
    icon: Icons.language,
    title: 'App-Sprache',
    onTap: () => print('App-Sprache tapped'),
  ),
  SettingsItem(
    category: SettingsCategory.account,
    icon: Icons.block,
    title: 'Blockierte User',
    onTap: () => print('Blockierte User tapped'),
  ),
  SettingsItem(
    category: SettingsCategory.info,
    icon: Icons.privacy_tip,
    title: 'Datenschutzerklärung',
    onTap: () => print('Datenschutzerklärung tapped'),
  ),
  SettingsItem(
    category: SettingsCategory.info,
    icon: Icons.gavel,
    title: 'AGB\'s',
    onTap: () => print('AGB\'s tapped'),
  ),
  SettingsItem(
    category: SettingsCategory.info,
    icon: Icons.receipt_long,
    title: 'Lizenzen',
    onTap: () => print('Lizenzen tapped'),
  ),
  SettingsItem(
    category: SettingsCategory.info,
    icon: Icons.group,
    title: 'Community Richtlinien',
    onTap: () => print('Community Richtlinien tapped'),
  ),
];
