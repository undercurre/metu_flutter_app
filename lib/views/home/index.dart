import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:metu_app/api/mission.dart';
import 'package:metu_app/model/do/mission_list_req.dart';
import 'package:metu_app/model/do/mission_list_res.dart';
import 'package:metu_app/utils/storage/index.dart';
import 'package:metu_app/utils/logger/index.dart';

import '../../model/entity/mission.dart';
import '../../model/entity/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<Mission> missionList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPage();
  }

  initPage() async {
    User userInfo = User.fromJson(json.decode(LocalStorage.getItem('userInfo')));
    MissionListRequest missionListRequest = MissionListRequest(userInfo.userId);
    MissionListResponse? missionsRes = await MissionApi.getMissionList(missionListRequest);
    Console.log(missionsRes);
  }

  @override
  Widget build(BuildContext context) {

    Widget divider1=const Divider(color: Colors.blue);
    Widget divider2=const Divider(color: Colors.green);

    return Scaffold(
      appBar: AppBar( //导航栏
        title: Text(dotenv.get('appName')),
      ),
      body: ListView.separated(
        itemCount: 100,
        //列表项构造器
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text("$index"));
        },
        //分割器构造器
        separatorBuilder: (BuildContext context, int index) {
          return index%2==0?divider1:divider2;
        },
      ),
    );
  }
}