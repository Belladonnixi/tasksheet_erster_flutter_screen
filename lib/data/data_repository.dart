import 'package:erster_flutter_screen/models/settings_item.dart';

abstract class DataRepository {
  Future<List<SettingsItem>> getSettingsItems();
}
