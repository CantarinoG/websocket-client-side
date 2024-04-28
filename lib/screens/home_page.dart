import 'package:flutter/material.dart';
import 'package:websocket_client_side/services/websocket_service.dart';

class HomePage extends StatefulWidget {
  final WebsocketService webSocketService;
  const HomePage({super.key, required this.webSocketService});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      widget.webSocketService.sendMessage(_controller.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Websocket Client"),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Send a message",
              ),
              controller: _controller,
            ),
            SizedBox(
              height: 15,
            ),
            StreamBuilder(
              stream: widget.webSocketService.stream,
              builder: (context, snapshot) {
                return Text(snapshot.hasData ? '${snapshot.data}' : '');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: 'Send message',
        child: const Icon(Icons.send),
      ),
    );
  }

  @override
  void dispose() {
    widget.webSocketService.close();
    super.dispose();
  }
}
