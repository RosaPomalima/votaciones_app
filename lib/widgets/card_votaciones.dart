import 'package:flutter/material.dart';
import 'package:votaciones_app/models/participantes_models.dart';

class CardVotaciones extends StatelessWidget {
  final ParticipantesModels participantes;

  CardVotaciones({required this.participantes});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "https://images.pexels.com/photos/2978800/pexels-photo-2978800.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
          fit: BoxFit.cover,
        ),
        border: Border.all(color: Colors.black, width: 2.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.white60,
            backgroundImage: NetworkImage(participantes.image),
          ),
          Column(
            children: [
              Text(
                participantes.namePolitico,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Text(
                participantes.nombreRepresentante,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Column(
            children: [
              Icon(Icons.arrow_circle_up),
              Icon(Icons.arrow_circle_down),
            ],
          ),
          Text(
            participantes.nVotos,
            style: TextStyle(
              color: Colors.black,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
