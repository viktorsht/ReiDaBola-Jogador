import 'package:babigol/babigol.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../routes/app_routes.dart';
import '../../../../../routes/route_navigator.dart';
import '../../../../../valueobject/email.dart';
import '../../../../../valueobject/name.dart';
import '../../../../../valueobject/password.dart';
import '../../../domain/entities/create_user.dart';
import '../controller/create_user_controller.dart';
import '../controller/create_user_state.dart';

class CreateUserPage extends StatefulWidget {
  final RouteNavigator route;
  final CreateUserController controller;
  const CreateUserPage({super.key, required this.controller, required this.route});

  @override
  State<CreateUserPage> createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {

  final formKey = GlobalKey<FormState>();
  FormState get form => formKey.currentState!;

  bool isViewPassword = false;
  bool isViewConfirPassword = false;

  final entity = CreateUser.empty();

  void setIsViewPassword(){
    setState(() {
      isViewPassword = !isViewPassword;
    });
  }

  void setIsViewConfirPassword(){
    setState(() {
      isViewConfirPassword = !isViewConfirPassword;
    });
  }

  void showSnackBar(String message, Color color){
    final snackBar = SnackBar(
      content: Text(message, style: const TextStyle(fontSize: 16),),
      duration: const Duration(seconds: 3),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final colors = BabigolColors.of(context);
    final textTheme = Theme.of(context).textTheme;
    return Form(
      key: formKey,
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: BabigolImages.logoNome, color: colors.primary,),
                  const SizedBox(height: 8,),
                  Text(
                    'Crie uma conta na Repense', 
                    style: textTheme.bodyLarge!.copyWith(
                      fontSize: 22
                    )
                  ),
                  const SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: BabigolFormField(
                          hint: 'Nome',
                          value: entity.firstName!.toString(),
                          onChanged: (p0) => entity.firstName = Name(p0),
                          validator: (p0) => entity.firstName!.validator(),
                        ),
                      ),
                      const SizedBox(width: 8,),
                      Expanded(
                        child: BabigolFormField(
                          hint: 'Sobrenome',
                          value: entity.lastName!.toString(),
                          onChanged: (p0) => entity.lastName = Name(p0),
                          validator: (p0) => entity.lastName!.validator(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16,),
                  BabigolFormField(
                    hint: 'Email',
                    value: entity.email!.toString(),
                    onChanged: (p0) => entity.email = Email(p0),
                    validator: (p0) => entity.email!.validator(),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16,),
                  BabigolFormField(
                    hint: 'Usuário',
                    value: entity.username!.toString(),
                    onChanged: (p0) => entity.username = Name(p0),
                    validator: (p0) => entity.username!.validator(),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 10,),
                  BabigolFormField(
                    hint: 'Senha',
                    value: entity.password!.toString(),
                    onChanged: (p0) => entity.password = Password(p0),
                    validator: (p0) => entity.password!.validator(),
                    obscure: !isViewPassword,
                    suffix: PasswordLook(
                      onPressed: setIsViewPassword, 
                      iconData: isViewPassword ? Icons.remove_red_eye_outlined : Icons.remove_red_eye_rounded,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  BabigolFormField(
                    hint: 'Confirmar senha',
                    value: entity.passwordConfirmation!.toString(),
                    onChanged: (p0) => entity.passwordConfirmation = Password(p0),
                    validator: (p0) => entity.passwordConfirmation!.validator(),
                    obscure: !isViewConfirPassword,
                    suffix: PasswordLook(
                      onPressed: setIsViewConfirPassword, 
                      iconData: isViewConfirPassword ? Icons.remove_red_eye_outlined : Icons.remove_red_eye_rounded,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  ListenableBuilder(
                    listenable: widget.controller,
                    builder: (context, child) {
                      final state = widget.controller.state;
                      return FractionallySizedBox(
                        widthFactor: 0.6,
                        child: ElevatedButton(
                          onPressed: () async {
                            final valid = form.validate();
                            if(valid){
                              await widget.controller.createUser(entity);
                              if(state is CreateUserSucess){
                                showSnackBar('Conta criada com sucesso!', colors.success);
                                Future.delayed(
                                  const Duration(milliseconds: 2500),
                                  () => Modular.to.navigate(AppRoutes.authModule)
                                );
                              }
                              if(state is CreateUserError){
                                showSnackBar('Erro no cadastro do usuário', colors.error);
                              }
                            }
                            else{
                              showSnackBar('Dados inválidos inválidos', colors.error);
                            }
                          }, 
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colors.secondary,
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)
                            )
                          ),
                          child: state is CreateUserLoading 
                          ? CircularProgressIndicator(color: colors.primary,) 
                          : Text("Cadastre-se", style: TextStyle(color: colors.primary, fontSize: 20),),
                        ),
                      );
                    }
                  ),
                  const SizedBox(height: 16,),
                  const Divider(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      onPressed: () {Modular.to.navigate(AppRoutes.authModule);},
                      child: Text(
                          "Já tenho uma conta",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: colors.textColor
                          ),
                        ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}