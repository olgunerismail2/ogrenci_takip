mixin StudentValidationMixin{
  String? validateFirstName(String? value) {
    if (value!.length <2) {
      return 'en az iki karakter olmalıdır';
    }
 // Uygun hatalı mesajı döndür
  }

  String? validateLastName(String? value) {
    if (value!.length <2) {
      return 'soyad en az 2 karakter olmalıdır';
    }


  }
  String? validateGrade(String? value) {
    int grade = value != 0 ? int.parse(value!) : 100;
    if (value != 0-100) {
      grade = int.parse(value!);
      return"Not 0-100 arasında olmalıdır";
    }

   }
  }
