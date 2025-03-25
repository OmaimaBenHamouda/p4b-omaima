import 'package:flutter/material.dart';

import '../ember_quest.dart';
class SettingsMenu extends StatelessWidget {  
  final EmberQuestGame game;  

  const SettingsMenu({super.key, required this.game});  

  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      backgroundColor: Colors.black.withOpacity(0.5),  
      body: Center(  
        child: Column(  
          mainAxisAlignment: MainAxisAlignment.center,  
          children: [  
            const Text('Configuració', style: TextStyle(fontSize: 32, color: Colors.white)),  
            const SizedBox(height: 20),  
            // Exemple: Control de so  
            Row(  
              mainAxisAlignment: MainAxisAlignment.center,  
              children: [  
                const Text('So', style: TextStyle(color: Colors.white)),  
                Switch(  
                  value: game.isSoundOn,  
                  onChanged: (value) => game.toggleSound(value),  
                ),  
              ],  
            ),  
            ElevatedButton(  
              onPressed: () => game.overlays.remove('SettingsMenu'),  
              child: const Text('Tornar'),  
            ),  
          ],  
        ),  
      ),  
    );  
  }  
}  