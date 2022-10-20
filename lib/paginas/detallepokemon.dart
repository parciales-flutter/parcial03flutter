import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetallePokemon extends StatefulWidget {
  final pokemonDetalle;
  final Color color;
  final int idpokemon;

  const DetallePokemon(
      {super.key,
      required this.pokemonDetalle,
      required this.color,
      required this.idpokemon});
  @override
  State<DetallePokemon> createState() => _DetallePokemonState();
}

class _DetallePokemonState extends State<DetallePokemon> {
  @override
  Widget build(BuildContext context) {
    var anchodeta = MediaQuery.of(context).size.width;
    var altodeta = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: widget.color,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 40,
            left: 1,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 20),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: 80,
            left: 20,
            child: Text(
              widget.pokemonDetalle['title'],
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          Positioned(
            top: altodeta * 0.18,
            right: -30,
            child: Image.asset(
              'assets/img/pokeball.png',
              height: 200,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: anchodeta,
              height: altodeta * 0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width: anchodeta * 0.3,
                                  child: Text(
                                    "Nombre :",
                                    style: TextStyle(
                                        color: Colors.blueGrey, fontSize: 16),
                                  )),
                              Container(
                                  width: anchodeta * 0.3,
                                  child: Text(
                                    widget.pokemonDetalle['title'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ]),
                      ),
                    ]),
              ),
            ),
          ),
          Positioned(
            top: (altodeta * 0.18) - 10,
            left: (altodeta / 2) - 180,
            child: CachedNetworkImage(
                imageUrl: widget.pokemonDetalle['thumbnail'],
                height: 150,
                fit: BoxFit.fitHeight),
          )
        ],
      ),
    );
  }
}