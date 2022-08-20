import 'package:riverhotel/arc/data/models/models.dart';
import 'package:riverhotel/arc/data/models/response_models/doctor_response_model.dart';
import 'package:riverhotel/arc/presentation/blocs/doctor_profile_bloc.dart';
import 'package:riverhotel/arc/presentation/models/doctor_profile/doctor_profile_model.dart';
import 'package:riverhotel/src/base_widget_state/base_cubit_stateful_widget.dart';

import 'doctor.dart';

class DoctorScreen extends BaseCubitStatefulWidget {
  const DoctorScreen({Key? key}) : super(key: key);

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState
    extends BaseCubitStateFulWidgetState<DoctorProfileBloc, DoctorScreen> {
  int currentIndex = 0;
  int doctorId = 90201;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.getDoctorProfile(doctorId);
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

  @override
  Widget buildContent(BuildContext context, state) {
    final size = MediaQuery.of(context).size;
    final model = state.model as DoctorProfileModel;
    return Scaffold(
        appBar: AppBar(
          title: Text("Thông tin"),
        ),
        floatingActionButton: SpeedDial(
          backgroundColor: Colors.blue,
          animatedIcon: AnimatedIcons.menu_close,
          iconTheme: IconThemeData(color: Colors.white),
          children: [
            SpeedDialChild(
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.calendar_today,
                  color: Colors.white,
                ),
                label: 'Hẹn tái khám'),
            SpeedDialChild(
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.calendar_month,
                  color: Colors.white,
                ),
                label: 'Đặt khám online'),
            SpeedDialChild(
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.messenger,
                color: Colors.white,
              ),
              label: 'Chat với bác sĩ',
            ),
            SpeedDialChild(
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.video_call,
                  color: Colors.white,
                ),
                label: 'Gọi video'),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 30,
            ),
            MainTitle(title: model.doctor?.data?.doctorName ?? "Unknown"),
            SizedBox(
              height: size.height * 0.08,
            ),
            Information(size: size, data: model.doctor?.data),
            SizedBox(
              height: size.height * 0.03,
            ),
            ProfileButtons(size: size, data: model.doctor?.data),
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              height: 500,
              width: 500,
              child: Column(
                children: [
                  _getNavigationButtons(),
                  _getStackedContainers(model.doctor),
                ],
              ),
            ),
            CommentSection(
              size: size,
              doctorName: model.doctor?.data?.doctorName ?? 'unknown',
            ),
          ]),
        ));
  }

  Widget _getStackedContainers(DoctorResponseModel? data) {
    return Expanded(
      child: IndexedStack(
        index: currentIndex,
        children: [
          Text('Không có thông báo nào từ bác sĩ'),
          Container(),
          Container(
            height: 700,
            width: 300,
            child: Column(
              children: [
                Text(
                  'Quá trình đào tạo',
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text('${data?.data?.doctorDescription}'),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Chuyên khám và điều trị:',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                      '${data?.data?.doctorspeciality?.speciality?.specialityDesc}'),
                ),
              ],
            ),
          ),
          Text('Bạn hãy là người đầu tiên hỏi bác sĩ'),
        ],
      ),
    );
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
          child: Text('THÔNG BÁO'),
          style: TextButton.styleFrom(
              backgroundColor: Colors.transparent, fixedSize: Size(90, 60)),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              currentIndex = 1;
            });
          },
          child: Text('LÂM SÀNG'),
          style: TextButton.styleFrom(
              backgroundColor: Colors.transparent, fixedSize: Size(90, 60)),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              currentIndex = 2;
            });
          },
          child: Text('THÔNG TIN'),
          style: TextButton.styleFrom(
              backgroundColor: Colors.transparent, fixedSize: Size(90, 60)),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              currentIndex = 3;
            });
          },
          child: Text('HỎI ĐÁP'),
          style: TextButton.styleFrom(
              backgroundColor: Colors.transparent, fixedSize: Size(90, 60)),
        ),
      ],
    );
  }
}
