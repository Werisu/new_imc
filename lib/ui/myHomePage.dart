import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imcapp/ui/screenListImc.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _nomeController = new TextEditingController();
  final TextEditingController _idadeController = new TextEditingController();
  final TextEditingController _altController = new TextEditingController();
  final TextEditingController _pesoController = new TextEditingController();

  double _resultado = 0;
  String _status = "";
  int _statusInt = 0;
  Color _valor = Colors.grey;

  void calcularIMC() {
    setState(() {
      _resultado = calcula(_pesoController.text, _altController.text);
      statusIMC();
      Colllors();
    });
  }

  void Colllors() {
    switch (_statusInt) {
      case 1:
        _valor = Colors.orangeAccent;
        break;
      case 2:
        _valor = Colors.orange;
        break;
      case 3:
        _valor = Colors.green;
        break;
      case 4:
        _valor = Colors.orange;
        break;
      case 5:
        _valor = Colors.redAccent;
        break;
      case 6:
        _valor = Colors.red;
        break;
      default:
        _valor = Colors.brown;
        break;
    }
  }

  void statusIMC() {
    if (_resultado < 17) {
      _status = "Muito abaixo do peso";
      _statusInt = 1;
    } else if (_resultado > 17 && _resultado <= 18.49) {
      _status = "Abaixo do peso";
      _statusInt = 2;
    } else if (_resultado > 18.5 && _resultado <= 24.99) {
      _status = "Peso normal";
      _statusInt = 3;
    } else if (_resultado > 25 && _resultado <= 29.99) {
      _status = "Acima do peso";
      _statusInt = 4;
    } else if (_resultado > 30 && _resultado <= 34.99) {
      _status = "Obesidade I";
      _statusInt = 5;
    } else if (_resultado > 35 && _resultado <= 39.99) {
      _status = "Obesidade II";
      _statusInt = 6;
    } else if (_resultado > 40) {
      _status = "Obesidade III";
      _statusInt = 7;
    } else {
      _status = "Peração inoperante";
      _statusInt = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IMC"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.list),
              onPressed: () {
                print("Revelise");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ScreenListImc()));
              })
        ],
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: EdgeInsets.all(1.5),
          children: <Widget>[
            Image.asset("images/menhera.png", height: 150.0),
            Container(
              margin: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _nomeController,
                    decoration: InputDecoration(
                      labelText: "Nome",
                      hintText: "nome",
                      icon: Icon(Icons.person),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  TextField(
                    controller: _idadeController,
                    decoration: InputDecoration(
                      labelText: "Idade",
                      hintText: "anos",
                      icon: Icon(Icons.person),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  TextField(
                    controller: _altController,
                    decoration: InputDecoration(
                        labelText: "Altura",
                        hintText: "cm",
                        icon: Icon(Icons.accessibility)),
                    keyboardType: TextInputType.number,
                  ),
                  TextField(
                    controller: _pesoController,
                    decoration: InputDecoration(
                        labelText: "Peso",
                        hintText: "Kg",
                        icon: Icon(Icons.directions_walk)),
                    keyboardType: TextInputType.number,
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: RaisedButton(
                      onPressed: calcularIMC,
                      textColor: Colors.white,
                      color: Theme.of(context).accentColor,
                      child: Text("Calcular"),
                    ),
                  ),
                  Text(
                    _altController.text.isEmpty && _pesoController.text.isEmpty
                        ? ""
                        : "IMC: ${_resultado.toStringAsFixed(2)}",
                    style: TextStyle(color: Colors.blue),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                    child: Text(
                      _altController.text.isEmpty &&
                              _pesoController.text.isEmpty
                          ? ""
                          : "$_status",
                      style: TextStyle(
                          fontSize: 20.5,
                          fontWeight: FontWeight.bold,
                          color: _valor),
                    ),
                  ),
                  Text(_altController.text.isEmpty &&
                          _pesoController.text.isEmpty
                      ? "Insira os dados para fazer o calculo"
                      : "Seu peso é ${_pesoController.text}Kg e sua altura é ${_altController.text}cm"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double calcula(String peso, String alt) {
    if (double.parse(peso).toString().isNotEmpty &&
        double.parse(alt).toString().isNotEmpty) {
      return (double.parse(peso) / (double.parse(alt) * double.parse(alt)));
    } else {
      return -1.0;
    }
  }
}
