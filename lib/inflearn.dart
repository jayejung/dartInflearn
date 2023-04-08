void test1st() {
  String name = '히히히';
  String name2 = '호호호';

  print('${name.runtimeType} ${name2}');
  print('$name.runtimeType $name2');
}

void dynamicSample() {
  dynamic name = '코드팩토리';
  dynamic number = 1;

  var name2 = '블랙핑크';

  print(name);
  print(name2);

  number = '1st';
  //name2 = 1;
}

void nullableSample() {
  String name = '카카오엔터테인먼트';
  print(name);
  //name = null;

  // nullable
  String? name2 = '카카오';
  name2 = null;

  // non-nullable ! 사용
  //print(name2!);
  print(name!);

  double? number = 4.0;
  print(number);
  number = null;
  print(number);
  // number가 null이면 오른쪽 값으로 re-assign하라.
  number ??= 3.0;
  print(number);
}

void finalConstSample() {
  final String name = '카카오엔터테인먼트';
  print(name);
  //name = '카카오'

  const String name2 = '카카오';
  print(name2);
  //name2 = '카카'

  // final const 사용시 type or var 생략 가능
  final name3 = 'a';
  const name4 = 1;

  // final은 runtime시 할당되어도 되는 경우
  // const는 빌드타임에 할당되어야 하는.. 말그대로 진짜 상수.
  final DateTime now = DateTime.now();
  print(now);
  //const DateTime now2 = DateTime.now();
}

void operatorSample() {
  int number = 2;
  print(number);
  print(number % 2);
  number ++;
  print(number);
  number --;
  print(number);

  double dnumber = 4.0;
  dnumber += 1;
  print(dnumber);
  dnumber *= 2;
  print(dnumber);
  dnumber %= 3;
  print(dnumber);
  dnumber ??= 2.0;
  print(dnumber);

  int number1 = 1;
  print(number1 is int);
  print(number1 is String);
  print(number1 is! int);
  print(number1 is! String);
}

void listSample() {
  List<dynamic> list = [1, '2', '3rd', true];

  for (int i = 0; i < list.length; i++) {
    print('dynamic: ${list[i]}, type: ${list[i].runtimeType}');
  }

  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  flybyObjects.where((name) => name.contains('e')).forEach(print);
  flybyObjects.add('Earth');
  print(flybyObjects.toString());
  print(flybyObjects.indexOf('Earth'));
  flybyObjects.remove('Saturn');
  print(flybyObjects.toString());
  print(flybyObjects.indexOf('Earth'));
}

void mapSample() {
  Map<String, String> dictionary = {
    'good morning': '좋은 아침~',
    'good afternoon': '좋은 오후~',
    'thank you': '고마워~'
  };
  print(dictionary);
  dictionary.addAll({'good night': '좋은 저녁~'});
  print(dictionary);
  print(dictionary['good morning']);
  dictionary['sorry'] = '미안해';
  print(dictionary);
  dictionary.remove('good night');
  print(dictionary);
  print(dictionary.keys);
  print(dictionary.values);
}

void setSample() {
  // 중복제거
  final Set<String> names = {
    'shai', 'jaye', 'erin', 'jaye',
  };
  print(names);
  print(names.contains('yvonne'));
  names.addAll({'rita', 'yvonne'});
  print(names);
}

void switchSample() {
  int number = 3;
  switch(number % 3) {
    case 0:
      print('나머지 0');
      break;
    case 1:
      print('나머지 1');
      break;
    default:
      print('나머지가 2');
      break;
  }
}

void loopSample() {
  List<int> numbers = [1, 2, 3, 4, 5, 6];
  int total = 0;
  for (int i = 0; i < numbers.length; i++) {
    total += numbers[i];
  }
  print(total);
  total = 0;

  for (int number in numbers) {
    if (number == 5) {
      continue;
    }
    total += number;
  }
  print(total);
  total = 0;

  numbers.forEach((element) {total += element;});
  print(total);
  total = 0;
}

void enumSample() {
  Status status = Status.pending;
  if (status == Status.approved) {
    print('승인');
  } else if (status == Status.pending) {
    print('대기');
  } else if (status == Status.rejected) {
    print('거절');
  }
}

enum Status {
  approved,
  pending,
  rejected,
}

// [int? y, int? z] 옵션널한 parameter
// [int y = 30, int z = 40] 기본값이 있는 옵셔널 파라메터. 전달되면 전달된 값을.. 없으면 기본 값을
void functionSample(int x, [int y = 0, int z = 0]) {
  print('x: $x, y: $y, z: $z');
  int total = x + y + z;
  print(total);
}

// required 제거하면 optional
// 기본값을 넣어서 + 연산에서 예외 발생하지 않게 변경
// named와 positional parameter를 같이 사용 할 수 있는데, positional이 앞으로 와야함.
int namedParameterSample(int x, {
  required int y,
  int z = 0,
}) {
  print('x: $x, y: $y, z: $z');
  int total = x + y + z;
  print(total);
  return total;
}

int arrorFunctionSample(int x, {
  required int y,
  int z = 0,
}) => x + y + z;

typedef Operation = int Function(int x, int y, int z);

// 더하기, 빼기, 곱하기
int add(int x, int y, int z) => x + y + z;
int subtract(int x, int y, int z) => x - y - z;
int multiply(int x, int y, int z) => x * y * z;

int calculator(int x, int y, int z, Operation operation) {
  return operation(x, y, z);
}

int calculate() {
  return 6 * 7;
}
