import 'package:inflearn/inflearn.dart' as inflearn;

void main(List<String> arguments) {
  inflearn.test1st();
  inflearn.dynamicSample();
  inflearn.nullableSample();
  inflearn.finalConstSample();
  inflearn.operatorSample();
  inflearn.listSample();
  inflearn.mapSample();
  inflearn.setSample();
  inflearn.switchSample();
  inflearn.loopSample();
  inflearn.enumSample();
  inflearn.functionSample(20, 30, 40);
  int result = inflearn.namedParameterSample(20, y: 30, z: 40);
  print('namedParaemter\'s result: $result');
  int result2 = inflearn.arrorFunctionSample(20, y: 30, z: 40);
  print('arrow functions\' result: $result');

  // typedef
  inflearn.Operation operation = inflearn.add;
  print(operation(10, 20, 30));
  inflearn.Operation subOperation = inflearn.subtract;
  print(subOperation(10, 20, 30));
  print(inflearn.calculator(10, 20, 30, inflearn.add));
  print(inflearn.calculator(10, 20, 30, inflearn.subtract));

  print(Uri.decodeComponent('uc1E3/qbjnPXZ/%2BsaBvJCYCjuPNRkiliFRhSeaFptLM='));
}
