// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:readwithmint/models/webtoons.dart';

class WebtoonsApi {
  static Future<List<Webtoons>> getWebtoon() async {
    var uri = Uri.https('manga-scrapper.p.rapidapi.com', '/webtoons',
        {'provider': 'surya', 'page': '1', 'limit': '10'});

    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': '7dbbda4bb7mshce3f22880e914fcp1528ddjsnbeb6619e5c9b',
      'X-RapidAPI-Host': 'manga-scrapper.p.rapidapi.com',
    });

    if (response.statusCode == 200) {
      // แยกวิเคราะห์การตอบสนอง JSON เป็นรายการ <ไดนามิก>
      List<dynamic> data = jsonDecode(response.body);

      // สร้างรายการ Webtoons จากข้อมูล JSON
      List<Webtoons> Webtoon =
          data.map((item) => Webtoons.fromJson(item)).toList();

      return Webtoon;
    } else {
      // หากคำขอล้มเหลว ให้ส่งข้อยกเว้นหรือจัดการข้อผิดพลาดอย่างเหมาะสม
      throw Exception('Failed to load recipes');
    }
  }
}
