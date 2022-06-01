import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class detail extends StatefulWidget {
  final heroTag;
  final detailPokemon;
  final Color color;

  const detail(
      {Key? key, this.heroTag, this.detailPokemon, required this.color})
      : super(key: key);

  @override
  State<detail> createState() => _detailState();
}

class _detailState extends State<detail> {
  @override
  Widget build(BuildContext context) {
    var widht = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      
      backgroundColor: widget.color,
      body: Stack(
        alignment:Alignment.center,
        children: [
          Positioned(
            top: 40,
            left: 15,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 30,
                  ))),
          Positioned(
              top: 170,
              left: 30,
              child: Text(
                widget.detailPokemon['name'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              )),
              Positioned(
                top: 200,
                left: 30,
                child: Container(
                  child: Text(widget.detailPokemon['type'].join(", "),
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                  
                  ),
                 decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                ),
              
                ),
          Positioned(
            bottom: 0,
            child: Container(
              width: widht,
              height: height * 0.6,
              decoration:
               BoxDecoration(
                borderRadius: BorderRadius.only(
               topLeft: Radius.circular(20),
                topRight: Radius.circular(20)),
                 color: Colors.white),
                  
             child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: widht * 0.3,
                            child: Text('Name', style: TextStyle(color: Colors.blueGrey, fontSize: 17),),
                          ),
                          Container(
                            child: Text(widget.detailPokemon['name'], style: TextStyle(color: Colors.black, fontSize: 17),),
                          ),

                        ], 
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: widht * 0.3,
                            child: Text('Height', style: TextStyle(color: Colors.blueGrey, fontSize: 17),),
                          ),
                          Container(
                            child: Text(widget.detailPokemon['height'], style: TextStyle(color: Colors.black, fontSize: 17),),
                          ),

                        ], 
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: widht * 0.3,
                            child: Text('Weight', style: TextStyle(color: Colors.blueGrey, fontSize: 17),),
                          ),
                          Container(
                            child: Text(widget.detailPokemon['weight'], style: TextStyle(color: Colors.black, fontSize: 17),),
                          ),

                        ], 
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: widht * 0.3,
                            child: Text('Spawn Time', style: TextStyle(color: Colors.blueGrey, fontSize: 17),),
                          ),
                          Container(
                            child: Text(widget.detailPokemon['spawn_time'], style: TextStyle(color: Colors.black, fontSize: 17),),
                          ),

                        ], 
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: widht * 0.3,
                            child: Text('Weakness', style: TextStyle(color: Colors.blueGrey, fontSize: 17),),
                          ),
                          Container(
                            child: Text(widget.detailPokemon['weaknesses'].join(", "), style: TextStyle(color: Colors.black, fontSize: 17),),
                          ),

                        ], 
                      ),
                    ),
                      Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: widht * 0.3,
                            child: Text('Pre Evolution', style: TextStyle(color: Colors.blueGrey, fontSize: 17),),
                          ),
                          Container(
                              child: widget.detailPokemon['prev_evolution'] != null ?
                              SizedBox(
                                height: 20,
                                width: widht * 0.55,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: widget.detailPokemon['prev_evolution'].length,
                                  itemBuilder: (context, index){
                                    return Padding(
                                      padding: const EdgeInsets.only(left:8.0),
                                      child: Text(widget.detailPokemon['prev_evolution'][index]['name'], style: TextStyle(color: Colors.black, fontSize: 17),),
                                    );
                                  },
                                ),
                              ): Text("Just Hatched", style: TextStyle(color: Colors.black, fontSize: 17),)
                          ),

                        ],
                      ),
                    ),
                    
                     Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: widht * 0.3,
                            child: Text('Eggs', style: TextStyle(color: Colors.blueGrey, fontSize: 17),),
                          ),
                          Container(
                            child: Text(widget.detailPokemon['egg'], style: TextStyle(color: Colors.black, fontSize: 17),),
                          ),

                        ], 
                      ),
                    ),
                    
                     Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: widht * 0.3,
                            child: Text('num', style: TextStyle(color: Colors.blueGrey, fontSize: 17),),
                          ),
                          Container(
                            child: Text(widget.detailPokemon['num'], style: TextStyle(color: Colors.black, fontSize: 17),),
                          ),

                        ], 
                      ),
                    ),


                    ]
                    )
                    )
          
            ),
          ),
          
          Positioned(
            top: 150,
            right: 40,
            child: CachedNetworkImage(imageUrl: widget.detailPokemon['img'],
            height: 200,
            fit: BoxFit.fitHeight,
            ))
        ],
      ),
    );
  }
}
