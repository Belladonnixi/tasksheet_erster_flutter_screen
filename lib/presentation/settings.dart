import 'package:erster_flutter_screen/models/settings_item.dart';
import 'package:erster_flutter_screen/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

final Logger _logger = Logger('SettingsScreen');

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Beobachtet den SettingsItemsProvider und aktualisiert das Widget, wenn sich die Daten ändern.
    final settingsItemsAsyncValue = ref.watch(settingsItemsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Einstellungen',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Divider(
            color: Theme.of(context).colorScheme.primary,
            thickness: 1.0,
          ),
        ),
      ),
      // Die Daten werden basierend auf dem Status des AsyncValue-Objekts geladen.
      body: settingsItemsAsyncValue.when(
        data: (groupedItems) {
          _logger.info(
              'Grouped items: ${groupedItems.entries.map((e) => 'Key: ${e.key}, Type: ${e.key.runtimeType}').toList()}');
          return Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Iteriere über die Map, um Kategorien und deren Items darzustellen.
                    for (var entry in groupedItems.entries) ...[
                      // Kategoriename
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24.0,
                          vertical: 16.0,
                        ),
                        child: Text(
                          entry.key.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Listenelemente der Kategorie
                      for (var item in entry.value)
                        ListTile(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 24),
                          leading: Icon(item.icon),
                          title: Text(item.title),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: item.onTap,
                        ),
                    ],
                  ],
                ),
              ),
              // Bereich am unteren Rand der Seite mit Buttons
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      onPressed: () => _logger.info('Ausloggen tapped'),
                      child: const Text(
                        'Ausloggen',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => _logger.info('Account löschen tapped'),
                      child: const Text(
                        'Account löschen',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        // Ladeindikator anzeigen
        loading: () => const Center(child: CircularProgressIndicator()),
        // Fehlerindikator anzeigen
        error: (error, stack) {
          _logger.severe('Error: $error', error, stack);
          return const Center(
            child: Text('An error occurred. Please try again.'),
          );
        },
      ),
    );
  }
}
