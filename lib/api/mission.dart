import 'package:metu_app/model/do/mission_list_req.dart';
import 'package:metu_app/model/do/mission_list_res.dart';
import 'package:metu_app/model/do/mission_update_req.dart';
import 'package:metu_app/utils/logger/index.dart';

import '../model/do/mission_update_res.dart';
import '../utils/request/axios_entity.dart';

class MissionApi {
  static Future<MissionListResponse?> getMissionList(MissionListRequest missionListRequest) async {
    var res = await AxiosEntity.get('mission/queryByUser', params: missionListRequest.toMap());
    MissionListResponse resStrict = MissionListResponse.fromJson(res);
    return resStrict;
  }

  static Future<MissionUpdateResponse?> updateMissionStatus(MissionUpdateRequest missionUpdateRequest) async {
    Console.log(missionUpdateRequest.missionId);
    var res = await AxiosEntity.post('mission/update', data: missionUpdateRequest.toMap());
    Console.log(res);
    MissionUpdateResponse resStrict = MissionUpdateResponse.fromJson(res);
    return resStrict;
  }
}