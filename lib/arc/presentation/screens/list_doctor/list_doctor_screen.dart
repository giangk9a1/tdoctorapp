import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riverhotel/arc/presentation/blocs/doctor_bloc.dart';
import 'package:riverhotel/arc/presentation/models/doctor/doctor_model.dart';
import 'package:riverhotel/src/base_widget_state/base_cubit_stateful_widget.dart';
import 'package:riverhotel/src/styles/style.dart';

class ListDoctorScreen extends BaseCubitStatefulWidget {
  const ListDoctorScreen({Key? key}) : super(key: key);

  @override
  State<ListDoctorScreen> createState() => _ListDoctorScreenState();
}

class _ListDoctorScreenState
    extends BaseCubitStateFulWidgetState<DoctorBloc, ListDoctorScreen> {
  @override
  void initState() {
    super.initState();
    bloc.getDoctor();
  }

  @override
  Widget buildContent(BuildContext context, state) {
    final model = state.model as DoctorScreenModel;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColors.backgroundColor,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: SvgPicture.asset(
              'assets/svgs/ic_back.svg',
              color: MyColors.backgroundHomeColor,
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
                color: MyColors.backgroundHomeColor,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 18),
            child: Column(
              children: [
                const Text(
                  'Gặp các bác sĩ của chúng tôi',
                  style: TextStyle(
                    fontSize: Dimens.size18,
                    fontWeight: FontWeight.w700,
                    color: MyColors.black,
                  ),
                ),
                const SizedBox(
                  height: 53,
                ),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: model.listDoctor?.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: MyColors.whiteColor,
                              boxShadow: const <BoxShadow>[
                                BoxShadow(
                                  color: MyColors.gray3,
                                  blurRadius: 16,
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: InkWell(
                                onTap: () {},
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(90),
                                          color: MyColors.blue1),
                                      child: const ClipOval(
                                        child: Image(
                                          image: AssetImage(
                                              'assets/images/ic_specialist.png'),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Expanded(
                                      child: Text(
                                        '${model.listDoctor?[index]['doctor_name']}',
                                        style: const TextStyle(
                                            fontSize: Dimens.size14,
                                            fontWeight: FontWeight.w600,
                                            color: MyColors.black),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
