class Utils {
  static bool passwordMinSize(String s, {int minSize = 8}) {
    return s.length >= minSize;
  }
}
