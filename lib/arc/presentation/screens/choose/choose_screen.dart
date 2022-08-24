import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:riverhotel/arc/presentation/blocs/choose_bloc.dart';
import 'package:riverhotel/arc/presentation/screens/clinic/clinic_screen.dart';
import 'package:riverhotel/arc/presentation/screens/screens.dart';
import 'package:riverhotel/arc/presentation/widgets/commons/common.dart';
import 'package:riverhotel/src/base_widget_state/base_cubit_stateful_widget.dart';
import 'package:riverhotel/src/styles/style.dart';
import 'package:riverhotel/translation_key.dart';
import '../../../../src/config/route_keys.dart';
import '../../../../src/utilities/logger.dart';

class ChooseScreen extends BaseCubitStatefulWidget {
  final String? module;
  const ChooseScreen({Key? key, required this.module}) : super(key: key);

  @override
  State<ChooseScreen> createState() => _ChooseScreenState();
}

class _ChooseScreenState
    extends BaseCubitStateFulWidgetState<ChooseBloc, ChooseScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget buildContent(BuildContext context, state) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: (widget.module == '1')
              ? const Text(
                  "HẸN KHÁM TẠI NHÀ",
                  style: TextStyle(fontSize: Dimens.size20),
                )
              : const Text(
                  "KHÁM TẠI PHÒNG KHÁM",
                  style: TextStyle(fontSize: Dimens.size20),
                ),
          elevation: 0,
          backgroundColor: MyColors.primaryColor,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: SvgPicture.asset(
                'assets/svgs/ic_back.svg',
                color: MyColors.backgroundColor,
              ),
            ),
          ),
          actions: [
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(right: 18),
                child: SvgPicture.asset(
                  'assets/svgs/ic_home.svg',
                  color: MyColors.backgroundColor,
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(children: [_tabBar(), _tabBarView()]))));
  }

  _tabBar() {
    return Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: TabBar(
            controller: _tabController,
            labelStyle: const TextStyle(
                fontFamily: "Comfortaa",
                fontSize: 24,
                fontWeight: FontWeight.bold),
            tabs: [
              Text(TranslationKey.clinic.tr()),
              Text(TranslationKey.doctor.tr())
            ],
            indicatorColor: Colors.black,
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
            labelPadding:
                const EdgeInsets.symmetric(horizontal: 13, vertical: 2),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black.withOpacity(0.5),
            isScrollable: true));
  }

  _tabBarView() {
    return Expanded(
        child: TabBarView(controller: _tabController, children: [
      const ClinicScreen(),
      const DoctorScreen(isChat: false),
    ]));
  }
}
