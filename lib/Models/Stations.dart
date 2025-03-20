import 'package:get/get.dart';
import 'package:metro_app/sta_tg.dart';

class Stations extends GetxController {
  //line 1 in metro
  List<String> line_1 = [
    'Helwan',
    'Ain Helwan',
    'Helwan University',
    'Wadi Hof',
    'Hadayek Helwan',
    'El-Maasara',
    'Tora El-Asmant',
    'Kozzika',
    'Tora El-Balad',
    'Sakanat El-Maadi',
    'Maadi',
    'Hadayek El-Maadi',
    'Dar El-Salam',
    'El-Zahraa',
    'Mar Girgis',
    'El-Malek El-Saleh',
    'El-Sayeda Zeinab',
    'Saad Zaghloul',
    'Sadat',
    'Nasser',
    'Orabi',
    'Al-Shohadaa',
    'Ghamra',
    'El-Demerdash',
    'Manshiet El-Sadr',
    'Kobri El-Qobba',
    'Hammamat El-Qobba',
    'Saray El-Qobba',
    'Hadayek El-Zaitoun',
    'Helmeyet El-Zaitoun',
    'El-Matareyya',
    'Ain Shams',
    'Ezbet El-Nakhl',
    'El-Marg',
    'New El-Marg'
  ];

//line 2 in metro
  List<String> line_2 = [
    'Shubra El-Kheima',
    'Kolleyet El-Zeraa',
    'Mezallat',
    'Khalafawy',
    'St. Teresa',
    'Rod El-Farag',
    'Masarra',
    'Al-Shohadaa',
    'Attaba',
    'Mohamed Naguib',
    'Sadat',
    'Dokki',
    'Opera',
    'Bohooth',
    'Cairo University',
    'Faisal',
    'Giza',
    'Om El-Masryeen',
    'Sakiat Mekky',
    'El-Mounib'
  ];

//line 3 in metro
  List<String> line_3 = [
    'Adly Mansour',
    'El-Haykestep',
    'Omar Ibn El-Khattab',
    'Qobaa',
    'Hesham Barakat',
    'El-Nozha',
    'Nadi El-Shams',
    'Alf Maskan',
    'Heliopolis',
    'Haroun',
    'Al-Ahram',
    'Kolleyet El-Banat',
    'Stadium',
    'Fair Zone',
    'Abbassiya',
    'Abdou Pasha',
    'El-Geish',
    'Bab El-Shaaria',
    'Attaba',
    'Nasser',
    'Maspero',
    'Zamalek',
    'Kit Kat'
  ];

//this place in right of end line 3 ,you can look in the map and you will find it
  List<String> rightExtension3 = [
    'Al-Sodan',
    'Embaba',
    'Al-Bohe',
    'Ah-Kwmia',
    'Al-Daary Road',
    'Rod Al-Farag'
  ];

//this place in right of end line 3 ,you can look in the map and you will find it
  List<String> leftExtension3 = [
    'Al-Twfikia',
    'Wady Al-Nil',
    'Al-Dwal University',
    'Bolak',
    'Cairo University'
  ];

  List<Station> statoin = [
    Station(
        nsme: "Shubra El-Kheima",
        late: 0.0,
        long: 0.0,
        link:
            "https://www.google.com/maps/dir/30.1786623,31.2285491/%D9%85%D8%AD%D8%B7%D8%A9+%D9%85%D8%AA%D8%B1%D9%88+%D8%B4%D8%A8%D8%B1%D8%A7+%D8%A7%D9%84%D8%AE%D9%8A%D9%85%D9%87,+22+%D8%A7%D9%84%D8%AA%D8%B1%D8%B9%D8%A9+%D8%A7%D9%84%D8%A8%D9%88%D9%84%D8%A7%D9%82%D9%8A%D8%A9%D8%8C+%D8%AF%D9%85%D9%86%D9%87%D9%88%D8%B1+%D8%B4%D8%A8%D8%B1%D8%A7%D8%8C+%D9%82%D8%B3%D9%85+%D8%A3%D9%88%D9%84+%D8%B4%D8%A8%D8%B1%D8%A7+%D8%A7%D9%84%D8%AE%D9%8A%D9%85%D8%A9%D8%8C+%D9%85%D8%AD%D8%A7%D9%81%D8%B8%D8%A9+%D8%A7%D9%84%D9%82%D9%84%D9%8A%D9%88%D8%A8%D9%8A%D8%A9+6210338%E2%80%AD/@30.1554508,31.2346326,13z/data=!3m1!4b1!4m19!1m8!3m7!1s0x14586bcaf494f9f1:0xa5efbed0d93906b5!2z2YXYrdi32Kkg2YXYqtix2Ygg2LTYqNix2Kcg2KfZhNiu2YrZhdmH!8m2!3d30.1241402!4d31.2433017!15sChrZhdit2LfZhyDZhdiq2LHZiCDYtNio2LHYp5IBGm1ldHJvcG9saXRhbl90cmFpbl9jb21wYW554AEA!16s%2Fg%2F11j4tcxd6s!4m9!1m1!4e1!1m5!1m1!1s0x14586bcaf494f9f1:0xa5efbed0d93906b5!2m2!1d31.2433017!2d30.1241402!3e0?entry=ttu&g_ep=EgoyMDI1MDMxNy4wIKXMDSoJLDEwMjExNjM5SAFQAw%3D%3D"),
    Station(
        nsme: "Kolleyet El-Zeraa",
        late: 0.0,
        long: 0.0,
        link:
            "https://www.google.com/maps/dir/30.1786846,31.2285594/%D9%83%D9%84%D9%8A%D8%A9+%D8%A7%D9%84%D8%B2%D8%B1%D8%A7%D8%B9%D8%A9%D8%8C+%D8%B4%D8%A8%D8%B1%D8%A7+%D8%A7%D9%84%D8%AE%D9%8A%D9%85%D8%A9%D8%8C+%D9%82%D8%B3%D9%85+%D8%A3%D9%88%D9%84+%D8%B4%D8%A8%D8%B1%D8%A7+%D8%A7%D9%84%D8%AE%D9%8A%D9%85%D8%A9%D8%8C+%D9%85%D8%AD%D8%A7%D9%81%D8%B8%D8%A9+%D8%A7%D9%84%D9%82%D9%84%D9%8A%D9%88%D8%A8%D9%8A%D8%A9+6210201%E2%80%AD/@30.150789,31.2770869,13z/data=!3m1!4b1!4m18!1m7!3m6!1s0x14586aa7835c8017:0x2fa49891f589298!2z2YPZhNmK2Kkg2KfZhNiy2LHYp9i52Kk!8m2!3d30.1136919!4d31.2486699!16s%2Fg%2F121l5t0t!4m9!1m1!4e1!1m5!1m1!1s0x14586aa7835c8017:0x2fa49891f589298!2m2!1d31.2486699!2d30.1136919!3e0?entry=ttu&g_ep=EgoyMDI1MDMxNy4wIKXMDSoJLDEwMjExNjM5SAFQAw%3D%3D"),
    Station(
        nsme: "Mezallat",
        late: 0.0,
        long: 0.0,
        link:
            "https://www.google.com/maps/dir/30.1786846,31.2285594/%D8%A7%D9%84%D9%85%D8%B8%D9%84%D8%A7%D8%AA%D8%8C+%D8%A3%D8%B3%D8%B9%D8%AF%D8%8C+%D8%A7%D9%84%D8%B3%D8%A7%D8%AD%D9%84%D8%8C+%D9%85%D8%AD%D8%A7%D9%81%D8%B8%D8%A9+%D8%A7%D9%84%D9%82%D8%A7%D9%87%D8%B1%D8%A9%E2%80%AC+4350229%E2%80%AD/@30.1041327,31.245769,20.12z/data=!4m18!1m8!3m7!1s0x1458401a02eede8f:0x15961923818c54d1!2z2KfZhNmF2LjZhNin2Ko!8m2!3d30.1041743!4d31.2456414!15sChBNZXphbGxhdCBzdGF0aW9ukgEOc3Vid2F5X3N0YXRpb27gAQA!16s%2Fg%2F1vpgzzvh!4m8!1m1!4e1!1m5!1m1!1s0x1458401a02eede8f:0x15961923818c54d1!2m2!1d31.2456414!2d30.1041743?entry=ttu&g_ep=EgoyMDI1MDMxNy4wIKXMDSoJLDEwMjExNjM5SAFQAw%3D%3D"),
    Station(
        nsme: "Khalafawy",
        late: 0.0,
        long: 0.0,
        link:
            "https://www.google.com/maps/dir/30.1786632,31.228547/Khlfawy's+metro+station%D8%8C+Al+Khalafawi,%D8%AD%D8%A7%D8%B1%D8%A9+%D8%A3%D8%B3%D8%B9%D8%AF+%D8%B4%D8%A8%D8%B1%D8%A7%D8%8C+%D8%A7%D9%84%D8%B3%D8%A7%D8%AD%D9%84%E2%80%AD/@30.1424678,31.3179542,12z/data=!3m1!4b1!4m17!1m7!3m6!1s0x145840140800dc0d:0x208945e92503b0db!2sKhlfawy's+metro+station!8m2!3d30.0972289!4d31.2454981!16s%2Fg%2F11d_1pmqhw!4m8!1m1!4e1!1m5!1m1!1s0x145840140800dc0d:0x208945e92503b0db!2m2!1d31.2454981!2d30.0972289?entry=ttu&g_ep=EgoyMDI1MDMxNy4wIKXMDSoJLDEwMjExNjM5SAFQAw%3D%3D"),
    Station(
        nsme: "St. Teresa",
        late: 0.0,
        long: 0.0,
        link:
            "https://www.google.com/maps/place/%D8%B3%D8%A7%D9%86%D8%AA+%D8%AA%D8%B1%D9%8A%D8%B2%D8%A7%E2%80%AD/@30.0879022,31.2457146,21z/data=!4m20!1m13!4m12!1m4!2m2!1d31.228547!2d30.1786632!4e1!1m6!1m2!1s0x1458406c0002fb41:0x9959722226caaf3a!2z2LPYp9mG2Kog2KrYsdmK2LLYp9iMINi02LHZitmB2Iwg2KfZhNiz2KfYrdmE2Iwg2YXYrdin2YHYuNipINin2YTZgtin2YfYsdip4oCsIDQzNTIyMDI!2m2!1d31.2454927!2d30.0879569!3m5!1s0x1458406c0002fb41:0x9959722226caaf3a!8m2!3d30.0879569!4d31.2454927!16s%2Fg%2F1xpt1501?entry=ttu&g_ep=EgoyMDI1MDMxNy4wIKXMDSoJLDEwMjExNjM5SAFQAw%3D%3D"),
  ];
}
