class Channel {
  final String name;
  final String logo;
  final String url;

  Channel({this.name, this.logo, this.url});

  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(
      name: json['name'],
      logo: json['logo'],
      url: json['url'] as String,
    );
  }
}