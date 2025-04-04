// import 'dart:convert';

// import 'package:cbot/secrets.dart';
// import 'package:http/http.dart' as http;

// class OpenAIService {
//   final List<Map<String, String>> messages = [];
//   String companyContent =
//       "Company Overview Sofindex is positioned as a dynamic and innovative software company specializing in digital solutions. The company is dedicated to creating seamless digital experiences that enhance client engagement. Its primary focus is on: UI/UX Design – crafting intuitive, user-friendly interfaces to elevate brand presence; Mobile App Development – building cross-platform mobile applications using Flutter to ensure smooth performance and a superior user experience; Web Development – developing modern, engaging websites tailored to the needs of modern businesses. (Source: , , ) Core Services UI/UX Design: Sofindex emphasizes creating interfaces that are both visually appealing and functional, focusing on intuitive user journeys for effortless digital interactions. Mobile App Development: Leveraging Flutter, the company develops robust and high-performance mobile applications that work seamlessly across multiple platforms, ensuring consistency and speed. Web Development: The company provides web development services that not only focus on modern design aesthetics but also on building engaging digital experiences that help clients stand out online. Digital Innovation: Underpinning all services is a commitment to transforming ideas into impactful digital experiences, ensuring that every project is infused with creativity and technical expertise. (Source: , , ) Additional Details Navigation & Content: The website is structured with clear navigation—Home, Services, About, and Contact—ensuring visitors can easily access key company information. Client Trust and Experience: Indicators like “20+” and “5+” on the site suggest a strong track record of innovative solutions and a trusted client base. Contact Information: Email – info@sofindex.com; Phone – +201040230372; Social Media – links to LinkedIn and WhatsApp for direct communication. (Source: , ) Reservation Service: For reservation-related inquiries, the assistant should redirect users to the dedicated reservation service at https://reserve.sofindex.com, ensuring that any questions specifically about reservations are efficiently managed by sending users to the appropriate portal. Implementation Notes for the AI Bot: Domain-Specific Responses – the bot should answer queries strictly related to the company’s services and support, replying “I only answer questions based on the services and support of this company nothing else” for unrelated questions. Prompt Classification – the provided code snippet checks if a prompt is related to Sofindex and generates a tailored response if it is; otherwise, a generic response is given to maintain domain specificity. Incorporation of Company Data – the assistant should leverage the following key points: Expertise in UI/UX design, mobile app development using Flutter, and web development; Digital Innovation emphasizing the transformation of ideas into innovative digital solutions; Contact & Navigation by using the website’s structure to direct users for further information or support; and Reservation Redirect by automatically providing the reservation URL for related inquiries. (Sources: , , , , , , )";

//   Future isArtPrompt(String prompt) async {
//     try {
//       final res = await http.post(
//         Uri.parse('https://api.aimlapi.com/v1/chat/completions'),
//         headers: {
//           'Host': 'api.aimlapi.com',
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer $openaiApiKey'
//         },
//         body: jsonEncode({
//           "model": "gpt-4o-mini",
//           "messages": [
//             {
//               "role": "user",
//               "content":
//                   "Does this prompt $prompt contains content about out company SOFINDEX the content of what the company do is $companyContent? Simply answer with yes or no"
//             },
//           ]
//         }),
//       );
//       // print(res.body);
//       if (res.statusCode == 200) {
//         String content =
//             jsonDecode(res.body)['choices'][0]['message']['content'];
//         print(res.body);

//         content = content.trim();
//         // if the content starts with yes, then return the prompt
//         switch (content) {
//           case 'yes':
//           case 'Yes':
//           case 'YES':
//           case 'Yes.':
//           case 'yes.':
//             final res = await ChatGPTApiSOF(prompt);
//             return res;
//           default:
//             final res = await ChatGPTApino(prompt);
//             return res;
//         }
//       } else {
//         return 'Error';
//       }
//     } catch (e) {
//       return e.toString();
//     }
//   }

//   Future<String> ChatGPTApiSOF(String prompt) async {
//     messages.add({
//       'role': 'user',
//       'content': prompt,
//     });
//     try {
//       final res = await http.post(
//         Uri.parse('https://api.aimlapi.com/v1/chat/completions'),
//         headers: {
//           'Host': 'api.aimlapi.com',
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer $openaiApiKey',
//         },
//         body: jsonEncode({
//           "model": "gpt-4o-mini",
//           "messages": messages,
//         }),
//       );

//       if (res.statusCode == 200) {
//         String content =
//             jsonDecode(res.body)['choices'][0]['message']['content'];
//         print(res.body);

//         content = content.trim();

//         messages.add({
//           'role': 'assistant',
//           'content': content,
//         });
//         return content;
//       }
//       return 'An internal error occurred';
//     } catch (e) {
//       return e.toString();
//     }
//   }

//   Future<String> ChatGPTApino(String prompt) async {
//     try {
//       final res = await http.post(
//         Uri.parse('https://api.aimlapi.com/v1/chat/completions'),
//         headers: {
//           'Host': 'api.aimlapi.com',
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer $openaiApiKey',
//         },
//         body: jsonEncode({
//           "model": "gpt-4o-mini",
//           "messages": messages,
//         }),
//       );
//       if (res.statusCode == 200) {
//         String content =
//             jsonDecode(res.body)['choices'][0]['message']['content'];
//         print(res.body);
//         content = content.trim();

//         messages.add({
//           'role': 'assistant',
//           'content':
//               "I can not answer this question, Please ask a question related to the company",
//         });
//         return content;
//       }
//       return 'An internal error occurred';
//     } catch (e) {
//       return e.toString();
//     }
//     // return 'I can not answer this question, Please ask a question related to the company';
//   }
// }
import 'dart:convert';
import 'package:cbot/secrets.dart';
import 'package:http/http.dart' as http;

class OpenAIService {
  final List<Map<String, String>> messages = [];
  String companyContent =
      "Company Overview Sofindex is positioned as a dynamic and innovative software company specializing in digital solutions. The company is dedicated to creating seamless digital experiences that enhance client engagement. Its primary focus is on: UI/UX Design – crafting intuitive, user-friendly interfaces to elevate brand presence; Mobile App Development – building cross-platform mobile applications using Flutter to ensure smooth performance and a superior user experience; Web Development – developing modern, engaging websites tailored to the needs of modern businesses. (Source: , , ) Core Services UI/UX Design: Sofindex emphasizes creating interfaces that are both visually appealing and functional, focusing on intuitive user journeys for effortless digital interactions. Mobile App Development: Leveraging Flutter, the company develops robust and high-performance mobile applications that work seamlessly across multiple platforms, ensuring consistency and speed. Web Development: The company provides web development services that not only focus on modern design aesthetics but also on building engaging digital experiences that help clients stand out online. Digital Innovation: Underpinning all services is a commitment to transforming ideas into impactful digital experiences, ensuring that every project is infused with creativity and technical expertise. (Source: , , ) Additional Details Navigation & Content: The website is structured with clear navigation—Home, Services, About, and Contact—ensuring visitors can easily access key company information. Client Trust and Experience: Indicators like “20+” and “5+” on the site suggest a strong track record of innovative solutions and a trusted client base. Contact Information: Email – info@sofindex.com; Phone – +201040230372; Social Media – links to LinkedIn and WhatsApp for direct communication. (Source: , ) Reservation Service: For reservation-related inquiries, the assistant should redirect users to the dedicated reservation service at https://reserve.sofindex.com,";

  Future<String> isArtPrompt(String prompt) async {
    try {
      print("Calling isArtPrompt with prompt: $prompt");
      final res = await http.post(
        Uri.parse('https://api.aimlapi.com/v1/chat/completions'),
        headers: {
          'Host': 'api.aimlapi.com',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openaiApiKey'
        },
        body: jsonEncode({
          "model": "gpt-4o-mini",
          "messages": [
            {
              "role": "user",
              "content":
                  "Does this prompt \"$prompt\" contain content about our company SOFINDEX? The company’s services are: $companyContent. Simply answer with yes or no even the prompt is in another language answer in english"
            },
          ]
        }),
      );
      print("Response from isArtPrompt: ${res.body}");
      if (res.statusCode == 200 || res.statusCode == 201) {
        String content =
            jsonDecode(res.body)['choices'][0]['message']['content'];
        content = content.trim();
        print("Parsed answer: $content");
        // If the answer is yes, then call ChatGPTApiSOF; otherwise, call ChatGPTApino.
        switch (content) {
          case 'yes':
          case 'Yes':
          case 'YES':
          case 'Yes.':
          case 'yes.':
            final result = await ChatGPTApiSOF(prompt);
            print("Returning response from ChatGPTApiSOF: $result");
            return result;
          default:
            final result = await ChatGPTApino(prompt);
            print("Returning response from ChatGPTApino: $result");
            return result;
        }
      } else {
        print("Non-200 response: ${res.statusCode}");
        return 'Error';
      }
    } catch (e) {
      print("Exception in isArtPrompt: $e");
      return e.toString();
    }
  }

  Future<String> ChatGPTApiSOF(String prompt) async {
    print("Entering ChatGPTApiSOF with prompt: $prompt");
    messages.add({
      'role': 'user',
      'content':
          "The user provided the prompt: $prompt and the company services and info are: $companyContent. Please answer the question based on the company services and info,and answer as you are the company's assistant. , be friendly and professional. and try to answer the question in a way that is easy to understand. write the answer directly as i take the full answer as a result.",
    });
    try {
      final res = await http.post(
        Uri.parse('https://api.aimlapi.com/v1/chat/completions'),
        headers: {
          'Host': 'api.aimlapi.com',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openaiApiKey',
        },
        body: jsonEncode({
          "model": "gpt-4o-mini",
          "messages": messages,
        }),
      );
      print("Response from ChatGPTApiSOF: ${res.body}");
      if (res.statusCode == 200 || res.statusCode == 201) {
        String content =
            jsonDecode(res.body)['choices'][0]['message']['content'];
        content = content.trim();
        // print("Parsed content from ChatGPTApiSOF: $content");

        messages.add({
          'role': 'assistant',
          'content': content,
        });
        return content;
      }
      return 'An internal error occurred';
    } catch (e) {
      print("Exception in ChatGPTApiSOF: $e");
      return e.toString();
    }
  }

  Future<String> ChatGPTApino(String prompt) async {
    print("Entering ChatGPTApino with prompt: $prompt");
    // Instead of making an API call, simply return a fixed message
    String response =
        "I cannot answer this question, please ask a question related to the company";
    print("Returning fixed response from ChatGPTApino: $response");
    // Optionally, you can also add this message to the conversation history if needed:
    messages.add({
      'role': 'assistant',
      'content': response,
    });
    return response;
  }
}
