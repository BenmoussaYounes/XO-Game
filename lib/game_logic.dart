import 'dart:math';

class Player {
  static const x = 'X';
  static const o = 'O';
  static const empty = '';

  static List<int> playerx = [];
  static List<int> playero = [];
}

extension ContainAll on List {
  bool containAll(int x, int y, [z]) {
    if (z == null) {
      return contains(x) && contains(y);
    } else {
      return contains(x) && contains(y) && contains(z);
    }
  }
}

class Game {
  void playgame(int index, String activePlayer) {
    if (activePlayer == 'X') {
      Player.playerx.add(index);
    } else {
      Player.playero.add(index);
    }
  }

  String checkWinner() {
    String winner = '';
    if (Player.playerx.containAll(0, 1, 2) ||
        Player.playerx.containAll(3, 4, 5) ||
        Player.playerx.containAll(6, 7, 8) ||
        Player.playerx.containAll(0, 3, 6) ||
        Player.playerx.containAll(2, 5, 7) ||
        Player.playerx.containAll(0, 1, 2) ||
        Player.playerx.containAll(8, 2, 5) ||
        Player.playerx.containAll(0, 4, 7) ||
            Player.playerx.containAll(1, 4, 7) ||
        Player.playerx.containAll(2, 4, 6)) winner = 'X is Winner :D';
        else if (Player.playero.containAll(0, 1, 2) ||
        Player.playero.containAll(3, 4, 5) ||
        Player.playero.containAll(6, 7, 8) ||
        Player.playero.containAll(0, 3, 6) ||
           Player.playero.containAll(1, 4, 7) ||
        Player.playero.containAll(2, 5, 7) ||
        Player.playero.containAll(8, 2, 5) ||
        Player.playero.containAll(0, 4, 7) ||
        Player.playero.containAll(2, 4, 6)) winner = 'O is Winner :D';
        else winner='';
    return winner;
  }

  Future autoPlay(String activePlayer) async {
    List<int> emptyCells = [];
    int index = 0;
    for (int i = 0; i < 9; i++) {
      if (!Player.playero.contains(i) && !Player.playerx.contains(i)) {
        emptyCells.add(i);
      }
    }
    Random _random = Random();
    int randomIndex = _random.nextInt(emptyCells.length);
    index = emptyCells[randomIndex];
    playgame(index, activePlayer);
  }
}
