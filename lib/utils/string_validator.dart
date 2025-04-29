extension StringValidator on String? {
  String? validateNotEmpty(String fieldName) {
    if (this == null || this!.isEmpty) {
      return 'Please enter $fieldName';
    }
    return null;
  }
}