import 'dart:convert';

import 'package:e_recruitment/config/default_data.dart';
import 'package:e_recruitment/model/login_model.dart';
import 'package:e_recruitment/utils/common/loading_dialog.dart';
import 'package:e_recruitment/utils/http_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginRepository{

  static loginUser(
      { String email, String password, bool isAdmin}) async {
    showLoadingDialog();
    Map response = await HttpHandler.postHttpMethod(
        url: isAdmin ? DefaultApiString.adminLogin : DefaultApiString.login,
        data: {"email": email,"role": isAdmin ? "admin" : "user","password": password});

    if (response["error_description"] == null) {
      hideLoadingDialog();
      return loginModelFromJson(response['body']);
    } else if (response["error_description"] != null) {
      hideLoadingDialog();
      Get.snackbar("Error","Username or password incorrect");
      return loginModelFromJson(response['body']);
    } else {
      hideLoadingDialog();
      return null;
    }
  }

  static createInquiryData({
    @required BuildContext context,
    @required bodyData
  }) async {
    showLoadingDialog();
    Map response = await HttpHandler.postHttpMethod(
      url: "${DefaultApiString.createInquiry}",
      data: bodyData
    );
    if (response["error_description"] == null) {
      hideLoadingDialog();
      return jsonDecode(response['body']);
    } else if (response["error_description"] != null) {
      hideLoadingDialog();
      return jsonDecode(response['body']);
    } else {
      hideLoadingDialog();
      return null;
    }
  }
  static getInquiryData({
    @required BuildContext context,
  }) async {
    showLoadingDialog();
    Map response = await HttpHandler.getHttpMethod(
        url: "${DefaultApiString.getInquiry}",
    );
    if (response["error_description"] == null) {
      hideLoadingDialog();
      return jsonDecode(response['body']);
    } else if (response["error_description"] != null) {
      hideLoadingDialog();
      return jsonDecode(response['body']);
    } else {
      hideLoadingDialog();
      return null;
    }
  }
  static getQuestionData({
    @required BuildContext context,
  }) async {
    showLoadingDialog();
    Map response = await HttpHandler.getHttpMethod(
      url: "${DefaultApiString.examQuestions}",
    );
    if (response["error_description"] == null) {
      hideLoadingDialog();
      return jsonDecode(response['body']);
    } else if (response["error_description"] != null) {
      hideLoadingDialog();
      return jsonDecode(response['body']);
    } else {
      hideLoadingDialog();
      return null;
    }
  }
  static submitExamData({
    @required BuildContext context,
    @required answers,
  }) async {
    showLoadingDialog();
    Map response = await HttpHandler.postHttpMethod(
        url: "${DefaultApiString.submitExam}",
        data: answers
    );
    if (response["error_description"] == null) {
      hideLoadingDialog();
      return jsonDecode(response['body']);
    } else if (response["error_description"] != null) {
      hideLoadingDialog();
      return jsonDecode(response['body']);
    } else {
      hideLoadingDialog();
      return null;
    }
  }
  static userExamData({
    @required BuildContext context,
  }) async {
    showLoadingDialog();
    Map response = await HttpHandler.getHttpMethod(
        url: "${DefaultApiString.userExam}",
    );
    if (response["error_description"] == null) {
      hideLoadingDialog();
      return jsonDecode(response['body']);
    } else if (response["error_description"] != null) {
      hideLoadingDialog();
      return jsonDecode(response['body']);
    } else {
      hideLoadingDialog();
      return null;
    }
  }
}