import 'package:flutter_dotenv/flutter_dotenv.dart';

class Api {
  static String urlApi = dotenv.env['BASE_URL'] ?? '';
}
class RoutesApi{
  
  //CONTAS
  static String login = '${Api.urlApi}/login'; 
  static String createUser = '${Api.urlApi}/register'; 

}