import 'dart:convert';

import 'package:bookstore/cubits/get_user_info/get_user_info_cubit.dart';
import 'package:bookstore/generated/l10n.dart';
import 'package:bookstore/models/chatbot.dart';
import 'package:bookstore/views/message_bubble.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  void initState() {
    super.initState();
    context.read<GetUserInfoCubit>().getUserInfo();
  }

  final List<Map<String, String>> _messages = [];
  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false;

  late String image;
  late String user;
  Future<void> _sendMessage({
    required String query,
  }) async {
    setState(() {
      _isLoading = true;
    });

    final url = Uri.parse('https://api.dify.ai/v1/chat-messages');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer app-JZhvTyQtikfhrthvUK6TurY3',
    };
    final body = jsonEncode({
      'inputs': {},
      'query': query,
      'user': user,
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      Chatbot chatbotResponse = Chatbot.fromJson(jsonDecode(response.body));
      setState(() {
        _messages.add({'user': user, 'message': query});
        _messages.add({
          'user': 'Bot',
          'message': chatbotResponse.answer ?? 'No answer found'
        });
        _isLoading = false;
      });
    } else {
      if (kDebugMode) {
        print('Error: ${response.statusCode} - ${response.body}');
      }
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return MessageBubble.first(
                    message: _messages[index]['message']!,
                    isMe: _messages[index]['user'] != 'Bot',
                    userImage: _messages[index]['user'] != 'Bot'
                        ? image
                        : 'https://github.com/moustafa3laa2/E-Book-Grad/blob/main/assets/images/logo.png?raw=true',
                    username: _messages[index]['user'] != 'Bot' ? user : 'Bot',
                  );
                },
              ),
            ),
            if (_isLoading)
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              ),
            BlocBuilder<GetUserInfoCubit, GetUserInfoState>(
              builder: (context, state) {
                if (state is GetUserInfoLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                } else if (state is GetUserInfoSuccess) {
                  image = state.response.findUser!.image!.url!;
                  user = state.response.findUser!.firstname!;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _controller,
                            decoration: InputDecoration(
                              hintText: S.of(context).Typeyourmessage,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.send),
                          onPressed: () async {
                            if (_controller.text.isNotEmpty) {
                              await _sendMessage(
                                query: _controller.text,
                              );
                              _controller.clear();
                            }
                          },
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('Error fetching user information'),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
