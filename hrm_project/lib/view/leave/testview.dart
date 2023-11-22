import 'package:flutter/material.dart';

class test_view extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[800], // 배경색 설정
        body: Center(
          child: Card(
            color: Colors.blue[800], // 카드의 배경색도 같게 설정
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // 모서리를 둥글게
            ),
            child: Container(
              width: 200,
              height: 400,
              padding: EdgeInsets.all(20), // 내부 여백 설정
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.home, size: 64, color: Colors.white), // 아이콘 추가
                  SizedBox(height: 10), // 아이콘과 텍스트 사이 간격
                  Text(
                    'HOMER',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10), // 두 줄 텍스트 사이 간격
                  Text(
                    'Join anywhere, book anything\nand anytime.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
