import 'dart:math';

class Util {

  static void shuffle(List list, [int start = 0, int end]) {
    var random = Random();
    if (end == null) end = list.length;
    int length = end - start;
    while (length > 1) {
      int pos = random.nextInt(length);
      length--;
      var tmp1 = list[start + pos];
      list[start + pos] = list[start + length];
      list[start + length] = tmp1;
    }
  }

}