import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pox_globe/color_pallete/pallete.dart';

class PrakashChatBot extends StatefulWidget {
  const PrakashChatBot({super.key});

  @override
  State<PrakashChatBot> createState() => _PrakashChatBotState();
}

class _PrakashChatBotState extends State<PrakashChatBot> {
  final Gemini gemini = Gemini.instance;
  List<ChatMessage> messages = [];
  ChatUser currentuser = ChatUser(id: "0", firstName: "User");
  ChatUser geminiuser = ChatUser(id: "1", firstName: "DocBot");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "DocBot",
          style:
              TextStyle(color: Colors.white, fontFamily: "nexa", fontSize: 30),
        ),
        backgroundColor: Pallete.MainContainerColor,
      ),
      body: _BuildUI(),
    );
  }

  Widget _BuildUI() {
    return DashChat(

        inputOptions: InputOptions(trailing: [
          IconButton(
              onPressed: _sendMediaMessage,
              icon: Icon(
                Icons.image,
                color: Colors.blue,
              )),
        ],
        inputDecoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Pallete.MainContainerColor), 
          ),
          hintText: 'Type a message...',
          filled: true,
          fillColor: Pallete.whiteColor,
        )
        ),
        currentUser: currentuser,
        onSend: _sendmessage,
        messages: messages,
    );

  }

  void _sendmessage(ChatMessage chatmessage) {
    setState(() {
      messages = [chatmessage, ...messages];
    });
    try {
      String question = chatmessage.text;
      gemini.streamGenerateContent(question).listen((event) {
        ChatMessage? lastMessage = messages.firstOrNull;
        if (lastMessage != null && lastMessage.user == geminiuser) {
          lastMessage = messages.removeAt(0);
          String response = event.content?.parts?.fold(
                  "", (previous, current) => "$previous ${current.text}") ??
              "";
          lastMessage.text += response;
          setState(() {
            messages = [lastMessage!, ...messages];
          });
        } else {
          String response = event.content?.parts?.fold(
                  "", (previous, current) => "$previous ${current.text}") ??
              "";
          ChatMessage message = ChatMessage(
              user: geminiuser, createdAt: DateTime.now(), text: response);
          setState(() {
            messages = [message, ...messages];
          });
        }
      });
    } catch (e) {}
  }

  void _sendMediaMessage() async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (file != null) {
      ChatMedia media = ChatMedia(
        url: file.path,
        fileName: file.name, // Include the file name
        type: MediaType.image,
      );

      ChatMessage chatMessage = ChatMessage(
        user: currentuser,
        createdAt: DateTime.now(),
        text: "Describe", // You might want to customize this message
        medias: [media], // Add media to the list
      );

      _sendmessage(chatMessage); // Call _sendmessage instead of _sendMediaMessage
    }
  }

}
