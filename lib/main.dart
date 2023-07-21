import 'package:flutter/material.dart';
import 'package:kurs/models/student.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String mesaj = "Öğrenci Takip Sistemi";

  String seciliOgrenci = "abc";

  List<Student> students = [
    new Student("İsmail", "Olguner", 20),
    Student("Alim", "Ulaş", 80),
    Student("Halil", "Duymaz", 45)
  ];

  var ogrenciler = [
    "İsmail Olguner",
    "Alim Ulaş",
    "Berkay Bilgin",
    "Murat Kurt"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: buidBody(context),
    );
  }

  String sinavHesapla(int puan) {
    String mesaj = "";
    if (puan >= 50) {
      mesaj = "Geçti";
    } else if (puan >= 40) {
      mesaj = "Bütünlemeye Kaldı";
    } else {
      mesaj = "Kaldı";
    }
    return mesaj;
  }

  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("Sınav Sonucu"),
      content: Text(mesaj),
    );

    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buidBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://pixabay.com/tr/photos/adam-iskele-siluet-g%C3%BCndo%C4%9Fumu-sis-8091933/"),
                    ),
                    title: Text(students[index].firstName +
                        " " +
                        students[index].lastName),
                    subtitle: Text("Sınavdan aldığı not : " +
                        students[index].grade.toString() +
                        " [" +
                        students[index].getStatus +
                        "]"),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: () {
                      setState(() {
                        seciliOgrenci = students[index].firstName +
                            " " +
                            students[index].lastName;
                      });

                      print(seciliOgrenci);
                    },
                  );
                })),
        Text("Seçili Öğrenci : " + seciliOgrenci),
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.purpleAccent,
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Yeni Öğrenci"),
                  ],
                ),
                onPressed: () {
                  var mesaj = sinavHesapla(35);
                  mesajGoster(context, mesaj);
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.amberAccent,
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.update),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Güncelle"),
                  ],
                ),
                onPressed: () {
                  var mesaj = sinavHesapla(35);
                  mesajGoster(context, mesaj);
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.greenAccent,
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.delete),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Sil"),
                  ],
                ),
                onPressed: () {
                  var mesaj = sinavHesapla(35);
                  mesajGoster(context, mesaj);
                },
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}
