import 'package:babigol/babigol.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    final colors = BabigolColors.of(context);
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        backgroundColor: colors.primary,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(image: BabigolImages.logo),
                 Text(
                  'Domine o campo e conquiste a coroa.', 
                  style: textTheme.displayMedium!.copyWith(
                    fontSize: 24,
                    color: colors.textColor
                  ),
                  textAlign: TextAlign.center,
                               ),
                const SizedBox(height: 100),
                FractionallySizedBox(
                  widthFactor: 0.6,
                  child: BabigolButton(
                    onPressed: () {
                    },
                    color: colors.white,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Entrar",
                          style: textTheme.labelMedium!.copyWith(
                            fontSize: 22,
                            color: colors.black
                          ),
                        ),
                        const SizedBox(width: 10),
                        /*Image.asset(
                          ImagesApp.entrar,
                        ),*/
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                BabigolTextButton(
                  onPressed: () {
                    //Modular.to.navigate(RoutesModulesApp.routerLoginModule);
                  },
                  label: 'Cadastre-se',
                ),
                /*TextButton(
                  onPressed: () {
                    Modular.to.navigate(RoutesModulesApp.routerRegisterModule);
                  },
                  child: Text(
                    'Cadastre-se',
                    style: TextStyle(color: colors.white, fontSize: 20),
                  ),
                )*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}