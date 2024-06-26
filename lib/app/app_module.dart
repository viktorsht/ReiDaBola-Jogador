/*import 'package:app_repense/app/modules/blog/blog_module.dart';
import 'package:app_repense/app/modules/education/education_module.dart';
import 'package:app_repense/app/modules/habilidades/habilidades_module.dart';
import 'package:app_repense/app/modules/home/home_module.dart';
import 'package:app_repense/app/modules/jobs/jobs_module.dart';
import 'package:app_repense/app/modules/projetos/projetos_module.dart';
import 'package:app_repense/app/modules/publications/publications_module.dart';
import 'package:app_repense/app/modules/settings/settings_module.dart';
import 'package:app_repense/app/modules/splash/splash_module.dart';
import 'modules/auth/auth_module.dart';
import 'modules/courses/courses_module.dart';
import 'modules/curriculo/curriculo_module.dart';
import 'modules/linguas/lingua_module.dart';
import 'modules/professional/professional_module.dart';
import 'routes/app_routes.dart';
import 'package:app_repense/app/modules/tecnologias/tecnologias_module.dart';*/
import 'package:core_kb/core_kb.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/auth/auth_module.dart';
import 'modules/splash/splash_module.dart';
import 'routes/app_routes.dart';


class AppModule extends Module{

  @override
  List<Module> get imports => [CoreModule(), AuthModule()];
  
  @override
  void routes(r){
    r.module('/', module: SplashModule());
    r.module(AppRoutes.authModule, module: AuthModule());
    /*r.module(AppRoutes.root, module: SplashModule());
    r.module(AppRoutes.jobsModule, module: JobsModule());
    r.module(AppRoutes.curriculumModule, module: CurriculoModule());
    r.module(AppRoutes.splashModule, module: SplashModule());
    r.module(AppRoutes.homeModule, module: HomeModule());
    r.module(AppRoutes.educationModule, module: EducationModule());
    r.module(AppRoutes.professionalModule, module: ProfessionalModule());
    r.module(AppRoutes.tecnologiaModule, module: TecnologiasModule());
    r.module(AppRoutes.habilidadeModule, module: HabilidadesModule());
    r.module(AppRoutes.linguaModule, module: LinguaModule());
    r.module(AppRoutes.projetoModule, module: ProjetosModule());
    r.module(AppRoutes.settingsModule, module: SettingsModule());
    r.module(AppRoutes.publicationsModule, module: PublicationsModule());
    r.module(AppRoutes.coursesModule, module: CoursesModule());
    r.module(AppRoutes.blogModule, module: BlogModule());*/
  }
}