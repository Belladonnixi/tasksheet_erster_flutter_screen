import 'package:erster_flutter_screen/data/mock_database_repository.dart';
import 'package:erster_flutter_screen/models/settings_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_provider.g.dart';

final Logger _logger = Logger('Providers');

// stellt eine Instanz von MockDatabaseRepository bereit
@riverpod
MockDatabaseRepository mockDatabaseRepository(Ref ref) {
  _logger.info('Creating MockDatabaseRepository');
  return MockDatabaseRepository();
}

// stellt eine Liste von SettingsItems bereit
// die von MockDatabaseRepository geholt werden deshlab auch als FutureProvider
// weil ich in MockDatabaseRepository auch eine async Verzögerung extra eingebaut habe
@riverpod
Future<List<SettingsItem>> settingsItems(Ref ref) async {
  // Die Instanz von MockDatabaseRepository wird mit ref.watch() beobachtet.
  final repository = ref.watch(mockDatabaseRepositoryProvider);
  _logger.info('fetching settings items');

  // Holen der Daten aus dem Repository.
  return await repository.getSettingsItems();
}
