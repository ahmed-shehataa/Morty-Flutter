class Location {
  const Location({
    required this.name,
    required this.url,
  });

  final String? name;
  final String? url;

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json["name"],
      url: json["url"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
