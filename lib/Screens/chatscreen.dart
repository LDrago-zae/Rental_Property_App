import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart'; // For date and time formatting

class ChatScreen extends StatefulWidget {
  final bool isOwner;

  ChatScreen({required this.isOwner});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Map<String, dynamic>> messages = [
    {
      "text": "Hello, is the apartment still available?",
      "isOwner": false,
      "timestamp": DateTime.now().subtract(Duration(minutes: 15)),
    },
    {
      "text": "Yes, it is still available.",
      "isOwner": true,
      "timestamp": DateTime.now().subtract(Duration(minutes: 10)),
    },
  ];

  TextEditingController messageController = TextEditingController();

  final Map<String, String> owner = {
    "name": "William Henry",
    "subtitle": "Owner",
    "dp": "https://i.pravatar.cc/150?img=12"
  };

  final Map<String, String> customer = {
    "name": "Jane Doe",
    "subtitle": "Customer",
    "dp": "https://i.pravatar.cc/150?img=8"
  };

  void sendMessage() {
    if (messageController.text.isNotEmpty) {
      setState(() {
        messages.add({
          "text": messageController.text,
          "isOwner": widget.isOwner, // Assign dynamically based on the user
          "timestamp": DateTime.now(),
        });
      });
      messageController.clear();
    }
  }

  String formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm a, MMM d').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white, // Sets the top bar (system overlay) color
      statusBarIconBrightness: Brightness.dark, // For dark icons in status bar
    ));

    final Map<String, String> currentUser =
    widget.isOwner ? owner : customer;
    final Map<String, String> otherUser =
    widget.isOwner ? customer : owner;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffdbfdf8),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xff015c4e)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(otherUser["dp"]!),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  otherUser["name"]!,
                  style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff015c4e)),
                ),
                Text(
                  otherUser["subtitle"]!,
                  style:   GoogleFonts.montserrat(fontSize: 14, color: Color(0xff015c4e)),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true, // Ensures messages start from the bottom
              padding: const EdgeInsets.all(16.0),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[messages.length - 1 - index];
                final isMessageOwner = message['isOwner'];
                return ChatBubble(
                  text: message['text'],
                  isOwner: isMessageOwner,
                  timestamp: message['timestamp'],
                  dp: isMessageOwner ? owner['dp']! : customer['dp']!,
                  formatDateTime: formatDateTime,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                        hintText: "Write your message...",
                        border: InputBorder.none,
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: sendMessage,
                    icon: Icon(Icons.send, color: Color(0xff015c4e)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isOwner;
  final DateTime timestamp;
  final String dp;
  final String Function(DateTime) formatDateTime;

  const ChatBubble({
    required this.text,
    required this.isOwner,
    required this.timestamp,
    required this.dp,
    required this.formatDateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      isOwner ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isOwner)
          CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(dp),
          ),
        SizedBox(width: isOwner ? 8 : 12),
        Flexible(
          child: Column(
            crossAxisAlignment:
            isOwner ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isOwner
                      ? Color(0xff80aca6)
                      : Color(0xffececec), // Changed to grey for customer
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  text,
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    color: isOwner ? Colors.white : Colors.black, // Dynamic color change
                  ),
                ),
              ),
              SizedBox(height: 4),
              Text(
                formatDateTime(timestamp),
                style: GoogleFonts.montserrat(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
        SizedBox(width: isOwner ? 12 : 8),
        if (isOwner)
          CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(dp),
          ),
      ],
    );
  }
}
