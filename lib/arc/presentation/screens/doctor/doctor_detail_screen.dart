import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riverhotel/arc/data/models/response_models/chat_response_model.dart';
import 'package:riverhotel/arc/data/models/response_models/doctor_response_model.dart';
import 'package:riverhotel/arc/presentation/screens/doctor/widgets/expandable_fab.dart';
import 'package:riverhotel/arc/presentation/widgets/commons/common.dart';
import 'package:riverhotel/src/config/config.dart';
import 'package:riverhotel/src/styles/style.dart';
import 'package:riverhotel/src/base_widget_state/base_cubit_stateful_widget.dart';
import 'package:riverhotel/static_variable.dart';
import '../../blocs/blocs.dart';
import '../../models/models.dart';
import 'widgets/comment_section.dart';
import 'widgets/information.dart';
import 'widgets/main_title.dart';
import 'widgets/profile_buttons.dart';

class DoctorDetailScreen extends BaseCubitStatefulWidget {
  final DoctorInfo? doctor;
  const DoctorDetailScreen({
    Key? key,
    required this.doctor,
  }) : super(key: key);

  @override
  State<DoctorDetailScreen> createState() => _DoctorDetailScreenState();
}

class _DoctorDetailScreenState
    extends BaseCubitStateFulWidgetState<DoctorBloc, DoctorDetailScreen> {
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // bloc.getDetailDoctor(widget.doctorID);
    //LoggerUtils.d("doctor" + widget.doctor.toString());
  }

  @override
  Widget buildContent(BuildContext context, state) {
    final size = MediaQuery.of(context).size;
    final doctor = widget.doctor;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("BÁC SĨ CHI TIẾT",
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
                    arguments: {"type": 1, "doctor": doctor});
              },
              icon: const Icon(
                Icons.calendar_today,
                color: Colors.white,
              ),
            ),
            ActionButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteKey.appointment,
                    arguments: {"type": 2, "doctor": doctor});
              },
              icon: const Icon(
                Icons.calendar_month,
                color: Colors.white,
              ),
            ),
            ActionButton(
              onPressed: () => navigator.pushNamed(RouteKey.getListDoctor,
                  arguments: {"isChat": true}),
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
            MainTitle(title: doctor?.doctorName ?? "Unknown"),
            SizedBox(
              height: 10,
            ),
            Information(size: size, data: doctor),
            SizedBox(
              height: size.height * 0.02,
            ),
            // ProfileButtons(size: size, data: doctor),
            // SizedBox(
            //   height: size.height * 0.03,
            // ),
            Container(
              height: 500,
              width: 500,
              child: Column(
                children: [
                  _getNavigationButtons(),
                  _getStackedContainers(doctor),
                ],
              ),
            ),
            CommentSection(
              size: size,
              doctorName: doctor?.doctorName ?? 'unknown',
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

  Widget _getStackedContainers(DoctorInfo? doctor) {
    return Expanded(
      child: IndexedStack(
        index: currentIndex,
        children: [
          const Text('Không có thông báo nào từ bác sĩ'),
          Container(),
          doctor?.doctorFullinfo != null
              ? Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Html(
                    data: doctor?.doctorFullinfo,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Quá trình đào tạo',
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text('${doctor?.doctorDescription}'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Chuyên khám và điều trị:',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                            '${doctor?.doctorspeciality?.speciality?.specialityDesc}'),
                      ),
                    ],
                  ),
                ),
          const Text('Bạn hãy là người đầu tiên hỏi bác sĩ'),
        ],
      ),
    );
  }
}
