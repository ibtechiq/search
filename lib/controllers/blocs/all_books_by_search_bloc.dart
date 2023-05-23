import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:rxdart/rxdart.dart';
import 'package:search/models/search_model.dart';
import '../../common/api_constants.dart';

class AllBooksBySearchBLoC {
  final _searchSubject = BehaviorSubject<UnmodifiableListView<SearchModel>>();
////////////////////////////////////////////////////////////
  List<SearchModel> _searchList = [];
////////////////////////////////////////////////////////////
  Stream<UnmodifiableListView<SearchModel>> get searchBooks =>
      _searchSubject.stream;
////////////////////////////////////////////////////////////
  Future<List<SearchModel>> _getAllBooksBySearch(
      {required String search}) async {
      var temp = <SearchModel>[];
      var body = <String, String>{
        'value': search
      };
      var headers = <String, String>{
        'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNGJhODEyZDdmYjEyNDBlNTRiODkzNTRiOGIyY2QzNjRiN2JlOWI4MmI2ZGI0NjlhMjQ2MGFiNjVhYzM5YjU5ODExYzYyZjg1Y2YyN2MxODgiLCJpYXQiOjE2ODQ0MDI5NjAuMDkyNjM5OTIzMDk1NzAzMTI1LCJuYmYiOjE2ODQ0MDI5NjAuMDkyNjQyMDY4ODYyOTE1MDM5MDYyNSwiZXhwIjoxNzE2MDI1MzYwLjA4NzEzMjkzMDc1NTYxNTIzNDM3NSwic3ViIjoiNzI3Iiwic2NvcGVzIjpbXX0.V8vflU1KOBAtRvABI0j6nna_Aeh8nl0wLkqAGBstSJ13DbCZmEXHnGpVV9RltvGMWkBjD-uSuIzK9OIEaEYpVW88U2_xNuFjdsYWuTjV1hHFRr5hspzRpzg9sk_m6TbBdPvOhFdZz0TyMNeNdfgCSg4XMO4Evoi-GRA0-lWcifQLfwTHe5yM_D3wUQBs_Z5iC_HLszB-JX-RacmtuGXlFfoWQbzPFL_7a3Ph9ylQ60KWDYA2cyPpjbCTqLMp5m0Zf3uqQEH8deZzBKFs3Gg8852IHUwcfWJiiJn7ntyNQ-m_iRDQB-Yew2tkpUqO_6jwbe7BAo0gei6HPgeKUfeXU4rEw4cy42T6QL6jX7H_5xxdb14UaD4-4AGyuoUcoDQ9p4Xpio01soU0OpFEPVMumk9_1QLQR5xU5jIN7QJmijs0BzySGKFrrIy2YdME27XfFZh0COihCPFSfo7PLNPPRcI9b3L18OjguhYFQa9iphmnc9lPM5y2m0YMYX8lC5oR0JASgSKjlU521b3p4HeWKQW8nLIJy5Uyvf-F54Tq_gMlvxpbShbhruePQNCe9hzQuTFbxhtC3vyd_W-e1kZg-xFcK38PHX6ve_aVrkw3dNLHGu1s7x_KMfcF7-8slTs8UjtAD7cQhHbmW9VtOExIpq8ipQHxFzIcT4MAz18SLJA'
      };
      var response = await post(getAllBooksBySearchApiUrl, body: body,headers: headers);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        List<dynamic> infoData = data['data'];
        if (infoData.isEmpty) {
          return _searchList;
        } else {
          temp = infoData.map((e) => SearchModel.fromJson(e)).toList();
          _searchList = temp;
        }
    }
    return _searchList;
  }
  ////////////////////////////////////////////////////////////
  Future<String> getAllBooksBySearchFuture({required String search}) async {
    _searchList.clear();
    await _getAllBooksBySearch(search: search).then(
            (_) => _searchSubject.add(UnmodifiableListView(_searchList)));
    return 'success';
  }
}
