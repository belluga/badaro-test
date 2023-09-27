import 'package:value_objects/domain/value_objects/generic_string_value.dart';

class NewsIconSlugValue extends GenericStringValue {
  NewsIconSlugValue({super.isRequired = false});

  @override
  void validate(String? newValue) {
    final _regExp = RegExp(r'^[a-z]+(?:_?[a-z]+)*$');
    _regExp.hasMatch(newValue!);
  }
}
