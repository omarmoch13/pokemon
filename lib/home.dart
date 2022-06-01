import 'dart:convert';
import 'dart:ui';
import 'package:pokemon/appbar.dart';

import 'detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  late List pokedex;
  ScrollController _scrollController = ScrollController();
  int _currentMax = 10;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
    pokedex = List.generate(10, (i) => "Item : ${i + 1}");
    if (mounted) {
      fetchPokemonApi();
    }
  }

  _getMoreData() {
    for (int i = _currentMax; i < _currentMax + 10; i++) {
      pokedex.add('Item : ${i + 1}');
    }
    _currentMax = _currentMax + 10;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var widht = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white30,
        appBar: AppBar(
          title: Text('pokemon'),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
          backgroundColor: Colors.red,
        ),
        body: Stack(children: [
          Positioned(
            top: 0,
            bottom: 0,
            width: widht,
            child: Column(
              children: [
                pokedex.length != null
                    ? Expanded(
                        child: GridView.builder(
                            controller: _scrollController,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 1.4),
                            itemCount: pokedex.length,
                            itemBuilder: (context, index) {
                              var type = pokedex[index]['type'][0];
                              return InkWell(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 12),
                                  child: Container(
                                      decoration: BoxDecoration(
                                        color: type == 'Grass'
                                            ? Colors.green
                                            : type == 'Fire'
                                                ? Colors.orange
                                                : type == 'Water'
                                                    ? Colors.lightBlue
                                                    : type == 'Rock'
                                                        ? Colors.brown
                                                        : type == 'Bug'
                                                            ? Colors.lightGreen
                                                            : type == 'Normal'
                                                                ? Colors.grey
                                                                : type ==
                                                                        'Poison'
                                                                    ? Colors
                                                                        .purple
                                                                    : type ==
                                                                            'Electric'
                                                                        ? Colors
                                                                            .yellow
                                                                        : type ==
                                                                                'Psychic'
                                                                            ? Colors.amber
                                                                            : type == 'Ground'
                                                                                ? Colors.lime
                                                                                : type == 'Fighting'
                                                                                    ? Colors.cyan
                                                                                    : type == 'Ghost'
                                                                                        ? Colors.orangeAccent
                                                                                        : Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                      child: Stack(children: [
                                        Positioned(
                                          left: 18,
                                          top: 15,
                                          child: Column(children: [
                                            Text(
                                              pokedex[index]['name'],
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ]),
                                        ),
                                        Positioned(
                                            top: 55,
                                            left: 15,
                                            child: Container(
                                                child: Text(
                                              pokedex[index]['type'][0],
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  shadows: [
                                                    BoxShadow(
                                                      color: Colors.black,
                                                    )
                                                  ]),
                                            ))),
                                        Positioned(
                                          bottom: 5,
                                          right: 5,
                                          child: Hero(
                                            tag: index,
                                            child: CachedNetworkImage(
                                              imageUrl: pokedex[index]['img'],
                                              height: 100,
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        ),
                                      ])),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => detail(
                                                detailPokemon: pokedex[index],
                                                color: type == 'Grass'
                                                    ? Colors.green
                                                    : type == 'Fire'
                                                        ? Colors.orange
                                                        : type == 'Water'
                                                            ? Colors.lightBlue
                                                            : type == 'Rock'
                                                                ? Colors.brown
                                                                : type == 'Bug'
                                                                    ? Colors
                                                                        .lightGreen
                                                                    : type ==
                                                                            'Normal'
                                                                        ? Colors
                                                                            .grey
                                                                        : type ==
                                                                                'Poison'
                                                                            ? Colors.purple
                                                                            : type == 'Electric'
                                                                                ? Colors.yellow
                                                                                : type == 'Psychic'
                                                                                    ? Colors.amber
                                                                                    : type == 'Ground'
                                                                                        ? Colors.lime
                                                                                        : type == 'Fighting'
                                                                                            ? Colors.cyan
                                                                                            : type == 'Ghost'
                                                                                                ? Colors.orangeAccent
                                                                                                : Colors.white,
                                                heroTag: index,
                                              )));
                                },
                              );
                            }))
                    : Center(
                        child: CircularProgressIndicator(),
                      )
              ],
            ),
          )
        ]));
  }

  void fetchPokemonApi() {
    var url = Uri.http("raw.githubusercontent.com",
        "/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    http.get(url).then((value) {
      if (value.statusCode == 200) {
        var decodedJson = jsonDecode(value.body);
        print(decodedJson);
        pokedex = decodedJson['pokemon'];

        setState(() {});
      }
    });
  }
}
