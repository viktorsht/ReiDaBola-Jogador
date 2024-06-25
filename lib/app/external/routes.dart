import 'package:flutter_dotenv/flutter_dotenv.dart';

class Api {
  static String urlApi = dotenv.env['BASE_URL'] ?? '';
}
class RoutesApi{
  
  //CONTAS
  static String createUser = '${Api.urlApi}/contas/api-register/'; 
  static String refreshToken = '${Api.urlApi}/contas/api-refresh/'; 
  static String login = '${Api.urlApi}/contas/api-login/'; 
  static String myUser = '${Api.urlApi}/contas/me/'; 

  //VAGAS
  static String vagas = '${Api.urlApi}/vagas/api-vagas'; 

  //CURRICULUM
  static String curriculum = '${Api.urlApi}/curriculum/curriculum-api-lista/'; 
  static String curriculumUpDel = '${Api.urlApi}/curriculum/';  // tem que colocar o id do curriculo

  //EDUCAÇÃO
  static String education = '${Api.urlApi}/curriculum/educacao-api-lista/'; 
  static String addEducation = '${Api.urlApi}/curriculum/add-curriculum/'; //IdCurriculo/idEducacao
  static String removeEducation = '${Api.urlApi}/curriculum/remove-curriculum/';

  //LINGUA
  static String lingua = '${Api.urlApi}/curriculum/lingua/'; 
  static String addLingua = '${Api.urlApi}/curriculum/add-curriculum-lingua/'; 
  static String removeLingua = '${Api.urlApi}/curriculum/remove-curriculum-lingua/';

  //PROJETOS
  static String projeto = '${Api.urlApi}/curriculum/projeto/'; 
  static String addProjeto = '${Api.urlApi}/curriculum/add-curriculum-projeto/'; 
  static String removeProjeto = '${Api.urlApi}/curriculum/remove-curriculum-projeto/';
  
  //HABILIDADE
  static String habilidade = '${Api.urlApi}/curriculum/habilidade/'; 
  static String addHabilidade = '${Api.urlApi}/curriculum/add-curriculum-hab/'; 
  static String removeHabilidade = '${Api.urlApi}/curriculum/remove-curriculum-hab/';
  
  //PROFISSIONAL
  static String profissional = '${Api.urlApi}/curriculum/profissional/'; 
  static String addProfissional = '${Api.urlApi}/curriculum/add-curriculum-pro/'; 
  static String removeProfissional = '${Api.urlApi}/curriculum/remove-curriculum-pro/';
  
  //TECNOLOGIA
  static String tecnologia = '${Api.urlApi}/curriculum/tecnologia/'; 
  static String addTecnologia = '${Api.urlApi}/curriculum/add-curriculum-tecnologia/'; 
  static String removeTecnologia = '${Api.urlApi}/curriculum/remove-curriculum-tecnologia/';

  static String sharedCurriculum = 'https://repense.ong.br/curriculum/curriculum-visualizacao_publico/'; //IdCurriculo

  // visibilidade dos campos
  static String fotoVisAdd = '${Api.urlApi}/curriculum/add_visibilidade_foto/';
  static String fotoVisRem = '${Api.urlApi}/curriculum/remove_visibilidade_foto/';

  static String projetoVisAdd = '${Api.urlApi}/curriculum/add_visibilidade_projeto/';
  static String projetoVisRem = '${Api.urlApi}/curriculum/remove_visibilidade_projeto/';

  static String linguaVisAdd = '${Api.urlApi}/curriculum/add_visibilidade_lingua/';
  static String linguaVisRem = '${Api.urlApi}/curriculum/remove_visibilidade_lingua/';

  static String habilidadeVisAdd = '${Api.urlApi}/curriculum/add_visibilidade_habilidade/';
  static String habilidadeVisRem = '${Api.urlApi}/curriculum/remove_visibilidade_habilidade/';

  static String profissionalVisAdd = '${Api.urlApi}/curriculum/add_visibilidade_profissional/';
  static String profissionalVisRem = '${Api.urlApi}/curriculum/remove_visibilidade_profissional/';

  static String tecnologiaVisAdd = '${Api.urlApi}/curriculum/add_visibilidade_tecnologia/';
  static String tecnologiaVisRem = '${Api.urlApi}/curriculum/remove_visibilidade_tecnologia/';

  static String educacaoVisAdd = '${Api.urlApi}/curriculum/add_visibilidade_educacao/';
  static String educacaoVisRem = '${Api.urlApi}/curriculum/remove_visibilidade_educacao/';


  //PUBLICIDADE

  static String publications = '${Api.urlApi}/publicidade/publicidade-lista/';

  // CURSOS
  static String courses = '${Api.urlApi}/cursos/curso-api-lista/';
  static String preRegistered = '${Api.urlApi}/cursos/pre-inscrito-usuario/'; // add id do curso
  
  //BLOG
  static String blogList = '${Api.urlApi}/api-blog-list/';
  static String blogTag = '${Api.urlApi}/api-blogtag-list/';
  static String blogListFilter = '${Api.urlApi}/api-blog-filter/';

  //Versão do app

  static String versionApp = '${Api.urlApi}/app-version/';
  static String attVersionApp = '${Api.urlApi}/app-version-atualiza/';
}