import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:round_app/core/app_export.dart';
import 'package:round_app/data/models/taglist_model/taglist_model.dart';
import 'package:round_app/data/models/transaction_model/transaction_model.dart';
import 'package:round_app/data/models/user/user_model.dart';
import 'package:round_app/data/models/video_model.dart';

class ApiClient {
  static var _dio = dio.Dio();
  static String baseUrl = 'https://roundapp.it/backend/api';

/*---------Method For Post Api---------*/
  static Future<dio.Response> postRequest({
    required String endPoint,
    required Map<String, dynamic> data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      var response = await _dio.post('$baseUrl/$endPoint',
          data: data,
          options: headers != null ? Options(headers: headers) : null);
      print('-------------------End Point--------------------');
      print(endPoint);
      print('-------------------Status Code--------------------');
      print(response.statusCode);
      print('-------------------Response--------------------');
      print('response===>::$response');
      return response;
    } catch (e) {
      log('Error During POST Request', error: e);

      rethrow; // Rethrow the exception to propagate it up the call stack
    }
  }

/*---------Method For Put Api---------*/
  static Future<dio.Response> putRequest({
    required String endPoint,
    required Map<String, dynamic> data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      var response = await _dio.put('$baseUrl/$endPoint',
          data: data,
          options: headers != null ? Options(headers: headers) : null);
      print('-------------------End Point--------------------');
      print(endPoint);
      print('-------------------Status Code--------------------');
      print(response.statusCode);
      print('-------------------Response--------------------');
      print('response===>::$response');
      return response;
    } catch (e) {
      log('Error During POST Request', error: e);

      rethrow; // Rethrow the exception to propagate it up the call stack
    }
  }

/*---------Method For Get Api---------*/
  static Future<dio.Response> getRequest(
      {required String endPoint,
      Map<String, dynamic>? data,
      Map<String, dynamic>? headers}) async {
    try {
      var response = await _dio.get('$baseUrl/$endPoint',
          queryParameters: data, options: Options(headers: headers));
      print('-------------------End Point--------------------');
      print(endPoint);
      print('-------------------Status Code--------------------');
      print(response.statusCode);
      print('-------------------Response--------------------');
      print('response===>::$response');
      return response;
    } catch (e) {
      log('Error During GET Request', error: e);
      rethrow;
    }
  }

/*-----------Register Api----------*/
  static Future<bool> register(
      {required name,
      required email,
      required password,
      required confirmPassword}) async {
    // String endPoint = 'auth/register/advertiser';
    try {
      var response = await _dio.post(
        'https://roundapp.it/backend/api/auth/register/advertiser',
        //'$baseUrl/$endPoint',
        data: {
          "name": name,
          "email": email,
          "password": password,
          "password_confirmation": confirmPassword
        },
      );
      print('response::${response.statusCode}');
      print('response0::$response');
      if (response.statusCode == 201) {
        PrefUtils.setToken(response.data['access_token']);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log('Error During Registration', error: e);
      return false;
    }
  }

/*-----------Login Api----------*/
  static Future<bool> login({required email, required password}) async {
    String endPoint = 'auth/login';

    try {
      var response = await postRequest(
        endPoint: endPoint,
        data: {"email": email, "password": password, "remember": 0},
      );
      if (response.statusCode == 200) {
        PrefUtils.setToken(response.data['access_token']);
        PrefUtils.setId(response.data['id']);
        List<dynamic> dynamicTags = response.data['tags'] as List<dynamic>;
        List<String> tags = dynamicTags.map((tag) => tag.toString()).toList();
        PrefUtils.setTag(tags);
        print('Tags==>${response.data['tags']}');
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log('Error During Registration', error: e);
      return false;
    }
  }

/*-----------Fetch Videos Api----------*/
  static Future<Videos?> fetchVideo() async {
    var response = await getRequest(
      endPoint: 'campaigns/all',
      headers: {
        'Authorization': 'Bearer ${PrefUtils.getToken()}',
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return Videos.fromJson(response.data);
    }
    return null;
  }

/*-----------Fetch User Data Api----------*/
  static Future<User?> fetchUserData() async {
    var response = await getRequest(
      endPoint: 'me',
      headers: {
        'Authorization': 'Bearer ${PrefUtils.getToken()}',
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return User.fromJson(response.data);
    }
    return null;
  }

/*-----------Forgot Password Api----------*/
  static Future<bool> forgotPassword(String email) async {
    print(email);
    try {
      var response = await postRequest(endPoint: 'auth/password/forgot', data: {
        'email': email,
      }, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json, text/plain, /'
      });

      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

/*-----------File Upload Api----------*/
  static Future<bool> uploadFile(String filePath) async {
    print(filePath);
    try {
      var response = await _dio.post('$baseUrl/files/user.image',
          options: Options(headers: {
            'Authorization': 'Bearer ${PrefUtils.getToken()}',
            'Content-Type': 'application/json',
          }),
          data: dio.FormData.fromMap({
            'UploadFiles': await dio.MultipartFile.fromFile(filePath,
                filename: 'profile_image'),
            'category': 'user.image'
          }));
      print('File upload Response:::$response');
      print('File upload Response:::${response.statusCode}');

      if (response.statusCode == 201) {
        Fluttertoast.showToast(msg: 'profile update successfully');
        return true;
      }
      return false;
    } catch (e) {
      log('Error During File upload', error: e);
      return false;
    }
  }

/*-----------Update User Api----------*/
  static Future<bool> updateUser(Map<String, dynamic> data) async {
    print("request Data:::=>$data");
    try {
      var response = await putRequest(endPoint: 'adv/me', data: data, headers: {
        'Authorization': 'Bearer ${PrefUtils.getToken()}',
        'Content-Type': 'application/json',
      });

      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  /*-----------Update User Api----------*/
  static Future<bool> addTransaction(
      {required int id, required double reward}) async {
    print("request Data:::=>$id");
    try {
      var response = await postRequest(endPoint: 'add-transactions', data: {
        'direction': "in",
        "amount": reward,
        "type": "wallet transfer",
        "campaign_id": id
      }, headers: {
        'Authorization': 'Bearer ${PrefUtils.getToken()}',
        'Content-Type': 'application/json',
      });

      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  /*-----------Update User Api----------*/
  static Future<List<Transaction>> getTransaction() async {
    print("request Data:::=>${PrefUtils.getToken()}");
    try {
      var response = await getRequest(endPoint: 'get-transactions', headers: {
        'Authorization': 'Bearer ${PrefUtils.getToken()}',
        'Content-Type': 'application/json',
      });

      if (response.statusCode == 200) {
        TransactionModel transactionModel =
            TransactionModel.fromJson(response.data);

        return transactionModel.transaction ?? <Transaction>[];
      }
      return <Transaction>[];
    } catch (e) {
      print(e);
      return <Transaction>[];
    }
  }

  /*-----------Update User Api----------*/
  static Future<List<Tag>> getTagList() async {
    print("request Data:::=>${PrefUtils.getToken()}");
    try {
      var response = await getRequest(endPoint: 'campaigns/info', headers: {
        'Authorization': 'Bearer ${PrefUtils.getToken()}',
        'Content-Type': 'application/json',
      });

      if (response.statusCode == 200) {
        TagListModel tagListModel = TagListModel.fromJson(response.data);

        return tagListModel.data?.tags ?? <Tag>[];
      }
      return <Tag>[];
    } catch (e) {
      print(e);
      return <Tag>[];
    }
  }

  /*-----------Withdraw amount----------*/
  static Future<bool> withDrawAmount({required String amount}) async {
    String endPoint = 'withdrawAmount';

    try {
      var response = await postRequest(endPoint: endPoint, data: {
        "amount": amount,
        "currency": 'eur',
      }, headers: {
        'Authorization': 'Bearer ${PrefUtils.getToken()}',
        'Content-Type': 'application/json',
      });
      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: jsonDecode(response.data)['message']);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      if (e is DioException) {
        Fluttertoast.showToast(msg: jsonDecode(e.response!.data)['message']);
      }
      Fluttertoast.showToast(msg: 'qualcosa è andato storto');
      log('Error During Registration', error: e);
      return false;
    }
  }

  /*-----------Login Api with Social----------*/
  static Future<bool> loginWithSocial(
      {required String email, required String name}) async {
    String endPoint = 'auth/socialLogin/advertiser';

    try {
      var response = await postRequest(
        endPoint: endPoint,
        data: {
          "email": email,
          "name": name,
        },
      );
      if (response.statusCode == 200) {
        PrefUtils.setToken(response.data['access_token']);
        PrefUtils.setId(response.data['id']);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log('Error During Registration', error: e);
      return false;
    }
  }
}
