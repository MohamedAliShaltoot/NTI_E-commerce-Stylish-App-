class LoginResponseModel {
  String? accessToken;
  String? refreshToken;
  bool? status;
  UserModel? user;

  LoginResponseModel({
    accessToken,
    refreshToken,
    status,
    user,
  });

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    status = json['status'];
    user = json['user'] != null ?  UserModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['access_token'] = accessToken;
    data['refresh_token'] = refreshToken;
    data['status'] = status;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class UserModel {
  String? email;
  List<int>? favoriteProducts;
  int? id;
  String? imagePath;
  String? name;
  String? phone;

  UserModel({
    email,
    favoriteProducts,
    id,
    imagePath,
    name,
    phone,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    if (json['favorite_products'] != null) {
     favoriteProducts = json['favorite_products'].cast<int>();
    }
    id = json['id'];
    imagePath = json['image_path'];
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data ={};
    data['email'] = email;
    if (favoriteProducts != null) {
      data['favorite_products'] = favoriteProducts;
    }
    data['id'] = id;
    data['image_path'] = imagePath;
    data['name'] = name;
    data['phone'] = phone;
    return data;
  }
}
