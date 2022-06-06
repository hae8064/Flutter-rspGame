import 'package:flutter/material.dart';
import 'gameMethod.dart' as gm;
import 'package:get/get.dart';

void main() {
  runApp(MainHome());
}

class MainHome extends StatefulWidget {
  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  gm.GameMethod gameclass = gm.GameMethod();
  List gameImgs = [
    "imgs/question.png",
    "imgs/paper.png",
    "imgs/rock.jpg",
    "imgs/scissor.png"
  ];
  int myScore = 0;
  int comScore = 0;
  //이미지 리스트 인덱스
  int myChoice = 0;
  int comChoice = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "가위바위보 게임",
      home: Scaffold(
        appBar: AppBar(
          title: Text("가위바위보 게임"),
        ),
        // extendBodyBehindAppBar: true, //appbar 바디 위에 겹치기
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${myScore} : ",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${comScore}",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Container(
                          child: Column(
                            children: [
                              Text(
                                "Player",
                                style: TextStyle(fontSize: 25),
                              ),
                              Image.asset(
                                gameImgs[myChoice],
                                fit: BoxFit.fill,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            children: [
                              Text(
                                "Computer",
                                style: TextStyle(fontSize: 25),
                              ),
                              Image.asset(gameImgs[comChoice],
                                  fit: BoxFit.fill),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    child: Text(
                      "Start",
                      style: TextStyle(fontSize: 25),
                    ),
                    onPressed: () {
                      print("게임시작~");
                      setState(() {
                        gameclass.imgChange();
                        gameclass.scoreResult();

                        //이미지 변환
                        myChoice = gameclass.playerChoice;
                        comChoice = gameclass.comChoice;
                        //점수 변환
                        myScore = gameclass.playerScore;
                        comScore = gameclass.comScore;

                        whoWin();
                      });
                    }),
                ElevatedButton(
                    child: Text(
                      "Reset",
                      style: TextStyle(fontSize: 25),
                    ),
                    onPressed: () {
                      setState(() {
                        gameclass.playerScore = 0;
                        gameclass.comScore = 0;
                        print("다시하기!");
                        myChoice = 0;
                        comChoice = 0;
                        myScore = gameclass.playerScore;
                        comScore = gameclass.comScore;
                      });
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  //3판2선승 누가 이겼는지 출력
  void whoWin() {
    //내가 3점 먼저 땀
    if (myScore == 3) {
      Get.dialog(
        AlertDialog(
          title: Text("결과는?"),
          content: Text("Player가 승리하였습니다."),
          actions: [
            TextButton(
                onPressed: () {
                  gameclass.playerScore = 0;
                  gameclass.comScore = 0;
                  print("확인!");
                  myChoice = 0;
                  comChoice = 0;
                  myScore = gameclass.playerScore;
                  comScore = gameclass.comScore;
                  Get.back();
                },
                child: Text("확인"))
          ],
        ),
      );
    }
    // 컴퓨터가 먼저 3점 땀
    else if (comScore == 3) {
      Get.dialog(
        AlertDialog(
          title: Text("결과는?"),
          content: Text("Computer가 승리하였습니다."),
          actions: [
            TextButton(
                onPressed: () {
                  gameclass.playerScore = 0;
                  gameclass.comScore = 0;
                  print("확인!");
                  myChoice = 0;
                  comChoice = 0;
                  myScore = gameclass.playerScore;
                  comScore = gameclass.comScore;
                  Get.back();
                },
                child: Text("확인"))
          ],
        ),
      );
    }
  }
}
