import 'package:app/app/routes/app_routes.dart';
import 'package:babigol/babigol.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 15),
      () async {
        Modular.to.navigate(AppRoutes.authModule);
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    final colors = BabigolColors.of(context);
    return Scaffold(
      backgroundColor: colors.primary,
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(
            flex: 4,
            child: Image(
              image: BabigolImages.logoNome,
              //width: 200,
              //height: 200,
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Feito pelo Rei da Bola ❤️' ,
                  style: TextStyle(
                    fontSize: 14,
                    color: colors.textColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }
}