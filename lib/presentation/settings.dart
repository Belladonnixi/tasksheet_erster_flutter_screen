import 'package:erster_flutter_screen/data/mock_database_repository.dart';
import 'package:erster_flutter_screen/model/settings_item.dart';
import 'package:erster_flutter_screen/model/settings_section.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

final Logger _logger = Logger('SettingsScreen');

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MockDatabaseRepository repository = MockDatabaseRepository();

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
      body: FutureBuilder<List<SettingsItem>>(
        future: repository.getSettingsItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No settings items available'));
          }

          final settingsItems = snapshot.data!;
          final Map<SettingsCategory, List<SettingsItem>> groupedItems = {};
          for (var item in settingsItems) {
            groupedItems.putIfAbsent(item.category, () => []).add(item);
          }

          final List<SettingsSection> sections =
              groupedItems.entries.map((entry) {
            return SettingsSection(items: entry.value);
          }).toList();

          return ListView.builder(
            itemCount: sections.length,
            itemBuilder: (context, sectionIndex) {
              final section = sections[sectionIndex];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
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
                  ...section.items.map(
                    (item) {
                      return ListTile(
                        leading: Icon(item.icon),
                        title: Text(
                          item.title,
                          style: const TextStyle(fontSize: 16),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: item.onTap,
                      );
                    },
                  ),
                  if (sectionIndex < sections.length - 1)
                    const SizedBox(height: 16.0),
                ],
              );
            },
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
