// ignore_for_file: unused_local_variable

import 'package:dio/dio.dart';
import 'package:riverhotel/arc/data/models/response_models/province_response_model.dart';
import 'package:riverhotel/arc/data/services/doctor_service.dart';
import 'package:riverhotel/arc/presentation/models/doctor/doctor_model.dart';
import 'package:riverhotel/src/bloc/base_cubit.dart';
import 'package:riverhotel/src/bloc/base_state.dart';
import 'package:riverhotel/src/utilities/utilities.dart';

import '../../data/models/response_models/doctor_response_model.dart';
import '../../data/models/response_models/specialty_response_model.dart';

class DoctorBloc extends BaseCubit<DoctorScreenParams, DoctorScreenModel> {
  final DoctorService _service;

  DoctorBloc(this._service) : super(InitialState());

  @override
  void initState() {
    super.initState();
    final params = DoctorScreenParams();
    final model = DoctorScreenModel();
    emit(LoadedState<DoctorScreenParams, DoctorScreenModel>(params, model));
  }

  Future<void> getListDoctor(
      int page, int? province, String? speciality) async {
    if (latestLoadedState is LoadedState) {
      emit(latestLoadedState!.copyWith(isShowLoading: true));
      final result = await _service.getListDoctor(
          page, province ?? null, speciality ?? null);
      final response = DoctorResponseModel.fromJson(result.data);
      if (response.success == true) {
        model.listDoctor = response.data?.data;
      }
      emit(latestLoadedState!.copyWith(isShowLoading: false, model: model));
    }
  }

  Future<void> getMoreDoctor(
      int page, int? province, String? speciality) async {
    if (latestLoadedState is LoadedState) {
      LoggerUtils.d(page);
      //  emit(latestLoadedState!.copyWith(isShowLoading: true));
      final result = await _service.getListDoctor(
          page, province ?? null, speciality ?? null);
      final response = DoctorResponseModel.fromJson(result.data);
      if (response.success == true) {
        //model.listDoctor = result.data['data'];
        final list = model.listDoctor ?? [];
        list.addAll(response.data?.data ?? []);
        model.listDoctor = list;
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

  Future<void> getDetailDoctor(int doctorID) async {
    if (latestLoadedState is LoadedState) {
      // emit(latestLoadedState!.copyWith(isShowLoading: true));
      final result = await _service.getDetailDoctor(doctorID);
      final response = DoctorDetailResponseModel.fromJson(result.data);
      if (response.success == true) {
        DoctorInfo? doctor = response.data;
        model.doctor = doctor;
      }
    }
  }
}
