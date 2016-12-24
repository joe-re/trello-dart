library TrelloDart;

import 'dart:io';
import 'dart:async';

class Client {
  String key;
  String token;
  HttpClient client;
  static const HOST = "https://api.trello.com";

  Client(String key, String token) {
    this.key = key;
    this.token = token;
    this.client = new HttpClient();
  }

  Future<HttpClientResponse> get(String uri, Map<String, String> args) async {
    return _request("GET", uri, args);
  }

  Future<HttpClientResponse> post(String uri, Map<String, String> args) async {
    return _request("POST", uri, args);
  }

  Future<HttpClientResponse> put(String uri, Map<String, String> args) async {
    return _request("PUT", uri, args);
  }

  Future<HttpClientResponse> delete(String uri, Map<String, String> args) async {
    return _request("DELETE", uri, args);
  }

  Future<HttpClientResponse> _request(String method, String uri, Map<String, String> args) async {
    if (uri[0] != "/") {
      uri = "/${uri}";
    }
    return this.client.openUrl(method, _createUri(uri, args))
        .then((HttpClientRequest req) => req.close())
        .then((HttpClientResponse res) => res);
  }

  Uri _createUri(String uri, Map<String, String> args) {
    StringBuffer buf = new StringBuffer();
    void addToBuf(k, v) {
      buf.write("&");
      buf.write(k);
      buf.write("=");
      buf.write(v);
    }
    args.forEach(addToBuf);
    return Uri.parse("${HOST}${uri}?key=${key}&token=${token}${buf.toString()}");
  }
}