class Recipe {
  String label;
  String imageUrl;

  List<Ingredient> ingredients;

  Recipe(
      this.label,
      this.imageUrl,
      this.ingredients,
      );

  static List<Recipe> samples = [
    Recipe(
      'Learning',
      'image/learn.jpg',
      [
        Ingredient('Extend your fingers and cross your thumb in front of your palm. Then, starting with your hand in front of your ear, flick it outward and away from your body.',)
      ],
    ),
    Recipe(
      'Quiz',
      'image/quiz.jpg',
      [
        Ingredient('Goodbye is the same as the traditional gesture for the word. Open your palm, folding down your fingers, then open your palm again.',)
      ],
    ),
  ];
}

class Ingredient {
  String name;

  Ingredient(
      this.name,);
}
