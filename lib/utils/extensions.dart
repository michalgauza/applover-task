const String _emailPattern =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

extension StringVaildator on String {
  bool get isEmailValid =>
      this.isNotEmpty ? RegExp(_emailPattern).hasMatch(this) : false;

  bool get isPasswordValid => this.isNotEmpty;
}
