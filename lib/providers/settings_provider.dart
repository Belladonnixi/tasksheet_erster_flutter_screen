import 'package:erster_flutter_screen/data/mock_database_repository.dart';
import 'package:erster_flutter_screen/models/settings_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:convert';

part 'settings_provider.g.dart';

final Logger _logger = Logger('Providers');

// stellt eine Instanz von MockDatabaseRepository bereit
@riverpod
Future<MockDatabaseRepository> mockDatabaseRepository(Ref ref) async {
  _logger.info('Creating MockDatabaseRepository');
  return await MockDatabaseRepository.create();
}

// stellt eine Liste von SettingsItems bereit
// die von MockDatabaseRepository geholt werden deshlab auch als FutureProvider
// weil ich in MockDatabaseRepository auch eine async Verzögerung extra eingebaut habe
@riverpod
Future<Map<SettingsCategory, List<SettingsItem>>> settingsItems(Ref ref) async {
  // Die Instanz von MockDatabaseRepository wird mit ref.watch() beobachtet.
  final repository = await ref.watch(mockDatabaseRepositoryProvider.future);
  _logger.info('Fetching settings items');

  // Holen der Daten aus dem Repository.
  final data = await repository.getSettingsItems();

  // Logge die tatsächlichen Daten (serialisierbar machen nur für Logging, nicht die Map ändern)
  final serializableData = data.map(
    (key, value) => MapEntry(
      key.name, // Kategorie als String
      value.map((item) => item.toJson()).toList(), // Items als JSON
    ),
  );
  _logger.info('Settings items fetched: ${jsonEncode(serializableData)}');

  // Gib die ursprüngliche Map zurück (Schlüssel bleiben `SettingsCategory`)
  return data;
}
