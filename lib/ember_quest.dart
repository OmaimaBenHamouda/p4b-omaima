import 'package:flame/components.dart';
import 'package:flame/game.dart';

import 'actors/ember.dart';

class EmberQuestGame extends FlameGame {
  late EmberPlayer _ember;
  
  @override
Future<void> onLoad() async {
  await images.load('ember.png'); // Cargar imagen antes de usarla

  camera.viewfinder.anchor = Anchor.topLeft;

  _ember = EmberPlayer(
    position: Vector2(128, canvasSize.y - 70),
  );
  world.add(_ember);
}
}