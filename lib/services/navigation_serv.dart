
import 'package:assignment2/routers/routes.dart';

class NavigationServ {
  static
   final NavigationServ _instance = NavigationServ._internal();
  NavigationServ._internal();
  
  factory NavigationServ() {
    return _instance;
  }

  Future<dynamic> navigateTo(String routeName) async {
    return AppRouter.router.push(routeName);
  }

  Future<dynamic> navigateToWithParameters(
      String routeName, Object arguments) async {
    return AppRouter.router.pushNamed(routeName, extra: arguments);
  }

  void goBack() {
    return AppRouter.router.pop();
  }

  void replaceWith(String routeName) {
    AppRouter.router.replace(routeName);
  }

  void replaceAll(String routeName){
     AppRouter.router.go(routeName);
  }
}

