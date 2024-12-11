enum Level {
  ZERO(0, "Newbie"), ONE(1, "Beginner"), TWO(2, "Intermediate"), THREE(3, "Advanced"), FOUR(4, "Master"), FIVE(5, "Grandmaster"), SIX(6, "Legend");

  const Level(this.level, this.title);

  final int level;
  final String title;
}