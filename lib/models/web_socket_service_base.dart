abstract class WebsocketServiceBase {
  void sendMessage(String message);
  Stream get stream;
  void close();
}
