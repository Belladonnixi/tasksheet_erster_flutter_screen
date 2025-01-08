import 'package:erster_flutter_screen/data/mock_database_repository.dart';
import 'package:erster_flutter_screen/models/settings_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// stellt eine Instanz von MockDatabaseRepository bereit
final mockDatabaseRepositoryProvider = Provider<MockDatabaseRepository>((ref) {
  return MockDatabaseRepository();
});

// stellt eine Liste von SettingsItems bereit
// die von MockDatabaseRepository geholt werden deshlab auch als FutureProvider
// weil ich in MockDatabaseRepository auch eine async Verzögerung extra eingebaut habe
final settingsItemsProvider = FutureProvider<List<SettingsItem>>((ref) async {
  // die Instanz von MockDatabaseRepository wird geholt indem wir den vorher erstellten Provider beobachten
  final repository = ref.watch(mockDatabaseRepositoryProvider);
  // Die Methode wird aufgerufen um eine Liste von SettingsItems zu bekommen
  return repository.getSettingsItems();
});
