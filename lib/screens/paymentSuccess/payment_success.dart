import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rc_fl_gopoolar/theme/theme.dart';

class PaymentSuccessScreen extends StatefulWidget {
  const PaymentSuccessScreen({super.key});

  @override
  State<PaymentSuccessScreen> createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final data =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    final id = data['id'];

    return WillPopScope(
      onWillPop: () async {
        onWillpop();
        return false;
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark),
        child: Scaffold(
          body: Column(
            children: [
              successContent(size, id),
              backToHomeButton(context),
            ],
          ),
        ),
      ),
    );
  }

  backToHomeButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, '/bottomBar');
      },
      child: const Text(
        "Back to home",
        style: semibold16Primary,
      ),
    );
  }

  successContent(Size size, id) {
    return Expanded(
      child: Center(
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(fixPadding * 2.0),
          children: [
            Center(
              child: Image.asset(
                "assets/success/checkmark.png",
                height: size.height * 0.1,
                fit: BoxFit.cover,
              ),
            ),
            heightSpace,
            heightSpace,
            Text(
              id == 1 ? "\$150.00 sended" : "\$150.00 added",
              style: semibold20Primary,
              textAlign: TextAlign.center,
            ),
            heightSpace,
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: size.width * 0.65),
                child: Text(
                  id == 1
                      ? "Congratulation your money successfully send in your bank"
                      : "Congratulation your money successfully added into wallet",
                  style: semibold14Grey,
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  onWillpop() {
    Navigator.pushNamed(context, '/bottomBar');
  }
}
