// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class ItesoScreen extends StatefulWidget {
  ItesoScreen({Key? key}) : super(key: key);

  @override
  _ItesoScreenState createState() => _ItesoScreenState();
}

class _ItesoScreenState extends State<ItesoScreen> {
  String imageUrl =
      "https://www.cisco.com/c/m/es_mx/cases/iteso/jcr:content/Grid/category_atl_26d4/layout-category-atl/marquee_inpage_505b.img.jpg/1549279992740.jpg";
  int numberOfLikes = 59;
  bool isPressedDown = false;
  bool isPressedUp = false;

  Color emailBtn = Colors.grey;
  Color phoneBtn = Colors.grey;
  Color routeBtn = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ITESO APP"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(imageUrl),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "ITESO, Universidad Jesuita de Guadalajara",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: GestureDetector(
                      child: Icon(
                        Icons.thumb_down,
                        color: isPressedDown ? Colors.blue : Colors.grey,
                      ),
                      onTap: () {
                        setState(() {
                          if (isPressedDown) {
                            // blue color
                            isPressedDown = false;
                            numberOfLikes++;
                          } else {
                            // greyColor
                            if (isPressedUp) {
                              isPressedUp = false;
                              numberOfLikes--;
                            }
                            isPressedDown = true;
                            numberOfLikes--;
                          }
                        });
                      },
                    ),
                  ),
                  GestureDetector(
                    child: Icon(
                      Icons.thumb_up,
                      color: isPressedUp ? Colors.blue : Colors.grey,
                    ),
                    onTap: () {
                      setState(() {
                        if (isPressedUp) {
                          // blue color
                          isPressedUp = false;
                          numberOfLikes--;
                        } else {
                          // greyColor
                          if (isPressedDown) {
                            isPressedDown = false;
                            numberOfLikes++;
                          }
                          isPressedUp = true;
                          numberOfLikes++;
                        }
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("$numberOfLikes"),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        getSnackBar("Enviar Correo", context);
                        setState(() {
                          emailBtn = Colors.blue;
                          phoneBtn = Colors.grey;
                          routeBtn = Colors.grey;
                        });
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.email,
                            color: emailBtn,
                            size: 50.0,
                          ),
                          Text("Correo"),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        getSnackBar("Hacer llamada", context);
                        setState(() {
                          emailBtn = Colors.grey;
                          phoneBtn = Colors.blue;
                          routeBtn = Colors.grey;
                        });
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.phone,
                            color: phoneBtn,
                            size: 50.0,
                          ),
                          Text("Llamada"),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        getSnackBar("Ir al ITESO", context);
                        setState(() {
                          emailBtn = Colors.grey;
                          phoneBtn = Colors.grey;
                          routeBtn = Colors.blue;
                        });
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.directions,
                            color: routeBtn,
                            size: 50.0,
                          ),
                          Text("Ruta"),
                        ],
                      ),
                    ),
                  ]),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              child: Text(
                "El ITESO, Universidad Jesuita de Guadalajara (Instituto Tecnológico y de Estudios Superiores de Occidente), es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957.La institución forma parte del Sistema Universitario Jesuita (SUJ) que integra a ocho universidades en México. Fundada en el año de 1957 por el ingeniero José Fernández del Valle y Ancira, entre otros, la universidad ha tenido una larga trayectoria. A continuación se presenta la historia de la institución en período de décadas.",
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void getSnackBar(String msg, context) {
  SnackBar snackBar = SnackBar(
    backgroundColor: Colors.blue,
    content: Text(
      msg,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 18.0),
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
