/*
  String에 변수를 포멧팅
  단일변수는 $만 표현식은 ${} 으로
 */
void test1st() {
  String name = '히히히';
  String name2 = '호호호';

  print('${name.runtimeType} ${name2}');
  print('$name.runtimeType $name2');
}

/*
  dynamic 변수는 type 변경이 가능함. (타입 추론을 계속 할 수 있음)
 */
void dynamicSample() {
  dynamic name = '코드팩토리';
  dynamic number = 1;
  print("dynamic number: $number, type of dynamic number: ${number.runtimeType}");

  var name2 = '블랙핑크';

  print(name);
  print(name2);

  number = '1st';
  //name2 = 1;

  print("dynamic number: $number, type of dynamic number: ${number.runtimeType}");
}

/*
  nullable 변수는 타입 뒤에 ?를 붙힌다.
  non-nullable 변수는 타입 뒤에 !을 붙힌다.
  null인 경우 기본값 assign은 number ??= 3.0
 */
void nullableSample() {
  String name = '카카오엔터테인먼트';
  print(name);
  //name = null;

  // nullable
  String? name2;
  //name2 = null;
  print("nullable name2 : $name2");

  // non-nullable ! 사용
  print(name2!);
  print(name!);

  double? number = 4.0;
  print(number);
  number = null;
  print(number);
  // number가 null이면 오른쪽 값으로 re-assign하라.
  number ??= 3.0;
  print(number);
}

/*
  final/const 사용시 type 혹은 var 생략 가능 (final/const 이므로 타입 추론이 완료 된 상태)
  final은 runtime시 할당되어도 되는 경우
  const는 빌드타임에 할당이 되어야 하는 진짜 상수.
  즉 아래의 코드는 compile error. now2 변수는 runtime시 변경되므로.
  const DateTime now2 = DateTime.now();
 */
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
  // const DateTime now2 = DateTime.now();
}

/*
  일반적인 언어들의 연산자와 비슷
  ??= : ??= 왼쪽의 값이 null이면 오른쪽 값으로 할당. eg. value ??= 3; value가 null이면 3을 할당
  variable is [type] eg. number is String
 */
void operatorSample() {
  int number = 2;
  print("number : $number");
  print("number % 2 : ${number % 2}");
  number++;
  print("number++ : $number");
  number--;
  print("number-- : $number");

  double dnumber = 4.0;
  dnumber += 1;
  print("dnumber += 1 : $dnumber");
  dnumber *= 2;
  print("dnumber *= 2 : $dnumber");
  dnumber %= 3;
  print("dnumber %= 3: $dnumber");
  dnumber ??= 2.0;
  print("dnumber ??= 2.0 : $dnumber");

  int number1 = 1;
  print("number1 is int : ${number1 is int}");
  print("number1 is String : ${number1 is String}");
  print("number1 is! int : ${number1 is! int}");
  print("number1 is! String : ${number1 is! String}");
}

/*
 generic 타입이 dynamic이면 여러가지 타입이 저장됨.
 list의 where -> filter
 */
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

/*
  map도 여타 언어와 비슷한데, entry를 가져올때 배열과 유사하게 ['key이름'] 으로 value를 불러 올 수 있음.
  eg. dictionary['{key}']
 */
void mapSample() {
  Map<String, String> dictionary = {
    'cat': '고양이',
    'dog': '개',
    'giraffe': '얼룩말',
  };
  print('dictionanry[\'dog\']: ${dictionary['dog']}');
  print(dictionary);
  dictionary.addAll({'zebra': '기린'});
  print(dictionary);
  print(dictionary['zebra']);
  dictionary['horse'] = '말';
  print(dictionary);
  dictionary.remove('dog');
  print(dictionary);
  print(dictionary.keys);
  print(dictionary.values);
}

/*
  특이 사항 없는듯?
 */
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

/*
  특이 사항 없는 듯
 */
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

/*
  forEach외에는 java와 다를바 없는 듯
 */
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

/*
  별다를게 없지만, enum text를 가져오기 위해서는 extension method를 통해서 가져올 수 있음.
  ParseToString은 extension의 이름이지 호출할때 사용하는 이름이 아님. API 출돌시 이름을 리턴할듯.
  실제 사용되는 API는 toShortString()임.
 */
void enumSample() {
  Status status = Status.pending;
  if (status == Status.approved) {
    print('승인');
  } else if (status == Status.pending) {
    print('대기');
  } else if (status == Status.rejected) {
    print('거절');
  }

  print("Status.pending: ${Status.pending.toShortString()}");
}

enum Status {
  approved,
  pending,
  rejected,
}

extension ParseToString on Status {
  String toShortString() {
    return this.toString().split('.').last;
  }
}

/*
  [int? y, int? z] 옵션널한 parameter는 []로 표기
  [int y = 30, int z = 40] 기본값이 있는 옵셔널 파라메터. 전달되면 전달된 값을. 없으면 기본 값을 할당.
 */
void functionSample(int x, [int y = 0, int z = 0]) {
  print('x: $x, y: $y, z: $z');
  int total = x + y + z;
  print(total);
}

/*
  parameter 설정을 {}로 묶으면 namedParameter로 되어 호출시 parameter이름 : 값 형태로 호출해야함.
  required 제거하면 optional.
  기본값을 넣어서 + 연산에서 예외 발생하지 않게 변경 가능.
  named와 positional parameter를 같이 사용 할 수 있는데, 이때는 positional이 앞으로 와야함.
 */
int namedParameterSample(int x, {
  required int y,
  int z = 0,
}) {
  print('x: $x, y: $y, z: $z');
  int total = x + y + z;
  print(total);
  return total;
}

/*
  method body 없이 => 로.. 처리됨
 */
int arrorFunctionSample(int x, {
  required int y,
  int z = 0,
}) => x + y + z;

/*
  typedef
  c에서 보던... java의 functional interface와 유사함.
  method signature가 같으면 함수를 typedef를 통해서 할당
 */
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
