import 'package:flutter/material.dart';

// Kategorien für die Einstellungen
enum SettingsCategory {
  account,
  info,
}

// Die Model class für ein Einstellungs-item das es auch möglich macht die Kategorien als String zu bekommen
class SettingsItem {
  final SettingsCategory category;
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  SettingsItem({
    required this.category,
    required this.icon,
    required this.title,
    this.onTap,
  });

  String get categoryTitle {
    switch (category) {
      case SettingsCategory.account:
        return 'Account';
      case SettingsCategory.info:
        return 'Info';
    }
  }
}
