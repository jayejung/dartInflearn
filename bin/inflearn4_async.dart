void main() async {

  // Future - 미래에 받아올 값
  Future<String> name = Future.value('kakao entertainment');
  Future<int> number = Future.value(1);
  Future<bool> isTrue = Future.value(true);

  print('start function');

  // Future.delayed(Duration(seconds: 2), () {
  //   print('Delay finished');
  // });

  // addNumbers(1, 1);
  // addNumbers(2, 2);
  // await addNumbersAsync(1, 1);
  // await addNumbersAsync(2, 2);
  final result1 = await addnumberWithReturn(1, 1);
  final result2 = await addnumberWithReturn(2, 2);
  print('result1: $result1');
  print('result2: $result2');
  print('result1 + result2 = ${result1 + result2}');
}

void addNumbers(int number1, int number2) {
  print('calculating...:  $number1 + $number2');

  // 서버 시뮬레이션
  Future.delayed(Duration(seconds: 2), () {
    print('calculation completed : $number1 + $number2 = ${number1 + number2}');
  });

  print('end of function: $number1 + $number2');
}

Future<void> addNumbersAsync(int number1, int number2) async {
  print('async calculating...: $number1 + $number2');

  // 서버 시뮬레이션
  await Future.delayed(Duration(seconds: 2), () {
    print('async calculation completed: $number1 + $number2 = ${number1 + number2}');
  });

  print('async end of function: $number1 + $number2');
}

Future<int> addnumberWithReturn(int number1, int number2) async {
  print('async return calculating...: $number1 + $number2');

  // 서버 시뮬레이션
  await Future.delayed(Duration(seconds: 2), () {
    print('async return calculation completed: $number1 + $number2 = ${number1 + number2}');
  });

  print('async return end of function: $number1 + $number2');

  return number1 + number2;
}