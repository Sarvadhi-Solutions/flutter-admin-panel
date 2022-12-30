import 'package:admin_dash/src/constant/color.dart';
import 'package:admin_dash/src/constant/image.dart';

import 'package:admin_dash/src/constant/string.dart';
import 'package:admin_dash/src/constant/text.dart';
import 'package:admin_dash/src/constant/theme.dart';
import 'package:admin_dash/src/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'package:flutterx/flutterx.dart';

class Chatscreen extends StatefulWidget {
  const Chatscreen({Key? key}) : super(key: key);

  @override
  State<Chatscreen> createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> {
  final TextEditingController _msgController = TextEditingController();
  final List<Map<String, dynamic>> _chatList = [
    {
      'userName': 'John Deo',
      'userMsg': 'Hello',
      'isCurrentUser': false,
    },
    {
      'userName': 'Smith',
      'userMsg': 'Hi, How are you? What about our next meeting?',
      'isCurrentUser': true,
    },
    {
      'userName': 'John Deo',
      'userMsg': 'Yeah everything is fine',
      'isCurrentUser': false,
    },
    {
      'userName': 'Smith',
      'userMsg': 'Wow that\'s great',
      'isCurrentUser': true,
    },
    {
      'userName': 'John Deo',
      'userMsg': 'yah!',
      'isCurrentUser': false,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: ColorConst.primary.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      elevation: 7,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 380),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ConstText.lightText(
                text: Strings.chat,
                fontWeight: FontWeight.bold,
              ),
              FxBox.h10,
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 350),
                child: ListView.builder(
                  shrinkWrap: true,
                  controller: ScrollController(),
                  itemCount: _chatList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: !_chatList[index]['isCurrentUser']
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _chatBox(
                          isMe: _chatList[index]['isCurrentUser'],
                          userName: _chatList[index]['userName'],
                          userMsg: _chatList[index]['userMsg'],
                          boxColor: _chatList[index]['isCurrentUser']
                              ? ColorConst.lightGrey
                              : ColorConst.primary.withOpacity(0.15),
                          usermsgColor: !_chatList[index]['isCurrentUser']
                              ? ColorConst.primary
                              : ColorConst.black,
                        )
                      ],
                    );
                  },
                ),
              ),
              FxBox.h10,
              _chatBubble(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userIcon() {
    return Column(
      children: [
        CircleAvatar(
          maxRadius: MediaQuery.of(context).size.height * 0.02,
          backgroundImage: const AssetImage(Images.profileImage),
        ),
      ],
    );
  }

  Widget _chatBox({
    required String userName,
    String? userMsg,
    required Color usermsgColor,
    required Color boxColor,
    bool isMe = false,
  }) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          !isMe ? _userIcon() : FxBox.shrink,
          Expanded(
            child: ChatBubble(
              alignment: !isMe ? Alignment.bottomLeft : Alignment.bottomRight,
              padding: const EdgeInsets.all(12),
              shadowColor: Colors.transparent,
              clipper: isMe
                  ? ChatBubbleClipper1(type: BubbleType.sendBubble)
                  : ChatBubbleClipper1(type: BubbleType.receiverBubble),
              backGroundColor: boxColor,
              child: Container(
                padding: !isMe
                    ? const EdgeInsets.only(left: 12)
                    : const EdgeInsets.only(right: 12),
                constraints: const BoxConstraints(maxWidth: 300),
                child: Column(
                  crossAxisAlignment:
                      !isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ConstText.lightText(
                          text: userName,
                          textAlign: isMe ? TextAlign.right : TextAlign.left,
                          color: ColorConst.primary,
                          fontWeight: FontWeight.w700,
                        ),
                        Text(
                          '10:00',
                          style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.012,
                            color: isDark
                                ? ColorConst.darkFontColor
                                : ColorConst.lightFontColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    ConstText.lightText(
                      text: userMsg ?? '',
                      textAlign: TextAlign.left,
                      color: usermsgColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ),
          ),
          isMe ? _userIcon() : FxBox.shrink,
        ],
      ),
    );
  }

  Widget _chatBubble() {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 10),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 35,
              child: TextField(
                controller: _msgController,
                decoration: InputDecoration(
                  hintText: Strings.enterYourText,
                  hintStyle: const TextStyle(
                    fontSize: 15,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(color: ColorConst.primary)),
                ),
              ),
            ),
          ),
          FxBox.w16,
          FxButton(
            onPressed: () {
              _msgController.clear();
            },
            borderRadius: 40,
            height: 40,
            text: Strings.send,
            minWidth: 80,
          ),
        ],
      ),
    );
  }
}
