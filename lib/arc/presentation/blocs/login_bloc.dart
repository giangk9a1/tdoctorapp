import 'package:riverhotel/arc/presentation/models/models.dart';
import 'package:riverhotel/arc/presentation/widgets/commons/dialog.dart';
import 'package:riverhotel/src/config/route_keys.dart';
import 'package:riverhotel/src/utilities/utilities.dart';
import 'package:riverhotel/src/validators/validators.dart';

import '../../../src/bloc/bloc.dart';
import '../../data/models/models.dart';
import '../../data/services/services.dart';

class LoginBloc extends BaseCubit<LoginScreenParam, LoginScreenModel> {
  final AuthService _service;
  LoginBloc(this._service) : super(InitialState());

  @override
  void initState() {
    super.initState();
    final params = LoginScreenParam();
    final model = LoginScreenModel();
    emit(LoadedState<LoginScreenParam, LoginScreenModel>(params, model));
    initData();
  }

  Future<void> initData() async {
    if (latestLoadedState is LoadedState) {
      final isRemeber = await appPreference.remember;
      model.isRemember = isRemeber == 'true' ? true : false;
      emit(latestLoadedState!.copyWith(model: model));
    }
  }

  Future<void> changeRemember() async {
    if (latestLoadedState is LoadedState) {
      final remember = model.isRemember ?? false;
      model.isRemember = !remember;
      appPreference.setRemember(model.isRemember.toString());
      emit(latestLoadedState!.copyWith(model: model));
    }
  }

  Future<void> login(String username, String password) async {
    if (latestLoadedState is LoadedState) {
      final listError = [];
      if (username.isEmpty) {
        listError.add('Số điện thoại');
      }
      if (password.isEmpty) {
        listError.add('Mật khẩu');
      }
      if (listError.isNotEmpty) {
        ToastView.show('${listError.join(', ')} không được bỏ trống!');
      } else if (!Validator.isPhone(username)) {
        ToastView.show('Số điện thoại không hợp lệ!');
      } else {
        emit(latestLoadedState!.copyWith(isShowLoading: true));
        final result = await _service.login(LoginRequestModel(
          username: username,
          password: password,
        ));
        final loginResponseModel = LoginResponseModel.fromJson(result.data);
        if (loginResponseModel.success ?? false) {
          ToastView.show("Login succcesss");
          appPreference.setToken(loginResponseModel.data?.token);
          navigator.pushNamedAndRemoveUntil(RouteKey.main);
        } else {
          ToastView.show(loginResponseModel.detail ?? '');
        }
      }

      if (model.isRemember ?? false) {
        appPreference.setUsername(username);
        appPreference.setPassword(password);
      }
      emit(latestLoadedState!.copyWith(model: model));
    }
  }
}
