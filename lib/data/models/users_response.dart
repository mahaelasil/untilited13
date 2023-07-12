class UsersResponse{
  List<User>? _data;

  List<User> get data => _data ?? [];

  UsersResponse({List<User>? data}){
    _data = data;
  }

  UsersResponse.fromJson(Map<String, dynamic> json){
    if(json['data'] != null && json['data'] != []){
      _data = <User>[];
      json['data'].forEach((v) {
        _data!.add(User.fromJson(v));
      });
    }
  }
}

class User{
  num? _id;
  String? _email;
  String? _firstName;
  String? _lastName;
  String? _avatar;

  num get id => _id ?? 0;

  String get email => _email ?? '';

  String get firstName => _firstName ?? '';

  String get lastName => _lastName ?? '';

  String get avatar => _avatar ?? '';

  User(int? id, String? email, String? firstName, String? lastName, String? avatar){
    _id = id;
    _email = email;
    _firstName = firstName;
    _lastName = lastName;
    _avatar = avatar;
  }

  User.fromJson(Map<String, dynamic> json){
    _id = json['id'];
    _email = json['email'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _avatar = json['avatar'];
  }
}