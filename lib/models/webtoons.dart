// ignore_for_file: non_constant_identifier_names

class Webtoons {
  final String title;
  final String coverURL;

  Webtoons({
    required this.title,
    required this.coverURL,
  });

  factory Webtoons.fromJson(dynamic json) {
    return Webtoons(
      title: json['title'] as String,
      coverURL: json['coverURL'] as String,
    );
  }

  static List<Webtoons> webtoonsFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Webtoons.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Webtoons {title: $title, coverURL: $coverURL,';
  }
}
