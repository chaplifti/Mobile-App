import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rc_fl_gopoolar/theme/theme.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  TextEditingController messageController = TextEditingController();

  final messagesList = [
    {
      "message": "Hello Jecob good morning",
      "time": "9:15 PM",
      "isMe": false,
    },
    {
      "message": "Hii, Good morning",
      "time": "9:15 PM",
      "isMe": true,
    },
    {
      "message": "Hello ,What time you reach my place",
      "time": "9:20 PM",
      "isMe": false
    },
    {
      "message": "I will  be there around at 10:00am .please be ready",
      "time": "9:20 PM",
      "isMe": true
    },
    {
      "message": "Okay. i will be there on time",
      "time": "9:20 PM",
      "isMe": false
    },
  ];

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
          padding:
              const EdgeInsets.only(left: fixPadding * 2.0, right: fixPadding),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: whiteColor,
          ),
        ),
        leadingWidth: 50.0,
        title: title(),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
            vertical: fixPadding, horizontal: fixPadding * 2.0),
        itemCount: messagesList.length,
        reverse: true,
        itemBuilder: (context, index) {
          int reverseIndex = messagesList.length - index - 1;
          return messagesList[reverseIndex]['isMe'] == true
              ? sendMessages(size, reverseIndex)
              : receiveMessages(size, reverseIndex);
        },
      ),
      bottomNavigationBar: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          padding: const EdgeInsets.only(
              left: fixPadding * 2.0,
              right: fixPadding * 2.0,
              bottom: fixPadding * 2.0),
          child: Row(
            children: [
              messageField(),
              widthSpace,
              sendButton(),
            ],
          ),
        ),
      ),
    );
  }

  messageField() {
    return Expanded(
      child: Container(
        height: 50.0,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: secondaryColor),
          boxShadow: [
            BoxShadow(
              color: secondaryColor.withOpacity(0.1),
              blurRadius: 12.0,
              offset: const Offset(0, 6),
            )
          ],
        ),
        alignment: Alignment.center,
        child: TextField(
          controller: messageController,
          style: medium14Black33,
          cursorColor: primaryColor,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Type your message here..",
            hintStyle: medium14Grey,
            contentPadding: EdgeInsets.symmetric(
              horizontal: fixPadding,
            ),
          ),
        ),
      ),
    );
  }

  sendButton() {
    return InkWell(
      onTap: () {
        if (messageController.text.isNotEmpty) {
          setState(() {
            messagesList.add({
              "message": messageController.text,
              "time": DateFormat.jm().format(DateTime.now()),
              "isMe": true
            });
          });
          messageController.clear();
        }
      },
      child: Container(
        height: 50.0,
        width: 50.0,
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
        child: const Icon(
          Icons.send,
          color: whiteColor,
        ),
      ),
    );
  }

  sendMessages(Size size, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(
              top: fixPadding, bottom: fixPadding, left: size.width * 0.2),
          padding: const EdgeInsets.symmetric(
              horizontal: fixPadding * 1.5, vertical: fixPadding),
          decoration: const BoxDecoration(
            color: Color(0xFFFFEED2),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(fixPadding),
              topRight: Radius.circular(fixPadding),
              bottomLeft: Radius.circular(fixPadding),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                messagesList[index]['message'].toString(),
                style: medium14Black33,
              ),
              height5Space,
              Text(
                messagesList[index]['time'].toString(),
                style: medium12Grey,
              )
            ],
          ),
        ),
      ],
    );
  }

  receiveMessages(Size size, int index) {
    return Padding(
      padding: EdgeInsets.only(
          top: fixPadding, bottom: fixPadding, right: size.width * 0.2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 30.0,
            width: 30.0,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("assets/findRide/rider-2.png"))),
          ),
          width5Space,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: fixPadding * 1.5, vertical: fixPadding),
                  decoration: const BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(fixPadding),
                      topRight: Radius.circular(fixPadding),
                      bottomLeft: Radius.circular(fixPadding),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        messagesList[index]['message'].toString(),
                        style: medium14Black33,
                      ),
                      height5Space,
                      Text(
                        messagesList[index]['time'].toString(),
                        style: medium12Grey,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  title() {
    return Row(
      children: [
        Container(
          height: 39.0,
          width: 39.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage("assets/findRide/rider-2.png"),
            ),
          ),
        ),
        widthSpace,
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Jenny Wilson",
                style: semibold16White,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "Ride on 25 june 2023",
                style: medium12White,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ],
    );
  }
}
