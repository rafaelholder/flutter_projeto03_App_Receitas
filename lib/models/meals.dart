enum Complex {
  simple,
  medium,
  difficult,
}

enum Cost {
  cheap,
  ok,
  expensive,
}

class Meal {
  final String id;
  final List<String> categories;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final bool isVegetarian;
  final bool isVegan;
  final String title;
  final String imageUrl;
  final Complex complex;
  final Cost cost;

  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.isVegetarian,
    required this.isVegan,
    required this.complex,
    required this.cost,
  });

  String get complexText {
    switch (complex) {
      case Complex.simple:
        return 'Simples';
      case Complex.medium:
        return 'Media';
      case Complex.difficult:
        return 'Dificil';
      default:
        return 'Desconhecida';
    }
  }

  String get costText {
    switch (cost) {
      case Cost.cheap:
        return 'Barato';
      case Cost.ok:
        return 'Ok';
      case Cost.expensive:
        return 'Caro';
      default:
        return 'Desconhecida';
    }
  }
}
