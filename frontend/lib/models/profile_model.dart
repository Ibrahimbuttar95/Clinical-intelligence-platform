class ProfileModel {

  final int age;

  final String gender;

  final String allergies;

  ProfileModel({
    required this.age,
    required this.gender,
    required this.allergies,
  });

  factory ProfileModel.fromJson(
      Map<String,dynamic> json) {

    return ProfileModel(
      age:
          json["age"] ?? 0,

      gender:
          json["gender"] ?? "",

      allergies:
          json["allergies"] ?? "",
    );
  }
}
