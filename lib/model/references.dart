class Reference {
  String name;
  String position;
  String company;
  String email;
  String phone;

  Reference({
    required this.name,
    required this.position,
    required this.company,
    required this.email,
    required this.phone,
  });

  factory Reference.fromJson(Map<String, dynamic> json) => Reference(
        name: json['name'],
        position: json['position'],
        company: json['company'],
        email: json['email'],
        phone: json['phone'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'position': position,
        'company': company,
        'email': email,
        'phone': phone,
      };
}
