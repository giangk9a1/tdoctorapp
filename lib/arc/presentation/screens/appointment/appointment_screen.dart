import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:riverhotel/arc/data/models/response_models/clinic_response_model.dart';
import 'package:riverhotel/arc/data/models/response_models/province_response_model.dart';
import 'package:riverhotel/arc/data/services/pick_service.dart';
import 'package:riverhotel/arc/presentation/blocs/blocs.dart';

import 'package:riverhotel/src/base_widget_state/base_cubit_stateful_widget.dart';
import 'package:riverhotel/src/styles/style.dart';
import 'package:riverhotel/static_variable.dart';

import '../../../../src/utilities/logger.dart';
import '../../../data/models/response_models/doctor_response_model.dart';
import '../../../data/models/response_models/province.dart';
import 'widgets/annotate_header.dart';
import 'widgets/symptom_text_field.dart';

class AppointmentScreen extends BaseCubitStatefulWidget {
  const AppointmentScreen(
      {Key? key,
      required this.type,
      required this.doctor,
      required this.clinic})
      : super(key: key);
  final int type;
  final DoctorInfo? doctor;
  final ClinicInfo? clinic;
  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState
    extends BaseCubitStateFulWidgetState<AppointmentBloc, AppointmentScreen> {
  DateTime dateTime = DateTime.now();
  String pickedProvince = 'Chọn Tỉnh/Thành phố';
  String pickedDistrict = "Chọn Quận/Huyện";

  @override
  Widget buildContent(BuildContext context, state) {
    final provinces = StaticVariable.provinces;
    final size = MediaQuery.of(context).size;
    LoggerUtils.d("ExaminationDate: ${widget.doctor?.doctorName}");

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          (widget.type == 1) ? "HẸN KHÁM TẠI NHÀ" : "KHÁM TẠI PHÒNG KHÁM",
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnnotateHeader(doctor: widget.doctor, size: size),
            SizedBox(height: size.height * 0.03),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            fixedSize: Size(size.width, size.height * 0.03)),
                        onPressed: () async {
                          dateTime = await PickService.pickDateTime(context)
                              as DateTime;
                          setState(() {});
                        },
                        child: Text(
                            'Bạn muốn khám lúc: ${dateTime.hour}:${dateTime.minute} - ${dateTime.day}/${dateTime.month}/${dateTime.year}')),
                  ),
                  OutlinedButton(
                    child: Text(pickedProvince),
                    style: OutlinedButton.styleFrom(
                        fixedSize: Size(size.width, size.height * 0.03)),
                    onPressed: () {
                      showProvinceDialog(context, provinces);
                    },
                  ),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          fixedSize: Size(size.width, size.height * 0.03)),
                      onPressed: () {
                        if (pickedProvince.contains("Chọn") == false) {
                          Province target = provinces.firstWhere((element) =>
                              element.name!.contains(pickedProvince));
                          showDistrictDialog(context, target);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Bạn phải nhập tỉnh thành trước!')));
                        }
                      },
                      child: Text(pickedDistrict)),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            SymptomTextField(size: size),
            SizedBox(
              height: size.height * 0.06,
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  child: const Text('ĐẶT LỊCH KHÁM'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    fixedSize: const Size(300, 10),
                    onPrimary: Colors.white,
                    primary: Colors.blue,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> showDistrictDialog(BuildContext context, Province target) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: const EdgeInsets.only(left: 25, right: 25),
            title: const Center(child: Text("Chọn Quận/Huyện")),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            content: Container(
                margin: const EdgeInsets.only(top: 20),
                height: 600,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    itemCount: target.districts!.length,
                    itemBuilder: (context, index) {
                      final district = target.districts![index];
                      return ListTile(
                        onTap: () {
                          setState(() {
                            pickedDistrict = district.name!;
                            Navigator.pop(context);
                          });
                        },
                        title: Text(
                          district.name!,
                          style: const TextStyle(color: Colors.black),
                        ),
                      );
                    })),
          );
        });
  }

  Future<dynamic> showProvinceDialog(
      BuildContext context, List<Province> provinces) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: const EdgeInsets.only(left: 25, right: 25),
            title: const Center(child: Text('Chọn Tỉnh/Thành phố')),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            content: Container(
                margin: const EdgeInsets.only(top: 10),
                height: 600,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    itemCount: provinces.length,
                    itemBuilder: (context, index) {
                      final province = provinces[index];
                      var name = PickService.getProvinceName(province.name!);
                      return ListTile(
                        onTap: () {
                          setState(() {
                            pickedProvince = name;
                            LoggerUtils.d(pickedProvince);
                            pickedDistrict = "Chọn Quận/Huyện";
                            Navigator.pop(context);
                          });
                        },
                        title: Text(
                          name,
                          style: const TextStyle(color: Colors.black),
                        ),
                      );
                    })),
          );
        });
  }
}
