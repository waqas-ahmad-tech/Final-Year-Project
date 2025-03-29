class Modelmessage {
  final bool isPrompt;
  final String message;
  final DateTime time;
  Modelmessage(
      {
        required this.isPrompt,
        required this.message,
        required this.time
      });
}
