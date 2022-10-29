import 'package:flutter/material.dart';
import 'package:flutter_projeto_03_receitas/components/main_drawer.dart';
import 'package:flutter_projeto_03_receitas/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen(this.onSettingsChanged, this.settings, {super.key});

  final Settings settings;
  final Function(Settings) onSettingsChanged;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late Settings settings;
  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: ((value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Configurações')),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(7),
              child: Text(
                'Config',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            Expanded(
              child: ListView(children: [
                _createSwitch(
                  'Vegano',
                  'Exibir comidas veganas',
                  settings.isVegan,
                  (value) => setState((() => settings.isVegan = value)),
                ),
                _createSwitch(
                  'Vegetarianas',
                  'Exibir comidas vegetarias',
                  settings.isVegetarian,
                  (value) => setState((() => settings.isVegetarian = value)),
                ),
              ]),
            )
          ],
        ));
  }
}
