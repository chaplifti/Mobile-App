import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:rc_fl_gopoolar/theme/theme.dart';

class HistoryRideDetailScreen extends StatefulWidget {
  const HistoryRideDetailScreen({super.key});

  @override
  State<HistoryRideDetailScreen> createState() =>
      _HistoryRideDetailScreenState();
}

class _HistoryRideDetailScreenState extends State<HistoryRideDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        centerTitle: false,
        titleSpacing: 0.0,
        leading: IconButton(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: whiteColor,
          ),
        ),
        title: const Text(
          "Ride detail",
          style: semibold18White,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          riderDetail(size),
          rideDetail(),
          heightSpace,
          heightSpace,
          vehicleInfo()
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          rateDialog(context, size);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: fixPadding, vertical: fixPadding * 1.4),
          margin: const EdgeInsets.all(fixPadding * 2.0),
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
          child: const Text(
            "Rate your ride",
            style: bold18White,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }

  rateDialog(BuildContext context, Size size) {
    return showDialog(
      context: context,
      builder: (context) {
        int selectedRate = 3;
        return StatefulBuilder(
          builder: (context, state) {
            return Dialog(
              insetPadding: const EdgeInsets.all(fixPadding * 3.0),
              backgroundColor: whiteColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(fixPadding * 2.0),
                physics: const BouncingScrollPhysics(),
                children: [
                  Image.asset(
                    "assets/rideDetail/car.png",
                    height: size.height * 0.1,
                  ),
                  heightBox(fixPadding * 1.2),
                  const Text(
                    "Rate your ride",
                    style: bold17Primary,
                    textAlign: TextAlign.center,
                  ),
                  heightSpace,
                  heightSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 5; i++)
                        InkWell(
                          onTap: () {
                            state(() {
                              selectedRate = i;
                            });
                          },
                          child: Icon(
                            Icons.star_rounded,
                            size: 42,
                            color: i <= selectedRate
                                ? secondaryColor
                                : greyB4Color,
                          ),
                        )
                    ],
                  ),
                  heightSpace,
                  heightSpace,
                  Container(
                    height: size.height * 0.15,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: blackColor.withOpacity(0.15),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: const TextField(
                      enabled: true,
                      minLines: null,
                      maxLines: null,
                      style: medium16Black33,
                      cursorColor: primaryColor,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(fixPadding * 0.9),
                        border: InputBorder.none,
                        hintText: "Say something",
                        hintStyle: medium16Grey,
                      ),
                    ),
                  ),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: fixPadding, vertical: fixPadding * 1.4),
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
                      child: const Text(
                        "Send",
                        style: bold18White,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

  vehicleInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: fixPadding * 1.5, horizontal: fixPadding * 2.0),
      width: double.maxFinite,
      color: whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Vehicle info",
            style: semibold17Secondary,
          ),
          heightSpace,
          height5Space,
          vehicleDetailWidget(
              "Car model", "Toyota Matrix | KJ 5454 | Black colour"),
          heightSpace,
          heightSpace,
          vehicleDetailWidget("Facilities", "AC , Luggage space, Music system")
        ],
      ),
    );
  }

  vehicleDetailWidget(String title, String detail) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: semibold14Grey,
        ),
        Text(
          detail,
          style: medium14Black33,
        )
      ],
    );
  }

  rideDetail() {
    return Container(
      width: double.maxFinite,
      color: whiteColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: fixPadding * 2.0, vertical: fixPadding * 1.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Rider detail",
                  style: semibold17Secondary,
                ),
                heightSpace,
                heightSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    address(
                      greenColor,
                      '2715 Ash Dr. San Jose, South Dakota 83475',
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: fixPadding),
                      child: DottedBorder(
                        padding: EdgeInsets.zero,
                        dashPattern: const [1.9, 3.9],
                        color: greyColor,
                        strokeWidth: 1.2,
                        child: const SizedBox(height: 14.0),
                      ),
                    ),
                    address(
                      redColor,
                      '1901 Thornridge Cir. Shiloh, Hawaii 81063',
                    ),
                  ],
                ),
              ],
            ),
          ),
          DottedBorder(
            padding: EdgeInsets.zero,
            dashPattern: const [2, 4.2],
            color: greyColor,
            child: const SizedBox(
              width: double.maxFinite,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: fixPadding * 2.0, vertical: fixPadding * 1.5),
            child: Row(
              children: [
                detailWidget("Start time", "25 June,09 :00AM", 3),
                verticaldivider(),
                detailWidget("Return time", "25 june,09 :00PM", 3),
                verticaldivider(),
                detailWidget("Ride with", "150 people", 2),
              ],
            ),
          ),
        ],
      ),
    );
  }

  verticaldivider() {
    return Container(
      height: 40,
      width: 1,
      color: greyD4Color,
      margin: const EdgeInsets.symmetric(horizontal: fixPadding / 2),
    );
  }

  detailWidget(String title, String detail, int flex) {
    return Expanded(
      flex: flex,
      child: Column(
        children: [
          Text(
            title,
            style: semibold14Black33,
            overflow: TextOverflow.ellipsis,
          ),
          height5Space,
          Text(
            detail,
            style: semibold14Grey,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }

  address(Color color, String address) {
    return Row(
      children: [
        Container(
          height: 20.0,
          width: 20.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: color),
          ),
          alignment: Alignment.center,
          child: Icon(
            Icons.location_pin,
            color: color,
            size: 15.0,
          ),
        ),
        widthSpace,
        Expanded(
          child: Text(
            address,
            style: medium14Black3C,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  riderDetail(Size size) {
    return Padding(
      padding: const EdgeInsets.all(fixPadding * 2.0),
      child: Row(
        children: [
          Container(
            height: size.width * 0.21,
            width: size.width * 0.21,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(5.0),
              image: const DecorationImage(
                image: AssetImage("assets/rideDetail/rider-image.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          widthSpace,
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jacob Jones",
                  style: semibold17Black33,
                  overflow: TextOverflow.ellipsis,
                ),
                height5Space,
                Row(
                  children: [
                    Text(
                      "4.8",
                      style: semibold14Grey,
                    ),
                    Icon(
                      Icons.star,
                      color: secondaryColor,
                      size: 15.0,
                    ),
                    Expanded(
                      child: Text(
                        " | 120 review",
                        style: semibold14Grey,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
                height5Space,
                Text(
                  "Join 2016",
                  style: semibold14Grey,
                )
              ],
            ),
          ),
          widthSpace,
          const Text(
            "\$15.00",
            style: semibold18Primary,
          ),
        ],
      ),
    );
  }
}
