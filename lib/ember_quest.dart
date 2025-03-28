import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'actors/ember.dart';
import 'actors/water_enemy.dart';
import 'managers/segment_manager.dart';
import 'objects/ground_block.dart';
import 'objects/platform_block.dart';
import 'objects/star.dart';
import 'package:flame/events.dart';
import 'overlays/hud.dart';
import 'package:flame_audio/flame_audio.dart'; // Per HasAudio

class EmberQuestGame extends FlameGame 
    with HasCollisionDetection, HasKeyboardHandlerComponents {
    
  bool _userInteracted = false; // Flag para verificar la interacción del usuario
  late double lastBlockXPosition = 0.0;
  late UniqueKey lastBlockKey;
  late EmberPlayer _ember;
  double objectSpeed = 0.0;
  int starsCollected = 0;
  int health = 3;
  bool isSoundOn = true;
  static const String backgroundMusic = 'background_music.mp3';
  int currentLevel = 1; // Nivell actual  
  @override
Color backgroundColor() {
  return const Color.fromARGB(255, 189, 221, 186);
}

    void initializeGame(bool loadHud) {
  // Assume that size.x < 3200
  final segmentsToLoad = (size.x / 640).ceil();
  segmentsToLoad.clamp(0, segments.length);

  for (var i = 0; i <= segmentsToLoad; i++) {
    loadGameSegments(i, (640 * i).toDouble());
  }

  _ember = EmberPlayer(
    position: Vector2(128, canvasSize.y - 128),
  );
  add(_ember);
  if (loadHud) {
    add(Hud());
  }
}


@override
  Future<void> onLoad() async {
    await images.loadAll([
      'block.png',
      'gorila.png',
      'ground.png',
      'heart_half.png',
      'heart.png',
      'platano.png',
      'water_enemy.png',
    ]);

    
    camera.viewfinder.anchor = Anchor.topLeft;

   await FlameAudio.audioCache.loadAll([
    backgroundMusic,
  ]);

  initializeGame(true);
  }


void loadGameSegments(int segmentIndex, double xPositionOffset) {
    for (final block in segments[segmentIndex]) {
      switch (block.blockType) {
        case GroundBlock:
                    world.add(
                GroundBlock(
                  gridPosition: block.gridPosition,
                  xOffset: xPositionOffset,
                ),
              );
        case PlatformBlock:
                    add(PlatformBlock(
                gridPosition: block.gridPosition,
                xOffset: xPositionOffset,
              ));
        case Star: 
         world.add(
                      Star(
                        gridPosition: block.gridPosition,
                        xOffset: xPositionOffset,
                      ),
                    );
        case WaterEnemy:
                      world.add(
                      WaterEnemy(
                      gridPosition: block.gridPosition,
                      xOffset: xPositionOffset,
                      ),
                    );
        case PlatformBlock:
                    add(PlatformBlock(
                      gridPosition: block.gridPosition,
                      xOffset: xPositionOffset,
                    ));
      }
    }
  }


  void reset() {
  starsCollected = 0;
  health = 3;
  initializeGame(false);
}
@override
void update(double dt) {
  if (health <= 0) {
    overlays.add('GameOver');
  }
  super.update(dt);
}

 
  void toggleSound(bool value) {
    isSoundOn = value;
    
    if (isSoundOn) {
      _playBackgroundMusic();
    } else {
      FlameAudio.bgm.stop();
    }
  }

void _playBackgroundMusic() {
  if (isSoundOn) {
    FlameAudio.bgm.stop(); // Detener cualquier música en reproducción
    FlameAudio.bgm.play(backgroundMusic, volume: 0.5); // Reproducir con loop activado
  }
}
// Método para iniciar la música después de la interacción
void _startMusicAfterInteraction() {
  if (!_userInteracted) {
    _userInteracted = true;
    _playBackgroundMusic();
  }
}

// Detectar cuando el usuario toca la pantalla
@override
void onTapDown(TapDownEvent event) {
  _startMusicAfterInteraction();
}

}