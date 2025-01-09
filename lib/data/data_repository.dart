import 'package:erster_flutter_screen/models/settings_item.dart';

abstract class DataRepository {
  Future<Map<SettingsCategory, List<SettingsItem>>> getSettingsItems();
}
