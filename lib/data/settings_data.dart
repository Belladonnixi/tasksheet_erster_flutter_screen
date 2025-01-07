import 'package:erster_flutter_screen/model/settings_item.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

final Logger _logger = Logger('SettingsData');

final List<SettingsItem> settingsItems = [
  SettingsItem(
    category: SettingsCategory.account,
    icon: Icons.language,
    title: 'App-Sprache',
    onTap: () => _logger.info('App-Sprache tapped'),
  ),
  SettingsItem(
    category: SettingsCategory.account,
    icon: Icons.block,
    title: 'Blockierte User',
    onTap: () => _logger.info('Blockierte User tapped'),
  ),
  SettingsItem(
    category: SettingsCategory.info,
    icon: Icons.privacy_tip,
    title: 'Datenschutzerklärung',
    onTap: () => _logger.info('Datenschutzerklärung tapped'),
  ),
  SettingsItem(
    category: SettingsCategory.info,
    icon: Icons.gavel,
    title: 'AGB\'s',
    onTap: () => _logger.info('AGB\'s tapped'),
  ),
  SettingsItem(
    category: SettingsCategory.info,
    icon: Icons.receipt_long,
    title: 'Lizenzen',
    onTap: () => _logger.info('Lizenzen tapped'),
  ),
  SettingsItem(
    category: SettingsCategory.info,
    icon: Icons.group,
    title: 'Community Richtlinien',
    onTap: () => _logger.info('Community Richtlinien tapped'),
  ),
];
