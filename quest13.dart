import 'dart:io';

void main() {
  stdout.write('Digite a quantidade de números: ');
  int n = int.parse(stdin.readLineSync()!);

  List<int> numeros = [];
  Map<int, int> frequencia = {};

  for (int i = 0; i < n; i++) {
    stdout.write('Digite o ${i + 1}º número: ');
    int numero = int.parse(stdin.readLineSync()!);

    numeros.add(numero);

    if (frequencia.containsKey(numero)) {
      frequencia[numero] = frequencia[numero]! + 1;
    } else {
      frequencia[numero] = 1;
    }
  }

  print('\nNúmeros e suas repetições:');

  for (int numero in frequencia.keys) {
    print('$numero - ${frequencia[numero]}');
  }
}
