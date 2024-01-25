import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:rc_fl_gopoolar/theme/theme.dart';
import 'package:rc_fl_gopoolar/widget/column_builder.dart';

class OfferRideScreen extends StatefulWidget {
  const OfferRideScreen({super.key});

  @override
  State<OfferRideScreen> createState() => _OfferRideScreenState();
}

class _OfferRideScreenState extends State<OfferRideScreen> {
  final carList = [
    "Mercedes-Benz",
    "Toyota matrix",
    "Audi A4",
  ];

  final seatList = ["1", "2", "3", "4", "5", "6", "7", "8"];
  String? selectedSeat;

  String? selectedCar;

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
          "Offer ride",
          style: semibold18White,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          pickupAndDestinatioLocation(),
          Padding(
            padding: const EdgeInsets.all(fixPadding * 2.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                priceField(),
                heightSpace,
                heightSpace,
                yourCar(context),
                heightSpace,
                heightSpace,
                availableSeat(size),
                heightSpace,
                heightSpace,
                facilityField(size)
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: continueButton(context),
    );
  }

  continueButton(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/success', arguments: {"id": 1});
        },
        child: Container(
          margin: const EdgeInsets.all(fixPadding * 2.0),
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
          child: const Text(
            "Continue",
            style: bold18White,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  facilityField(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleText("Facility (i.e Ac, Music etc)"),
        heightSpace,
        Container(
          height: size.height * 0.13,
          decoration: boxDecoration,
          alignment: Alignment.center,
          child: const TextField(
            expands: true,
            maxLines: null,
            minLines: null,
            style: semibold15Black33,
            cursorColor: primaryColor,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: fixPadding, vertical: fixPadding * 1.5),
              border: InputBorder.none,
              hintText: "Enter facility",
              hintStyle: medium15Grey,
              isDense: true,
            ),
          ),
        )
      ],
    );
  }

  availableSeat(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleText("Available seat"),
        heightSpace,
        GestureDetector(
          onTap: () {
            noOfSeatBottomsheet(size);
          },
          child: Container(
            decoration: boxDecoration,
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(
                horizontal: fixPadding, vertical: fixPadding * 1.2),
            child: Row(
              children: [
                Expanded(
                  child: selectedSeat != null
                      ? Text(
                          "$selectedSeat Seat",
                          style: semibold15Black33,
                          overflow: TextOverflow.ellipsis,
                        )
                      : const Text(
                          "Select available seat",
                          style: medium15Grey,
                          overflow: TextOverflow.ellipsis,
                        ),
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: greyColor,
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  noOfSeatBottomsheet(Size size) {
    return showModalBottomSheet(
        isScrollControlled: true,
        constraints: BoxConstraints(maxHeight: size.height - 80),
        backgroundColor: whiteColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
        ),
        context: context,
        builder: (contetx) {
          return ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            children: [
              heightSpace,
              heightSpace,
              const Text(
                "No of seat",
                style: semibold18Primary,
                textAlign: TextAlign.center,
              ),
              ColumnBuilder(
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          onTap: () {
                            setState(() {
                              selectedSeat = seatList[index];
                            });
                            Navigator.pop(context);
                          },
                          title: Text(
                            "${seatList[index]} Seat",
                            style: selectedSeat == seatList[index]
                                ? semibold16Secondary
                                : semibold16Black33,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        seatList.length == index + 1
                            ? const SizedBox()
                            : Container(
                                width: double.maxFinite,
                                height: 1,
                                color: greyD4Color,
                              )
                      ],
                    );
                  },
                  itemCount: seatList.length)
            ],
          );
        });
  }

  yourCar(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleText("Your car"),
        heightSpace,
        GestureDetector(
          onTap: () {
            carListBottomsheet(context);
          },
          child: Container(
            decoration: boxDecoration,
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(
                horizontal: fixPadding, vertical: fixPadding * 1.2),
            child: Row(
              children: [
                Expanded(
                  child: selectedCar != null
                      ? Text(
                          selectedCar.toString(),
                          style: semibold15Black33,
                          overflow: TextOverflow.ellipsis,
                        )
                      : const Text(
                          "Select your car",
                          style: medium15Grey,
                          overflow: TextOverflow.ellipsis,
                        ),
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: greyColor,
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  carListBottomsheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: whiteColor,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40.0),
        ),
      ),
      context: context,
      builder: (context) {
        return ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          children: [
            const Padding(
              padding:
                  EdgeInsets.only(top: fixPadding * 2.0, bottom: fixPadding),
              child: Text(
                "Select your car",
                style: semibold18Primary,
                textAlign: TextAlign.center,
              ),
            ),
            ColumnBuilder(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        setState(() {
                          selectedCar = carList[index];
                        });
                        Navigator.pop(context);
                      },
                      title: Text(
                        carList[index],
                        style: semibold15Black33,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    carList.length == index + 1
                        ? const SizedBox()
                        : Container(
                            height: 1,
                            width: double.maxFinite,
                            color: greyD4Color,
                          )
                  ],
                );
              },
              itemCount: carList.length,
            )
          ],
        );
      },
    );
  }

  priceField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleText("Price"),
        heightSpace,
        Container(
          decoration: boxDecoration,
          alignment: Alignment.center,
          child: const TextField(
            style: semibold15Black33,
            cursorColor: primaryColor,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    horizontal: fixPadding, vertical: fixPadding * 1.5),
                border: InputBorder.none,
                hintText: "Write price per seat",
                hintStyle: medium15Grey,
                isDense: true,
                prefixText: "\$",
                prefixStyle: medium15Black33),
          ),
        )
      ],
    );
  }

  BoxDecoration boxDecoration = BoxDecoration(
    color: whiteColor,
    borderRadius: BorderRadius.circular(10.0),
    boxShadow: [
      BoxShadow(
        color: blackColor.withOpacity(0.15),
        blurRadius: 6.0,
      )
    ],
  );

  pickupAndDestinatioLocation() {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: fixPadding, horizontal: fixPadding * 2.0),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.15),
            blurRadius: 6.0,
          )
        ],
      ),
      child: Row(
        children: [
          Column(
            children: [
              locationIcon(greenColor),
              DottedBorder(
                padding: EdgeInsets.zero,
                color: greyColor,
                dashPattern: const [2.4, 4],
                child: const SizedBox(height: 55.0),
              ),
              locationIcon(redColor),
            ],
          ),
          widthSpace,
          width5Space,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleText("Pick up location"),
                height5Space,
                const Text(
                  "B 420 Broome station,New york, NY 100013, USA ",
                  style: medium14Grey,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                heightSpace,
                heightSpace,
                height5Space,
                titleText("Destination location"),
                height5Space,
                const Text(
                  "B 420 Broome station,New york, NY 100013, USA ",
                  style: medium14Grey,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  titleText(String title) {
    return Text(
      title,
      style: semibold15Black33,
    );
  }

  locationIcon(Color color) {
    return Container(
      height: 24.0,
      width: 24.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color),
      ),
      alignment: Alignment.center,
      child: Icon(
        Icons.location_pin,
        color: color,
        size: 18.0,
      ),
    );
  }
}
