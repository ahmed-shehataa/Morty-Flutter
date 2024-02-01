class CharacterLocation {
  final String name;
  final String url;

  const CharacterLocation({required this.name, required this.url});

  factory CharacterLocation.fromJson(Map<String, dynamic> json) {
    return CharacterLocation(
      name: json['name'] as String,
      url: json['url'] as String,
    );
  }
}
