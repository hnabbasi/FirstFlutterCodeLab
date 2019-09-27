class StringHelper {
  static String getFriendlyName(String string) {
    if (string == null || string.isEmpty || string.trimLeft().isEmpty) {
      return string;
    }

    var friendlyName = new StringBuffer();
    friendlyName.write(string[0]);
    for (int i = 1; i < string.length; i++) {
      var s = string[i];
      if(s.toUpperCase() == s)
        friendlyName.write(" ");
      friendlyName.write(s);
    }
    return friendlyName.toString();
  }
}