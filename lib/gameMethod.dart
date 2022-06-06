import 'dart:math';

//전역변수 처리
class GameMethod {
  int playerScore = 0;
  int comScore = 0;
  int playerChoice = 0;
  int comChoice = 0;

//이미지 랜덤 변경
  void imgChange() {
    playerChoice = Random().nextInt(3) + 1;
    comChoice = Random().nextInt(3) + 1;
  }

  //랜덤하게 나온 결과를 통한 score
  void scoreResult() {
    //플레이어가 보 나왔을 때
    if (playerChoice == 1) {
      //컴퓨터도 보
      if (comChoice == 1) {
        print("비겼습니다!");
      }
      //컴퓨터 바위
      else if (comChoice == 2) {
        playerScore++;
        print("플레이어가 이겼습니다!");
      }
      //컴퓨터 가위
      else if (comChoice == 3) {
        comScore++;
        print("컴퓨터가 이겼습니다");
      }
    }
    //플레이어가 바위 나왔을 때
    else if (playerChoice == 2) {
      //컴퓨터 보
      if (comChoice == 1) {
        comScore++;
        print("컴퓨터가 이겼습니다!");
      }
      //컴퓨터 바위
      else if (comChoice == 2) {
        print("비겼습니다");
      }
      //컴퓨터 가위
      else if (comChoice == 3) {
        playerScore++;
        print("플레이어가 이겼습니다!");
      }
    }
    //플레이어가 가위 나왔을 때
    else if (playerChoice == 3) {
      //컴퓨터 보
      if (comChoice == 1) {
        playerScore++;
        print("플레이어가 이겼습니다!");
      }
      //컴퓨터 바위
      else if (comChoice == 2) {
        comScore++;
        print("컴퓨터가 이겼습니다!");
      }
      //컴퓨터 가위
      else if (comChoice == 3) {
        print("비겼습니다");
      }
    }
  }
}
