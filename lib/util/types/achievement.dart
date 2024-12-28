import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

enum Achievement {

  ADMIN(-1, "Admin", "Group Admin", "assets/achievements/newbie.jpeg",  Colors.purple),
  LOCAL_CONTRIBUTOR(0, "Local Contributor", "Add 10 sticks in a city!", "assets/achievements/local-contributor.jpeg",  Colors.green),
  EARLY_ADOPTER(1, "Early Adopter", "You joined in the first year!", "assets/achievements/early-bird.jpeg", Colors.indigoAccent),
  BUFFED(2, "Mona", "Join the Buffed Lisa group!", "assets/achievements/mona.jpg", Colors.yellow),
  CREATE_PIN(3, "Stick-It", "Add your first stick!", "assets/achievements/stick-it.jpg", Colors.purpleAccent),
  JOIN_GROUP(4, "Team player", " Join your first group!", "assets/achievements/group.jpeg", Colors.lightGreen),
  LIKES_1000(5, "Like plz", "1,000 likes!", "assets/achievements/1000likes.jpeg", Colors.redAccent),
  SICK_ARTIST(6, "Artist", "Earn 1000 art likes!", "assets/achievements/art.jpeg", Colors.redAccent),
  TRAVELLER(7, "Traveller", "Earn 1000 location likes!", "assets/achievements/traveler.jpeg", Colors.redAccent),
  PHOTOGRAPHER(8, "Photographer", "Earn 1000 photography likes!", "assets/achievements/photography.jpeg", Colors.redAccent),
  YOU_ARE_AMAZING(9, "Certified Awesome", "Amazing! Add 500 sticks!", "assets/achievements/amazing.jpeg", Colors.tealAccent),
  REGIONAL_MASTER(10, "Regional Master", "Add 100 sticks in one state!", "assets/achievements/regional-master.jpeg", Colors.pink),
  COUNTRY_MASTER(11, "Country Master", "Add 100 sticks in one country!", "assets/achievements/country-master.jpeg", Colors.pink),
  LOCAL_HERO(12, "Local Hero", "Reach the top 3 ranking in a city!", "assets/achievements/local-hero.jpeg", Colors.orange),
  REGIONAL_HERO(13, "Regional Hero", "Reach the top 3 ranking in a state!", "assets/achievements/regional-hero.jpeg", Colors.orange),
  COUNTRY_HERO(14, "Country Hero", "Reach the top 3 ranking in a country!", "assets/achievements/country-hero.jpeg", Colors.orange),
  WORLD_HERO(15, "World Hero", "Reach the top 3 ranking in the world!", "assets/achievements/world-hero.jpeg", Colors.orange);


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