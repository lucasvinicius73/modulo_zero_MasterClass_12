class RegraDeTres {
  double calculo({
    double? grupo11,
    double? grupo12,
    double? grupo21,
    double? grupo22,
  }) {
    List<double?> list = [grupo11, grupo12, grupo21, grupo22];
    int countNull = list.where((element) => element == null).length;

    if (countNull > 1) {
      throw Exception("Só pode deixar um valor em branco!");
    } else if (countNull == 0) {
      throw Exception(
          "Você deve deixar um valor em branco para poder calcular");
    }

    if (grupo11 == null) {
      return (grupo21! * grupo12!) / grupo22!;
    } else if (grupo12 == null) {
      return (grupo11 * grupo22!) / grupo21!;
    } else if (grupo21 == null) {
      return (grupo11 * grupo22!) / grupo12;
    } else {
      return (grupo21 * grupo12) / grupo11;
    }
  }
}

