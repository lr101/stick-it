import 'package:openapi/api.dart';


extension VisibilityTypeTransformer on Visibility {
  int ordinal() {
    return Visibility.values.indexOf(this);
  }
}

Visibility fromOrdinal(int ordinal) {
  if (ordinal < 0 || ordinal >= Visibility.values.length) {
    throw Exception("Invalid ordinal: $ordinal");
  }
  return Visibility.values[ordinal]; // Return the corresponding Visibility
}