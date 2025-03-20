import 'package:get/get.dart';
import 'package:metro_app/sta_tg.dart';

class Stations extends GetxController {
  //line 1 in metro
  List<String> line_1 = [
    'helwan',
    'ain helwan',
    'helwan university',
    'wadi hof',
    'hadayek helwan',
    'el-maasara',
    'tora el-asmant',
    'kozzika',
    'tora el-balad',
    'sakanat el-maadi',
    'maadi',
    'hadayek el-maadi',
    'dar el-salam',
    'el-zahraa',
    'mar girgis',
    'el-malek el-saleh',
    'el-sayeda zeinab',
    'saad zaghloul',
    'sadat',
    'nasser',
    'orabi',
    'al-shohadaa',
    'ghamra',
    'el-demerdash',
    'manshiet el-sadr',
    'kobri el-qobba',
    'hammamat el-qobba',
    'saray el-qobba',
    'hadayek el-zaitoun',
    'helmeyet el-zaitoun',
    'el-matareyya',
    'ain shams',
    'ezbet el-nakhl',
    'el-marg',
    'new el-marg'
  ];

//line 2 in metro
  List<String> line_2 = [
    'shubra el-kheima',
    'kolleyet el-zeraa',
    'mezallat',
    'khalafawy',
    'st.teresa',
    'rod el-farag',
    'masarra',
    'al-shohadaa',
    'attaba',
    'mohamed naguib',
    'sadat',
    'dokki',
    'opera',
    'bohooth',
    'cairo university',
    'faisal',
    'giza',
    'om el-masryeen',
    'sakiat mekky',
    'el-mounib'
  ];

//line 3 in metro
  List<String> line_3 = [
    'adly mansour',
    'el-haykestep',
    'omar ibn el-khattab',
    'qobaa',
    'hesham barakat',
    'el-nozha',
    'nadi el-shams',
    'alf maskan',
    'heliopolis',
    'haroun',
    'al-ahram',
    'kolleyet el-banat',
    'stadium',
    'fair zone',
    'abbassiya',
    'abdou pasha',
    'el-geish',
    'bab el-shaaria',
    'attaba',
    'nasser',
    'maspero',
    'zamalek',
    'kit kat'
  ];

//this place in right of end line 3 ,you can look in the map and you will find it
  List<String> right_3 = [
    'al-sodan',
    'embaba',
    'al-bohe',
    'ah-kwmia',
    'al-daary road',
    'rod al-farag'
  ];

//this place in right of end line 3 ,you can look in the map and you will find it
  List<String> left_3 = [
    'al-twfikia',
    'wady al-nil',
    'al-dwal university',
    'bolak',
    'cairo university'
  ];

  List<Station> statoin = [
    Station(
        name: "shubra el-kheima",
        late: 30.123098565201634,
        long: 31.244280723342392,
        link:
            "https://www.google.com/maps/dir/30.1786623,31.2285491/%D9%85%D8%AD%D8%B7%D8%A9+%D9%85%D8%AA%D8%B1%D9%88+%D8%B4%D8%A8%D8%B1%D8%A7+%D8%A7%D9%84%D8%AE%D9%8A%D9%85%D9%87,+22+%D8%A7%D9%84%D8%AA%D8%B1%D8%B9%D8%A9+%D8%A7%D9%84%D8%A8%D9%88%D9%84%D8%A7%D9%82%D9%8A%D8%A9%D8%8C+%D8%AF%D9%85%D9%86%D9%87%D9%88%D8%B1+%D8%B4%D8%A8%D8%B1%D8%A7%D8%8C+%D9%82%D8%B3%D9%85+%D8%A3%D9%88%D9%84+%D8%B4%D8%A8%D8%B1%D8%A7+%D8%A7%D9%84%D8%AE%D9%8A%D9%85%D8%A9%D8%8C+%D9%85%D8%AD%D8%A7%D9%81%D8%B8%D8%A9+%D8%A7%D9%84%D9%82%D9%84%D9%8A%D9%88%D8%A8%D9%8A%D8%A9+6210338%E2%80%AD/@30.1554508,31.2346326,13z/data=!3m1!4b1!4m19!1m8!3m7!1s0x14586bcaf494f9f1:0xa5efbed0d93906b5!2z2YXYrdi32Kkg2YXYqtix2Ygg2LTYqNix2Kcg2KfZhNiu2YrZhdmH!8m2!3d30.1241402!4d31.2433017!15sChrZhdit2LfZhyDZhdiq2LHZiCDYtNio2LHYp5IBGm1ldHJvcG9saXRhbl90cmFpbl9jb21wYW554AEA!16s%2Fg%2F11j4tcxd6s!4m9!1m1!4e1!1m5!1m1!1s0x14586bcaf494f9f1:0xa5efbed0d93906b5!2m2!1d31.2433017!2d30.1241402!3e0?entry=ttu&g_ep=EgoyMDI1MDMxNy4wIKXMDSoJLDEwMjExNjM5SAFQAw%3D%3D"),
    Station(
        name: "kolleyet el-zeraa",
        late: 30.113882130732925,
        long: 31.24863771697479,
        link:
            "https://www.google.com/maps/dir/30.1786846,31.2285594/%D9%83%D9%84%D9%8A%D8%A9+%D8%A7%D9%84%D8%B2%D8%B1%D8%A7%D8%B9%D8%A9%D8%8C+%D8%B4%D8%A8%D8%B1%D8%A7+%D8%A7%D9%84%D8%AE%D9%8A%D9%85%D8%A9%D8%8C+%D9%82%D8%B3%D9%85+%D8%A3%D9%88%D9%84+%D8%B4%D8%A8%D8%B1%D8%A7+%D8%A7%D9%84%D8%AE%D9%8A%D9%85%D8%A9%D8%8C+%D9%85%D8%AD%D8%A7%D9%81%D8%B8%D8%A9+%D8%A7%D9%84%D9%82%D9%84%D9%8A%D9%88%D8%A8%D9%8A%D8%A9+6210201%E2%80%AD/@30.150789,31.2770869,13z/data=!3m1!4b1!4m18!1m7!3m6!1s0x14586aa7835c8017:0x2fa49891f589298!2z2YPZhNmK2Kkg2KfZhNiy2LHYp9i52Kk!8m2!3d30.1136919!4d31.2486699!16s%2Fg%2F121l5t0t!4m9!1m1!4e1!1m5!1m1!1s0x14586aa7835c8017:0x2fa49891f589298!2m2!1d31.2486699!2d30.1136919!3e0?entry=ttu&g_ep=EgoyMDI1MDMxNy4wIKXMDSoJLDEwMjExNjM5SAFQAw%3D%3D"),
    Station(
        name: "mezallat",
        late: 30.10435219853416,
        long: 31.245181536664138,
        link:
            "https://www.google.com/maps/dir/30.1786846,31.2285594/%D8%A7%D9%84%D9%85%D8%B8%D9%84%D8%A7%D8%AA%D8%8C+%D8%A3%D8%B3%D8%B9%D8%AF%D8%8C+%D8%A7%D9%84%D8%B3%D8%A7%D8%AD%D9%84%D8%8C+%D9%85%D8%AD%D8%A7%D9%81%D8%B8%D8%A9+%D8%A7%D9%84%D9%82%D8%A7%D9%87%D8%B1%D8%A9%E2%80%AC+4350229%E2%80%AD/@30.1041327,31.245769,20.12z/data=!4m18!1m8!3m7!1s0x1458401a02eede8f:0x15961923818c54d1!2z2KfZhNmF2LjZhNin2Ko!8m2!3d30.1041743!4d31.2456414!15sChBNZXphbGxhdCBzdGF0aW9ukgEOc3Vid2F5X3N0YXRpb27gAQA!16s%2Fg%2F1vpgzzvh!4m8!1m1!4e1!1m5!1m1!1s0x1458401a02eede8f:0x15961923818c54d1!2m2!1d31.2456414!2d30.1041743?entry=ttu&g_ep=EgoyMDI1MDMxNy4wIKXMDSoJLDEwMjExNjM5SAFQAw%3D%3D"),
    Station(
        name: "khalafawy",
        late: 30.09723198789446,
        long: 31.245497555006366,
        link:
            "https://www.google.com/maps/dir/30.1786632,31.228547/Khlfawy's+metro+station%D8%8C+Al+Khalafawi,%D8%AD%D8%A7%D8%B1%D8%A9+%D8%A3%D8%B3%D8%B9%D8%AF+%D8%B4%D8%A8%D8%B1%D8%A7%D8%8C+%D8%A7%D9%84%D8%B3%D8%A7%D8%AD%D9%84%E2%80%AD/@30.1424678,31.3179542,12z/data=!3m1!4b1!4m17!1m7!3m6!1s0x145840140800dc0d:0x208945e92503b0db!2sKhlfawy's+metro+station!8m2!3d30.0972289!4d31.2454981!16s%2Fg%2F11d_1pmqhw!4m8!1m1!4e1!1m5!1m1!1s0x145840140800dc0d:0x208945e92503b0db!2m2!1d31.2454981!2d30.0972289?entry=ttu&g_ep=EgoyMDI1MDMxNy4wIKXMDSoJLDEwMjExNjM5SAFQAw%3D%3D"),
    Station(
        name: "st. teresa",
        late: 30.087966572262022,
        long: 31.245491387021804,
        link:
            "https://www.google.com/maps/place/%D8%B3%D8%A7%D9%86%D8%AA+%D8%AA%D8%B1%D9%8A%D8%B2%D8%A7%E2%80%AD/@30.0879022,31.2457146,21z/data=!4m20!1m13!4m12!1m4!2m2!1d31.228547!2d30.1786632!4e1!1m6!1m2!1s0x1458406c0002fb41:0x9959722226caaf3a!2z2LPYp9mG2Kog2KrYsdmK2LLYp9iMINi02LHZitmB2Iwg2KfZhNiz2KfYrdmE2Iwg2YXYrdin2YHYuNipINin2YTZgtin2YfYsdip4oCsIDQzNTIyMDI!2m2!1d31.2454927!2d30.0879569!3m5!1s0x1458406c0002fb41:0x9959722226caaf3a!8m2!3d30.0879569!4d31.2454927!16s%2Fg%2F1xpt1501?entry=ttu&g_ep=EgoyMDI1MDMxNy4wIKXMDSoJLDEwMjExNjM5SAFQAw%3D%3D"),
    Station(
        name: "rod el-farag",
        late: 30.10190401299639,
        long: 31.184398999134125,
        link:
            "https://www.google.com/maps/place/Rod+Al+Farag+Metro+Station/@30.1342685,31.3179542,12z/data=!4m20!1m13!4m12!1m4!2m2!1d31.228547!2d30.1786632!4e1!1m6!1m2!1s0x1458406678f65d89:0x7ac10d2ba68300ec!2zUm9kIEFsIEZhcmFnIE1ldHJvIFN0YXRpb24sINin2YTYqNix2KfYr9iMINin2YTYs9in2K3ZhNiMINmF2K3Yp9mB2LjYqSDYp9mE2YLYp9mH2LHYqeKArCA0MzUyMDAz!2m2!1d31.24538!2d30.080608!3m5!1s0x1458406678f65d89:0x7ac10d2ba68300ec!8m2!3d30.080608!4d31.24538!16s%2Fg%2F11qk5ycqk5?entry=ttu&g_ep=EgoyMDI1MDMxNy4wIKXMDSoJLDEwMjExNjM5SAFQAw%3D%3D"),
    Station(
        name: "masarra",
        late: 30.072007610639766,
        long: 31.245016940016153,
        link:
            "https://www.google.com/maps/place/Massara+Station+Subway/@30.1294727,31.3179542,12z/data=!4m20!1m13!4m12!1m4!2m2!1d31.228547!2d30.1786632!4e1!1m6!1m2!1s0x1458408a04eca851:0xd05fdb45e72154aa!2zTWFzc2FyYSBTdGF0aW9uIFN1YndheSwgMzZDVytRMkPYjCDYrNiy2YrYsdipINio2K_Ysdin2YbYjCDYtNio2LHYp9iMINmF2K3Yp9mB2LjYqSDYp9mE2YLYp9mH2LHYqeKArCA0MzQyMTEw!2m2!1d31.2450181!2d30.0719364!3m5!1s0x1458408a04eca851:0xd05fdb45e72154aa!8m2!3d30.0719364!4d31.2450181!16s%2Fg%2F11f_1j3x4s?entry=ttu&g_ep=EgoyMDI1MDMxNy4wIKXMDSoJLDEwMjExNjM5SAFQAw%3D%3D"),
    Station(
        name: "al-shohadaa",
        late: 30.061372074913507,
        long: 31.246166488651753,
        link:
            "https://www.google.com/maps/place/%D8%A7%D9%84%D8%B4%D9%87%D8%AF%D8%A7%D8%A1%E2%80%AD/@30.1183595,31.3178076,12z/data=!4m20!1m13!4m12!1m4!2m2!1d31.228547!2d30.1786632!4e1!1m6!1m2!1s0x14584091f04331b9:0x68a071d449d650f0!2z2KfZhNi02YfYr9in2KHYjCDYp9mE2KzZitin2LHYqdiMINin2YTYo9iy2KjZg9mK2KnYjCDZhdit2KfZgdi42Kkg2KfZhNmC2KfZh9ix2KnigKwgNDMyMDE1MQ!2m2!1d31.2460506!2d30.0610714!3m5!1s0x14584091f04331b9:0x68a071d449d650f0!8m2!3d30.0610714!4d31.2460506!16s%2Fg%2F1tff00kk?entry=ttu&g_ep=EgoyMDI1MDMxNy4wIKXMDSoJLDEwMjExNjM5SAFQAw%3D%3D"),
    Station(
        name: "attaba",
        late: 30.052531730585645,
        long: 31.24673862696359,
        link:
            "https://www.google.com/maps/place/%D8%A7%D9%84%D8%B9%D8%AA%D8%A8%D9%87%E2%80%AD/@30.0523425,31.4067432,11z/data=!4m20!1m13!4m12!1m4!2m2!1d31.228547!2d30.1786632!4e1!1m6!1m2!1s0x1458409615a1b5e7:0x519c1b193917ab43!2z2KfZhNi52KrYqNmH2Iwg2LrZiti3INin2YTYudiv2KnYjCDYudin2KjYr9mK2YbYjCDZhdit2KfZgdi42Kkg2KfZhNmC2KfZh9ix2KnigKwgNDI4NDAwMw!2m2!1d31.246803!2d30.052346!3m5!1s0x1458409615a1b5e7:0x519c1b193917ab43!8m2!3d30.052346!4d31.246803!16s%2Fg%2F12hs83fps?entry=ttu&g_ep=EgoyMDI1MDMxNy4wIKXMDSoJLDEwMjExNjM5SAFQAw%3D%3D"),
    Station(
        name: "mohamed naguib",
        late: 30.04533069748844,
        long: 31.244161888223914,
        link:
            "https://www.google.com/maps/place/Mohamed+Naguib+Metro+Station/@30.0882622,31.3253075,12z/data=!4m20!1m13!4m12!1m4!2m2!1d31.228547!2d30.1786632!4e1!1m6!1m2!1s0x145840b96aedafff:0xe3ac95702a40face!2z2YXYrdmF2K8g2YbYrNmK2KjYjCDYp9mE2KjZhNin2YLYs9ip2Iwg2LnYp9io2K_ZitmG2Iwg2YXYrdin2YHYuNipINin2YTZgtin2YfYsdip4oCsIDQyODIwMDE!2m2!1d31.2441623!2d30.0453216!3m5!1s0x145840b969cdea27:0x97d6bfa40e902cd2!8m2!3d30.045362!4d31.244032!16s%2Fg%2F11mgs2hf3b?entry=ttu&g_ep=EgoyMDI1MDMxNy4wIKXMDSoJLDEwMjExNjM5SAFQAw%3D%3D"),
    Station(
        name: "sadat",
        late: 30.04363448963182,
        long: 31.235860155469567,
        link:
            "https://www.google.com/maps/place/Sadat+Metro+Station/@30.113176,31.3178076,12z/data=!4m20!1m13!4m12!1m4!2m2!1d31.228547!2d30.1786632!4e1!1m6!1m2!1s0x145841dc3b3f902f:0x1adaa1d092ec38f3!2zU2FkYXQgTWV0cm8gU3RhdGlvbiwgMjZWUCtDOFjYjCDZhdmK2K_Yp9mGINin2YTYqtit2LHZitix2Iwg2YLYtdixINin2YTYr9mI2KjYp9ix2KnYjCDZgtiz2YUg2YLYtdixINin2YTZhtmK2YTYjCDZhdit2KfZgdi42Kkg2KfZhNmC2KfZh9ix2KnigKwgNDI3MjA3Nw!2m2!1d31.2358609!2d30.043622!3m5!1s0x145841dc3b3f902f:0x1adaa1d092ec38f3!8m2!3d30.043622!4d31.2358609!16s%2Fg%2F11fm_bxhlx?entry=ttu&g_ep=EgoyMDI1MDMxNy4wIKXMDSoJLDEwMjExNjM5SAFQAw%3D%3D"),
    Station(
        name: "dokki",
        late: 30.0384519833401,
        long: 31.21222446424741,
        link:
            "https://www.google.com/maps/place/%D8%A7%D9%84%D8%AF%D9%82%D9%8A%E2%80%AD/@30.0396096,31.2296248,15z/data=!4m20!1m13!4m12!1m4!2m2!1d31.228547!2d30.1786632!4e1!1m6!1m2!1s0x145846d4be99004d:0xc048d76eec8c637c!2z2KfZhNiv2YLZitiMINin2YTYr9mC2Yog2KPYjCDZgtiz2YUg2KfZhNiv2YLZitiMINmF2K3Yp9mB2LjYqSDYp9mE2KzZitiy2KkgMzc1MzAwMg!2m2!1d31.2122279!2d30.0384395!3m5!1s0x145846d4be99004d:0xc048d76eec8c637c!8m2!3d30.0384395!4d31.2122279!16s%2Fg%2F1219h4xk?entry=ttu&g_ep=EgoyMDI1MDMxNy4wIKXMDSoJLDEwMjExNjM5SAFQAw%3D%3D"),
    Station(
        name: "bohooth",
        late: 30.03579428860002,
        long: 31.200166048565258,
        link:
            "https://www.google.com/maps/place/%D8%A7%D9%84%D8%A8%D8%AD%D9%88%D8%AB%E2%80%AD/@30.0371419,31.2104901,15.77z/data=!4m20!1m13!4m12!1m4!2m2!1d31.228547!2d30.1786632!4e1!1m6!1m2!1s0x145846cec93456ef:0x347fa2ff254a38d4!2z2KfZhNio2K3ZiNir2Iwg2KfZhNiv2YLZitiMINmC2LPZhSDYp9mE2K_ZgtmK2Iwg2YXYrdin2YHYuNipINin2YTYrNmK2LLYqSAzNzUxMDMx!2m2!1d31.2001594!2d30.0357798!3m5!1s0x145846cec93456ef:0x347fa2ff254a38d4!8m2!3d30.0357798!4d31.2001594!16s%2Fg%2F1vb67q1n?entry=ttu&g_ep=EgoyMDI1MDMxNy4wIKXMDSoJLDEwMjExNjM5SAFQAw%3D%3D"),
    Station(
        name: "cairo university",
        late: 30.026019692441054,
        long: 31.20116048778759,
        link:
            "https://www.google.com/maps/place/%D8%AC%D8%A7%D9%85%D8%B9%D8%A9+%D8%A7%D9%84%D9%82%D8%A7%D9%87%D8%B1%D8%A9%E2%80%AD/@30.0374295,31.2249436,13.65z/data=!4m20!1m13!4m12!1m4!2m2!1d31.228547!2d30.1786632!4e1!1m6!1m2!1s0x145846c3ed04411f:0xbd516eee043d2c3!2z2KzYp9mF2LnYqSDYp9mE2YLYp9mH2LHYqdiMINio2YjZhNin2YIg2KfZhNiv2YPYsdmI2LHYjCDZhdit2KfZgdi42Kkg2KfZhNis2YrYstipIDM3MTYyMzA!2m2!1d31.2011598!2d30.0260066!3m5!1s0x145846c3ed04411f:0xbd516eee043d2c3!8m2!3d30.0260066!4d31.2011598!16s%2Fg%2F1tfhwwyb?entry=ttu&g_ep=EgoyMDI1MDMxNy4wIKXMDSoJLDEwMjExNjM5SAFQAw%3D%3D"),
    Station(
        name: "faisal",
        late: 30.017053674107743,
        long: 31.20397556963166,
        link:
            "http://google.com/maps/place/%D9%81%D9%8A%D8%B5%D9%84%E2%80%AD/@30.048601,31.278289,12.48z/data=!4m20!1m13!4m12!1m4!2m2!1d31.228547!2d30.1786632!4e1!1m6!1m2!1s0x145846e8ec5db851:0x130d30d6096adf14!2z2YHZiti12YTYjCDYo9io2Ygg2YLYqtin2K_YqdiMINio2YjZhNin2YIg2KfZhNiv2YPYsdmI2LHYjCDZhdit2KfZgdi42Kkg2KfZhNis2YrYstipIDM3MTYwMTI!2m2!1d31.203936!2d30.0173696!3m5!1s0x145846e8ec5db851:0x130d30d6096adf14!8m2!3d30.0173696!4d31.203936!16s%2Fg%2F1tf8b5nd?entry=ttu&g_ep=EgoyMDI1MDMxNy4wIKXMDSoJLDEwMjExNjM5SAFQAw%3D%3D"),
    Station(
        name: "giza",
        late: 30.01123054849492,
        long: 31.206549368811515,
        link:
            "https://www.google.com/maps/place/Giza+Metro+Station/@30.0416132,31.25864,12.75z/data=!4m20!1m13!4m12!1m4!2m2!1d31.228547!2d30.1786632!4e1!1m6!1m2!1s0x145846e559601187:0x9182d98855abf1c9!2zR2l6YSBNZXRybyBTdGF0aW9uLCDYp9mE2LnZhdix2KfZhtmK2Kkg2KfZhNi02LHZgtmK2KnYjCDZgtiz2YUg2KfZhNi52YXYsdin2YbZitip2Iwg2YXYrdin2YHYuNipINin2YTYrNmK2LLYqSAzNTQ3MTMz!2m2!1d31.20575!2d30.01089!3m5!1s0x145846e559601187:0x9182d98855abf1c9!8m2!3d30.01089!4d31.20575!16s%2Fg%2F11h4k4fycl?entry=ttu&g_ep=EgoyMDI1MDMxNy4wIKXMDSoJLDEwMjExNjM5SAFQAw%3D%3D"),
    Station(
        name: "om el-masryeen",
        late: 30.005664865408367,
        long: 31.208122708638317,
        link:
            "https://www.google.com/maps/place/%D9%85%D8%AD%D8%B7%D8%A9+%D9%85%D8%AA%D8%B1%D9%88+%D8%A7%D9%85+%D8%A7%D9%84%D9%85%D8%B5%D8%B1%D9%8A%D9%8A%D9%86%E2%80%AD/@30.0193773,31.2423109,13.59z/data=!4m20!1m13!4m12!1m4!2m2!1d31.228547!2d30.1786632!4e1!1m6!1m2!1s0x145846fa3616bdd3:0x4874a5d508074e8e!2z2YXYrdi32Kkg2YXYqtix2Ygg2KfZhSDYp9mE2YXYtdix2YrZitmG2Iwg2KfZhNi52YXYsdin2YbZitipINin2YTYtNix2YLZitip2Iwg2YLYs9mFINin2YTYudmF2LHYp9mG2YrYqdiMINmF2K3Yp9mB2LjYqSDYp9mE2KzZitiy2KkgMzU0NzEwOQ!2m2!1d31.2081202!2d30.0056539!3m5!1s0x145846fa3616bdd3:0x4874a5d508074e8e!8m2!3d30.0056539!4d31.2081202!16s%2Fg%2F1tn8hnbg?entry=ttu&g_ep=EgoyMDI1MDMxNy4wIKXMDSoJLDEwMjExNjM5SAFQAw%3D%3D"),
    Station(
        name: "sakiat mekky",
        late: 29.995506041207047,
        long: 31.208654345119122,
        link:
            "https://www.google.com/maps/place/%D8%B3%D8%A7%D9%82%D9%8A%D8%A9+%D9%85%D9%83%D9%8A%E2%80%AD/@30.0004076,31.2313097,14.26z/data=!4m20!1m13!4m12!1m4!2m2!1d31.228547!2d30.1786632!4e1!1m6!1m2!1s0x14584656e339e7e5:0x264fb0a23037a06d!2z2LPYp9mC2YrYqSDZhdmD2YrYjCDYp9mE2LnZhdix2KfZhtmK2Kkg2KfZhNi02LHZgtmK2KnYjCDZgtiz2YUg2KfZhNi52YXYsdin2YbZitip2Iwg2YXYrdin2YHYuNipINin2YTYrNmK2LLYqSAzNzIzNDIw!2m2!1d31.208656!2d29.9954938!3m5!1s0x14584656e339e7e5:0x264fb0a23037a06d!8m2!3d29.9954938!4d31.208656!16s%2Fg%2F122qs49v?entry=ttu&g_ep=EgoyMDI1MDMxNy4wIKXMDSoJLDEwMjExNjM5SAFQAw%3D%3D"),
    Station(
        name: "el-mounib",
        late: 29.981107134363445,
        long: 31.21244944501756,
        link:
            "https://www.google.com/maps/place/%D8%A7%D9%84%D9%85%D9%86%D9%8A%D8%A8%E2%80%AD/@30.028783,31.2683131,12.57z/data=!4m20!1m13!4m12!1m4!2m2!1d31.228547!2d30.1786632!4e1!1m6!1m2!1s0x1458464bea5cc439:0xa6e716ace7b6b9e4!2z2KfZhNmF2YbZitio2Iwg2KzYstmK2LHYqSDYp9mE2K_Zh9io2Iwg2YLYs9mFINin2YTYrNmK2LLYqdiMINmF2K3Yp9mB2LjYqSDYp9mE2KzZitiy2KkgMzcyMjExMw!2m2!1d31.2123247!2d29.9810944!3m5!1s0x1458464bea5cc439:0xa6e716ace7b6b9e4!8m2!3d29.9810944!4d31.2123247!16s%2Fg%2F1q5ggdn2m?entry=ttu&g_ep=EgoyMDI1MDMxNy4wIKXMDSoJLDEwMjExNjM5SAFQAw%3D%3D")
  ];
}
