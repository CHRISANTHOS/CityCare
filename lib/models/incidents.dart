class Incidents {
  String title;
  String description;

  Incidents({required this.title, required this.description});

  factory Incidents.fromJson(Map<String, dynamic> json) {
    return Incidents(title: json['title'], description: json['description']);
  }
}
