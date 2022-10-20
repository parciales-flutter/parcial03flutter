import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:parcial3/paginas/detallepokemon.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var marvelApi = "https://dummyjson.com/products";
  List marvel = [];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barraApp(),
      body: cuerpoApp(),
    );
  }

  cuerpoApp() {
    var ancho = MediaQuery.of(context).size.width;
    var alto = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Stack(
          children: [
            Container(
              width: ancho,
              height: alto,
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 10, left: 10, top: 10, bottom: 10),
                          child: Container(
                              width: 250,
                              height: 70,
                              decoration:
                                  BoxDecoration(color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Center(child: Text("Nombre: Kevin Alberto", style: TextStyle(fontWeight: FontWeight.bold) ),),
                                        Center(child: Text("Apellido: Trujillo Reyes",style: TextStyle(fontWeight: FontWeight.bold) ),),
                                        Center(child: Text("Carnet: 25-1418-2017",style: TextStyle(fontWeight: FontWeight.bold) ),),
                                      ],
                                    ),
                                  ),
                              ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 10, left: 10, top: 10, bottom: 10),
                          child: Container(
                              width: 250,
                              height: 70,
                              decoration:
                                  BoxDecoration(color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Center(child: Text("Nombre: Erick Alberto",style: TextStyle(fontWeight: FontWeight.bold) ),),
                                        Center(child: Text("Apellido: Cruz Rosales",style: TextStyle(fontWeight: FontWeight.bold) ),),
                                        Center(child: Text("Carnet: 25-4822-2018",style: TextStyle(fontWeight: FontWeight.bold) ),),
                                      ],
                                    ),
                                  ),
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                "assets/img/pokeball.png",
                height: 100,
                fit: BoxFit.fitHeight,
                color: Colors.black,
              ),
            ),
            Positioned(
              top: 100,
              bottom: 10,
              width: ancho,
              child: Column(children: [
                marvel.length != null
                    ? Expanded(
                        child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1.4),
                        itemCount: marvel.length,
                        itemBuilder: (context, index) {
                          var tipo = marvel[index]['category'];
                          // var tipo2 = pokedesk[index]['type'][1];
                          
                          return InkWell(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 12),
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.lightBlueAccent,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20))),
                                  child: Stack(children: [
                                    Positioned(
                                        top: 10,
                                        left: 20,
                                        child: Text(
                                          marvel[index]['title'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Colors.white),
                                        )),
                                    Positioned(
                                        top: 35,
                                        left: 10,
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0,
                                                right: 20.0,
                                                top: 4,
                                                bottom: 4),
                                            child: Text(tipo.toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10)),
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.white),
                                        )),
                                    Positioned(
                                      bottom: 5,
                                      right: 5,
                                      child: CachedNetworkImage(
                                        imageUrl: marvel[index]['thumbnail'],
                                        height: 80,
                                        width: 120,
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  ])),
                            ),
                            onTap: (() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => DetallePokemon(
                                          pokemonDetalle: marvel[index],
                                          color: Colors.blue,
                                          idpokemon: index)));
                            }),
                          );
                        },
                      ))
                    : Center(
                        child: CircularProgressIndicator(),
                      )
              ]),
            ),
          ],
        ));
  }

  barraApp() {
    return AppBar(
      backgroundColor: Colors.blueGrey,
      elevation: 5,
      title: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Productos",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/img/pokeball.png",
                          ),
                          fit: BoxFit.cover,),
                      borderRadius: BorderRadius.circular(90)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    if (mounted) {
      datosMarvel();
    }
  }

  void datosMarvel() {
    var url = Uri.https('dummyjson.com', '/products');
    http.get(url).then((value) {
      if (value.statusCode == 200) {
        var decodejsonData = jsonDecode(value.body);
        marvel = decodejsonData['products'];
        //print(marvel[0]['id']);
        setState(() {});
      }
    });
  }
}
