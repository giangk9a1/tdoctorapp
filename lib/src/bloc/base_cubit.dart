import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riverhotel/injector.dart';
import 'package:riverhotel/src/preferences/app_preference.dart';

import 'base_state.dart';

abstract class BaseCubit<TParam, TModel> extends Cubit<BaseState> {
  String? title;
  String? id;

  final pref = AppDependencies.injector.get<AppPreference>();
  final StreamController<bool> _loadingController =
      StreamController<bool>.broadcast();

  StreamSink<bool> get loadingSink => _loadingController.sink;
  Stream<bool> get loadingStream => _loadingController.stream;

  BaseCubit(BaseState state) : super(state);

  LoadedState<TParam, TModel>? get latestLoadedState {
    if (state is LoadedState) {
      return state as LoadedState<TParam, TModel>;
    }
    return null;
  }

  TModel get model => (latestLoadedState?.model as TModel);

  TParam get param => (latestLoadedState?.params as TParam);

  void initState() {}

  void didChangeDependencies() {}

  void onResume() {}

  void onPause() {}

  void onDetach() {}

  void onInactive() {}

  void showLoading() => loadingSink.add(true);

  void dismissLoading() => loadingSink.add(false);

  @mustCallSuper
  @override
  Future<void> close() {
    _loadingController.close();
    return super.close();
  }
}
