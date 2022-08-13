import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riverhotel/arc/presentation/widgets/commons/common.dart';
import 'package:riverhotel/injector.dart';
import 'package:flutter/material.dart';
import 'package:riverhotel/src/bloc/bloc.dart';
import 'package:riverhotel/src/utilities/dialog_utility.dart';

abstract class BaseCubitStatefulWidget extends StatefulWidget {
  const BaseCubitStatefulWidget({Key? key}) : super(key: key);
}

abstract class BaseCubitStateFulWidgetState<B extends BaseCubit,
        S extends BaseCubitStatefulWidget> extends State<S>
    with WidgetsBindingObserver {
  final B bloc = AppDependencies.injector.get<B>();
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    bloc.initState();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    bloc.didChangeDependencies();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    bloc.close();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        onResume();
        break;
      case AppLifecycleState.paused:
        onPause();
        break;
      case AppLifecycleState.inactive:
        onInactive();
        break;
      default:
        onDetach();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  @mustCallSuper
  void onResume() {
    bloc.onResume();
  }

  @mustCallSuper
  void onPause() {
    bloc.onPause();
  }

  @mustCallSuper
  void onDetach() {
    bloc.onDetach();
  }

  @mustCallSuper
  void onInactive() {
    bloc.onInactive();
  }

  Widget buildBody(BuildContext context) {
    return BlocProvider<B>(
      create: (context) => bloc,
      child: BlocConsumer<B, BaseState>(
        builder: (context, state) {
          if (state is InitialState) {
            return buildInitialContent(context, state);
          }
          if (state is NoDataState) {
            return buildNoDataContent(context, state);
          }

          if (state is ErrorState) {
            return buildContentError(context, state);
          }

          if (state is LoadedState) {
            return buildContent(context, state);
          }

          return const SizedBox();
        },
        listener: listener,
      ),
    );
  }

  Widget buildInitialContent(BuildContext context, InitialState state) =>
      const LoadingWidget();

  Widget buildNoDataContent(BuildContext context, NoDataState state) =>
      const SizedBox();

  Widget buildContentError(BuildContext context, ErrorState state) =>
      const SizedBox();

  Widget buildContent(BuildContext context, LoadedState state) =>
      const SizedBox();

  @mustCallSuper
  void listener(BuildContext context, BaseState state) {
    if (state is InitialState) {
      EasyLoading.show(context);
    } else if (state is LoadedState && state.isShowLoading) {
      EasyLoading.show(context);
    } else {
      EasyLoading.dismiss();
    }
  }

  PreferredSizeWidget? buildAppbar(BuildContext context) => null;
  Widget? buildDrawer(BuildContext context) => null;
}
