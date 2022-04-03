import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_recruitment/config/app_constant.dart';
import 'package:e_recruitment/config/default_data.dart';
import 'package:e_recruitment/model/cv_model.dart';
import 'package:e_recruitment/model/no_data_model.dart';
import 'package:e_recruitment/utils/common/loading_dialog.dart';
import 'package:e_recruitment/utils/common/tost_message.dart';
import 'package:e_recruitment/utils/http_handler.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CvRepository {
  static createCv(BuildContext context,{
    File image,
    String userId,
    String name,
    String profileAddress,
    String email,
    String phone,
    String degree,
    String university,
    String grade,
    String year,
    String companyName,
    String jobTitle,
    String startDate,
    String endDate,
    String details,
    String skill,
    String objective,
    String refName,
    String refJobTitle,
    String refCompanyName,
    String refEmail,
    String refPhone,
    String projectTitle,
    String projectDescription,
    String helpTips,
    String examResult,
    String jobExperience,
  }) async {
    showLoadingDialog();

    var data = {
      "userId": userId,
      "name": name,
      "profile_address": profileAddress,
      "email": email,
      "phone": phone,
      "degree": degree,
      "university": university,
      "grade": grade,
      "year": year,
      "company_name": companyName,
      "job_title": jobTitle,
      "start_date": startDate,
      "end_date": endDate,
      "details": year,
      "skill": skill,
      "objective": objective,
      "ref_name": refName,
      "ref_job_title": refJobTitle,
      'ref_company_name': refCompanyName,
      "ref_email": refEmail,
      'ref_phone': refPhone,
      "project_title": projectTitle,
      "project_desription": projectDescription,
      "help_tips": helpTips,
      "exam_result": "examResult",
      "isActive": "true",
      "experience": jobExperience,
      "image": (await MultipartFile.fromFile(image.path))
    };
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString(PrefString.token);
    print("token========$token");
    print("Data========${data}");
    Dio dio = Dio();
    var header = {
       'Authorization' : '$token',
       'Content-Type' : 'multipart/form-data'
    };
    final payload = FormData.fromMap(data);
   var response = await dio.post("${DefaultApiString.endPoint}${DefaultApiString.createCv}", data: payload,options: Options(headers: header)).catchError((vf) {
     hideLoadingDialog();
     showToastMessage(context: context, message: "Something went wrong !");
     print('${vf}');
     return Future.value();});
    if(response.statusCode == 200){
      CvModel cvModel = cvModelFromJson(response.data);
      if (cvModel.status == 200) {
        hideLoadingDialog();
        return cvModel;
      } else {
        hideLoadingDialog();
        showToastMessage(context: context, message: "Something went wrong !");
        return "Something went wrong !";
      }
    // var request = http.MultipartRequest(
    //   "POST",
    //   Uri.parse("${DefaultApiString.endPoint}${DefaultApiString.createCv}"),
    // );
    //
    // request.headers.addAll({
    //   'Authorization': '$token',
    //   'Content-Type': 'application/json'
    // });
    // //Map response = await HttpHandler.postDioHttpMethod(url: DefaultApiString.createCv, data: data);
    // request.files.add(await http.MultipartFile.fromPath('image', image.path));
    // request.fields.addAll(data);
    // var response = await request.send();
    // if(response.statusCode == 200){
    //   var responseData = await response.stream.toBytes();
    //   String responseString = String.fromCharCodes(responseData);
    //   CvModel cvModel = cvModelFromJson(responseString);
    //   if (cvModel.status == 200) {
    //     /*  var stringData = response['data'];
    //   var data = json.decode(stringData);*/
    //     hideLoadingDialog();
    //     return cvModel;
    //   } else {
    //     hideLoadingDialog();
    //     showToastMessage(context: context, message: "Something went wrong !");
    //     return "Something went wrong !";
    //   }
    } else {
      hideLoadingDialog();
      return "Something went wrong !";
    }
  }

  static updateCv({
    @required BuildContext context,
    String id,
    String userName,
    String contact,
    String about,
    String workExperience,
    String education,
    String skill,
  }) async {
    showLoadingDialog();
    Map response = await HttpHandler.putHttpMethod(url: "${DefaultApiString.cv}$id", data: {
      "name": userName,
      "phone": contact,
      "profile_address": about,
      "experience": workExperience,
      "degree": education,
      "skill": skill,
    });
    if (response["error_description"] == null) {
      var stringData = response['body'];
      var data = json.decode(stringData);
      NoDataModel noDataModel = noDataModelFromJson(json.encode(data));
      hideLoadingDialog();
      return noDataModel;
    } else if (response["error_description"] != null) {
      var stringData = response['body'];
      var data = json.decode(stringData);
      NoDataModel noDataModel = noDataModelFromJson(json.encode(data));
      hideLoadingDialog();
      return noDataModel;
    } else {
      hideLoadingDialog();
      return "Something Went Wrong";
    }
  }

  static getData({
    @required BuildContext context,
    String cvId,
  }) async {
    showLoadingDialog();
    Map response = await HttpHandler.getHttpMethod(
      url: "${DefaultApiString.cv}$cvId",
    );
    if (response["error_description"] == null) {
      hideLoadingDialog();
      return cvModelFromJson(response['body']);
    } else if (response["error_description"] != null) {
      hideLoadingDialog();
      return cvModelFromJson(response['body']);
    } else {
      hideLoadingDialog();
      return null;
    }
  }
}
