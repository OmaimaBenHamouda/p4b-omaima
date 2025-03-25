import 'package:flutter/material.dart';

import '../ember_quest.dart';

class LevelSelector extends StatelessWidget {  
  final EmberQuestGame game;  

  const LevelSelector({super.key, required this.game});  

  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      backgroundColor: Colors.black.withOpacity(0.5),  
      body: Center(  
        child: Column(  
          mainAxisAlignment: MainAxisAlignment.center,  
          children: [  
            const Text('Tria un Nivell', style: TextStyle(fontSize: 32, color: Colors.white)),  
            const SizedBox(height: 20),  
            // Botons de nivell (ex: 3 nivells)  
            for (var i = 1; i <= 3; i++)  
              ElevatedButton(  
                onPressed: () {  
                  game.loadGameSegments(i, 0); // Carrega el nivell i  
                  game.overlays.remove('LevelSelector');  
                  game.overlays.remove('StartMenu');  
                },  
                child: Text('Nivell $i'),  
              ),  
            ElevatedButton(  
              onPressed: () => game.overlays.remove('LevelSelector'),  
              child: const Text('Tornar'),  
            ),  
          ],  
        ),  
      ),  
    );  
  }  
}  