import 'package:flutter/material.dart';

import 'package:flame/game.dart';

import 'ember_quest.dart';
import 'overlays/game_over.dart';
import 'overlays/main_menu.dart';
import 'overlays/start_menu.dart';
import 'overlays/settings_menu.dart';
import 'overlays/settings_menu.dart';
import 'overlays/level_selector.dart';

void main() {  
  runApp(  
    GameWidget<EmberQuestGame>.controlled(  
      gameFactory: EmberQuestGame.new,  
      overlayBuilderMap: {  
        'StartMenu': (_, game) => StartMenu(game: game), // Nova pantalla  
        'MainMenu': (_, game) => MainMenu(game: game),  
        'GameOver': (_, game) => GameOver(game: game),  
        'LevelSelector': (_, game) => LevelSelector(game: game), // Selector de nivells  
        'SettingsMenu': (_, game) => SettingsMenu(game: game), // Configuració  
      },  
      initialActiveOverlays: const ['StartMenu'], // Pantalla inicial  
    ),  
  );  
}  