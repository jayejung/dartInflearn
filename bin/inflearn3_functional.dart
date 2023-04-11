void main() {
  List<String> cats = ['shai', 'cheeze', 'mackerel'];
  print(cats);
  print(cats.asMap());
  print(cats.toSet());

  Map catsMap = cats.asMap();

  print(catsMap.keys.toList());
  print(catsMap.values.toList());

  Set catsSet = cats.toSet();
  // or
  // Set catsSet = Set.from(cats);

  print(catsSet.toList());

  final newCats = cats.map((x) {
    return 'cat $x';
  });

  final newCats2 = cats.map((x) => 'cat $x');

  print(newCats);
  print(newCats2);

  String number = '13579';
  final parsed = number.split('').map((x) => '$x.jpg').toList();

  print(parsed);

  Map<String, String> dictionary = {
    'Hi': '안녕',
    'Thanks': '고마워',
    'Sorry': '미안',
  };

  final dict = dictionary.map((key, value) => MapEntry('Eng $key', 'Kor $value'));
  print(dict);

  final engDict = dictionary.keys.map((x) => 'Eng $x').toList();
  final korDict = dictionary.values.map((x) => 'Kor $x').toList();
  print(engDict);
  print(korDict);

  List<Map<String, String>> pet = [
    {
      'name': 'shai',
      'home': 'myHome'
    },
    {
      'name': 'cheeze',
      'home': 'street'
    },
    {
      'name': 'mackerel',
      'home': 'apt'
    },
  ];
  print(pet);
  final myHomeCat = pet.where((x) => x['home'] == 'myHome').toList();
  print(myHomeCat);

  List<int> numbers = [1, 3, 5, 7, 9];
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