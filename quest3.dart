import 'dart:io';

void main() {
  stdout.write('Digite o número de termos: ');
  int n = int.parse(stdin.readLineSync()!);

  int a = 1;
  int b = 5;
  int c = 100;

  for (int i = 1; i <= n; i++) {
    print('$a $b $c');

    a *= 2;
    b += 5;
    c -= 10;
  }
}
