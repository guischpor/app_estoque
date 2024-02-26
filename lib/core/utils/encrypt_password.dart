import 'dart:convert';

class EncryptPassword {
  static String encrypt(String pass) {
    String convertPassword = pass;
    var bytes = utf8.encode(convertPassword);
    var digest = base64Url.encode(bytes);
    return digest.toString();
  }

  static String decrypt(String pass) {
    String convertPassword = pass;
    var decode = base64Url.decode(convertPassword);
    var bytes = utf8.decode(decode);
    return bytes.toString();
  }
}
