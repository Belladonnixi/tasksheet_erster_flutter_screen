import 'package:flutter/material.dart';

// Kategorien für die Einstellungen
enum SettingsCategory {
  account,
  info,
}

extension SettingsCategoryExtension on SettingsCategory {
  String get name {
    print('Calling name for $this');
    switch (this) {
      case SettingsCategory.account:
        return 'Account';
      case SettingsCategory.info:
        return 'Info';
    }
  }
}

// Die Model class für ein Einstellungs-item das es auch möglich macht die Kategorien als String zu bekommen
class SettingsItem {
  SettingsItem({
    required this.category,
    required this.icon,
    required this.title,
    this.onTap,
  });

  final SettingsCategory category;
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  String get categoryTitle => category.name;

  // JSON-Repräsentation für Logging
  Map<String, dynamic> toJson() => {
        'category': category.name,
        'icon': icon.codePoint, // IconData als Integer speichern
        'title': title,
      };
}
