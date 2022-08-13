import 'package:flutter/material.dart';

class ButtonResend extends StatelessWidget {
  const ButtonResend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Container(
      height: 45,
      width: size.width,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: theme.backgroundColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 5,
            color: Colors.grey.withOpacity(0.3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "Gửi lại mã",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: theme.primaryColor,
              ),
            ),
          ),
          const VerticalDivider(),
          Expanded(
            child: Text(
              "Gọi cho tôi",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: theme.primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
