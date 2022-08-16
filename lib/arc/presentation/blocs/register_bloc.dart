import 'package:riverhotel/arc/presentation/models/models.dart';
import 'package:riverhotel/arc/presentation/widgets/commons/dialog.dart';
import 'package:riverhotel/src/config/route_keys.dart';
import 'package:riverhotel/src/utilities/utilities.dart';
import 'package:riverhotel/src/validators/validators.dart';

import '../../../src/bloc/bloc.dart';
import '../../data/models/models.dart';
import '../../data/services/services.dart';

class RegisterBloc extends BaseCubit<RegisterScreenParam, RegisterScreenModel> {
  final AuthService _service;
  RegisterBloc(this._service) : super(InitialState());

  @override
  void initState() {
    super.initState();
    final params = RegisterScreenParam();
    final model = RegisterScreenModel();
    emit(LoadedState<RegisterScreenParam, RegisterScreenModel>(params, model));
  }

  Future<void> register(
      String username, String password, String referId) async {
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
        final check = await _service.existedPhone(username);
        final checkResponseModel = RegisterResponseModel.fromJson(check.data);
        if (checkResponseModel.success ?? false) {
          final result = await _service.register(RegisterRequestModel(
            mobilePhone: username,
            password: password,
            referId: referId,
          ));
          final loginResponseModel = LoginResponseModel.fromJson(result.data);
          if (loginResponseModel.success ?? false) {
            ToastView.show("Register succcesss");
            appPreference.setToken(loginResponseModel.data?.token);
            navigator.pushNamedAndRemoveUntil(RouteKey.main);
          } else {
            ToastView.show(loginResponseModel.detail ?? '');
          }
        } else {
          ToastView.show(checkResponseModel.detail ?? '');
          emit(latestLoadedState!.copyWith(isShowLoading: false));
        }
      }
      emit(latestLoadedState!.copyWith(model: model));
    }
  }
}
