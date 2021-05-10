import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash/constants.dart';

final _firestore = FirebaseFirestore.instance;
final _auth = FirebaseAuth.instance;
User loggedInUser = _auth.currentUser;

class ChatScreen extends StatefulWidget {
  static const String id = 'chat';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String messageText;
  final inputController = TextEditingController();

  // void getCurrentUser() async {
  //   loggedInUser = _auth.currentUser;
  //   if (loggedInUser != null) {
  //     print(loggedInUser.email);
  //   }
  // }

  void getMessages() async {
    final messages = await _firestore.collection('messages').get();

    for (var message in messages.docs) {
      print(message.data());
    }
  }

  void messagesStream() async {
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      for (var message in snapshot.docChanges) {
        print(message.doc.data());
      }
    }
  }

  // @override
  // void initState() {
  //   super.initState();
  //   getCurrentUser();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(),
            Container(
              decoration: messageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: inputController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: messageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      inputController.clear();
                      _firestore.collection('messages').add(
                          {'sender': loggedInUser.email, 'text': messageText});
                    },
                    child: Text(
                      'Send',
                      style: sendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            );
          } else {
            final messages = snapshot.data.docs.reversed;
            final currentUser = loggedInUser.email;

            return Expanded(
              child: ListView(
                reverse: true,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                children: messages.map((e) {
                  Map message = e.data();
                  return MessageBubble(
                    text: message['text'],
                    sender: message['sender'],
                    isUser: currentUser == message['sender'],
                  );
                }).toList(),
              ),
            );
          }
        },
        stream: _firestore.collection('messages').snapshots());
  }
}

class MessageBubble extends StatelessWidget {
  const MessageBubble({Key key, this.text, this.sender, this.isUser})
      : super(key: key);

  final String text;
  final String sender;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:
            isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Material(
            borderRadius: BorderRadius.only(
              topLeft: isUser ? Radius.circular(24) : Radius.circular(0),
              topRight: isUser ? Radius.circular(0) : Radius.circular(24),
              bottomRight: Radius.circular(24),
              bottomLeft: Radius.circular(24),
            ),
            elevation: 2,
            color: isUser ? Colors.white : Colors.lightBlueAccent,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 16, color: isUser ? Colors.black : Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
