import 'package:erster_flutter_screen/data/settings_data.dart';
import 'package:erster_flutter_screen/model/settings_item.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

final Logger _logger = Logger('SettingsScreen');

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // `groupedItems` ist eine Map, in der jede Kategorie eine Liste von Items hat.
    final Map<SettingsCategory, List<SettingsItem>> groupedItems = {};
    for (var item in settingsItems) {
      // `putIfAbsent` fügt eine neue Kategorie hinzu, falls sie nicht existiert,
      // und fügt anschließend das Item der entsprechenden Liste hinzu.
      // Wenn die Kategorie bereits existiert, wird das Item einfach der Liste hinzugefügt.
      // Das `=> []` erstellt eine leere Liste, falls die Kategorie noch nicht existiert.
      // Anschließend wird das Item zur Liste hinzugefügt.
      groupedItems.putIfAbsent(item.category, () => []).add(item);
    }

    // Erstellt eine Liste von SettingsSection-Widgets, die die Items in jeder Kategorie anzeigen.
    final List<SettingsSection> sections = groupedItems.entries.map((entry) {
      return SettingsSection(items: entry.value);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        // Titel der App-Leiste
        title: const Text(
          'Einstellungen',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        // Fügt eine horizontale Trennlinie direkt unter der App-Leiste hinzu.
        bottom: PreferredSize(
          // Legt die Höhe der Trennlinie fest.
          preferredSize: const Size.fromHeight(1.0),
          child: Divider(
            // Die Farbe der Trennlinie wird aus dem aktuellen Theme genommen.
            color: Theme.of(context).colorScheme.primary,
            thickness: 1.0, // Die Dicke der Trennlinie
          ),
        ),
      ),
      // Der Hauptinhalt der Seite
      body: ListView.builder(
        itemCount: sections.length,
        itemBuilder: (context, sectionIndex) {
          final section = sections[sectionIndex];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Kategorien Titel
              // Padding Fügt einen Abstand hinzu, um dem Inhalt Abstand vom rand zu geben.
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Text(
                  section.header, // Titel der Kategorie
                  style: const TextStyle(
                    fontSize: 18, // Schriftgröße
                    fontWeight: FontWeight.bold, // Fettgedruckt
                  ),
                ),
              ),
              // Erstellt eine Liste von ListTiles für jedes Item im Abschnitt.
              // Der `...`-Operator der sich auch Spread Operator nennt, entpackt die Liste, sodass jedes Item einzeln in die Column eingefügt wird.
              ...section.items.map(
                (item) {
                  return ListTile(
                    leading: Icon(item.icon),
                    title: Text(item.title),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: item.onTap,
                  );
                },
              ),
              // Fügt Abstand zwischen den Abschnitten hinzu, außer beim letzten Abschnitt das wird mit sections.length - 1 sichergestellt.
              if (sectionIndex < sections.length - 1)
                const SizedBox(height: 16.0),
            ],
          );
        },
      ),
      // Eigentlich der Platz für die BottomNavBar in diesem Fall nutze ich sie als Platz für die textButtons
      // ja hätte ich auch in der Colum machen können aber ich wollte mal ausprobieren ob es nicht auch so geht
      // und es machte so das positioning auch einfacher auf dem Screen
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
