void main() {
  List<String> cats = ['shai', 'cheeze', 'mackerel'];
  print("cats: $cats");
  print("cats.asMap(): ${cats.asMap()}");
  print("cats.toSet(): ${cats.toSet()}");

  Map catsMap = cats.asMap();

  print("catsMap.keys: ${catsMap.keys}");
  print("catsMap.keys.toList(): ${catsMap.keys.toList()}");
  print("catsMap.values.toList(): ${catsMap.values.toList()}");

  Set catsSet = cats.toSet();
  // or
  // Set catsSet = Set.from(cats);

  print("catsSet.toList(): ${catsSet.toList()}");

  final newCats = cats.map((x) {
    return 'cat $x';
  });

  final newCats2 = cats.map((x) => 'cat $x');

  print("newCats: $newCats");
  print("newCats2: $newCats2");

  String number = '13579';
  var mmp = number.split('');
  final parsed = number.split('').map((x) => '$x.jpg').toList();

  print("parsed: $parsed");

  Map<String, String> dictionary = {
    'Hi': '안녕',
    'Thanks': '고마워',
    'Sorry': '미안',
  };
  print("dictionary: $dictionary");

  final dict =
      dictionary.map((key, value) => MapEntry('Eng $key', 'Kor $value'));
  print("dict: $dict");

  final engDict = dictionary.keys.map((x) => 'Eng $x').toList();
  final korDict = dictionary.values.map((x) => 'Kor $x').toList();
  print("engDict: $engDict");
  print("korDict: $korDict");

  List<Map<String, String>> pet = [
    {'name': 'shai', 'home': 'myHome'},
    {'name': 'cheeze', 'home': 'street'},
    {'name': 'mackerel', 'home': 'apt'},
  ];
  print("pet: $pet");
  final myHomeCat = pet.where((x) => x['home'] == 'myHome').toList();
  print("myHomeCat: $myHomeCat");

  List<int> numbers = [1, 3, 5, 7, 9];
  print('# reduce #');
  final result = numbers.reduce((prev, next) {
    print('-------------------');
    print('previous: $prev');
    print('next: $next');
    print('total: ${prev + next}');

    return prev + next;
  });
  print(result);

  List<String> words = ['Hi, ', 'My name is ', 'jaye'];

  // list의 요소와 reduce의 결과의 타입이 같아야함
  final sentence = words.reduce((prev, next) => prev + next);
  print(sentence);

  print('# fold #');
  //final sum = numbers.fold<int>(0, (prev, next) => prev + next);
  final sum = numbers.fold<int>(0, (prev, next) {
    print('=================');
    print('prev: $prev');
    print('next: $next');
    print('total: ${prev + next}');
    return prev + next;
  });
  print(sum);

  final count = words.fold<int>(0, (prev, next) => prev + next.length);
  print(count);

  // cascading
  List<int> even = [2, 4, 6, 8];
  List<int> odd = [1, 3, 5, 7];

  print([...even, ...odd]);
}