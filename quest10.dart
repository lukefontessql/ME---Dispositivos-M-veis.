import 'dart:io';

void main() {
  int homens = 0;
  int mulheres = 0;

  int homensComExperiencia = 0;
  int somaIdadeHomensExperiencia = 0;

  int homensMais45 = 0;
  int mulheresMenos30Experiencia = 0;

  int menorIdadeFeminina = 999;
  String nomeCandidata = '';

  while (true) {
    stdout.write('Digite o nome do candidato (fim para encerrar): ');
    String nome = stdin.readLineSync()!;

    if (nome.toLowerCase() == 'fim') {
      break;
    }

    stdout.write('Digite o sexo (M/F): ');
    String sexo = stdin.readLineSync()!.toUpperCase();

    stdout.write('Digite a idade: ');
    int idade = int.parse(stdin.readLineSync()!);

    stdout.write('Possui experiência? (S/N): ');
    String experiencia = stdin.readLineSync()!.toUpperCase();

    bool temExperiencia = experiencia == 'S';

    if (sexo == 'M') {
      homens++;

      if (temExperiencia) {
        homensComExperiencia++;
        somaIdadeHomensExperiencia += idade;
      }

      if (idade > 45) {
        homensMais45++;
      }
    } else if (sexo == 'F') {
      mulheres++;

      if (idade < 30 && temExperiencia) {
        mulheresMenos30Experiencia++;
      }

      if (temExperiencia && idade < menorIdadeFeminina) {
        menorIdadeFeminina = idade;
        nomeCandidata = nome;
      }
    }
  }

  print('\n-----RESULTADOS-----');

  print('Número de homens: $homens');
  print('Número de mulheres: $mulheres');

  if (homensComExperiencia > 0) {
    double mediaIdade = somaIdadeHomensExperiencia / homensComExperiencia;

    print(
      'Idade média dos homens com experiência: '
      '${mediaIdade.toStringAsFixed(2)} anos',
    );
  } else {
    print('Nenhum homem com experiência.');
  }

  if (homens > 0) {
    double percentual = (homensMais45 / homens) * 100;

    print(
      'Percentual de homens com mais de 45 anos: '
      '${percentual.toStringAsFixed(2)}%',
    );
  } else {
    print('Não há homens cadastrados para calcular o percentual.');
  }

  print(
    'Mulheres com menos de 30 anos e com experiência: '
    '$mulheresMenos30Experiencia',
  );

  if (nomeCandidata.isNotEmpty) {
    print(
      'Candidata mais jovem com experiência: $nomeCandidata '
      '($menorIdadeFeminina anos)',
    );
  } else {
    print('Nenhuma candidata com experiência cadastrada.');
  }
}
