import 'dart:io';

void main() {
  List<int> vetor1 = [];
  List<int> vetor2 = [];
  List<int> vetor3 = [];

  stdout.write('Digite o tamanho do primeiro vetor: ');
  int n1 = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < n1; i++) {
    stdout.write('Digite o ${i + 1}º elemento em ordem crescente: ');
    vetor1.add(int.parse(stdin.readLineSync()!));
  }

  stdout.write('\nDigite o tamanho do segundo vetor: ');
  int n2 = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < n2; i++) {
    stdout.write('Digite o ${i + 1}º elemento em ordem crescente: ');
    vetor2.add(int.parse(stdin.readLineSync()!));
  }

  int i = 0;
  int j = 0;

  while (i < vetor1.length && j < vetor2.length) {
    if (vetor1[i] <= vetor2[j]) {
      vetor3.add(vetor1[i]);
      i++;
    } else {
      vetor3.add(vetor2[j]);
      j++;
    }
  }

  while (i < vetor1.length) {
    vetor3.add(vetor1[i]);
    i++;
  }

  while (j < vetor2.length) {
    vetor3.add(vetor2[j]);
    j++;
  }

  print('\nPrimeiro vetor: $vetor1');
  print('Segundo vetor: $vetor2');
  print('Terceiro vetor ordenado: $vetor3');
}
