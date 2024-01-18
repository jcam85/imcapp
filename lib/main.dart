import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: MyImc(),
    ),
  );
}

class MyImc extends StatefulWidget {
  const MyImc({super.key});

  @override
  State<MyImc> createState() => _MyImcState();
}

class _MyImcState extends State<MyImc> {
  double ldalturaSlider = 135.0;
  double ldpesoSlider = 35;
  num ldValueImc = 0;
  String lsCategory = "";
  int idImageCategory = 0;
  String lsComentario = "";
  //double ldvalueImc = 0;

  num calcularImc(double xpeso, double xaltura) {
    //ldValueImc = xpeso / (pow((xaltura / 100), 2));
    return (xpeso / (pow((xaltura / 100), 2)));
  }

  String tipoIMC(num value) {
    //ldValueImc = double.parse(ldValueImc.toStringAsFixed(1));
    value = double.parse(value.toStringAsFixed(1));

    switch (value.toDouble()) {
      case < 18.5:
        lsCategory = "Bajo Peso";
        idImageCategory = 1;
        lsComentario = "Falta comer mas";
        break;

      case >= 18.5 && <= 24.9:
        lsCategory = "Normal";
        idImageCategory = 2;
        lsComentario = "Se encuentra en buen estado";
        break;

      case >= 25.0 && <= 29.9:
        lsCategory = "Sobrepeso";
        idImageCategory = 3;
        lsComentario = "Tiene grasa de mas a lo normal";
        break;

      case >= 30.0:
        lsCategory = "Obesidad";
        idImageCategory = 4;
        lsComentario = "Tiene obesidad de mas a lo normal";
        break;
    }
    return lsCategory;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Calcular IMC",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 171, 140, 233),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 12.0,
              ),
              Text(
                "Altura:",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    ldalturaSlider.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32.0,
                      height: 1.0,
                    ),
                  ),
                  Text("cm"),
                ],
              ),
              Slider(
                min: 135.0,
                max: 200.0,
                value: ldalturaSlider,
                onChanged: (nValue) {
                  ldalturaSlider = nValue;
                  ldalturaSlider = ldalturaSlider.roundToDouble();
                  setState(() {});
                },
              ),
              Text(
                "Peso:",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    ldpesoSlider.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32.0,
                      height: 1.0,
                    ),
                  ),
                  Text("kg"),
                ],
              ),
              Slider(
                min: 35.0,
                max: 150.0,
                value: ldpesoSlider,
                onChanged: (nValue) {
                  ldpesoSlider = nValue;
                  ldpesoSlider = ldpesoSlider.roundToDouble();
                  setState(() {});
                },
              ),
              SizedBox(
                height: 12.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    ldValueImc = calcularImc(ldpesoSlider, ldalturaSlider);
                    lsCategory = tipoIMC(ldValueImc);

                    setState(() {});
                  },
                  child: Text(
                    "Calcular",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 171, 140, 233),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                ldValueImc.toStringAsFixed(1),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 42.0,
                  height: 1.0,
                ),
              ),
              Text(
                lsCategory,
                style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 16.0,
                ),
              ),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: lsComentario,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset(
                "assets/images/$idImageCategory.png",
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
