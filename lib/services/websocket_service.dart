import 'package:web_socket_channel/web_socket_channel.dart';

class WebsocketService {
  final WebSocketChannel _channel;

  WebsocketService(String url)
      : _channel = WebSocketChannel.connect(Uri.parse(url));

  void sendMessage(String message) {
    _channel.sink.add(message);
  }

  Stream get stream => _channel.stream;

  void close() {
    _channel.sink.close();
  }
}
