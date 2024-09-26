import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:votaciones_app/models/participantes_models.dart';
import 'package:votaciones_app/widgets/card_votaciones.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 30.0,
          ),
          Text(
            "Votaciones",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("partidosPoliticos")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          print(snapshot);
                          DocumentSnapshot documentSnapshot =
                              snapshot.data!.docs[index];
                          print(documentSnapshot["nVotos"]);
                          return CardVotaciones(
                            participantes: ParticipantesModels(
                              image: documentSnapshot[
                                  "image"], // Debe ser una URL de imagen
                              nVotos: documentSnapshot[
                                  "nVotos"], // Debe ser un entero
                              namePolitico: documentSnapshot["namePolitico"],
                              nombreRepresentante:
                                  documentSnapshot["nombreRepresentante"],
                            ),
                          );
                        });
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
          ),
        ],
      )),
    );
  }
}
