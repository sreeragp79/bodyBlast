import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class PopupContainer extends StatefulWidget {
  const PopupContainer({Key? key}) : super(key: key);

  @override
  State<PopupContainer> createState() => _PopupContainerState();
}

class _PopupContainerState extends State<PopupContainer> {

  final TextEditingController userMessageController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final List<Map<String, dynamic>> messages = [];
  bool isLoading = false;
  final apiKey = "AIzaSyCAJWLFd093jZerJvLKuAwhBC8_61uEWCs";

  void dispose() {
    userMessageController.dispose();
    scrollController.dispose();
    super.dispose();
  }
  void scrollToBottom() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  Future<void>talkWithGemini(String userMessage)async{
    if( userMessage.trim().isEmpty) return;

    setState(() {
      messages.add({
        "message": userMessage,
        "timestamp": DateFormat('HH:mm').format(DateTime.now()),
        "isUser": true,
      });
      isLoading = true;
    });

    userMessageController.clear();
    scrollToBottom();

    try {
      final model = GenerativeModel(model: "gemini-pro", apiKey: apiKey);
      final content = Content.text(userMessage);
      final response = await model.generateContent([content]);

      setState(() {
        messages.add({
          "message": response.text ?? "No response",
          "timestamp": DateFormat('HH:mm').format(DateTime.now()),
          "isUser": false,
        });
        isLoading = false;
      });
      scrollToBottom();
    } catch (e) {
      setState(() {
        messages.add({
          "message": "Error: Unable to get response",
          "timestamp": DateFormat('HH:mm').format(DateTime.now()),
          "isUser": false,
        });
        isLoading = false;
      });
      scrollToBottom();
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Material(
      color: Colors.transparent,
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: height / 2.30,
          width: width / 1.30,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Container(
                width: width,
                height: height / 20.56,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  color: Colors.grey.withOpacity(0.45),
                ),
                child: const Center(
                  child: Text(
                    "What can I help with?",
                    style: TextStyle(
                      fontFamily: "intermedi",
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: messages.length,
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    final isUser = message["isUser"] as bool;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                      child: Row(
                        mainAxisAlignment: isUser ? MainAxisAlignment.start : MainAxisAlignment.end,
                        children: [
                          if (!isUser) Flexible(
                            child: Text(
                              message["timestamp"]!,
                              style: const TextStyle(color: Colors.white54, fontSize: 10),
                            ),
                          ),
                          if (!isUser) const SizedBox(width: 8),
                          Flexible(
                            flex: 3,
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: isUser
                                    ? Colors.blue.withOpacity(0.3)
                                    : Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: isUser
                                      ? Colors.blue.withOpacity(0.5)
                                      : Colors.grey.withOpacity(0.3),
                                ),
                              ),
                              child: Text(
                                message["message"]!,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          if (isUser) const SizedBox(width: 8),
                          if (isUser) Flexible(
                            child: Text(
                              message["timestamp"]!,
                              style: const TextStyle(color: Colors.white54, fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // Loading indicator
              if (isLoading)
                 Padding(
                  padding: EdgeInsets.all(8.0),
                   child:  SizedBox(
                     width: 100,
                     height: 100,
                     child: Lottie.asset(
                       "assets/animation/LoadingAnimation.json",
                     ),
                   )
                ),
              // Input section with TextField, Send button, and Voice button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: userMessageController,
                        decoration: InputDecoration(
                          hintText: "Message",
                          hintStyle: const TextStyle(color: Colors.white54),
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.2),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send, color: Colors.blueAccent),
                      onPressed: () {
                        talkWithGemini(userMessageController.text);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.mic, color: Colors.blueAccent),
                      onPressed: () {

                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
void showPopup(BuildContext context) {
  showModalBottomSheet(
    context: context,

    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
        child: const PopupContainer(),
      );
    },
  );
}

