import 'package:flutter/material.dart';
import 'package:votaciones_app/constants/constants.dart';

class FieldWidget extends StatelessWidget {
  String titulo;
  TextEditingController controller;
  FieldWidget({required this.titulo, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          style: cabeceraFieldStyle,
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 50,
          child: TextField(
            controller: controller,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white.withOpacity(0.20),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(25)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(25))),
          ),
        ),
      ],
    );
  }
}
