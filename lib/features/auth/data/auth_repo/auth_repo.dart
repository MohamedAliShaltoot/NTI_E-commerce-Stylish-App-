// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nti_grad_project/core/network/api_response.dart';
import 'package:nti_grad_project/features/auth/data/models/login_response_model.dart';


import '../../../../core/cache/cache_helper.dart';
import '../../../../core/cache/cache_keys.dart';
import '../../../../core/network/api_helper.dart';
import '../../../../core/network/api_keys.dart';
import '../../../../core/network/end_points.dart';

class AuthRepo {
  // singleton
  AuthRepo._internal();
  static final AuthRepo _repo = AuthRepo._internal();
  factory AuthRepo() => _repo;

  ApiHelper apiHelper = ApiHelper();



  Future<Either<String, void>> register({
    required String username,
    required String password,
    required XFile? image,
  }) async {
    try {
      await apiHelper.postRequest(
        endPoint: EndPoints.register,
        data: {
          ApiKeys.userNameApiKey: username,
          ApiKeys.passwordApiKey: password,
          ApiKeys.imageApiKey:
              image == null
                  ? null
                  : await MultipartFile.fromFile(
                    image.path,
                    filename: image.name,
                  ),
        },
      );
      return Right(null);
    } catch (e) {
      if (e is DioException) {
        if (e.response != null && e.response?.data['message'] != null) {
          return Left(e.response?.data['message']);
        }
      }

      print("Error ${e.toString()}");
      return Left(e.toString());
    }
  }

  Future<Either<String, UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      ApiResponse response = await apiHelper.postRequest(
        // sendRefreshToken: true,
        isProtected: true,
        endPoint: EndPoints.login,
        data: {
          ApiKeys.emailApiKey: email,
          ApiKeys.passwordApiKey: password,
        },
      );
      LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(
        response.data,
      );
      if (loginResponseModel.status != null &&
          loginResponseModel.status == true) {
        // store tokens
        await CacheHelper.saveData(
          key: CacheKeys.accessToken,
          value: loginResponseModel.accessToken,
        );
        await CacheHelper.saveData(
          key: CacheKeys.refreshToken,
          value: loginResponseModel.refreshToken,
        );
        // return user model
        if (loginResponseModel.user != null) {
          return Right(loginResponseModel.user!);
        } else {
          throw Exception("Login Failed\nTry Again later");
        }
      } else {
        throw Exception("Login Failed\nTry Again later");
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response != null && e.response?.data['message'] != null) {
          return Left(e.response?.data['message']);
        }
      }

      print("Error ${e.toString()}");
      return Left(e.toString());
    }
  }
}
