import 'package:erster_flutter_screen/models/settings_item.dart';
import 'package:erster_flutter_screen/models/settings_section.dart';
import 'package:erster_flutter_screen/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

final Logger _logger = Logger('SettingsScreen');

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // beobachtet den SettingsItemsProvider und aktualisiert das Widget, wenn sich die Daten ändern
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
      // Die Daten werden basierend auf dem Status des AsyncValue-Objekts geladen
      body: settingsItemsAsyncValue.when(
        data: (settingsItems) {
          final Map<SettingsCategory, List<SettingsItem>> groupedItems = {};
          for (var item in settingsItems) {
            // `putIfAbsent` fügt die Kategorie hinzu, wenn sie nicht existiert, und gibt eine leere Liste zurück.
            groupedItems.putIfAbsent(item.category, () => []).add(item);
          }

          // Erstelle eine Liste von SettingsSections aus den gruppierten Daten.
          final List<SettingsSection> sections =
              groupedItems.entries.map((entry) {
            // erstellt eine Sectioorien für jede Kategorie
            return SettingsSection(items: entry.value);
          }).toList();

          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: sections.length,
            itemBuilder: (context, sectionIndex) {
              final section = sections[sectionIndex];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Kategorie Titel wird angezeigt
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      section.header,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // mit dem Spread-Operator werden die Items in der Liste angezeigt so iteriert man durch die
                  // Liste um sie als ListTile anzeigen zu können
                  ...section.items.map(
                    (item) {
                      return ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 24.0),
                        leading: Icon(item.icon),
                        title: Text(
                          item.title,
                          style: const TextStyle(fontSize: 16),
                        ),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: item.onTap,
                      );
                    },
                  ),
                  // Abstand nach der Section, wenn es nicht die letzte ist.
                  if (sectionIndex < sections.length - 1)
                    const SizedBox(height: 16.0),
                ],
              );
            },
          );
        },
        // solange die Daten geladen werden, wird ein Ladeindikator angezeigt
        loading: () => const Center(child: CircularProgressIndicator()),
        // zeigt den Fehler an, sollte einer auftreten und loggt die Fehlermeldung
        error: (error, stack) {
          _logger.severe('Error: $error', error, stack);
          return const Center(
            child: Text('An error occurred. Please try again.'),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // Minimiert die Größe der Leiste, basierend auf dem Inhalt, da Columns ansonsnten die gesamte verfügbare Höhe einnehmen.
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
    );
  }
}
