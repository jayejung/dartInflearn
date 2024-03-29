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

* 클래스 기본 구조
  ```dart
  class Family {
  
    final String name;
    final List<String> members;
  
    // unnamed 생성자
    const Family(this.name, this.members);
  
    // 커스텀 생성자 (named consturctor)
    // unnamed constructor는 1개만 작성 가능한듯
    Family.fromL(List values)
        : name = values[0],
          members = values[1];

    void sayHello() {
      print('hi this is $name');
    }

    void introduce() {
      print('hi we are $name. $members');
    }

    // getter
    // 하지만, java 기준의 get+멤버명은 아니어서 getter로 볼 수 없는거 아닌가?
    // get이라는 키워드가 있음
    String get firstFamilyMember {
      return members[0];
    }

    // setter
    // java 기준의 setter는 아닌듯
    // set이라는 키워드가 있음
    set firstFamilyMember(String name) {
      members[0] = name;
    }

    String get familyName {
      return name;
    }

    set familyName(String name) {
      name = name;
    }
  }
  ```
* const로 생성되고 모든 멤버의 값이 동일한 인스턴스는 동치임 (cats == cats2) -> true
  ```dart
  Family cats = const Family('cats', ['cheeze', 'mackerel']);
  Family cats2 = const Family('cats', ['cheeze', 'mackerel']);
  print(cats == cats2); // true
  ```
* 아래와 같이 커스텀 생성자로도 객체를 생성함
  ```dart
  Family jungs = Family.fromL(['jungs', ['yvonne', 'erin', 'shai', 'rita', 'jaye']]);
  
  //  커스텀 생성자는 아래와 같다 (named constructor)
  Family.fromL(List values)
    : name = values[0], members = values[1];
  ```
* 클래스 메소드에 get / set 키워드로 설정된 getter, setter는 아래 처럼 멤버를 직접 접근하는 것 처럼 사용
  ```dart
  jungs.firstFamilyMember = 'cheeze';
  print(jungs.firstFamilyMember); // cheeze
  ```
* 생성자를 curly brace({})로 표현해서 named parameter로 선언 할 수도 있음
  ```dart
  Idol({
    required this.name,
    required this.memberCount,
  });
  
  // 사용은 아래와 같이
  Idol idol = Idol(name: "BTS", memberCount: 5);
  ```
* 상속은 extends를 사용해서 함
  ```dart
  class BoyGroup extends Idol {
    // 생성자애서 super 호출(Idol의 기본 생성자는 named parameter
    BoygGroup(
      String name,
      int memberCount,
    ) : super(name: name, memberCount: memberCount);
  }
  ```
* 클래스 멤버에도 nullable 이 포함될 수 있음  
  static이 아닌 일반 멤버라고 가정하면, unnamed constructor는 1개만 가능하고 nullable member를 받지 않아도 됨
  ```dart
  class Employee {
    // 피고용인의 근무 건물
    static String? building;
    // 피고용인 이름
    final String name;

    // unnamed constructor 
    Employee(this.name);
    ....
  ```
* 인터페이스는 abstract 키워드를 class 앞에 추가  
  추상 클래스와 interface는 구별하지 않는 듯?
  ```dart
  abstract class IdolInterface {
    String name;
    IdolInterface(this.name);
    void sayName();
  }
  ```
* 인터페이스 구현시에는 implements 키워드 사용
  ```dart
  class MixedGroup implements IdolInterface {
    @override
    String name;

    MixedGroup(this.name);

    @override
    void sayName() {
      print('hello my name is $name');
    }
  }
  ```
* 클래스의 제너릭 타입의 멤버
  ```dart
  class Lecture<T> {
    final T id;
    final String name;

    Lecture(this.id, this.name);

    void printIdType() {
      print(id.runtimeType);
    }
  }
  ```
* 사용은 자바와 동일
  ```dart
  Lecture<String> english = Lecture("1", 'English');
  Lecture<Int> math = Lecture(2, "Math");
  ```

### functional

* Iterable interface내의 map은 Function을 parameter로 받고, 동일 타입을 리턴
  ```dart
  List<String> cats = ['shai', 'cheeze', 'mackerel'];
  final newCats = cats.map((x) { 
    return 'cat $x';
  });
  
  // noise code 제거된 버전
  final newCats2 = cats.map((x) => 'cat $x');
  
  print(newCats); // (cat shai, cat cheeze, cat mackerel)
  print(newCats2); // (cat shai, cat cheeze, cat mackerel)
  
  // list를 map function으로 mapping했으니, 1개의 요소(x)만 사용
  String number = '13579';
  final parsed = number.split('').map((x) => '$x.jpg').toList();
  print(parsed); // [1.jpg, 3.jpg, 5.jpg, 7.jpg, 9.jpg]
  
  // map을 map function으로 mapping했으니, 2개의 요소(key, value) 사용
  Map<String, String> dictionary = {
    'Hi': '안녕', 
    'Thanks': '고마워',
    'Sorry': '미안',
  };
  final dict = dictionary.map((k, v) => MapEntry('Eng $k', 'Kor $v'));
  ```
* Iterable interface내의 where는 Function을 parameter로 받는데,   
  해당 Function은 bool을 리턴해야함 (java의 Predicate?)
  ```dart
  List<Map<String, String>> pet = [
    {
      'name': 'shai',
      'home': 'myHome',
    },
    {
      'name': 'cheeze',
      'home': 'street',
    },
    {
      'name': 'mackerel',
      'home': 'apt',
    }, 
  ];
  final myHomePet = pet.where((x) => x['home'] == 'myHome').toList();
  print('myHomePet: ${myHomePet}'); // [{name: shai, home: myHome}]
  ```
* Iterable interface내의 reduce는 반복 요소를 줄여 가면서 결과를 만듬   
  2개의 인수를 받고, 반환값은 인수와 같은 타입임
  ```dart
  final items = [1, 2, 3, 4, 5];
  var maxResult = items[0];
  // for 문으로 max값 검출
  for(var i = 1; i < items.length; i++) {
    maxResult = max(items[1], maxResult);
  }
  
  // reduce로 max값 검출 (위의 for문과 동일한 결과)
  maxResult = items.reduce((e, v) => max(e, v)));
  ```
* Iterable interface내의 fold 함수는 return 값이 계속 더해지는 형태임   
  fold 함수는 positional parameter 2개를 가지며, 첫 번째는 실행 index를 두 번째는 함수를 가짐
  ```dart
  List<int> numbers = [1, 3, 5, 7, 9];
  final sum = numbers.fold<int>(0, (total, element) {
    return total + element;
  });
  print(sum); // 25
  
  List<String> words = ['Hi, ', 'My name is ', 'jaye'];
  final count = words.fold(0, (total, element) => total + element.length);
  print(count); // 19 (각 element 문자열의 length의 합)
  ```

### Future, async/await

* Future 미래에 받아올 값 혹은 루틴   
  아래의 addNumbers 펑션 내의 Future.delayed는 특정 duration(첫번째 파라메터)이 지난후, 두 번째 파라메터로 전달된 함수를 실행
  ```dart
  void addNumbers(int number1, int number2) {
    print('calculating...:  $number1 + $number2');

    // 서버 시뮬레이션
    Future.delayed(Duration(seconds: 2), () {
      print('calculation completed : $number1 + $number2 = ${number1 + number2}');
    });

    print('end of function: $number1 + $number2');
  }
  
  // 위의 메소드를 addNumbers(1, 2);로 호출하게 되면, 아래와 같은 순서로 출력됨
  // calculating...: 3
  // end of function: 3
  // (2초 후) 
  // calculation completed: 1 + 2 = 3 
  ```
* 위의 함수를 동기로 실행하고 싶으면, 호출시 await를 함수 앞에 붙혀서 호출해야하고, 함수는 Future를 리턴해야하고 함수의 scope 범위의 시작점인 { 앞에
  async를 추가해야함.   
  Future.delayed 구문 앞에도 await를 추가   
  Future.delayed가 실행 완료 될 때까시 waiting 함
  ```dart
  Future<void> addNumbersAsync(int number1, int number2) async {
    print('async calculating...: $number1 + $number2');

    // 서버 시뮬레이션
    await Future.delayed(Duration(seconds: 2), () {
      print('async calculation completed: $number1 + $number2 = ${number1 + number2}');
    });

    print('async end of function: $number1 + $number2');
  }
  
  // 위의 메소드를 await addNumbersAsync(1, 2);로 호출하면 아래와 같은 순서로 출력됨
  // calculating...: 3
  // (2초 후) 
  // async calculation completed: 1 + 2 = 3
  // end of function: 3
  ```

A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.
