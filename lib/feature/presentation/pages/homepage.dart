// import 'package:cbot/openai_service.dart';
// import 'package:cbot/pallet.dart';
// import 'package:flutter/material.dart';
// import 'package:speech_to_text/speech_recognition_result.dart';
// import 'package:speech_to_text/speech_to_text.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final speechtotext = SpeechToText();
//   String lastWords = '';
//   OpenAIService openaiService = OpenAIService();

//   /// We'll keep chat messages here so that when the user closes/reopens
//   /// the chat, the messages persist.
//   final List<Map<String, String>> chatMessages = [];

//   @override
//   void initState() {
//     super.initState();
//     initspeechtotext();
//   }

//   Future<void> initspeechtotext() async {
//     await speechtotext.initialize();
//     setState(() {});
//   }

//   void onSpeechResult(SpeechRecognitionResult result) {
//     setState(() {
//       lastWords = result.recognizedWords;
//     });
//   }

//   Future<void> startListening() async {
//     await speechtotext.listen(onResult: onSpeechResult);
//     setState(() {});
//   }

//   Future<void> stopListening() async {
//     await speechtotext.stop();
//     setState(() {});
//   }

//   @override
//   void dispose() {
//     speechtotext.stop();
//     super.dispose();
//   }

//   /// Opens the chat UI as a modal bottom sheet
//   void _openChat() {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent, // So we can style the container
//       builder: (context) {
//         return FractionallySizedBox(
//           heightFactor: 0.68, // Adjust as needed
//           child: ChatScreen(
//             openaiService: openaiService,
//             chatMessages: chatMessages,
//             speechToText: speechtotext,
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // Floating Action Button to open the chat
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Pallete.firstSuggestionBoxColor,
//         onPressed: _openChat,
//         child: const Icon(Icons.chat),
//       ),
//       appBar: AppBar(
//         title: const Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image(
//               image: AssetImage('assets/images/cbot_logoo.png'),
//               width: 60,
//               height: 70,
//             ),
//             Text("  X  ", style: TextStyle(fontWeight: FontWeight.bold)),
//             Image(
//               image: AssetImage('assets/images/SOF_ndex-removebg-preview.png'),
//               width: 90,
//               height: 70,
//             ),
//           ],
//         ),
//         leading: const Icon(Icons.menu),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Center(
//           child: Column(
//             children: [
//               const SizedBox(height: 20),
//               // Logo
//               Container(
//                 height: 100,
//                 width: 100,
//                 decoration: BoxDecoration(
//                   color:
//                       const Color.fromARGB(255, 199, 199, 199).withOpacity(0.2),
//                   shape: BoxShape.circle,
//                   image: const DecorationImage(
//                     image: AssetImage('assets/images/cbot_logoo.png'),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               // "Ask me anything" field
//               Container(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Pallete.borderColor),
//                   color: Pallete.firstSuggestionBoxColor,
//                   borderRadius: BorderRadius.circular(20).copyWith(
//                     topLeft: const Radius.circular(0),
//                   ),
//                 ),
//                 child: const Text(
//                   'Ask me anything...',
//                   style: TextStyle(
//                     fontFamily: 'Cera Pro',
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 15),

//               // Suggestions
//               const Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   "Here is some suggestions",
//                   style: TextStyle(
//                     fontFamily: 'Cera Pro',
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 15),

//               // Suggestions list
//               Column(
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       _openChat();
//                     },
//                     child: const FeatureBox(
//                       color: Pallete.firstSuggestionBoxColor,
//                       headerText: "Customer Service",
//                       descriptionText:
//                           "This is for customers that need help or have a question about the company's service.",
//                     ),
//                   ),
//                   const SizedBox(height: 15),
//                   InkWell(
//                     onTap: () {
//                       //appears an alert message have a description of what this app do
//                       showDialog(
//                         context: context,
//                         builder: (context) => AlertDialog(
//                           title: const Text("CBOT"),
//                           content: const Text(
//                               "This is a chatbot for users that need help or have a question about the company's service. it only answers questions about the company's service and products. it is supported by a strong foundationed AI model that answers questions based on the company's service and products."),
//                         ),
//                       );
//                     },
//                     child: const FeatureBox(
//                       color: Color.fromARGB(255, 142, 188, 221),
//                       headerText: "Customer Service",
//                       descriptionText:
//                           "This is for customers that need help or have a question about the company's service.",
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class FeatureBox extends StatelessWidget {
//   final Color color;
//   final String headerText;
//   final String descriptionText;

//   const FeatureBox({
//     super.key,
//     required this.color,
//     required this.headerText,
//     required this.descriptionText,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       decoration: BoxDecoration(
//         border: Border.all(color: Pallete.borderColor),
//         color: color,
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(height: 3),
//           Text(
//             headerText,
//             style: const TextStyle(
//               fontFamily: 'Cera Pro',
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             descriptionText,
//             style: const TextStyle(
//               fontFamily: 'Cera Pro',
//               fontSize: 16,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// ///
// /// ChatScreen shows the chat UI.
// ///  - The user can type text or use the mic.
// ///  - When sending a message, we show a 'thinking' bubble instead of a spinner by the input field.
// ///  - The assistant's messages display the CBOT logo on the left for branding.
// ///
// class ChatScreen extends StatefulWidget {
//   final OpenAIService openaiService;
//   final List<Map<String, String>> chatMessages;
//   final SpeechToText speechToText;

//   const ChatScreen({
//     super.key,
//     required this.openaiService,
//     required this.chatMessages,
//     required this.speechToText,
//   });

//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _controller = TextEditingController();

//   bool _isSending = false;
//   bool _isListening = false;

//   /// Toggles speech recognition.
//   /// When the user is done (presses Enter or Send), we stop listening.
//   void _toggleListening() async {
//     if (!_isListening) {
//       _isListening = true;
//       await widget.speechToText.listen(onResult: (result) {
//         setState(() {
//           _controller.text = result.recognizedWords;
//         });
//       });
//     } else {
//       await widget.speechToText.stop();
//       _isListening = false;
//     }
//     setState(() {});
//   }

//   /// Sends a message to the assistant, adds a "thinking" bubble, and stops mic if active.
//   Future<void> _sendMessage(String text) async {
//     final prompt = text.trim();
//     if (prompt.isEmpty) return;

//     // Clear the text field immediately.
//     _controller.clear();

//     // If the mic is active, stop it.
//     if (_isListening) {
//       await widget.speechToText.stop();
//       _isListening = false;
//     }

//     setState(() {
//       widget.chatMessages.add({'role': 'user', 'content': prompt});
//       _isSending = true;
//     });

//     // Retrieve the assistant's answer.
//     final answer = await widget.openaiService.isArtPrompt(prompt);

//     setState(() {
//       widget.chatMessages.add({'role': 'assistant', 'content': answer});
//       _isSending = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // We want to show a "thinking" bubble if _isSending is true.
//     // So the total item count is chatMessages.length + ( _isSending ? 1 : 0 ).
//     final itemCount = widget.chatMessages.length + (_isSending ? 1 : 0);

//     return Container(
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
//       ),
//       child: Column(
//         children: [
//           // Drag handle & close button row
//           Padding(
//             padding: const EdgeInsets.only(top: 8, bottom: 4),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   width: 40,
//                   height: 5,
//                   decoration: BoxDecoration(
//                     color: Colors.grey[300],
//                     borderRadius: BorderRadius.circular(2.5),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           // Header row: CBOT logo on the left, then "CBOT Chat" text, and close icon on the right
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//             child: Row(
//               children: [
//                 Image.asset(
//                   'assets/images/cbot_logoo.png',
//                   width: 80,
//                   height: 55,
//                 ),
//                 const SizedBox(width: 5),
//                 const Text(
//                   'Chat',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const Spacer(),
//                 IconButton(
//                   icon: const Icon(Icons.close),
//                   onPressed: () => Navigator.pop(context),
//                 ),
//               ],
//             ),
//           ),
//           const Divider(height: 1),

//           // Chat messages
//           Expanded(
//             child: ListView.builder(
//               padding: const EdgeInsets.all(12),
//               itemCount: itemCount,
//               itemBuilder: (context, index) {
//                 // If index equals the length of chatMessages and we are sending => "thinking" bubble
//                 if (index == widget.chatMessages.length && _isSending) {
//                   return _buildThinkingBubble();
//                 }

//                 // Otherwise, show normal message
//                 final msg = widget.chatMessages[index];
//                 final isUser = (msg['role'] == 'user');
//                 return _buildMessageBubble(msg, isUser);
//               },
//             ),
//           ),

//           // Input field row with mic and send icons
//           Padding(
//             padding: const EdgeInsets.fromLTRB(8, 0, 8, 12),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _controller,
//                     onSubmitted: (val) => _sendMessage(val), // Send on Enter
//                     decoration: InputDecoration(
//                       // fillColor: Colors.grey.withOpacity(0.2),
//                       hintText: 'Type your message...',
//                       contentPadding: const EdgeInsets.symmetric(
//                           horizontal: 12, vertical: 8),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 // Mic button
//                 IconButton(
//                   icon: Icon(_isListening ? Icons.mic_off : Icons.mic),
//                   onPressed: _toggleListening,
//                 ),
//                 const SizedBox(width: 8),
//                 // Send button
//                 IconButton(
//                   icon: const Icon(Icons.send),
//                   onPressed: () => _sendMessage(_controller.text),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   /// Builds a normal message bubble. If it's the assistant's message,
//   /// we place the CBOT logo to the left. We'll also parse newlines for better formatting.
//   Widget _buildMessageBubble(Map<String, String> msg, bool isUser) {
//     // Convert any escaped '\n' into actual newlines:
//     final textContent = (msg['content'] ?? '').replaceAll('\\n', '\n');

//     if (isUser) {
//       // Right-aligned bubble for user
//       return Container(
//         margin: const EdgeInsets.symmetric(vertical: 4),
//         alignment: Alignment.centerRight,
//         child: Container(
//           padding: const EdgeInsets.all(10),
//           constraints:
//               BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
//           decoration: BoxDecoration(
//             color: Colors.lightBlueAccent[100],
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Text(
//             textContent,
//             style: const TextStyle(fontSize: 15),
//           ),
//         ),
//       );
//     } else {
//       // Assistant's message: show a row with the logo on the left and the bubble on the right
//       return Container(
//         margin: const EdgeInsets.symmetric(vertical: 4),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Logo
//             Image.asset(
//               'assets/images/cbot_logoo.png',
//               width: 30,
//               height: 30,
//             ),
//             const SizedBox(width: 8),
//             // Bubble
//             Flexible(
//               child: Container(
//                 padding: const EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   color: Colors.grey[300],
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Text(
//                   textContent,
//                   style: const TextStyle(fontSize: 15),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     }
//   }

//   /// Builds a special "thinking" bubble displayed while the assistant is generating an answer.
//   Widget _buildThinkingBubble() {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 4),
//       alignment: Alignment.centerLeft,
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // CBOT logo next to thinking bubble
//           Image.asset(
//             'assets/images/cbot_logoo.png',
//             width: 30,
//             height: 30,
//           ),
//           const SizedBox(width: 8),
//           // Spinner bubble
//           Container(
//             padding: const EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: Colors.grey[300],
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: const Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 SizedBox(
//                   width: 16,
//                   height: 16,
//                   child: CircularProgressIndicator(strokeWidth: 2),
//                 ),
//                 SizedBox(width: 8),
//                 Text("Thinking..."),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:cbot/openai_service.dart';
import 'package:cbot/pallet.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

/// HomePage holds the main UI and persistent chat history.
/// The FAB toggles a side (or bottom) chat panel.
class _HomePageState extends State<HomePage> {
  final speechtotext = SpeechToText();
  String lastWords = '';
  OpenAIService openaiService = OpenAIService();

  // Persistent chat messages stored here.
  final List<Map<String, String>> chatMessages = [];

  @override
  void initState() {
    super.initState();
    initspeechtotext();
  }

  Future<void> initspeechtotext() async {
    await speechtotext.initialize();
    setState(() {});
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
    });
  }

  Future<void> startListening() async {
    await speechtotext.listen(onResult: onSpeechResult);
    setState(() {});
  }

  Future<void> stopListening() async {
    await speechtotext.stop();
    setState(() {});
  }

  @override
  void dispose() {
    speechtotext.stop();
    super.dispose();
  }

  /// Opens the chat UI as a modal bottom sheet.
  void _openChat() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent, // For custom styling.
      builder: (context) {
        // ChatScreen is provided the persistent chatMessages.
        return FractionallySizedBox(
          heightFactor: 0.68, // Adjusts the panel height.
          child: ChatScreen(
            openaiService: openaiService,
            chatMessages: chatMessages,
            speechToText: speechtotext,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Floating button to open the chat.
      floatingActionButton: FloatingActionButton(
        backgroundColor: Pallete.firstSuggestionBoxColor,
        onPressed: _openChat,
        child: const Icon(Icons.chat),
      ),
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/cbot_logoo.png'),
              width: 80,
              height: 90,
            ),
            Text("  X  ", style: TextStyle(fontWeight: FontWeight.bold)),
            Image(
              image: AssetImage('assets/images/SOF_ndex-removebg-preview.png'),
              width: 100,
              height: 70,
            ),
          ],
        ),
        leading: const Icon(Icons.menu),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Logo container.
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color:
                      const Color.fromARGB(255, 199, 199, 199).withOpacity(0.2),
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                    image: AssetImage('assets/images/cbot_logoo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // "Ask me anything" field.
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Pallete.borderColor),
                  color: Pallete.firstSuggestionBoxColor,
                  borderRadius: BorderRadius.circular(20)
                      .copyWith(topLeft: const Radius.circular(0)),
                ),
                child: const Text(
                  'Ask me anything...',
                  style: TextStyle(
                    fontFamily: 'Cera Pro',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              // Suggestions header.
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Here is some suggestions",
                  style: TextStyle(
                    fontFamily: 'Cera Pro',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              // Suggestions list.
              Column(
                children: [
                  InkWell(
                    onTap: _openChat,
                    child: const FeatureBox(
                      color: Pallete.firstSuggestionBoxColor,
                      headerText: "Customer Service",
                      descriptionText:
                          "This is for customers that need help or have a question about the company's service.",
                    ),
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("CBOT"),
                          content: const Text(
                              "This is a chatbot for users that need help or have a question about the company's service. It only answers questions related to the company's service and products."),
                        ),
                      );
                    },
                    child: const FeatureBox(
                      color: Color.fromARGB(255, 142, 188, 221),
                      headerText: "Customer Service",
                      descriptionText:
                          "This is for customers that need help or have a question about the company's service.",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FeatureBox extends StatelessWidget {
  final Color color;
  final String headerText;
  final String descriptionText;
  const FeatureBox({
    super.key,
    required this.color,
    required this.headerText,
    required this.descriptionText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Pallete.borderColor),
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 3),
          Text(
            headerText,
            style: const TextStyle(
              fontFamily: 'Cera Pro',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            descriptionText,
            style: const TextStyle(
              fontFamily: 'Cera Pro',
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

///
/// ChatScreen shows the animated, colorful, side-docked chat panel.
/// It slides in from the bottom and remains above the FAB.
/// It supports speech-to-text and clears input after sending.
///
class ChatScreen extends StatefulWidget {
  final OpenAIService openaiService;
  final List<Map<String, String>> chatMessages;
  final SpeechToText speechToText;

  const ChatScreen({
    super.key,
    required this.openaiService,
    required this.chatMessages,
    required this.speechToText,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  bool _isSending = false;
  bool _isListening = false;

  late final AnimationController _slideController;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    // Setup the slide animation: start from bottom (offset: (0, 1)) and end at (0, 0)
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _slideAnimation = Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
        .animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOut,
    ));
    _slideController.forward();

    _initSpeech();
  }

  Future<void> _initSpeech() async {
    await widget.speechToText.initialize();
    setState(() {});
  }

  /// Toggle the speech recognition.
  Future<void> _toggleListening() async {
    if (!_isListening) {
      _isListening = true;
      await widget.speechToText.listen(onResult: (result) {
        setState(() {
          _controller.text = result.recognizedWords;
        });
      });
    } else {
      await widget.speechToText.stop();
      _isListening = false;
    }
    setState(() {});
  }

  /// Sends the message to the assistant.
  Future<void> _sendMessage(String text) async {
    final prompt = text.trim();
    if (prompt.isEmpty) return;

    // Stop speech recognition if active.
    if (_isListening) {
      await widget.speechToText.stop();
      _isListening = false;
    }

    setState(() {
      widget.chatMessages.add({'role': 'user', 'content': prompt});
      _isSending = true;
    });
    // Clear the text field immediately.
    _controller.clear();

    // Retrieve assistant's answer.
    final answer = await widget.openaiService.isArtPrompt(prompt);

    setState(() {
      widget.chatMessages.add({'role': 'assistant', 'content': answer});
      _isSending = false;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final itemCount = widget.chatMessages.length + (_isSending ? 1 : 0);
    return SlideTransition(
      position: _slideAnimation,
      child: Container(
        margin: const EdgeInsets.only(
          left: 12,
          right: 12,
          bottom: 80, // Leave some space at the bottom for the FAB.
          top: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          children: [
            // Header with a drag handle and a close button.
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2.5),
                    ),
                  ),
                ],
              ),
            ),
            // Header row with CBOT logo and title.
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/cbot_logoo.png',
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'CBOT Chat',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            // Chat messages list.
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: itemCount,
                itemBuilder: (context, index) {
                  if (index == widget.chatMessages.length && _isSending) {
                    return _buildThinkingBubble();
                  }
                  final msg = widget.chatMessages[index];
                  final isUser = msg['role'] == 'user';
                  return _buildMessageBubble(msg, isUser);
                },
              ),
            ),
            // Input row with text field, mic, and send icons.
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 12),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      onSubmitted: (val) => _sendMessage(val),
                      decoration: InputDecoration(
                        hintText: 'Type your message...',
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Mic button
                  IconButton(
                    icon: Icon(_isListening ? Icons.mic_off : Icons.mic),
                    onPressed: _toggleListening,
                  ),
                  const SizedBox(width: 8),
                  // Send button
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () => _sendMessage(_controller.text),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds a user or assistant message bubble.
  Widget _buildMessageBubble(Map<String, String> msg, bool isUser) {
    // Parse newlines.
    final textContent = (msg['content'] ?? '').replaceAll('\\n', '\n');

    if (isUser) {
      return Container(
        alignment: Alignment.centerRight,
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Container(
          padding: const EdgeInsets.all(10),
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.5),
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(textContent, style: const TextStyle(fontSize: 15)),
        ),
      );
    } else {
      // Assistant message: show CBOT logo beside the bubble.
      return Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/cbot_logoo.png',
              width: 30,
              height: 30,
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(textContent, style: const TextStyle(fontSize: 15)),
              ),
            ),
          ],
        ),
      );
    }
  }

  /// Builds a "thinking" bubble shown while waiting for the assistant.
  Widget _buildThinkingBubble() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/cbot_logoo.png',
            width: 30,
            height: 30,
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
                SizedBox(width: 8),
                Text("Thinking..."),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
