import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

enum Achievement {

  FRESH(0, "Fresh", "Congratulations on joining! Earn your first 100xp!", "assets/achievements/newbie.png",  Colors.green),
  EARLY_ADOPTER(1, "Early Adopter", "Thanks for joining and supporting from the beginning. Create your account in the first year of the app!", "assets/achievements/early_adopter.png", Colors.orange),
  BUFFED(2, "Buffed", "Do you know the history of this app?! Join the Buffed Lisa group!", "assets/achievements/mona.png", Colors.yellow),
  CREATE_PIN(3, "Stick It", "You stick-it something! Add your first stick!", "assets/achievements/create_pin.png", Colors.purpleAccent),
  JOIN_GROUP(4, "The Joiner", " Teamwork makes the dream work. Join your first group!", "assets/achievements/join_group.png", Colors.lightGreen),
  LIKES_1000(5, "Like me plz", "1,000 likes! People really like you. Or at least, your posts.", "assets/achievements/likes_1000.png", Colors.indigoAccent),
  SICK_ARTIST(6, "Artist", "Your art made people say 'Whoa!'. Earn 1000 art likes!", "assets/achievements/sick_artist.png", Colors.limeAccent),
  TRAVELLER(7, "Traveller", "You've found some good spots! Earn 1000 location likes!", "assets/achievements/traveler.png", Colors.pinkAccent),
  PHOTOGRAPHER(8, "Photographer", "That are some beautiful photos. Earn 1000 photography likes!", "assets/achievements/master_photographer.png", Colors.indigo),
  YOU_ARE_AMAZING(9, "Certified Awesome", "Everyone agrees: you're simply amazing. Add 500 sticks!", "assets/achievements/you_are_amazing.png", Colors.tealAccent);


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