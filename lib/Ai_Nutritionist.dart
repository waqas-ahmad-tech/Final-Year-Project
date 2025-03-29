import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:intl/intl.dart';
import 'modelMessage.dart';

class AiNutritionist extends StatefulWidget {
  const AiNutritionist({super.key});

  @override
  State<AiNutritionist> createState() => _AiNutritionistState();
}

class _AiNutritionistState extends State<AiNutritionist> {
  TextEditingController promptController = TextEditingController();
  static const Api_Key = "AIzaSyDStVuPh4J2ih-GlfJVV6WJjpGjHz-9pjQ";

  // Model name updated
  final model = GenerativeModel(model: 'gemini-2.0-flash', apiKey: Api_Key);

  final List<Modelmessage> prompt = [];

  Future<void> sendMessage() async {
    final message = promptController.text;

    if (message.isEmpty) return; // Avoid empty prompts

    setState(() {
      promptController.clear();
      prompt.add(Modelmessage(isPrompt: true, message: message, time: DateTime.now()));
    });

    final content = [Content.text(message)];
    try {
      final response = await model.generateContent(content);
      setState(() {
        prompt.add(Modelmessage(isPrompt: false, message: response.text ?? "No response", time: DateTime.now()));
      });
    } catch (e) {
      setState(() {
        prompt.add(Modelmessage(isPrompt: false, message: "API Error: ${e.toString()}", time: DateTime.now()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.blue[100],
        title: Center(child: Text('AI Nutritionist')),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: prompt.length,
                  itemBuilder: (context, index) {
                    final message = prompt[index];
                    return UserPrompt(isPrompt: message.isPrompt, message: message.message, date: DateFormat('hh:mm a').format(message.time));
                  })),
          Padding(
            padding: EdgeInsets.all(25),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: TextField(
                    controller: promptController,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        hintText: 'Enter a prompt here'),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    sendMessage();
                  },
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 23,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container UserPrompt({required final bool isPrompt, required String message, required String date}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: isPrompt == true ? Colors.green : Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message,
            style: TextStyle(
              fontWeight: isPrompt ? FontWeight.bold : FontWeight.normal,
              fontSize: 18,
              color: isPrompt ? Colors.white : Colors.black,
            ),
          ),
          Text(
            date,
            style: TextStyle(
              fontWeight: isPrompt ? FontWeight.bold : FontWeight.normal,
              fontSize: 18,
              color: isPrompt ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
