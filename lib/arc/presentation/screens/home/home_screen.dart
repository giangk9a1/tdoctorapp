import 'package:flutter/material.dart';
import 'package:riverhotel/arc/presentation/widgets/commons/common.dart';
import 'package:riverhotel/src/constants.dart';

import 'home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: theme.primaryColor,
            child: Column(
              children: [
                const SizedBox(height: 40),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Mời bạn bè và nhận thêm"),
                        Text("100.000Đ tiền thưởng!"),
                      ],
                    ),
                    const Spacer(),
                    CustomButton(
                      onTap: () {},
                      text: 'Mời bạn bè',
                      width: 100,
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                      color: theme.backgroundColor,
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(10))),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          ItemFeature(
                            color: Colors.blue,
                            image: ImageAssetPath.icBackview,
                            text: 'Xét nghiệm \ntại nhà',
                          ),
                          ItemFeature(
                            color: Colors.blue,
                            image: ImageAssetPath.icHealthcare,
                            text: 'Kết quả \nxét nghiệm',
                          ),
                          ItemFeature(
                            color: Colors.blue,
                            image: ImageAssetPath.icProfessional,
                            text: 'Phòng tư vấn \ntrực tuyến',
                          )
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          ItemMenu(
                            image: ImageAssetPath.icDoctorHome,
                            text: 'Hẹn bác sĩ \nđến nhà',
                          ),
                          ItemMenu(
                            image: ImageAssetPath.icDoctorVideo,
                            text: 'Gọi video \nvới bác sĩ',
                          ),
                          ItemMenu(
                            image: ImageAssetPath.icDoctorChat,
                            text: 'Chat miễn phí \nvới bác sĩ',
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          ItemMenu(
                            image: ImageAssetPath.icAppointment,
                            text: 'Đặt hẹn tại \nphòng khám',
                          ),
                          ItemMenu(
                            image: ImageAssetPath.icDrugstore,
                            text: 'Nhà thuốc \ntrực tuyến',
                          ),
                          ItemMenu(
                            image: ImageAssetPath.icHealth,
                            text: 'Theo dõi \nsức khoẻ',
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 10,
            color: Colors.red.withOpacity(0.1),
          ),
          const BannerHome()
        ],
      ),
    );
  }
}
