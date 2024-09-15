import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/widgets/theme_switch.dart';

//Teil von TabsScreen
class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.only(top: 50),
            child: Text(
              'Flavor Fusion',
              style: GoogleFonts.dancingScript(
                color: const Color.fromARGB(218, 255, 255, 255),
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 4,
                wordSpacing: 5,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.restaurant),
            title: const Text('Meals'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.filter_list),
            title: const Text('Filter'),
            onTap: () {},
          ),
          const Spacer(),
          Container(
            margin: const  EdgeInsets.only(bottom: 50),
            color: const Color.fromARGB(162, 63, 63, 63),
            child: const ListTile(
              leading: Icon(Icons.dark_mode_outlined),
              title: Text('Dark Mode'),
              trailing: ThemeSwitch(),
            ),
          ),
        ],
      ),
    );
  }
}
