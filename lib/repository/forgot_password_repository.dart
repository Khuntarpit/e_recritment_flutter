import 'dart:convert';

import 'package:e_recruitment/config/default_data.dart';
import 'package:e_recruitment/model/forgot_password_model.dart';
import 'package:e_recruitment/utils/common/loading_dialog.dart';
import 'package:e_recruitment/utils/http_handler.dart';

class ForgotPasswordRepository{

  static forgotPassword({
    String email,
  })async {
    showLoadingDialog();
    Map response = await HttpHandler.postHttpMethod(
        url: DefaultApiString.forgotPassword,
        data: {
          "email": email,
          "role": "user",
        });

    if (response["error_description"] == null) {
      var stringData = response['body'];
      var data = json.decode(stringData);
      ForgotPasswordModel forgotPasswordModel = forgotPasswordModelFromJson(json.encode(data));
      hideLoadingDialog();
      return forgotPasswordModel;
    } else if (response["error_description"] != null) {
      var stringData = response['body'];
      var data = json.decode(stringData);
      hideLoadingDialog();
      return data;
    } else {
      hideLoadingDialog();
      return null;
    }
  }

}