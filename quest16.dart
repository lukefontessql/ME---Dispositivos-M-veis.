import 'dart:io';

void main() {
  List<int> vetor1 = lerVetor(1);
  List<int> vetor2 = lerVetor(2);
  List<int> vetor3 = lerVetor(3);
  List<int> vetor4 = lerVetor(4);

  List<int> vetor5 = [...vetor1, ...vetor2, ...vetor3, ...vetor4];

  vetor5.sort();

  List<int> intersecao = [];

  for (int numero in vetor1) {
    if (vetor2.contains(numero) &&
        vetor3.contains(numero) &&
        vetor4.contains(numero) &&
        !intersecao.contains(numero)) {
      intersecao.add(numero);
    }
  }

  intersecao.sort();

  print('\n-----RESULTADOS-----');
  print('Vetor 1: $vetor1');
  print('Vetor 2: $vetor2');
  print('Vetor 3: $vetor3');
  print('Vetor 4: $vetor4');
  print('Quinto vetor ordenado: $vetor5');
  print('Interseção dos quatro vetores: $intersecao');
}

List<int> lerVetor(int numeroVetor) {
  List<int> vetor = [];

  stdout.write('Digite o tamanho do vetor $numeroVetor: ');
  int tamanho = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < tamanho; i++) {
    stdout.write('Digite o ${i + 1}º elemento: ');
    int elemento = int.parse(stdin.readLineSync()!);

    vetor.add(elemento);
  }

  return vetor;
}
