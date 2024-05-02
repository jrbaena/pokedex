import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Pokédex'),
        shadowColor: Colors.black.withOpacity(0.75),
        elevation: 12.5,
        leadingWidth: 51.0,
        toolbarHeight: 65,
        leading: Container(
          padding: const EdgeInsets.only(left: 16.0),
          child: Image.asset('assets/images/icons/pokeball.png'),
        ),
        actions: [IconButton(onPressed: () {
          showDialog(context: context, builder: (BuildContext context) => _getPokeDialog());
        }, icon: const Icon(Icons.filter_hdr), padding: EdgeInsets.only(right: 16.0),)],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 25,),
            Container(height: 60, color: Colors.pink,),
            SizedBox(height: 25,),
            Container(height: 60, color: Colors.blue,),
            SizedBox(height: 25,),
            Container(height: 60, color: Colors.pink,),
            SizedBox(height: 25,),
            Container(height: 60, color: Colors.blue,),
            SizedBox(height: 25,),
            Container(height: 60, color: Colors.pink,),
            SizedBox(height: 25,),
            Container(height: 60, color: Colors.blue,),
          ],
        ),
      ),
    );
  }
  
  Widget _getPokeDialog() {
    return Dialog(
      backgroundColor: Colors.white,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('HOLA SOY UN POKEMON'),
            SizedBox(height: 25,),
            Text('Otro texto')
          ],
        ),
      ),
    );
  }
}