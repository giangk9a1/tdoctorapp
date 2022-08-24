import 'package:get_it/get_it.dart';
import 'package:riverhotel/arc/presentation/blocs/blocs.dart';
import 'package:riverhotel/arc/presentation/blocs/register_bloc.dart';
import 'package:riverhotel/src/network/network.dart';
import 'package:riverhotel/src/utilities/utilities.dart';
import '/src/preferences/app_preference.dart';
import 'arc/data/requests/requests.dart';
import 'arc/data/services/province_service.dart';
import 'arc/data/services/services.dart';

class AppDependencies {
  static GetIt get injector => GetIt.I;

  static Future<void> initialize() async {
    _initRequest();
    _initServices();
    _initBlocs();
    injector.registerLazySingleton<AppPreference>(() => AppPreference());
    injector.registerLazySingleton<AppClient>(() => AppClient());
    injector
        .registerLazySingleton<NavigationService>(() => NavigationService());
  }

  static void _initRequest() {
    injector.registerLazySingleton<BaseReq>(() => BaseReq());
  }

  static void _initServices() {
    injector.registerLazySingleton<AuthService>(() => AuthService(injector()));
    injector.registerLazySingleton<ChatService>(() => ChatService(injector()));
    injector
        .registerLazySingleton<DoctorService>(() => DoctorService(injector()));
    injector
        .registerLazySingleton<ChooseService>(() => ChooseService(injector()));

    injector
        .registerLazySingleton<ClinicService>(() => ClinicService(injector()));
    injector.registerLazySingleton<AppointmentService>(
        () => AppointmentService(injector()));
  }

  static void _initBlocs() {
    injector.registerFactory<ThemeBloc>(() => ThemeBloc());
    injector.registerFactory<MainBloc>(() => MainBloc());
    injector.registerFactory<SplashBloc>(() => SplashBloc());
    injector.registerFactory<ChatBloc>(() => ChatBloc(injector()));
    injector.registerFactory<LoginBloc>(() => LoginBloc(injector()));
    injector.registerFactory<RegisterBloc>(() => RegisterBloc(injector()));
    injector.registerFactory<DoctorBloc>(() => DoctorBloc(injector()));
    injector.registerFactory<ChooseBloc>(() => ChooseBloc(injector()));
    injector.registerFactory<ClinicBloc>(() => ClinicBloc(injector()));
    injector
        .registerFactory<AppointmentBloc>(() => AppointmentBloc(injector()));
  }
}
