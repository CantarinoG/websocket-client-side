import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:websocket_client_side/models/web_socket_service_base.dart';

class WebsocketService implements WebsocketServiceBase {
  final WebSocketChannel _channel;

  WebsocketService(String url)
      : _channel = WebSocketChannel.connect(Uri.parse(url));

  @override
  void sendMessage(String message) {
    _channel.sink.add(message);
  }

  @override
  Stream get stream => _channel.stream;

  @override
  void close() {
    _channel.sink.close();
  }
}
