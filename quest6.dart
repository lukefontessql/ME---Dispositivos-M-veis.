import 'dart:io';
import 'dart:math';

void main() {
  int numeroAleatorio = Random().nextInt(100) + 1;

  int minimo = 1;
  int maximo = 100;
  int tentativa;

  do {
    stdout.write('Digite um número entre $minimo e $maximo: ');
    tentativa = int.parse(stdin.readLineSync()!);

    if (tentativa < numeroAleatorio) {
      minimo = tentativa + 1;
      print('Errou! O número está entre $minimo e $maximo');
    } else if (tentativa > numeroAleatorio) {
      maximo = tentativa - 1;
      print('Errou! O número está entre $minimo e $maximo');
    } else {
      print('Parabéns! Você acertou o número $numeroAleatorio!');
    }
  } while (tentativa != numeroAleatorio);
}
