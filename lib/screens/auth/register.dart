import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rc_fl_gopoolar/theme/theme.dart';
import 'package:lottie/lottie.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          headerImage(size),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(fixPadding * 2.0),
              physics: const BouncingScrollPhysics(),
              children: [
                registerTitle(),
                heightSpace,
                welcomeText(),
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                nameField(),
                heightSpace,
                heightSpace,
                emailField(),
                heightSpace,
                heightSpace,
                mobileNumberField(),
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                registerButton(),
              ],
            ),
          )
        ],
      ),
    );
  }

  registerButton() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/otp');
      },
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(
            horizontal: fixPadding * 2.0, vertical: fixPadding * 1.4),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: secondaryColor.withOpacity(0.1),
              blurRadius: 12.0,
              offset: const Offset(0, 6),
            )
          ],
        ),
        alignment: Alignment.center,
        child: const Text(
          "Register",
          style: bold18White,
        ),
      ),
    );
  }

  emailField() {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.1),
            blurRadius: 12.0,
            offset: const Offset(0, 6),
          )
        ],
      ),
      child: const TextField(
        cursorColor: primaryColor,
        style: semibold15Black33,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Enter your email address",
          hintStyle: semibold15Grey,
          contentPadding: EdgeInsets.symmetric(vertical: fixPadding * 1.4),
          prefixIcon: Icon(
            CupertinoIcons.mail,
            size: 20.0,
          ),
        ),
      ),
    );
  }

  nameField() {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.1),
            blurRadius: 12.0,
            offset: const Offset(0, 6),
          )
        ],
      ),
      child: const TextField(
        cursorColor: primaryColor,
        style: semibold15Black33,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Enter your name",
          hintStyle: semibold15Grey,
          contentPadding: EdgeInsets.symmetric(vertical: fixPadding * 1.4),
          prefixIcon: Icon(
            CupertinoIcons.person,
            size: 20.0,
          ),
        ),
      ),
    );
  }

  mobileNumberField() {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.1),
            blurRadius: 12.0,
            offset: const Offset(0, 6),
          )
        ],
      ),
      child: const TextField(
        cursorColor: primaryColor,
        style: semibold15Black33,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Enter your mobile number",
          hintStyle: semibold15Grey,
          contentPadding: EdgeInsets.symmetric(vertical: fixPadding * 1.4),
          prefixIcon: Icon(
            CupertinoIcons.phone,
            size: 20.0,
          ),
        ),
      ),
    );
  }

  welcomeText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Text(
        "Welcome, please create your account using email address",
        style: medium15Grey,
        textAlign: TextAlign.center,
      ),
    );
  }

  registerTitle() {
    return const Text(
      "Register",
      style: semibold20Black33,
      textAlign: TextAlign.center,
    );
  }

  headerImage(Size size) {
    return Container(
      width: double.maxFinite,
      height: size.height * 0.4,
      color: primaryColor,
      alignment: Alignment.center,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: fixPadding * 2.5),
            alignment: Alignment.center,
            child: Lottie.asset('assets/lottie_assets/2.json'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: fixPadding * 2.0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  padding: const EdgeInsets.all(fixPadding * 2.0),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: whiteColor,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
