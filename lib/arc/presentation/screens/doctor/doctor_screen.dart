import 'doctor.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({Key? key}) : super(key: key);

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
            MainTitle(),
            SizedBox(
              height: size.height * 0.08,
            ),
            Information(size: size),
            SizedBox(
              height: size.height * 0.03,
            ),
            ProfileButtons(size: size),
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              height: 300,
              width: 500,
              child: Column(
                children: [
                  _getNavigationButtons(),
                  _getStackedContainers(),
                ],
              ),
            ),
            CommentSection(size: size),
          ]),
        ));
  }

  Widget _getStackedContainers() {
    return Expanded(
      child: IndexedStack(
        index: currentIndex,
        children: [
          Text('Không có thông báo nào từ bác sĩ'),
          Container(),
          Container(
            color: Colors.green,
            height: 300,
            width: 300,
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
