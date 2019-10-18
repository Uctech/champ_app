import 'package:champ_app/model/search_detail.dart';
import 'package:champ_app/util/hex_color.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final _formKey = GlobalKey<FormState>();
  final _searchDetail = SearchDetail();
  static const _imageHeight = 251.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: _imageHeight,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/p1.jpeg'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 0.0, left: 15.0),
                      child: Text("Champ.",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: HexColor("FFFFFF"))),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 60.0,
                        left: 15.0,
                      ),
                      child: Text(""),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 0.0,
                        left: 15.0,
                      ),
                      child: Text("Zoek, vind en boek je sport",
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: HexColor("FFFFFF"))),
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: Builder(
                  builder: (context) => Form(
                      key: _formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, bottom: 20.0),
                              child: Text("Waar?",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                prefixIcon:
                                    Icon(Icons.pin_drop, color: Colors.red),
                                prefixStyle: TextStyle(),
                                labelText: 'Locatie',
                                labelStyle: TextStyle(fontSize: 14.0),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter your location';
                                }
                              },
                              onSaved: (val) =>
                                  setState(() => _searchDetail.location = val),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 30.0, bottom: 10.0),
                              child: Text("Wat voor sport?",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Sportcategorie'),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your sportcategorie.';
                                  }
                                },
                                onSaved: (val) =>
                                    setState(() => _searchDetail.sport = val)),
                            Container(
                                height: 80.0,
                                padding: const EdgeInsets.only(top: 25.0),
                                child: RaisedButton(
                                    textColor: HexColor("FFFFFF"),
                                    color: HexColor("4142d2"),
                                    onPressed: () {
                                      final form = _formKey.currentState;
                                      if (form.validate()) {
                                        form.save();
                                        _searchDetail.save();
                                        _showDialog(context,_searchDetail);
                                      }
                                    },
                                    child: Text('Zoek op Champ',
                                        style: TextStyle(fontSize: 16.0)))),
                            Container(
                                margin: const EdgeInsets.only(top: 20.0),
                                child: Divider()),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20.0, bottom: 5.0),
                              child: Text("Populaire sporten",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 20.0),
                              height: 100.0,
                              //MediaQuery.of(context).size.height,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  popularImage("assets/p2.jpeg"),
                                  popularImage("assets/p3.jpeg"),
                                  popularImage("assets/p4.jpeg"),
                                  popularImage("assets/p5.jpeg"),
                                ],
                              ),
                            ),
                          ])
                  )
              )
          ),
        ],
      ),
    ));
  }

  Container popularImage(String img) {
    return Container(
      width: 160.0,
      margin: EdgeInsets.only(left: 15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        image: DecorationImage(
          image:AssetImage(
              img),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  _showDialog(BuildContext context, SearchDetail searchDetail) {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Location: '+ searchDetail.location+ ' Sport: '+searchDetail.sport)));
  }
}
