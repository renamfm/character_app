import 'package:character_app/character.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MaterialApp(
    home: CharacterCard()
));

class CharacterCard extends StatefulWidget {
  @override
  _CharacterCardState createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard> {

  //Character character =  Character('Renato', 'Rogue', 'Human', 23);

  List<Character> characters = [];

  List<String> names = [
    'Alan', 'Alexander', 'Andrew', 'Aslin', 'Arthur', 'Baldwin',
    'Benedict', 'Bernard', 'Bryan', 'Cvriac', 'Humphrey', 'Ingham',
    'James', 'Jeffrey', 'John', 'Leonard', 'Lewis', 'Luke', 'Martin',
    'Matthew', 'Powle', 'Raff', 'Raulin', 'Reginald', 'Reynard',
    'Richard', 'Rowland', 'Simon', 'Symond', 'Thames', 'Baldric', 'Osbert',
    'Siward', 'Theobald', 'Ulric', 'Fendrel', 'Zoricus',
  ];

  List<String> classes = [
    'Barbarian', 'Bard', 'Cleric', 'Druid', 'Fighter', 'Monk', 'Paladin',
    'Ranger', 'Rogue', 'Sorcerer', 'Warlock', 'Wizard',
  ];

  List<String> races = [
    'Dwarf', 'Elf', 'Goblin', 'Halfling', 'Human', 'Orc',
    'Leonid', 'Satyr', 'Kenku', 'Triton', 'Shifter',
  ];

  void randomize(){

      int maxName = names.length - 1;
      int maxClasse = classes.length - 1;
      int maxRace = races.length - 1;
      int maxLevel = 100;

      Random rnd = new Random();
      int iName = rnd.nextInt(maxName);
      int iClasse = rnd.nextInt(maxClasse);
      int iRace = rnd.nextInt(maxRace);
      int level = rnd.nextInt(maxLevel);

      Character character = Character(
          names[iName], classes[iClasse], races[iRace], level);

      setState(() {
        characters.add(character);
      });

      print(character);
  }

  Widget characterTemplate(character){
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Image.asset('assets/'+character.classe+'.png', height: 100, width: 100,),
            ]
          ),
          Column(
            children: <Widget>[
              SizedBox(width: 10.0,),
            ],
          ),
          IntrinsicWidth(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                        'Name: ',
                        style: TextStyle(
                          fontSize:18.0,
                          fontWeight: FontWeight.bold,
                        )
                    ),
                    Text(
                        character.name,
                        style: TextStyle(
                            fontSize:18.0
                        )
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                        'Class: ',
                        style: TextStyle(
                          fontSize:18.0,
                          fontWeight: FontWeight.bold,
                        )
                    ),
                    Text(
                        character.classe,
                        style: TextStyle(
                            fontSize:18.0
                        )
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              SizedBox(width: 10.0,),
            ],
          ),
          IntrinsicWidth(
            child: Column(
                children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                        'Race: ',
                        style: TextStyle(
                          fontSize:18.0,
                          fontWeight: FontWeight.bold,
                        )
                    ),
                    Text(
                        character.race,
                        style: TextStyle(
                            fontSize:18.0
                        )
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                        'Level: ',
                        style: TextStyle(
                          fontSize:18.0,
                          fontWeight: FontWeight.bold,
                        )
                    ),
                    Text(
                        character.level.toString(),
                        style: TextStyle(
                            fontSize:18.0
                        )
                    ),
                  ],
                ),
              ]
            ),
          ),
        ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Characters',
          style: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'GrenzeGotisch',
          ),
        ),
        backgroundColor: Colors.brown,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: characters.map((character) => characterTemplate(character)).toList(),
        ),
      ),
      /*
      body: Column(
          children: <Widget>[
            characterTemplate(character),
          ],
      ),*/
      backgroundColor: Colors.grey[800],
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.brown,
        onPressed: () => {
          randomize(),
        },
      ),
    );
  }


}

