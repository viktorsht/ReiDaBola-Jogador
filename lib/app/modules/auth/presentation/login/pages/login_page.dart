import 'package:flutter/material.dart';
import 'package:babigol/babigol.dart';
import '../../../../../valueobject/email.dart';
import '../../../../../valueobject/password.dart';
import '../../../domain/entities/login.dart';
import '../controllers/login_controller.dart';
import '../states/login_state.dart';

class LoginPage extends StatefulWidget {
  final LoginController controller;
  const LoginPage({super.key, required this.controller});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  var entity = Login.empty();

  final formKey = GlobalKey<FormState>();
  FormState get form => formKey.currentState!;

  bool isViewPassword = false;

  void setIsViewPassword(){
    setState(() {
      isViewPassword = !isViewPassword;
    });
  }

  void showSnackBar(String message, Color color){
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final colors = BabigolColors.of(context);
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
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Login', 
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 8,),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Entre para a comunidade', 
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 8,),
                  BabigolFormField(
                    hint: 'Email',
                    value: entity.email!.toString(),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (p0) => entity.email = Email(p0),
                    validator: (p0) => entity.email!.validator(),
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
                  const SizedBox(height: 20,),
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
                              await widget.controller.login(entity);
                              if(state is LoginSucess){
                                //Modular.to.navigate(AppRoutes.homeModule);
                              }
                              if(state is LoginError){
                                showSnackBar('Erro: ${state.error}', colors.error);
                              }
                            }
                            else{
                              showSnackBar('Email ou senha inválidos', colors.error);
                            }
                          }, 
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colors.primary,
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)
                            )
                          ),
                          child: state is LoginLoading 
                          ? CircularProgressIndicator(color: colors.secondary,) 
                          : Text("Entrar", style: TextStyle(color: colors.textColor2, fontSize: 20),),
                        ),
                      );
                    }
                  ),
                  const SizedBox(height: 16,),
                  const Divider(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      onPressed: () => {}, //Modular.to.navigate('${AppRoutes.authModule}${AppRoutes.createUser}'),
                      child: Text(
                          "Criar uma conta",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: colors.textColor2
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