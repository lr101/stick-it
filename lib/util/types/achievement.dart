import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

enum Achievement {

  ADMIN(-1, "Admin", "Group Admin", "assets/achievements/newbie.jpeg",  Colors.purple),
  FRESH(0, "Fresh", "Earn your first 100xp!", "assets/achievements/newbie.jpeg",  Colors.green),
  EARLY_ADOPTER(1, "Early Adopter", "You joined in the first year!", "assets/achievements/early-bird.jpeg", Colors.orange),
  BUFFED(2, "Mona", "Join the Buffed Lisa group!", "assets/achievements/mona.jpg", Colors.yellow),
  CREATE_PIN(3, "Stick-It", "Add your first stick!", "assets/achievements/stick-it.jpg", Colors.purpleAccent),
  JOIN_GROUP(4, "Team player", " Join your first group!", "assets/achievements/group.jpeg", Colors.lightGreen),
  LIKES_1000(5, "Like plz", "1,000 likes!", "assets/achievements/1000likes.jpeg", Colors.indigoAccent),
  SICK_ARTIST(6, "Artist", "Earn 1000 art likes!", "assets/achievements/art.jpeg", Colors.limeAccent),
  TRAVELLER(7, "Traveller", "Earn 1000 location likes!", "assets/achievements/traveler.jpeg", Colors.pinkAccent),
  PHOTOGRAPHER(8, "Photographer", "Earn 1000 photography likes!", "assets/achievements/photography.jpeg", Colors.indigo),
  YOU_ARE_AMAZING(9, "Certified Awesome", "Amazing! Add 500 sticks!", "assets/achievements/amazing.jpeg", Colors.tealAccent);


  const Achievement(
    this.id,
    this.name,
    this.description,
    this.imagePath,
    this.color);

  final int id;
  final String name;
  final String description;
  final String imagePath;
  final Color color;

  static Achievement getById(int id) {
    return Achievement.values.firstWhere((e) => e.id == id);
  }
}