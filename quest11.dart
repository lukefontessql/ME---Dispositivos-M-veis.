import 'dart:io';

void main() {
  int totalHomens = 0;
  int totalMulheres = 0;

  double somaLiquidoHomens = 0.0;
  double somaLiquidoMulheres = 0.0;

  while (true) {
    stdout.write('Digite o código do professor (9999 para encerrar): ');
    String codigo = stdin.readLineSync()!;

    if (codigo == '9999') {
      break;
    }

    stdout.write('Digite o nome: ');
    String nome = stdin.readLineSync()!;

    stdout.write('Digite o sexo (M/F): ');
    String sexo = stdin.readLineSync()!.toUpperCase();

    stdout.write('Digite o número de horas dadas no mês: ');
    int horas = int.parse(stdin.readLineSync()!);

    double salarioBruto = horas * 12.30;
    double desconto;
    double salarioLiquido;

    if (sexo == 'M') {
      desconto = salarioBruto * 0.10;
      salarioLiquido = salarioBruto - desconto;

      totalHomens++;
      somaLiquidoHomens += salarioLiquido;
    } else if (sexo == 'F') {
      desconto = salarioBruto * 0.05;
      salarioLiquido = salarioBruto - desconto;

      totalMulheres++;
      somaLiquidoMulheres += salarioLiquido;
    } else {
      print('Sexo inválido. \n');
      continue;
    }

    print('\n-----DADOS DO PROFESSOR-----');
    print('Código: $codigo');
    print('Nome: $nome');
    print('Salário bruto: R\$ ${salarioBruto.toStringAsFixed(2)}');
    print('Salário líquido: R\$ ${salarioLiquido.toStringAsFixed(2)}');
    print('---------------------------\n');
  }

  print('\n-----MÉDIAS SALARIAIS-----');

  if (totalHomens > 0) {
    double mediaHomens = somaLiquidoHomens / totalHomens;

    print(
      'Média dos salários líquidos dos homens: '
      'R\$ ${mediaHomens.toStringAsFixed(2)}',
    );
  } else {
    print('Nenhum professor do sexo masculino cadastrado.');
  }

  if (totalMulheres > 0) {
    double mediaMulheres = somaLiquidoMulheres / totalMulheres;

    print(
      'Média dos salários líquidos das mulheres: '
      'R\$ ${mediaMulheres.toStringAsFixed(2)}',
    );
  } else {
    print('Nenhuma professora cadastrada.');
  }
}
