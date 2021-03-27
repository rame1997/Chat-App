import 'package:chat_ui/models/Chat.dart';
import 'package:chat_ui/screens/chats/components/story.dart';
import 'package:chat_ui/screens/messages/message_screen.dart';
import 'package:chat_ui/screens/signinOrSignUp/signin_or_signup_screen.dart';
import 'package:flutter/material.dart';

import 'chat_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 2,
            child: Container(
              //height: 13,
              padding: EdgeInsets.only(top: 0, left: 20, right: 10, bottom: 0),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => story(
                  press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SigninOrSignupScreen(),
                      )),
                ),
                scrollDirection: Axis.horizontal,
              ),
            )),
        Expanded(
          flex: 12,
          child: ListView.builder(
            itemCount: chatsData.length,
            itemBuilder: (context, index) => ChatCard(
              chat: chatsData[index],
              press: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MessagesScreen(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
