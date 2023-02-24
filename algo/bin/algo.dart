import 'package:algo/algo.dart' as algo;

List<int> merge(List<int> arr1, List<int> arr2) {
  List<int> returnRes = [];
  int i = 0;
  int j = 0;
  int l1 = arr1.length;
  int l2 = arr2.length;

  //while the length of the arrays are not traversesd
  while (i < l1 && j < l2) {
    if (arr1[i] < arr2[j]) {
      returnRes.add(arr1[i]);
      i++;
    } else {
      returnRes.add(arr2[j]);
      j++;
    }
  }

  //checking for leftover items in both the lists
  if (i < l1) {
    returnRes = [...returnRes, ...arr1.sublist(i)];
  } else if (j < l2) {
    returnRes = [...returnRes, ...arr2.sublist(j)];
  }
  return returnRes;
}

List<int> mergeSort(List<int> arr) {
  List<int> left = [];
  List<int> right = [];
  int len = arr.length;

  double halfDeci = len / 2;

  int half = halfDeci.floor();

  if (half > 0) {
    left = mergeSort(arr.sublist(0, half));

    right = mergeSort(arr.sublist(half));

    List<int> results = merge(left, right);
    return results;
  } else {
    return arr;
  }
}

void main() {
  List<int> arr = [1, 78, 43, 79, 45, 90];
  List<int> res = mergeSort(arr);
  print(res);
}
