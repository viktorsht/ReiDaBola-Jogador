import 'package:flutter_modular/flutter_modular.dart';

class RouteNavigator {
  // Navegar para uma rota específica
  void navigateTo(String route) {
    Modular.to.navigate(route);
  }

  // Navegar para uma rota específica com parâmetros
  void navigateToWithParams(String route, dynamic params) {
    Modular.to.navigate(route, arguments: params);
  }

  // Empurrar uma nova rota para a pilha de navegação
  void pushNamed(String route) {
    Modular.to.pushNamed(route);
  }

  // Empurrar uma nova rota para a pilha de navegação com parâmetros
  void pushNamedWithParams(String route, dynamic params) {
    Modular.to.pushNamed(route, arguments: params);
  }

  // Substituir a rota atual
  void pushReplacementNamed(String route) {
    Modular.to.pushReplacementNamed(route);
  }

  // Substituir a rota atual com parâmetros
  void pushReplacementNamedWithParams(String route, dynamic params) {
    Modular.to.pushReplacementNamed(route, arguments: params);
  }

  // Empurrar uma nova rota e remover todas as rotas anteriores até a rota especificada
  /*void pushNamedAndRemoveUntil(String newRoute, String untilRoute) {
    Modular.to.pushNamedAndRemoveUntil(newRoute, ModalRoute.withName(untilRoute));
  }*/

  // Empurrar uma nova rota e remover todas as rotas anteriores até a rota especificada com parâmetros
  /*void pushNamedAndRemoveUntilWithParams(String newRoute, String untilRoute, dynamic params) {
    Modular.to.pushNamedAndRemoveUntil(newRoute, ModalRoute.withName(untilRoute), arguments: params);
  }*/

  // Voltar para a rota anterior
  void pop() {
    Modular.to.pop();
  }

  // Voltar para a rota anterior com resultado
  void popWithResult(dynamic result) {
    Modular.to.pop(result);
  }

  // Voltar para a rota anterior até uma rota específica
  /*void popUntil(String untilRoute) {
    Modular.to.popUntil(ModalRoute.withName(untilRoute));
  }*/
}

