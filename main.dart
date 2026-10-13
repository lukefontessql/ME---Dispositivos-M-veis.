void main() {
  const bolopreco = {'ovos': 5.5, 'chocolate': 7.5, 'cenoura': 6.5};

  const ordem = ['ovos', 'chocolate'];

  double total = 0.0;

  for (final bolo in ordem) {
    if (bolopreco.containsKey(bolo)) {
      total += bolopreco[bolo]!;
    } else {
      print('$bolo não está no cardápio');
    }
  }
}
