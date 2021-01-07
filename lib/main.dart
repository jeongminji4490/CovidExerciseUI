import 'dart:async';
//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//앱 시작 부분
void main() {
  //SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  runApp(MyApp());
}

//시작 클래스, 머터리얼 디자인 앱 생성
class MyApp extends StatelessWidget { //StatelessWidget: 상태를 가지지 않음, 한 번 그려진 후 다시 그리지 않음

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) { //build: 화면에 그릴 위젯을 작성해 반환
    return MaterialApp(
      title: 'FlutterCovid19App', //제목
      theme: ThemeData(

        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: '코로나 확 찐자 운동관리'),
    );
  }
}

//시작 클랴스가 실제로 표시하는 클래스, 카운터 앱 화면
class MyHomePage extends StatefulWidget { //상태가 있는 위젯
  MyHomePage({Key key, this.title}) : super(key: key); //key와 title 프로퍼티를 옵션으로 받아서 super 키워드로 부모 클래스의 생성자에 key를 전달

  // always marked "final".

  final String title; //생성자의 this.title이 여기에 대입됨

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


//위 MyHomePage의 상태를 나타내는 클래스
class _MyHomePageState extends State<MyHomePage> { //보통 이 클래스에서 모든 코드가 작성됨,State클래스를 속성받은 상태 클래스(상태 변경 가능)

  //화면에 UI를 그리는 메서드, 그려질 위젯을 반환
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset : false,
        backgroundColor: Colors.lightBlue,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, //앱 가운데 정렬
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          Container(
            width: 150.0,
            height: 150.0,
            margin: EdgeInsets.only(left: 20.0,top: 40),
            child: Image.asset('images/diet.png'),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            '환영합니다.',
            style: TextStyle(
              fontSize: 22.0,
              fontStyle: FontStyle.normal,
              color: Colors.white,
            ),
          ),
          Text(
            '오늘도 즐겁게 운동해요!',
            style: TextStyle(
              fontSize: 17.0,
              fontStyle: FontStyle.normal,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          Container(
            margin: EdgeInsets.only(left: 30,right: 30), //화면과의 간격을 위해 상위 클래스인 Container의 margin사용
            child: TextField(
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white,width: 1)
                ),
                labelText: 'ID',
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Container(
            margin: EdgeInsets.only(left: 30,right: 30),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white,width: 1)
                ),
                labelText: 'password',
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Container(
            width: 300,
            height: 60,
            child: FlatButton(
              child: Text('로그인',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()),);
              },
              color: Colors.white,
              textColor: Colors.lightBlue,
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('SNS 로그인',style: TextStyle(fontSize: 15,color: Colors.white)),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: Text('SNS 로그인'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: 40,
                                      height: 40,
                                      margin: EdgeInsets.only(left: 8),
                                      child: InkWell(
                                        child: Image.asset('images/search.png'),
                                        onTap: (){},
                                      ),
                                    ),
                                    Container(
                                      width: 40,
                                      height: 40,
                                      margin: EdgeInsets.only(left: 20),
                                      child: InkWell(
                                        child: Image.asset('images/kakao-talk.png'),
                                        onTap: (){},
                                      ),
                                    ),
                                    Container(
                                      width: 40,
                                      height: 40,
                                      margin: EdgeInsets.only(left: 20),
                                      child: InkWell(
                                        child: Image.asset('images/facebook.png'),
                                        onTap: (){},
                                      ),
                                    ),
                                    Container(
                                      width: 40,
                                      height: 40,
                                      margin: EdgeInsets.only(left: 20),
                                      child: InkWell(
                                        child: Image.asset('images/twitter.png'),
                                        onTap: (){},
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('OK'),
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        );
                    }
                  );
                },
              ),
              FlatButton(
                child: Text('회원가입',style: TextStyle(fontSize: 15)),
                textColor: Colors.white,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Join1()), //MaterialPageRoute : 새로운 라우트로 이동시 특화된 애니메이션을 사용하기 좋음
                  );
                },
              )
            ],
          )
        ],
      )
    );
  }
}

class Join1 extends StatelessWidget{

  @override
  Widget build(BuildContext context){

    return Scaffold(
      resizeToAvoidBottomInset : false, //Bottom overflowed by xx fixels 오류 해결
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text('Step 1. 기본정보 입력'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly, //앱 가운데 정렬
        children: <Widget> [
          Container(
            width: 170,
            height: 170,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            margin: EdgeInsets.only(top: 40),
            child: InkWell(
              child: Image.asset('images/gallery.png'),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Icon(
                Icons.face,
                color: Colors.white,
                size: 30.0,
              ),
              Container(
                width: 235.0,
                height: 60.0,
                margin: EdgeInsets.only(left: 10),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'ID',
                      hintStyle: TextStyle(color: Colors.white)
                    ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.lock,
                color: Colors.white,
                size: 30.0,
              ),
              Container(
                width: 235.0,
                height: 60.0,
                margin: EdgeInsets.only(left:10),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.white)
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.lock,
                color: Colors.white,
                size: 30.0,
              ),
              Container(
                width: 235.0,
                height: 60.0,
                margin: EdgeInsets.only(left:10),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.white)
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.phone,
                color: Colors.white,
                size: 30.0,
              ),
              Container(
                width: 235.0,
                height: 60.0,
                margin: EdgeInsets.only(left:10),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: 'Phone Number',
                      hintStyle: TextStyle(color: Colors.white)
                  ),
                ),
              )
            ]
          ),
          SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                width: 80,
                height: 80,
                margin: EdgeInsets.only(right: 35),
                child: InkWell(
                  child: Image.asset('images/next-button.png'),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>_Join2()));
                  }
                  ),
                ),
               ]
              )
            ],
          )
      );

  }
}

class _Join2 extends StatefulWidget{

  @override
  Join2 createState() => Join2();

}

class Join2 extends State<_Join2> {

  @override
  Widget build(BuildContext context){

    return Scaffold(
      resizeToAvoidBottomInset : false, //Bottom overflowed by xx fixels 오류 해결
        backgroundColor: Colors.lightBlue,

      appBar: AppBar(
        title: Text('Step 2. BMI 수치 입력'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(

        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 60.0,left: 55.0),
                child: Text(
                  '1. 이미지로 등록',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontStyle: FontStyle.normal,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 60.0,left: 40.0),
                child: Icon(
                  Icons.photo,
                  color: Colors.white,
                  size: 60.0,
                )
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 40.0,left: 55.0),
                child: Text(
                    '2. 직접 입력',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontStyle: FontStyle.normal,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 10.0),
                child: Text(
                  '신장',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontStyle: FontStyle.normal,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                width: 50,
                height: 10,
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 40.0),
                child: Text(
                  'cm',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontStyle: FontStyle.normal,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 10.0),
                child: Text(
                  '체중',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontStyle: FontStyle.normal,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                width: 55,
                height: 10,
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 40.0),
                child: Text(
                  'kg',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontStyle: FontStyle.normal,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 100.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text(
                  'BMI 수치 계산 결과: ',
                  style: TextStyle(
                    fontSize: 23.0,
                    fontStyle: FontStyle.normal,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                child: Text(
                  '0.0 [적정]',
                  style: TextStyle(
                    fontSize: 23.0,
                    fontStyle: FontStyle.normal,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 38.0),
                child: Text(
                  '목표 BMI 수치: ',
                  style: TextStyle(
                    fontSize: 23.0,
                    fontStyle: FontStyle.normal,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 47.0),
                child: Text(
                  '0.0 [적정]',
                  style: TextStyle(
                    fontSize: 23.0,
                    fontStyle: FontStyle.normal,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 80.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                width: 80,
                height: 80,
                margin: EdgeInsets.only(right: 35),
                child: InkWell(
                  child: Image.asset('images/check.png'),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));
                  },
                ),
              )
            ],
          ),
        ],
      )
    );
  }
}

//---progress bar 구현중에 에러 많아서 일단 놔둠!
class DataLoading extends StatefulWidget{

  @override
  _DataLoading createState()=>_DataLoading();
}

class _DataLoading extends State<DataLoading>{

  double _progress = 0.0;

  void startTimer(){
    new Timer.periodic(
        Duration(milliseconds: 100),
            (Timer timer) => setState(
                () {
              if(_progress == 1 && mounted){
                timer.cancel();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));
              }
              else{
                _progress=_progress+0.01;
              }
            }
        ));
  }


  Widget build(BuildContext context){

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.all(20),
              child: LinearProgressIndicator(
                value: _progress,
                valueColor: AlwaysStoppedAnimation(Colors.lightBlue),
                backgroundColor: Colors.greenAccent,
                minHeight: 30,
              )
          ),
          FlatButton(
            color: Colors.greenAccent,
            child: Text('버튼'),
            onPressed: (){
              startTimer();
              },
          )
        ],
    );
  }
}
//-------------------//


class MainPage extends StatelessWidget{

  @override
  Widget build(BuildContext context){

    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text('홈'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      drawer: Drawer( //메뉴바 리스트
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightBlue,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.circle,
                    size: 60.0,
                    color: Colors.white,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 45.0),
                        child: Text(
                            '이름',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 5.0),
                            child: InkWell(
                              child: Icon(
                                Icons.bookmark,
                                color: Colors.white,
                                size: 20.0,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5.0),
                            child: Text(
                              '내 정보 관리',
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.cast_for_education,color: Colors.lightBlue),
              title: Text('1:1 PT',style: TextStyle(color: Colors.lightBlue,fontWeight: FontWeight.bold),),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.food_bank,color: Colors.lightBlue),
              title: Text('식단 일기',style: TextStyle(color: Colors.lightBlue,fontWeight: FontWeight.bold),),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.chat,color: Colors.lightBlue),
              title: Text('메신저',style: TextStyle(color: Colors.lightBlue,fontWeight: FontWeight.bold),),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.calendar_today,color: Colors.lightBlue),
              title: Text('일정 관리',style: TextStyle(color: Colors.lightBlue,fontWeight: FontWeight.bold),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SchedulePage()),);
              },
            ),
            ListTile(
              leading: Icon(Icons.festival,color: Colors.lightBlue),
              title: Text('이벤트',style: TextStyle(color: Colors.lightBlue,fontWeight: FontWeight.bold),),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings,color: Colors.lightBlue),
              title: Text('설정',style: TextStyle(color: Colors.lightBlue,fontWeight: FontWeight.bold),),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.add_alert,color: Colors.lightBlue),
              title: Text('공지사항',style: TextStyle(color: Colors.lightBlue,fontWeight: FontWeight.bold),),
              onTap: () {},
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar( //바닥 메뉴바
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.lightBlue,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        items: [ //메뉴바 아이템은 적어도 2개 이상!
          BottomNavigationBarItem(
            title: Text('내정보',style: TextStyle(color: Colors.white)),
            icon: Icon(Icons.face,color: Colors.white),
          ),
          BottomNavigationBarItem(
            title: Text('그래프',style: TextStyle(color: Colors.white)),
            icon: Icon(Icons.leaderboard,color: Colors.white),
          ),
          BottomNavigationBarItem(
            title: Text('알람',style: TextStyle(color: Colors.white)),
            icon: Icon(Icons.alarm,color: Colors.white),
          ),
          BottomNavigationBarItem(
            title: Text('찜한 운동',style: TextStyle(color: Colors.white)),
            icon: Icon(Icons.favorite,color: Colors.white),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 70.0,top: 30),
            child: Text(
              '목표 달성까지',
              style: TextStyle(
                fontSize: 25.0,
                fontStyle: FontStyle.normal,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 70,top: 10.0),
            child: Text(
              '0.0!',
              style: TextStyle(
                fontSize: 50.0,
                fontStyle: FontStyle.normal,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            width: 230.0,
            height: 230.0,
            margin: EdgeInsets.only(left: 65.0,top: 10.0),
            child: Image.asset('images/weighing-machine.png'),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            width: 200.0,
            height: 50.0,
            margin: EdgeInsets.only(left: 65,top: 30.0),
            child: RaisedButton(
              child: Text('운동하러 가기',style: TextStyle(fontSize: 20.0,color: Colors.lightBlue,fontWeight: FontWeight.bold),),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ExercisePage()));
              },
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class ExercisePage extends StatelessWidget{

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Text('운동하기'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.lightBlue,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        items: [
          BottomNavigationBarItem(
            title: Text('운동 목록',style: TextStyle(color: Colors.white)),
            icon: Icon(Icons.line_weight,color: Colors.white),
          ),
          BottomNavigationBarItem(
            title: Text('추천 운동',style: TextStyle(color: Colors.white)),
            icon: Icon(Icons.medical_services,color: Colors.white),
          )
        ],
      ),
    );
  }
}

class SchedulePage extends StatelessWidget{


  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Text('일정 관리'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
    );
  }
}
