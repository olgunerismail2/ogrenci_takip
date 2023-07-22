import 'package:flutter/material.dart';
import 'package:kurs/models/student.dart';
import 'package:kurs/validation/student_validatior.dart';

class StudentAdd extends StatefulWidget {
  late List<Student> students;
 StudentAdd(List<Student>students){
   this.students=students;


  }
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(students);
  }
}

class _StudentAddState extends State with StudentValidationMixin {
  late List<Student> students;
  var student =Student.withoutInfo();
  var fromKey=GlobalKey<FormState>();

  _StudentAddState(List<Student> students);

  StudentAddState(List<Student> students) {
    // TODO: implement _StudentAddState
    throw UnimplementedError();
  }




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Öğrenci Ekle"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: fromKey,
          child: Column(
            children: <Widget>[
             buildFirstNameField(),
              buildLastNameField(),
              buildGradeNameField(),
              buildSubmitButton()
            ],
          ),
        ),
      )
    );
  }

 Widget buildFirstNameField() {
  return TextFormField(
     decoration: InputDecoration(labelText: "Öğrenci Adı",hintText: "İsmail" ),
     validator: validateFirstName,
     onSaved: (String? value){
       student.firstName =value!;
     },
   );
 }
  Widget buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci Soyadı",hintText: "Olguner" ),
      validator: validateLastName,
      onSaved: (String? value){
        student.lastName =value!;
      },
    );
  }
  Widget buildGradeNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Aldığı Not",hintText: "65" ),
      validator: validateGrade,
      onSaved: (String? value){
        student.grade =int.parse(value!);
      },
    );
  }

 Widget buildSubmitButton() {
    return ElevatedButton(
      child: Text("Kaydet"),
      onPressed: (){
        if(fromKey.currentState!.validate()){
          fromKey.currentState!.save();
          student.add(students);
          saveStudent();
          Navigator.pop(context);
        }
      },
    );

 }

  void saveStudent() {
    print(student.firstName);
    print(student.lastName);
    print(student.grade);
  }

}


