import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riverhotel/arc/data/models/response_models/province_response_model.dart';
import 'package:riverhotel/arc/presentation/blocs/doctor_bloc.dart';
import 'package:riverhotel/arc/presentation/screens/home/widgets/item_menu.dart';
import 'package:riverhotel/arc/presentation/widgets/commons/common.dart';
import 'package:riverhotel/arc/presentation/widgets/commons/dropdown_text_input.dart';
import 'package:riverhotel/src/base_widget_state/base_cubit_stateful_widget.dart';
import 'package:riverhotel/src/styles/style.dart';
import 'package:riverhotel/arc/presentation/models/doctor/doctor_model.dart';
import 'package:riverhotel/translation_key.dart';
import '../../../../src/config/route_keys.dart';
import '../../../../src/utilities/logger.dart';
import '../../../data/models/response_models/doctor_response_model.dart';
import '../../../data/models/response_models/specialty_response_model.dart';

class DoctorScreen extends BaseCubitStatefulWidget {
  final bool? isChat;
  const DoctorScreen({Key? key, required bool this.isChat}) : super(key: key);

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState
    extends BaseCubitStateFulWidgetState<DoctorBloc, DoctorScreen> {
  int page = 0;
  ProvinceModel? selectProvince;
  SpecialtyModel? selectSpeciality;
  String? specialityValue;
  @override
  void initState() {
    super.initState();
    bloc.getListDoctor(page, selectProvince?.id ?? null,
        selectSpeciality?.specialtyUrl ?? null);
    bloc.getMoreDoctor(page, selectProvince?.id ?? null,
        selectSpeciality?.specialtyUrl ?? null);
    bloc.getListProvince();
    bloc.getListSpeciality();
  }

  @override
  Widget buildContent(BuildContext context, state) {
    final model = state.model as DoctorScreenModel;
    final listDoctor = model.listDoctor ?? [];
    final listProvince = model.listProvince ?? [];
    final listSpeciality = model.listSpeciality ?? [];

    LoggerUtils.d(widget.isChat);

    return Scaffold(
      // if (widget.isChat == true){
      appBar: widget.isChat == true
          ? AppBar(
              centerTitle: true,
              title: const Text(
                "DANH SÁCH BÁC SĨ",
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
            )
          : null,
      //    }
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Gặp các bác sĩ của chúng tôi',
                style: TextStyle(
                  fontSize: Dimens.size18,
                  fontWeight: FontWeight.w700,
                  color: MyColors.black,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 10,
              ),
              DropdownTextInput<ProvinceModel>(
                hint: TranslationKey.chooseProvince.tr(),
                initialValue: selectProvince,
                items: listProvince,
                valueShow: (item) => item.name ?? '',
                onChanged: (ProvinceModel? provinceModel) {
                  setState(() {
                    selectProvince = provinceModel;
                    bloc.getListDoctor(page, selectProvince?.id ?? null,
                        selectSpeciality?.specialtyUrl ?? null);
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              DropdownTextInput<SpecialtyModel>(
                hint: TranslationKey.chooseSpeciality.tr(),
                initialValue: selectSpeciality,
                items: listSpeciality,
                valueShow: (item) => item.specialtyName ?? '',
                onChanged: (SpecialtyModel? specialityModel) {
                  setState(() {
                    selectSpeciality = specialityModel;
                    bloc.getListDoctor(page, selectProvince?.id ?? null,
                        selectSpeciality?.specialtyUrl ?? null);
                  });
                },
              ),
              // if (listSpeciality != null)
              //   Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: DropdownButton<SpecialtyModel>(
              //       isExpanded: true,
              //       hint: Text(TranslationKey.chooseProvince.tr()),
              //       value: selectSpeciality,
              //       items: listSpeciality.map((speciality) {
              //         return DropdownMenuItem<SpecialtyModel>(
              //             value: speciality,
              //             child: Text(speciality.specialtyName ?? '',
              //                 style: TextStyle(
              //                     fontSize: Dimens.size16,
              //                     color: Colors.black)));
              //       }).toList(),
              //       onChanged: (SpecialtyModel? newValue) {
              //         setState(() {
              //           selectSpeciality = newValue;
              //         });
              //         print(selectProvince);
              //       },
              //     ),
              //   ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: AppListView(
                data: listDoctor,
                onLoadMore: () {
                  page++;
                  bloc.getMoreDoctor(page, selectProvince?.id ?? null,
                      selectSpeciality?.specialtyUrl ?? null);
                },
                onRefresh: () {
                  page = 1;
                  bloc.getListDoctor(page, selectProvince?.id ?? null,
                      selectSpeciality?.specialtyUrl ?? null);
                },
                renderItem: (item) => DoctocInfo(item: item),
              )),
              //  DoctorListInfo(listDoctor: listDoctor),
            ],
          ),
        ),
      ),
    );
  }
}

class DoctorListInfo extends StatelessWidget {
  const DoctorListInfo({
    Key? key,
    required this.listDoctor,
  }) : super(key: key);

  final List<DoctorInfo> listDoctor;
  //final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: listDoctor.length,
        itemBuilder: (context, index) {
          return Column(
            children: [DoctocInfo(item: listDoctor[index])],
          );
        });
  }
}

class DoctocInfo extends StatelessWidget {
  const DoctocInfo({
    Key? key,
    required this.item,
  }) : super(key: key);

  final DoctorInfo item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: MyColors.blue1,
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: MyColors.gray3,
            blurRadius: 16,
          )
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(5),
        child: InkWell(
          onTap: () => navigator.pushNamed(
            RouteKey.detailDoctor,
            arguments: {"doctor": item},
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: MyColors.primaryColor),
                child: ClipOval(
                  child: Image.network(
                    "https://tdoctor.vn/public/images/doctor/${item.profileImage}",
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: GestureDetector(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${item.doctorName}',
                          //
                          style: const TextStyle(
                              fontSize: Dimens.size16,
                              fontWeight: FontWeight.w700,
                              color: MyColors.black),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Địa chỉ: ${item.doctorAddress}",
                          //
                          style: const TextStyle(
                              fontSize: Dimens.size14,
                              color: MyColors.blackSurface),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Nơi công tác: ${item.doctorClinic}",
                          //
                          style: const TextStyle(
                              fontSize: Dimens.size14,
                              color: MyColors.blackSurface),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
