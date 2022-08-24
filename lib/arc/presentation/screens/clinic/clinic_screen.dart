import 'package:flutter/material.dart';
import 'package:riverhotel/arc/data/models/response_models/province_response_model.dart';
import 'package:riverhotel/arc/presentation/blocs/clinic_bloc.dart';
import 'package:riverhotel/arc/presentation/widgets/commons/common.dart';
import 'package:riverhotel/arc/presentation/widgets/commons/dropdown_text_input.dart';
import 'package:riverhotel/src/base_widget_state/base_cubit_stateful_widget.dart';
import 'package:riverhotel/src/styles/style.dart';
import 'package:riverhotel/arc/presentation/models/clinic/clinic_model.dart';
import 'package:riverhotel/translation_key.dart';
import '../../../../src/config/route_keys.dart';
import '../../../../src/utilities/logger.dart';
import '../../../data/models/response_models/clinic_response_model.dart';
import '../../../data/models/response_models/specialty_response_model.dart';

class ClinicScreen extends BaseCubitStatefulWidget {
  const ClinicScreen({Key? key}) : super(key: key);

  @override
  State<ClinicScreen> createState() => _ClinicScreenState();
}

class _ClinicScreenState
    extends BaseCubitStateFulWidgetState<ClinicBloc, ClinicScreen> {
  int page = 0;
  ProvinceModel? selectProvince;
  SpecialtyModel? selectSpeciality;
  String? specialityValue;
  @override
  void initState() {
    super.initState();
    bloc.getListClinic(page, selectProvince?.id ?? null,
        selectSpeciality?.specialtyUrl ?? null);
    bloc.getMoreClinic(page, selectProvince?.id ?? null,
        selectSpeciality?.specialtyUrl ?? null);
    bloc.getListProvince();
    bloc.getListSpeciality();
  }

  @override
  Widget buildContent(BuildContext context, state) {
    final model = state.model as ClinicScreenModel;
    final listClinic = model.listClinic ?? [];
    final listProvince = model.listProvince ?? [];
    final listSpeciality = model.listSpeciality ?? [];

    LoggerUtils.d(model.listSpeciality);
    return Scaffold(
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
                    bloc.getListClinic(page, selectProvince?.id ?? null,
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
                    bloc.getListClinic(page, selectProvince?.id ?? null,
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
                data: listClinic,
                onLoadMore: () {
                  page++;
                  bloc.getMoreClinic(page, selectProvince?.id ?? null,
                      selectSpeciality?.specialtyUrl ?? null);
                },
                onRefresh: () {
                  page = 1;
                  bloc.getListClinic(page, selectProvince?.id ?? null,
                      selectSpeciality?.specialtyUrl ?? null);
                },
                renderItem: (item) => WigetClinicInfo(item: item),
              )),
              //  ClinicListInfo(listClinic: listClinic),
            ],
          ),
        ),
      ),
    );
  }
}

class WigetClinicInfo extends StatelessWidget {
  const WigetClinicInfo({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ClinicInfo item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Container(
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
            onTap: () => {
              Navigator.pushNamed(
                context,
                RouteKey.detailClinic,
                arguments: {"clinic": item},
              )
            },
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
                      "https://tdoctor.vn/public/images/health_facilities/${item.profileImage}",
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
                            '${item.clinicName}',
                            //
                            style: const TextStyle(
                                fontSize: Dimens.size16,
                                fontWeight: FontWeight.w700,
                                color: MyColors.black),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Địa chỉ: ${item.clinicAddress}",
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
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
