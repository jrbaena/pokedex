import 'package:flutter/material.dart';

class PokemonDetailPage extends StatelessWidget {
  const PokemonDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () { Navigator.of(context).pop(); },
          icon: const Icon(Icons.arrow_back_ios_new),),
      ),
      body: Card(
        shadowColor: Colors.black.withOpacity(0.5),
        elevation: 15,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(height: 60, width: 70, color: Colors.purple, margin: EdgeInsets.only(right: 100),),
                Container(height: 60, width: 70, color: Colors.amber, margin: EdgeInsets.only(right: 100),)
              ],
            ),
            SizedBox(height: 20,),
            Text('Mankey'),
            SizedBox(height: 20,),
            Padding(padding: EdgeInsets.only(left: 16), child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.balance),
                    Text('Peso: '),
                    Text('25'),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.height),
                    Text('Altura: '),
                    Text('170'),
                  ],
                ),
              ],
            ),)
          ],
        ),
      ),
    );
  }

}