class Utils{
  bool isValidEmail(String email) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?).*$";
    RegExp regex = RegExp(pattern);
    print(regex.hasMatch(email));
    return regex.hasMatch(email);
  }
}