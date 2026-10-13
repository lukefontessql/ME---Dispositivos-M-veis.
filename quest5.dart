import 'dart:io';

void main() {
  int total = 0;
  int abaixoPeso = 0;
  int normal = 0;
  int acimaPeso = 0;

  double maiorPesoFeminino = -1.0;
  String nomeMaiorFeminino = '';

  while (true) {
    stdout.write('Nome do recém-nascido (fim para encerrar): ');
    String nome = stdin.readLineSync()!;

    if (nome.toUpperCase() == 'fim') {
      break;
    }

    stdout.write('digite o sexo do bebê (M/F): ');
    String sexo = stdin.readLineSync()!.toUpperCase();

    stdout.write('digite o peso do bebê em kg: ');
    double peso = double.parse(stdin.readLineSync()!.replaceAll(',', '.'));

    total++;

    String classificacao;

    if (peso >= 0 && peso <= 2) {
      classificacao = 'abaixo do peso';
      abaixoPeso++;
    } else if (peso > 2 && peso <= 4) {
      classificacao = 'Normal';
      normal++;
    } else if (peso > 4) {
      classificacao = 'acima do peso';
      acimaPeso++;
    } else {
      classificacao = 'Peso inválido';
    }

    print('\nNome: $nome');
    print('Sexo: $sexo');
    print('Classificação: $classificacao\n');

    if (sexo == 'F' && peso >= 0 && peso > maiorPesoFeminino) {
      maiorPesoFeminino = peso;
      nomeMaiorFeminino = nome;
    }
  }

  print('\n-----RESULTADOS FINAIS-----');

  if (total > 0) {
    print(
      'Percentual abaixo do peso: '
      '${(abaixoPeso / total * 100).toStringAsFixed(2)}%',
    );

    print(
      'Percentual com peso normal: '
      '${(normal / total * 100).toStringAsFixed(2)}%',
    );

    print(
      'Percentual acima do peso: '
      '${(acimaPeso / total * 100).toStringAsFixed(2)}%',
    );
  } else {
    print('Nenhum recém-nascido cadastrado.');
  }

  if (nomeMaiorFeminino.isNotEmpty) {
    print(
      'Recém-nascida do sexo feminino com maior peso: '
      '$nomeMaiorFeminino ($maiorPesoFeminino kg)',
    );
  } else {
    print('Nenhuma recém-nascida do sexo feminino cadastrada.');
  }
}
