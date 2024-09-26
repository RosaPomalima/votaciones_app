import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:votaciones_app/constants/constants.dart';
import 'package:logger/logger.dart';
import 'package:votaciones_app/pages/login_page.dart';
import 'package:votaciones_app/widgets/field_widget.dart';

class CreacionCuentaPage extends StatelessWidget {
  TextEditingController _correoController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var logger = Logger(
    printer: PrettyPrinter(),
  );

  Future createAccount(BuildContext context) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: _correoController.text, password: _passController.text);

      logger.d(userCredential);
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          behavior: SnackBarBehavior.floating,
          content: Text(
            mapErrorAuth(
              error.toString(),
            ),
          ),
        ),
      );
    }
  }

  String mapErrorAuth(String errorMessage) {
    if (errorMessage.contains("email-already-in-use")) {
      return "La dirección de correo ya esta en uso";
    } else if (errorMessage.contains("invalid-email")) {
      return "El correo no es válido";
    } else if (errorMessage.contains("weak-password")) {
      return "La contraseña no cumple con los estádares";
    } else {
      return "Ocurrió un problema al registrar la cuenta";
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
                Color.fromARGB(255, 4, 203, 60),
                Color.fromARGB(255, 35, 29, 200),
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
                  "Crear cuenta",
                  style: subtitulosStyleWhite,
                ),
                SizedBox(
                  height: 15,
                ),
                FieldWidget(
                  titulo: "Correo electrónico",
                  controller: _correoController,
                ),
                SizedBox(
                  height: 15,
                ),
                FieldWidget(
                  titulo: "Contraseña",
                  controller: _passController,
                ),
                SizedBox(
                  height: 16,
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
                  child: Text(
                    "o Inicia sesión",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                ElevatedButton(
                  onPressed: () {
                    createAccount(context);
                  },
                  child: Text("Crear Cuenta"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
