import 'dart:math';

class Imc {
  int calculo({required double peso, required double altura}) {
    if (altura < 1) {
      throw Exception("Altura não pode ser menor que 1");
    }
    if (peso < 1) {
      throw Exception("Peso não pode ser menor que 1");
    }
    
    return (peso / pow(2, altura)).round();
  }
}

void main() {
  final imc = Imc();

  print(imc.calculo(peso: 106.5, altura: 1.8));
}
