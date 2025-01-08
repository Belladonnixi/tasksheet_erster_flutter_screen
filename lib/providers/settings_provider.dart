import 'package:erster_flutter_screen/data/mock_database_repository.dart';
import 'package:erster_flutter_screen/models/settings_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

final Logger _logger = Logger('Providers');

// stellt eine Instanz von MockDatabaseRepository bereit
final mockDatabaseRepositoryProvider = Provider<MockDatabaseRepository>((ref) {
  _logger.info('Creating MockDatabaseRepository');
  return MockDatabaseRepository();
});

// stellt eine Liste von SettingsItems bereit
// die von MockDatabaseRepository geholt werden deshlab auch als FutureProvider
// weil ich in MockDatabaseRepository auch eine async Verzögerung extra eingebaut habe
final settingsItemsProvider = FutureProvider<List<SettingsItem>>((ref) async {
  // die Instanz von MockDatabaseRepository wird geholt indem wir den vorher erstellten Provider beobachten
  final repository = ref.watch(mockDatabaseRepositoryProvider);
  _logger.info('fetching settings items');
  // Die Methode wird aufgerufen um eine Liste von SettingsItems zu bekommen
  return repository.getSettingsItems();
});
