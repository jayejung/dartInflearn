import 'dart:async';

void streamSample() {
  final controller = StreamController();
  final stream = controller.stream;

  final streamListener1 = stream.listen((val) {
    print('listener 1 : $val');
  });

  controller.sink.add(1);
  controller.sink.add(2);
  controller.sink.add(3);
  controller.sink.add(4);
  controller.sink.add(5);
}

void streamBroadcastingSample() {
  final controller = StreamController();
  final stream = controller.stream.asBroadcastStream();

  final streamListener1 = stream.listen((val) {
    print('listener 1 : $val');
  });

  final streamListener2 = stream.listen((val) {
    print('listener 2 : $val');
  });

  controller.sink.add(1);
  controller.sink.add(2);
  controller.sink.add(3);
  controller.sink.add(4);
  controller.sink.add(5);
}

void streamBroadcastingWithSep() {
  final controller = StreamController();
  final stream = controller.stream.asBroadcastStream();

  final streamListener1 = stream.listen((val) {
    if (val % 2 == 0) {
      print('listener even : $val');
    }
  });

  final streamListener2 = stream.listen((val) {
    if (val % 2 == 1) {
      print('listener odd : $val');
    }
  });

  controller.sink.add(1);
  controller.sink.add(2);
  controller.sink.add(3);
  controller.sink.add(4);
  controller.sink.add(5);
}

void streamFunctionSample() {
  calculate(2).listen((val) {
    print('calculate(2): $val');
  });

  calculate(4).listen((val) {
    print('calculate(4): $val');
  });
}

void streamFunctionSyncSample() {
  playAllStream().listen((val) {
    print('playAllStream(): $val');
  });
}

Stream<int> calculate(int number) async* {
  for (int i = 0; i < 5; i++) {
    yield i * number;

    await Future.delayed(Duration(seconds: 1));
  }
}

Stream<int> playAllStream() async* {
  yield* calculate(1);
  yield* calculate(1000);
}