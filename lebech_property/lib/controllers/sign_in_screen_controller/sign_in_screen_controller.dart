import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lebech_property/models/login_model/login_model.dart';
import 'package:lebech_property/screens/home_screen/home_screen.dart';
import '../../common/constant/api_url.dart';
import '../../common/sharedpreference_data/sharedpreference_data.dart';

class SignInScreenController extends GetxController {
  RxBool isLoading = false.obs;

  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final phoneNoTextField = TextEditingController();
  final passwordTextField = TextEditingController();

  userSignInFunction() async {
    isLoading(true);
    String url = ApiUrl.loginApi;
    print('url : $url');

    try{
      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.fields['mobile'] = phoneNoTextField.text.trim().toLowerCase();
      request.fields['password'] = passwordTextField.text.trim();

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async {
        LoginModel loginModel = LoginModel.fromJson(json.decode(value));

        if(loginModel.status == "Success") {
          Fluttertoast.showToast(msg: 'User LoggedIn Successfully!');
          String userToken = loginModel.data.token;
          await sharedPreferenceData.setUserLoggedInDetailsInPrefs(userToken: userToken);
          Get.offAll(()=> HomeScreen());
        } else {
          Fluttertoast.showToast(msg: 'User Not LoggedIn Successfully!');
        }

      });

    } catch(e) {
      print('userSignInFunction Error1 : $e');
    } finally {
      isLoading(false);
    }
  }
}