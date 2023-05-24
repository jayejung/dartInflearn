void main() {
  Family cats = const Family('cats', ['cheeze', 'mackerel']);
  Family cats2 = const Family('cats', ['cheeze', 'mackerel']);
  // const로 생성되고 모든 멤버의 값이 동일한 인스턴스는 동치임 (cats == cats2) true
  print(cats == cats2);

  print(cats.name);
  print(cats.members);
  cats.sayHello();
  cats.introduce();

  Family jungs = Family.fromL(['jungs', ['yvonne', 'erin', 'shai', 'rita', 'jaye']]);
  print(jungs.name);
  print(jungs.members);
  jungs.sayHello();
  jungs.introduce();

  // getter
  print(jungs.firstFamilyMember);
  // setter
  jungs.firstFamilyMember = 'cheeze';
  print(jungs.members);
  jungs.familyName = 'chungs';
  print(jungs.familyName);

  cats2.familyName = 'cats2'; // 변경되지 않지만, 오류를 내지도 않는다.. ㄷㄷ
  print(cats == cats2);
  print(cats.familyName);
  print(cats2.familyName);

  print('---Idol---');
  Idol apink = Idol(name:  'apink', membersCount: 5);
  apink.sayName();
  apink.sayMembersCount();

  BoyGroup bts = BoyGroup('BTS', 7);
  bts.sayName();
  bts.sayMembersCount();
  bts.sayMale();

  GirlGroup redVelvet = GirlGroup('Red Velvet', 5);
  redVelvet.sayName();
  redVelvet.sayMembersCount();
  redVelvet.sayFemale();

  print('------------ Type Comparison ---------------');
  print('apink is Idol: ${apink is Idol}');
  print('apink is BoyGroup: ${apink is BoyGroup}');
  print('apink is GirlGroup: ${apink is GirlGroup}');

  print('bts is Idol: ${bts is Idol}');
  print('bts is BoyGroup: ${bts is BoyGroup}');
  print('bts is GirlGroup: ${bts is GirlGroup}');

  print('redVelvet is Idol: ${redVelvet is Idol}');
  print('redVelvet is BoyGroup: ${redVelvet is BoyGroup}');
  print('redVelvet is GirlGroup: ${redVelvet is GirlGroup}');

  Employee jayej = Employee('jaye.j');
  Employee jayejung = Employee('jaye.jung');

  // static member
  Employee.building = 'H square, N';
  jayej.printNameAndBuilding();
  jayejung.printNameAndBuilding();

  // interface
  MixedGroup sharp = MixedGroup('Sharp');
  sharp.sayName();
  print('sharp is IdolInterface: ${sharp is IdolInterface}');
  print('sharp is MixedGroup: ${sharp is MixedGroup}');

  // generic
  Lecture<String> english = Lecture("1",'English');
  Lecture<int> math = Lecture(2, 'Math');
  english.printIdType();
  math.printIdType();
}

class Family {
  final String name;
  final List<String> members;

  const Family(this.name, this.members);

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
  String get firstFamilyMember {
    return members[0];
  }

  // setter
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

class Idol {
  String name;
  int membersCount;

  Idol({
    required this.name,
    required this.membersCount,
  });

  void sayName() {
    print('This is ${this.name}');
  }

  void sayMembersCount() {
    print('${this.name} has ${this.membersCount} members');
  }
}

class BoyGroup extends Idol {
  BoyGroup(
      String name,
      int membersCount,
      ) : super(name: name, membersCount: membersCount);

  void sayMale() {
    print('we are boy group');
  }
}

class GirlGroup extends Idol {
  GirlGroup(
      String name,
      int membersCount,
      ) : super(name: name, membersCount: membersCount);

  void sayFemale() {
    print('we are girl group');
  }

  @override
  void sayName() {
    print('This is girlGroup ${name}');
  }
}

class Employee {
  // 피고용인의 근무 건물
  static String? building;
  // 피고용인 이름
  final String name;

  Employee(this.name);

  void printNameAndBuilding() {
    print('my name is $name. I\'m working in $building');
  }

  static void printBuilding() {
    print('I\'m working in $building');
  }
}

abstract class IdolInterface {
  String name;

  IdolInterface(this.name);

  void sayName();
}

class MixedGroup implements IdolInterface {
  @override
  String name;

  MixedGroup(this.name);

  @override
  void sayName() {
    print('hello my name is $name');
  }
}

class Lecture<T> {
  final T id;
  final String name;

  Lecture(this.id, this.name);

  void printIdType() {
    print(id.runtimeType);
  }
}
