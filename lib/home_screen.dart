import 'package:flutter/material.dart';
import 'game_logic.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  String activePlayer = 'X';
  bool gameover = false;
  int turn = 0;
  String result = 'loser';
  Game game = Game();
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
          child: Column(
        children: [
          SwitchListTile.adaptive(
              title: const Text(
                'Turn on/off two player mode',
                style: TextStyle(fontSize: 28, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              value: isSwitched,
              onChanged: (val) {
              
                setState(() {
                  isSwitched = val;
         
                });
              }),
          Text(
            "It's $activePlayer turn".toUpperCase(),
            style: const TextStyle(fontSize: 38, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: GridView.count(
                padding: const EdgeInsets.all(16),
                crossAxisCount: 3,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 1.0,
                children: List.generate(
                  9,
                  (index) => InkWell(
                       borderRadius: BorderRadius.circular(16),
                    onTap: gameover?null:()=>_ontap(index),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).shadowColor,
                          borderRadius: BorderRadius.circular(16)),
                      child:  Center(
                        child:  Text(
                          Player.playerx.contains(index)?Player.x
                          :Player.playero.contains(index)?Player.o:Player.empty,
                          style:
                               TextStyle(fontSize: 52, color: Player.playerx.contains(index)?Colors.blue
                          :Colors.pink),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                )),
          ),
          Text(
            result,
            style: const TextStyle(fontSize: 28, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                Player.playerx=[];
                Player.playero=[];
                activePlayer = 'X';
                gameover = false;
                turn = 0;
                result = '';

                isSwitched = false;
              });
            },
            icon: const Icon(Icons.replay),
            label: const Text('Repeat the game'),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).splashColor)),
          )
        ],
      )),
    );
  }
  
  _ontap(int index) async{
  
if(!Player.playerx.contains(index)&&!Player.playero.contains(index)){
    game.playgame(index,activePlayer);
    updateState(index);     
     }
       if(!isSwitched&&!gameover){
      await  game.autoPlay(activePlayer);
      updateState(index);
      }
     }

   updateState(int index) {  
   setState(() {
    activePlayer =(activePlayer=='X')?'O':'X';
    turn++;
    String winnerPlayer= game.checkWinner();
    if(winnerPlayer!=''){
      gameover=true;
      result=winnerPlayer+'is the Winner ! :D';
    }else if(!gameover && turn==9){
      result = 'it\' a Draw ! ';
    }
  });
  
  }
}
