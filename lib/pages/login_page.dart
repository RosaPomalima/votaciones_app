import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:votaciones_app/constants/constants.dart';
import 'package:votaciones_app/pages/home_page.dart';
import 'package:votaciones_app/widgets/field_widget.dart';

class LoginPage extends StatelessWidget {
  TextEditingController _correoController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Logger logger = Logger();

  Future<void> login(BuildContext context) async {
    try {
      await _auth
          .signInWithEmailAndPassword(
        email: _correoController.text,
        password: _passController.text,
      )
          .then((value) {
        logger.d(value);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      });
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          behavior: SnackBarBehavior.floating,
          content: Text(error.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 231, 145, 16),
                Color.fromARGB(255, 29, 200, 146),
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "App votaciones",
                  style: titulosStyleWhite,
                ),
                SizedBox(
                  height: 15,
                ),
                FlutterLogo(
                  size: 200,
                ),
                Text(
                  "Iniciar Sesión",
                  style: subtitulosStyleWhite,
                ),
                SizedBox(
                  height: 15,
                ),
                FieldWidget(
                  titulo: "Ingresar Correo:",
                  controller: _correoController,
                ),
                SizedBox(
                  height: 15,
                ),
                FieldWidget(
                  titulo: "Ingresar contraseña:",
                  controller: _passController,
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => LoginPage(),
                      ),
                    );
                  },
                  child: Text("¿Olvidaste tu contraseña?"),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    login(context);
                  },
                  child: Text("Iniciar"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
