class Ders {
  final String ad;
  final double harfdegeri;
  final double kredidegeri;

  Ders({required this.ad, required this.harfdegeri, required this.kredidegeri});
  @override
  String toString() {
    // TODO: implement toString
    return "Öğrenci adı : ${ad} Harf değeri : ${harfdegeri} Kredi değeri :${kredidegeri}";
  }
}
