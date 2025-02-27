import 'package:flutter/material.dart';
import 'chat_dialog_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat with your mentors'),
      ),
      body: ListView(
        children: const [
          ChatItem(
            name: 'Lars Hendriks',
            message: 'Ik vond het heel gezellig',
            time: '3 min',
            hasNotification: true, 
          ),
          ChatItem(
            name: 'Monique Zuid',
            message: 'Wanneer spreken we nog...',
            time: '3h',
            hasNotification: true, 
          ),
          ChatItem(
            name: 'Forrel Williams',
            message: 'Dankjewel!!',
            time: '17h',
          ),
          ChatItem(
            name: 'Hans Hato',
            message: 'Geen probleem fijne d...',
            time: '2d',
          ),
          ChatItem(
            name: 'Sander De Groot',
            message: 'Tijdens de nieuwe opdra...',
            time: '3d',
          ),
          ChatItem(
            name: 'John Doe',
            message: 'chess.com invitation, join.....',
            time: '1w',
          ),
        ],
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  const ChatItem({
    super.key,
    required this.name,
    required this.message,
    required this.time,
    this.hasNotification = false, 
  });

  final String name;
  final String message;
  final String time;
  final bool hasNotification; 

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatDialogScreen(name: name),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 30,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(message),
                ],
              ),
            ),
            Text(time),
            if (hasNotification) 
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}