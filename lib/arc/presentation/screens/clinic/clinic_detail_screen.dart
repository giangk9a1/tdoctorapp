import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riverhotel/arc/data/models/response_models/clinic_response_model.dart';
import 'package:riverhotel/arc/data/models/response_models/doctor_response_model.dart';
import 'package:riverhotel/arc/presentation/blocs/blocs.dart';
import 'package:riverhotel/arc/presentation/screens/doctor/doctor.dart';
import 'package:riverhotel/arc/presentation/screens/doctor/widgets/expandable_fab.dart';
import 'package:riverhotel/src/base_widget_state/base_cubit_stateful_widget.dart';
import 'package:riverhotel/src/config/config.dart';
import 'package:riverhotel/src/styles/style.dart';

import '../../models/models.dart';
import 'widgets/comment_section.dart';
import 'widgets/information.dart';
import 'widgets/main_title.dart';
import 'widgets/profile_buttons.dart';

class ClinicDetailScreen extends BaseCubitStatefulWidget {
  final ClinicInfo? clinic;
  const ClinicDetailScreen({
    Key? key,
    required this.clinic,
  }) : super(key: key);

  @override
  State<ClinicDetailScreen> createState() => _ClinicDetailScreenState();
}

class _ClinicDetailScreenState
    extends BaseCubitStateFulWidgetState<ClinicBloc, ClinicDetailScreen> {
  int currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget buildContent(BuildContext context, state) {
    final size = MediaQuery.of(context).size;
    final clinic = widget.clinic;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("CƠ SỞ Y TẾ CHI TIẾT",
              style: TextStyle(fontSize: Dimens.size20)),
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
        floatingActionButton: ExpandableFab(
          initialOpen: true,
          distance: 112.0,
          children: [
            ActionButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteKey.appointment,
                    arguments: {"type": 1, "clinic": clinic});
              },
              icon: const Icon(
                Icons.calendar_today,
                color: Colors.white,
              ),
            ),
            ActionButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteKey.appointment,
                    arguments: {"type": 2, "clinic": clinic});
              },
              icon: const Icon(
                Icons.calendar_month,
                color: Colors.white,
              ),
            ),
            ActionButton(
              onPressed: () {},
              icon: const Icon(
                Icons.videocam,
                color: Colors.white,
              ),
            ),
            ActionButton(
              onPressed: () {},
              icon: const Icon(
                Icons.chat_bubble,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 10,
            ),
            MainTitle(title: clinic?.clinicName ?? "Unknown"),
            SizedBox(
              height: size.height * 0.01,
            ),
            Information(size: size, data: clinic),
            SizedBox(
              height: size.height * 0.01,
            ),
            //     ProfileButtons(size: size, data: clinic),
            // SizedBox(
            //   height: size.height * 0.03,
            // ),
            Container(
              height: 500,
              width: 500,
              child: Column(
                children: [
                  _getNavigationButtons(),
                  _getStackedContainers(clinic),
                ],
              ),
            ),
            CommentSection(
              size: size,
              doctorName: clinic?.clinicName ?? 'unknown',
            ),
          ]),
        ));
  }

  double _calculateRating(List<dynamic> rating) {
    if (rating.isEmpty) {
      return 5.0;
    }
    double sum = 0;
    rating.forEach((element) {
      sum += double.parse(element['number_star']);
    });
    return sum / 5;
  }

  Widget _getNavigationButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            setState(() {
              currentIndex = 0;
            });
          },
          child: const Text('THÔNG BÁO'),
          style: TextButton.styleFrom(
              backgroundColor: Colors.transparent, fixedSize: Size(90, 60)),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              currentIndex = 1;
            });
          },
          child: const Text('LÂM SÀNG'),
          style: TextButton.styleFrom(
              backgroundColor: Colors.transparent, fixedSize: Size(90, 60)),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              currentIndex = 2;
            });
          },
          child: const Text('THÔNG TIN'),
          style: TextButton.styleFrom(
              backgroundColor: Colors.transparent, fixedSize: Size(90, 60)),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              currentIndex = 3;
            });
          },
          child: const Text('HỎI ĐÁP'),
          style: TextButton.styleFrom(
              backgroundColor: Colors.transparent, fixedSize: Size(90, 60)),
        ),
      ],
    );
  }

  Widget _getStackedContainers(ClinicInfo? clinic) {
    return Expanded(
      child: IndexedStack(
        index: currentIndex,
        children: [
          Text('Không có thông báo nào từ bác sĩ'),
          Container(),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Html(
              data: clinic?.clinicDesc,
            ),
          ),
          const Text('Bạn hãy là người đầu tiên hỏi bác sĩ'),
        ],
      ),
    );
  }
}
