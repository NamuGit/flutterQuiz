class OptionSet {
   String color;
   String name;

  OptionSet({required this.color, required this.name});

  factory OptionSet.fromJson(Map<String, dynamic> json) {
    return OptionSet(
      color: json['color'],
      name: json['name'],
    );
  }
}