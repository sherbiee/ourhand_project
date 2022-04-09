class HomeInfo {
  String label;
  String imageUrl;

  List<Info> infos;

  HomeInfo(
      this.label,
      this.imageUrl,
      this.infos,
      );

  static List<HomeInfo> samples = [
    HomeInfo(
      'Learning',
      'image/learn.jpg',
      [
        Info('Extend your fingers and cross your thumb in front of your palm. Then, starting with your hand in front of your ear, flick it outward and away from your body.',)
      ],
    ),
    HomeInfo(
      'Quiz',
      'image/quiz.jpg',
      [
        Info('Goodbye is the same as the traditional gesture for the word. Open your palm, folding down your fingers, then open your palm again.',)
      ],
    ),
  ];
}

class Info {
  String name;

  Info(
      this.name,);
}
