import 'dart:io';

void main() {
  int totalAlunos = 0;
  int totalAprovados = 0;
  int totalFeminino = 0;

  double somaMedias = 0.0;
  double somaMediasFeminino = 0.0;

  double maiorMediaMasculino = -1.0;
  double maiorMediaFeminino = -1.0;

  String matriculaMaiorMasculino = '';
  String matriculaMaiorFeminino = '';

  while (true) {
    stdout.write('Matrícula (00000 para encerrar): ');
    String matricula = stdin.readLineSync()!;

    if (matricula == '00000') {
      break;
    }

    stdout.write('Nome: ');
    String nome = stdin.readLineSync()!;

    stdout.write('Sexo (M/F): ');
    String sexo = stdin.readLineSync()!.toUpperCase();

    stdout.write('Nota 1: ');
    double nota1 = double.parse(stdin.readLineSync()!);

    stdout.write('Nota 2: ');
    double nota2 = double.parse(stdin.readLineSync()!);

    stdout.write('Nota 3: ');
    double nota3 = double.parse(stdin.readLineSync()!);

    stdout.write('Faltas: ');
    int faltas = int.parse(stdin.readLineSync()!);

    double media = (nota1 + nota2 + nota3) / 3;

    totalAlunos++;
    somaMedias += media;

    bool aprovado = media >= 7.0 && faltas <= 18;

    if (aprovado) {
      totalAprovados++;

      if (sexo == 'M' && media > maiorMediaMasculino) {
        maiorMediaMasculino = media;
        matriculaMaiorMasculino = matricula;
      }

      if (sexo == 'F' && media > maiorMediaFeminino) {
        maiorMediaFeminino = media;
        matriculaMaiorFeminino = matricula;
      }
    }

    if (sexo == 'F') {
      totalFeminino++;
      somaMediasFeminino += media;
    }
  }

  print('\n-----RESULTADOS------');

  if (totalAlunos > 0) {
    double mediaTurma = somaMedias / totalAlunos;
    double percentualAprovados = (totalAprovados / totalAlunos) * 100;

    print('Média da turma: ${mediaTurma.toStringAsFixed(2)}');
    print(
      'Percentual de aprovados: '
      '${percentualAprovados.toStringAsFixed(2)}%',
    );
  } else {
    print('Nenhum aluno cadastrado.');
  }

  if (matriculaMaiorMasculino.isNotEmpty) {
    print(
      'Matrícula do aluno masculino com maior média '
      '$matriculaMaiorMasculino',
    );
  } else {
    print('Nenhum aluno masculino aprovado.');
  }

  if (matriculaMaiorFeminino.isNotEmpty) {
    print(
      'Matrícula da aluna com maior média '
      '$matriculaMaiorFeminino',
    );
  } else {
    print('Nenhuma aluna aprovada.');
  }

  if (totalFeminino > 0) {
    double mediaFeminina = somaMediasFeminino / totalFeminino;

    print('Média das alunas: ${mediaFeminina.toStringAsFixed(2)}');
  } else {
    print('Nenhuma aluna cadastrada.');
  }
}
