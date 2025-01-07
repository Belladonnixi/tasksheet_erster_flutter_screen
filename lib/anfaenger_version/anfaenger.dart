import 'package:flutter/material.dart';

// Mögliche Anfänger Version eventuell?

// Definition für ein ListItem
class ListItem {
  ListItem(this.icon, this.title);
  final IconData icon;
  final String title;
}

class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, List<ListItem>> itemsMap = {
      'Account': [
        ListItem(Icons.language, 'App-Sprache'),
        ListItem(Icons.block, 'Blockierte User'),
      ],
      'Info': [
        ListItem(Icons.info, 'Datenschutzerklärung'),
        ListItem(Icons.gavel, "AGB's"),
        ListItem(Icons.article, 'Lizenzen'),
        ListItem(Icons.group, 'Community Richtlinien'),
      ],
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Einstellungen',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Divider(
            color: Theme.of(context).colorScheme.primary,
            thickness: 1.0,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: itemsMap.entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          entry.key,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Column(
                        children: entry.value.map((item) {
                          return ListTile(
                            leading: Icon(item.icon),
                            title: Text(item.title),
                            trailing: const Icon(
                              Icons.chevron_right,
                            ),
                            onTap: () {
                              print('${item.title} tapped');
                            },
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              // Minimiert die Größe der Leiste, basierend auf dem Inhalt, da Columns ansonsnten die gesamte verfügbare Höhe einnehmen.
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () => print('Ausloggen tapped'),
                  child: const Text(
                    'Ausloggen',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => print('Account löschen tapped'),
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
      ),
    );
  }
}
