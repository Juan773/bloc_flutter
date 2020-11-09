import 'dart:async';

class CouterBase {}

class IncrementCouter extends CouterBase {}

class ClearCouter extends CouterBase {}

class CouterBlock {
  int _count = 0;
  StreamController<CouterBase> _input = StreamController();
  StreamController<int> _output = StreamController();
  Stream<int> get couterStream => _output.stream;

  CouterBlock() {
    _input.stream.listen(onEvent);
  }
  void dispose() {
    _input.close();
    _output.close();
  }

  void onEvent(CouterBase event) {
    if (event is IncrementCouter) {
      _count++;
    } else {
      _count = 0;
    }
    _output.add(_count);
  }
}
