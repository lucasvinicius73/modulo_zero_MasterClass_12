// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

class CryptModel {
  final String? text;
  final int index;
  final String ramdomkey;
  final String? textCrypt;
  CryptModel({
    this.text,
    required this.index,
    required this.ramdomkey,
    this.textCrypt,
  });
}

class VigereCifra {
  String keyGenerator(String texto) {
    String ramdomkey = '';
    for (var i = 0; i < texto.length; i++) {
      int codeUnit = texto.codeUnitAt(i);
      bool isUpperCase = (codeUnit >= 48 && codeUnit <= 90);
      if (isUpperCase) {
        var randonCharCode = Random().nextInt(58) + 32;
        ramdomkey = ramdomkey + String.fromCharCode(randonCharCode);
      } else {
        throw Exception("Não pode haver letras minusculas no Texto!");
      }
    }
    return ramdomkey;
  }

  String encode(String text, String ramdomkey) {
    String textCrypt = '';
    for (var i = 0; i < text.length; i++) {
      var charCode = text.codeUnitAt(i);
      bool isNumber = (charCode >= 48 && charCode <= 57);

      if (isNumber) {
        textCrypt += text[i];
      } else {
        var cp = CryptModel(text: text, index: i, ramdomkey: ramdomkey);
        var newChar = encryptChar(cp);
        textCrypt += String.fromCharCode(newChar);
      }
    }
    return textCrypt;
  }

  String decode(String textCrypt, String ramdomkey) {
    String textDecrypto = '';
    for (var i = 0; i < textCrypt.length; i++) {
      var charCode = textCrypt.codeUnitAt(i);
      bool isNumber = (charCode >= 48 && charCode <= 57);

      if (isNumber) {
        textDecrypto += textCrypt[i];
      } else {
        var cp =
            CryptModel(index: i, ramdomkey: ramdomkey, textCrypt: textCrypt);
        var newChar = decryptChar(cp);
        textDecrypto = textDecrypto + String.fromCharCode(newChar);
      }
    }
    return textDecrypto;
  }

  int encryptChar(CryptModel cp) {
    int newChar = 0;
    int codeUnitText = cp.text!.codeUnitAt(cp.index);
    int resto = (codeUnitText + cp.ramdomkey.codeUnitAt(cp.index)) % 26;
    bool isUpperCase = (codeUnitText >= 65 && codeUnitText <= 90);

    if (isUpperCase) {
      newChar = resto + "A".codeUnitAt(0);
    } else {
      newChar = codeUnitText;
    }
    return newChar;
  }

  int decryptChar(CryptModel cp) {
    var textCharCode = cp.textCrypt!.codeUnitAt(cp.index);
    var KeyCharCode = cp.ramdomkey.codeUnitAt(cp.index);
    int newCode = textCharCode - KeyCharCode + 26;
    int resto = newCode % 26;
    int newChar = resto + "A".codeUnitAt(0);
    return newChar;
  }
}
