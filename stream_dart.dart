
import 'dart:async';

main() {
  // myStreamFunction().listen(
  //  (e) {
  //print(e * e);


//  );
  StreamController _myStreamController = StreamController();

  void functionForStreamController() async {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 1));
      if (i==6){_myStreamController.addError('hatta');}
      _myStreamController.sink.add(i + 1);
    }

    _myStreamController.close();
  }



  functionForStreamController();
  _myStreamController.stream.listen((event) {
    print(event * 10);
  },

      onDone: (){
    print ('stream listen içerisinde onDone fonksiyonu çalıştı');
  },
    onError: (error ) {print (error);},
    cancelOnError: true
  );
}


Stream<int> myStreamFunction () async*{
  for (int i=0; i<10; i++){
    await Future.delayed(Duration(seconds: 1));
    yield i+1;
  }
}
