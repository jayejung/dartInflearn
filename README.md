# Dart test

### basic

* String 내 변수 포멧팅은 $으로, 표현식은 ${}
  ```dart
  print('value : $value');
  print('valeu : ${value.runtimeType}');
  ```
* dynamic 변수 타입은 어떤 값이라도 할당될 수 있고, initialize 된 후에도 다른 타입이 할당 가능
  ```dart
  dynamic number = 1;
  number = '1st'; // 오류 없음
  ```
* nullable 변수는 type 뒤에 ?를 붙힘 (initialize하지 않으면 자동으로 null로 초기화)    
  non-nullable 변수는 변수명 뒤에 !를 붙힘 (기본적으로 non-nullable을 지향하므로, 일반 변수들은 non-nullable이므로 non-nullable 선언은
  없고, 사용시에만 명시적인 non-nullable 사용)   
  null 인 경우 기본값을 설정하려면 ??= 를 사용
  ```dart
  String? name; // null로 initialize
  print(name!); // runtime exception 발생 (unhandled exception)  
  name ??= 'my name'; // name이 null 이면 'my name'을 할당
  ```
* final / const 변수 사용시 type 혹은 var 생략 가능(상수로 쓰일 것이므로 타입 추론이 완료된 상태)    
  final은 runtime시 할당 되어도 되는 경우 사용   
  const는 빌드타입에 할당이 되어야 하는 진짜 상수
  ```dart
  final String name = '카카오';
  const name2 = '카카오엔터테인먼트';
  const Datetime now = Datetime.now(); // 빌드 타임에는 현재시간을 알 수 없으므로 빌드 타임 에러
  ```
* 연산자는 일반 적인 언어와 비슷함. ??= 연산자는 왼쪽의 값이 null 이면, 오른쪽의 값을 기본으로 할당   
  타입 확인을 위해서 is / is! 연산자 사용
  ```dart
  String name = '카카오';
  print(${name is String}); // true 출력
  print(${name is! String}); // false 출력
  ```
* generic type도 일반적인 언어와 유사함. dynamic 타입의 generic이라면 어떤 값이라도 할당 가능
  ```dart
  List<dynamic> list = [1, '2', '3rd', true];
  ```
* map도 여타 언어와 비슷. entry의 value를 가져올 때는 map이름['키값']
  ```dart
  Map<String, String> dictionary = {
    'cat': '고양이',
    'dog': '개',
    'giraffe': '얼룩말',
  };
  print('dictionanry[\'dog\']: ${dictionary['dog']}'); // dictionary['dog']: 개
  // '가 중첩되어도 문제 없이 동작함
  dictionary.addAll({'zebra': '기린'});
  dictionary.remove('dog');
  print(dictionary.keys); // (cat, giraffe, zebra, horse) 
  print(dictionary.values); // (고양이, 얼룩말, 기린, 말)
  ```
* set도 특이사항 없음
  ```dart
  final Set<String> names = {
    'shai', 'jaye', 'erin', 'jaye',
  };
  print(names); // {shai, jaye, erin} - 중복 제거됨
  print(names.contains('yvonne'));  // false
  names.addAll({'rita', 'yvonne'});
  print(names); // {shai, jaye, erin, rita, yvonne}
  ```
* enum도 별다를게 없지만, java와 같이 다양한 생성자를 통한 다양한 값의 저장은 안되는듯?   
  대신 extenstion method를 통해서 enum 값을 가져올 수는 있음
  ```dart
  enum Status {
  approved,
  pending,
  rejected,
  }
  
  /*
    ParseToString은 extenstion이름이지 호출 대상 method이름은 아님
    api 충돌 등이 발생하면 알리기 위한 용도
    실제 사용하는 method는 toShortString 
  */
  extension ParseToString on Status {
    String toShortString() {
      return this.toString().split('.').last;
    }
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
    print("Status.pending: ${Status.pending.toShortString()}");
  }
  ```
* function의 파라메터에서 []를 사용하여 optional한 parameter를 설정할 수 있음   
  [int y = 30, int z = 40] 기본값이 있는 옵셔널 파라메터
  전달되면 전달된 값을 할당, 없으면 기본값을 할당
  ```dart
  void functionSample(int x, [int y = 0, int z = 0]) {
    ...
  }
  ```
* parameter를 {}로 묶으면 namedParameter가 되어, method 호출시 parameter이름: 값 형태로 호출해야함   
  required 제거하면 optional   
  기본값을 넣어서 + 연산에서 예외 발생하지 않게 변경 가능   
  named와 positional parameter를 같이 사용 할 수 있는데, 이때는 positional이 앞으로 와야함
  ```dart
  int namedParameterSample(int x, {
    required int y,
    int z = 0,
  }) {
    ...
  }
  ```
* method body없이 => 로 body를 표현 가능
  ```dart
  int arrowFunctionSample(int x, {
    required int y,
    int z = 0,
  }) => x + y + z;
  ```
* typedef : c와 유사함   
  java의 functional interface와 조금 더 유사함   
  method signature가 같으면 함수를 typedef를 통해서 할당
  ```dart
  typedef Operation = int Function(int x, int y, int z);
  // 더하기, 빼기, 곱하기
  int add(int x, int y, int z) => x + y + z;
  int subtract(int x, int y, int z) => x - y - z;
  int multiply(int x, int y, int z) => x * y * z;
  
  int calculator(int x, int y, int z, Operation operation) {
    return operation(x, y, z);
  }
  
  Operation op = multiply;
  print(op(1, 3, 5)); // 15 출력
  print(calculator(1, 3, 5, add));  // 9 출력
  ```

### OOP

A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.
