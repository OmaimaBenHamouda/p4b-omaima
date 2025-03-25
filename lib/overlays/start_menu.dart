import 'package:flutter/material.dart';

import '../ember_quest.dart';
class StartMenu extends StatelessWidget {  
  final EmberQuestGame game;  

  const StartMenu({super.key, required this.game});  

  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      backgroundColor: Colors.black.withOpacity(0.5),  
      body: Center(  
        child: Column(  
          mainAxisAlignment: MainAxisAlignment.center,  
          children: [  
            const Text('Ember Quest', style: TextStyle(fontSize: 48, color: Colors.white)),  
            const SizedBox(height: 40),  
            ElevatedButton(  
              onPressed: () => game.overlays.add('MainMenu'),  
              child: const Text('Jugar'),  
            ),  
            ElevatedButton(  
              onPressed: () => game.overlays.add('LevelSelector'),  
              child: const Text('Nivells'),  
            ),  
            ElevatedButton(  
              onPressed: () => game.overlays.add('SettingsMenu'),  
              child: const Text('Configuració'),  
            ),  
          ],  
        ),  
      ),  
    );  
  }  
}  