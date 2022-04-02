import 'package:e_recruitment/config/default_data.dart';
import 'package:e_recruitment/model/signup_model.dart';
import 'package:e_recruitment/utils/common/loading_dialog.dart';
import 'package:e_recruitment/utils/http_handler.dart';

class SignUpRepository {
  static signUp({
    String name,
    String phone,
    String email,
    String password,
    bool isAdmin,
  }) async {
    showLoadingDialog();
    var data = {
      "password": "$password",
      "email": "$email",
      "userName": "$name",
      "role": isAdmin == true ? "admin" : "user",
      "mobile": "$phone",
      "isActive": true
    };
    Map response = await HttpHandler.postDioHttpMethod(
        url: isAdmin == true ? DefaultApiString.adminSignUp : DefaultApiString.signUp, data: data);
    if (response["error_description"] == null) {
      /*  var stringData = response['data'];
      var data = json.decode(stringData);*/

      SignUpModel signUpModel = signUpModelFromJson(response['body']);
      hideLoadingDialog();
      return signUpModel;
    }
    if (response["error_description"] == "400") {
      /* var stringData = response['body'];
      var data = json.decode(stringData);*/

      SignUpModel signUpModel = signUpModelFromJson(response['body']);
      hideLoadingDialog();
      return signUpModel;
    } else {
      hideLoadingDialog();
      return "Something went wrong !";
    }
  }
}