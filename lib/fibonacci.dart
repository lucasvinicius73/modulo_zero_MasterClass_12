class Fibonacci {
  List<int> create(int size) {
    List<int> list = [0, 1];

    if (size == 2) {
      return list;
    } else if (size > 2) {
      for (var i = 2; i < size; i++) {
        int valorAtual = list[i - 1] + list[i - 2];
        list.add(valorAtual);
      }
      return list;
    } else {
      throw Exception("Tamanho não pode ser menor que 2");
    }
  }
}

void main() {
  final fib = Fibonacci();
  try {
    List<int> list = fib.create(10);
    print(list);
  } catch (e) {
    print(e);
  }
}
