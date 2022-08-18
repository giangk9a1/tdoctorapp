import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:riverhotel/arc/presentation/widgets/commons/dialog.dart';
import 'package:riverhotel/src/config/route_keys.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
            onTap: () => showConfirmDialog(
                context: context,
                msg: "Log out",
                onTap: () async {
                  appPreference.setToken('');
                  navigator.pushNamedAndRemoveUntil(RouteKey.intro);
                }),
            child: Text("Log out")),
      ),
    );
  }
}
