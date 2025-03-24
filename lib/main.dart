import 'package:flutter/material.dart';

import 'package:flame/game.dart';

import 'ember_quest.dart';

void main() {
  runApp(
    const GameWidget<EmberQuestGame>.controlled(
      gameFactory: EmberQuestGame.new,
    ),
  );
}