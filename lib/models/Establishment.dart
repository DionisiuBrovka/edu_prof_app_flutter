class Establishment {
  Establishment(this.title, this.shortTitle, this.adress, this.icon,
      [this.isFavorite = false]);

  String title;
  String shortTitle;
  String adress;
  String icon;
  bool isFavorite;

  static Future<List<Establishment>> getSteps() async {
    final _items = [
      Establishment("Минский государственный колледж цифровых технологий",
          "МГКЦТ", "ул. Казинца, 91", ""),
      Establishment(
          "Минский государственный колледж ремеслиничества и дизайна им. Кедышко",
          "МГКРиД",
          "ул. Сурганова, 45/2",
          "https://sun9-49.userapi.com/impg/IJINSnVz_ZzlI-dFPXlzaw6aHdQOK30emQqRzw/xaFaVf9IEW0.jpg?size=791x760&quality=95&sign=fbe2cb5751940d08bd2a98ecb90ccf86&type=album")
    ];
    return Future<List<Establishment>>.delayed(
        const Duration(seconds: 2), () => _items);
  }
}
