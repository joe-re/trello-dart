# TrelloDart

A Trello API Client for Dart.

## Installation

add your pubspec.yaml

```
dependencies:
  trello_dart: '^1.0.0'
```

## Usaage

```dart
import 'package:trello_dart/TrelloDart.dart';

main(List<String> args) async {
  //...
  Client trello = new Client(key /* your key */, token /* your token */);
  // Get your board list
  HttpClientResponse res = await trello.get('1/members/joe_re/boards', {"fields": "name"});
  res.transform(UTF8.decoder).listen((contents) {
    stdout.writeln(contents.toString());
  });

  // Get open list at specify board
  HttpClientResponse res2 = await trello.get('1/boards/57abcdefghijk', { 'lists': 'open', 'list_fields': 'name' });
  res2.transform(UTF8.decoder).listen((contents) {
    stdout.writeln(contents.toString());
  });

  // Create card
  HttpClientResponse res3 = await trello.post('1/cards', { 'idList': '1234567890abcdefg', 'name': 'test', 'desc': 'desctiprion' });
  res3.transform(UTF8.decoder).listen((contents) {
    stdout.writeln(contents.toString());
  });
}
```

## TODO
- [ ] attachment file to card
- [ ] oauth
- [ ] more easily to use(ex. implements addCard method etc..)
- [ ] write spec
