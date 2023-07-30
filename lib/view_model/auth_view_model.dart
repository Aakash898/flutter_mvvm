import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mvvm/repository/auth_repository.dart';
import 'package:flutter_mvvm/utils/routes/routes_name.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  final myRepo = AuthRepository();

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _signUpLoading = false;

  bool get signUploading => _signUpLoading;

  setSignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    myRepo.loginApi(data).then((value) async {
      setLoading(false);

      Fluttertoast.showToast(msg: "Login Successfully");
      Navigator.pushNamed(context, RoutesName.home);
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        Fluttertoast.showToast(msg: error.toString());
      }
    });
  }
}
