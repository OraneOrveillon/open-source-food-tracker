class Dog {
  Dog({
    required this.message,
    required this.status,
  });

  final String message;
  final String status;

  factory Dog.fromJson(Map<String, dynamic> json) => Dog(
        message: json[DogKeys.message],
        status: json[DogKeys.status],
      );

  Map<String, dynamic> toJson() => {
        DogKeys.message: message,
        DogKeys.status: status,
      };
}

// ? Put keys of your mapped object below.
abstract class DogKeys {
  static const String message = "message";
  static const String status = "status";
}
