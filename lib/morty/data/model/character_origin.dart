class CharacterOrigin {
  final String name;
  final String url;

  const CharacterOrigin({required this.name, required this.url});

  factory CharacterOrigin.fromJson(Map<String, dynamic> json) {
    return CharacterOrigin(
      name: json['name'] as String,
      url: json['url'] as String,
    );
  }
}