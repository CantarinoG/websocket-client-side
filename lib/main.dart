import 'package:flutter/material.dart';
import 'package:websocket_client_side/screens/home_page.dart';
import 'package:websocket_client_side/services/websocket_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final String endpoint = "wss://echo.websocket.org/";

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Websocket Client',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: HomePage(
        webSocketService: WebsocketService(endpoint),
      ),
    );
  }
}
