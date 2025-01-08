import 'package:erster_flutter_screen/data/data_repository.dart';
import 'package:erster_flutter_screen/data/settings_data.dart';
import 'package:erster_flutter_screen/models/settings_item.dart';
import 'package:logging/logging.dart';

final Logger _logger = Logger('MockDatabaseRepository');

class MockDatabaseRepository implements DataRepository {
  MockDatabaseRepository._privateConstructor();

  static final MockDatabaseRepository _instance =
      MockDatabaseRepository._privateConstructor();

  factory MockDatabaseRepository() {
    return _instance;
  }

  @override
  Future<List<SettingsItem>> getSettingsItems() async {
    _logger.info('Fetching settings items from MockDatabaseRepository');
    return Future.delayed(
      const Duration(
          milliseconds: 500), // Ich habe eine Simulierte Latenz eingebaut
      () => settingsItems,
    );
  }
}
