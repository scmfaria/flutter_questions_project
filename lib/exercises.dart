// para startar o projeto, é atraves desse metodo main !!
main() {
  print('Hello World');

  int a = 5;
  double b = 3.1;
  var c = 'Olá Mundo';

  print(c is String); // aqui retorna true 

  // listas
  var names = ['Maria', 'Joao'];
  names.add('Sara');
  print(names.length); // vai mostrar o tamanho da lista = 3
  print(names.elementAt(2)); // nesse caso vai retornar Sara
  print(names[0]); // aqui ira retornar Maria

  // variavel fracamente tipada
  // cada hora a variavel recebe um tipo de valor 
  dynamic x = 'Teste';
  x = 123;
  x = false;

  // chamando a funcao 
  final result = exec(5, 3, (a, b) {
    return a - b;
  });
  print('O resultado é $result');

  // trabalhando com classes
  var p1 = Product(); // pode ou nao colocar 'new': new Product()
  p1.name = 'Lapis';
  p1.price = 1.30;
}

 // funcoes 
int somaComRetorno(int a, int b) {
  return a + b;
}

somaSemRetorno(int a, int b) {
  print(a + b);
}

// aqui esta passando uma funcao como parametro
int exec(int a, int b, int Function(int, int) fn) {
  return fn(a,b);
}

class Product {
  String name;
  double price;
}