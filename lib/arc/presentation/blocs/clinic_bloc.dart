// ignore_for_file: unused_local_variable

import 'package:riverhotel/arc/data/models/response_models/province_response_model.dart';
import 'package:riverhotel/arc/data/services/clinic_service.dart';
import 'package:riverhotel/arc/presentation/models/clinic/clinic_model.dart';
import 'package:riverhotel/src/bloc/base_cubit.dart';
import 'package:riverhotel/src/bloc/base_state.dart';
import 'package:riverhotel/src/utilities/utilities.dart';

import '../../data/models/response_models/clinic_response_model.dart';
import '../../data/models/response_models/specialty_response_model.dart';

class ClinicBloc extends BaseCubit<ClinicScreenParams, ClinicScreenModel> {
  final ClinicService _service;

  ClinicBloc(this._service) : super(InitialState());

  @override
  void initState() {
    super.initState();
    final params = ClinicScreenParams();
    final model = ClinicScreenModel();
    emit(LoadedState<ClinicScreenParams, ClinicScreenModel>(params, model));
  }

  Future<void> getListClinic(
      int page, int? province, String? speciality) async {
    if (latestLoadedState is LoadedState) {
      emit(latestLoadedState!.copyWith(isShowLoading: true));
      final result = await _service.getListClinic(
          page, province ?? null, speciality ?? null);
      final response = ClinicResponseModel.fromJson(result.data);
      if (response.success == true) {
        model.listClinic = response.data?.data;
      }
      emit(latestLoadedState!.copyWith(isShowLoading: false, model: model));
    }
  }

  Future<void> getMoreClinic(
      int page, int? province, String? speciality) async {
    if (latestLoadedState is LoadedState) {
      LoggerUtils.d(page);
      //  emit(latestLoadedState!.copyWith(isShowLoading: true));
      final result = await _service.getListClinic(
          page, province ?? null, speciality ?? null);
      final response = ClinicResponseModel.fromJson(result.data);
      if (response.success == true) {
        //model.listClinic = result.data['data'];
        final list = model.listClinic ?? [];
        list.addAll(response.data?.data ?? []);
        model.listClinic = list;
      }
      emit(latestLoadedState!.copyWith(isShowLoading: false, model: model));
    }
  }

  Future<void> getListProvince() async {
    if (latestLoadedState is LoadedState) {
      emit(latestLoadedState!.copyWith(isShowLoading: true));
      final result = await _service.getListProvince();

      final response = ProvinceResponseModel.fromJson(result.data);
      if (response.success == true) {
        model.listProvince = response.data ?? [];
        LoggerUtils.d(model.listProvince);
      }
      emit(latestLoadedState!.copyWith(isShowLoading: false, model: model));
    }
  }

  Future<void> getListSpeciality() async {
    if (latestLoadedState is LoadedState) {
      emit(latestLoadedState!.copyWith(isShowLoading: true));
      final result = await _service.getListSpeciality();

      final response = SpecialtyResponseModel.fromJson(result.data);
      LoggerUtils.d(response.data);
      if (response.success == true) {
        model.listSpeciality = response.data ?? [];
        LoggerUtils.d(model.listSpeciality);
      }
      emit(latestLoadedState!.copyWith(isShowLoading: false, model: model));
    }
  }

  Future<void> getDetailClinic(String clinicID) async {
    if (latestLoadedState is LoadedState) {
      emit(latestLoadedState!.copyWith(isShowLoading: true));
      final result = await _service.getDetailClinic(clinicID);
      final response = ClinicDetailResponseModel.fromJson(result.data);
      if (response.success == true) {
        ClinicInfo? clinic = response.data;
        model.clinic = clinic;
      }
    }
  }
}
