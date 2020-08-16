class UserModel {
  String _nome;

  String get nome => _nome;

  set nome(String nome) {
    _nome = nome;
  }

  int _idade;

  int get idade => _idade;

  set idade(int idade) {
    _idade = idade;
  }

  double _altura;

  double get altura => _altura;

  set altura(double altura) {
    _altura = altura;
  }

  double _peso;

  double get peso => _peso;

  set peso(double peso) {
    _peso = peso;
  }

  UserModel(String nome, int idade, double altura, double peso) {
    this.nome = nome;
    this.idade = idade;
    this.altura = altura;
    this.peso = peso;
  }
}
