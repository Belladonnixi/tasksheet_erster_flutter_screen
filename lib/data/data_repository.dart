import 'package:erster_flutter_screen/model/settings_item.dart';

abstract class DataRepository {
  Future<List<SettingsItem>> getSettingsItems();
}
