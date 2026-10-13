import 'dart:io';

void main() {
  int totalCandidatos = 0;
  int totalMasculino = 0;
  int totalFeminino = 0;

  double menorPontuacaoMasculino = double.infinity;
  String nomeMenorMasculino = '';

  double maiorPontuacaoSI = -1;
  String codigoMaiorSI = '';

  while (true) {
    stdout.write('Código do candidato (0000 para encerrar): ');
    String codigo = stdin.readLineSync()!;

    if (codigo == '0000') {
      break;
    }

    stdout.write('Digite seu curso (CC ou SI): ');
    String curso = stdin.readLineSync()!.toUpperCase();

    stdout.write('Digite seu nome: ');
    String nome = stdin.readLineSync()!;

    stdout.write('Digite seu sexo (M/F): ');
    String sexo = stdin.readLineSync()!.toUpperCase();

    stdout.write('Digite sua pontuação (0 a 5000): ');
    double pontuacao = double.parse(stdin.readLineSync()!);

    totalCandidatos++;

    if (curso == 'CC' && pontuacao > 2500) {
      print('\nCandidato aprovado CC! Parabéns!:');
      print('Código: $codigo');
      print('Nome: $nome');
      print('Pontuação: $pontuacao\n');
    }

    if (sexo == 'M') {
      totalMasculino++;

      if (pontuacao < menorPontuacaoMasculino) {
        menorPontuacaoMasculino = pontuacao;
        nomeMenorMasculino = nome;
      }
    } else if (sexo == 'F') {
      totalFeminino++;
    }

    if (curso == 'SI' && sexo == 'M' && pontuacao > maiorPontuacaoSI) {
      maiorPontuacaoSI = pontuacao;
      codigoMaiorSI = codigo;
    }
  }

  print('\n-----RESULTADOS FINAIS-----');

  if (nomeMenorMasculino.isNotEmpty) {
    print(
      'Nome do candidato masculino com menor pontuação: '
      '$nomeMenorMasculino',
    );
  } else {
    print('Nenhum candidato masculino inscrito.');
  }

  if (codigoMaiorSI.isNotEmpty) {
    print(
      'Código do candidato masculino com maior pontuação em SI: '
      '$codigoMaiorSI',
    );
  } else {
    print('Nenhum candidato masculino inscrito em SI.');
  }

  if (totalCandidatos > 0) {
    double percentualMasculino = (totalMasculino / totalCandidatos) * 100;

    double percentualFeminino = (totalFeminino / totalCandidatos) * 100;

    print(
      'Percentual masculino: '
      '${percentualMasculino.toStringAsFixed(2)}%',
    );

    print(
      'Percentual feminino: '
      '${percentualFeminino.toStringAsFixed(2)}%',
    );
  } else {
    print('Nenhum candidato cadastrado.');
  }
}
