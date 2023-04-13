
abstract class BaseModel<T> {
  Map<String, dynamic>? toJson();
  T createObject();
  T fromJson(Map<String, dynamic> json);
}
