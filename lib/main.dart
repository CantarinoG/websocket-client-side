import 'package:flutter/material.dart';
import 'package:websocket_client_side/models/web_socket_service_base.dart';
import 'package:websocket_client_side/screens/home_page.dart';
import 'package:websocket_client_side/services/websocket_service.dart';

void main() {
  const String endpoint = "wss://echo.websocket.org/";
  final WebsocketServiceBase websocketService = WebsocketService(endpoint);

  runApp(MyApp(
    websocketService: websocketService,
  ));
}

class MyApp extends StatelessWidget {
  final WebsocketServiceBase websocketService;
  const MyApp({super.key, required this.websocketService});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Websocket Client',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: HomePage(
        webSocketService: websocketService,
      ),
    );
  }
}
