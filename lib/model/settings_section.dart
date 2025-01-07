// Die Model class für eine Einstellungs-Sektion in der ich die SettingsItems in einer Liste speichere
import 'package:erster_flutter_screen/model/settings_item.dart';

class SettingsSection {
  final List<SettingsItem> items;

  SettingsSection({required this.items});

  String get header {
    return items.first.categoryTitle;
  }
}
