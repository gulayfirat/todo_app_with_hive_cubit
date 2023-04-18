abstract class BaseModel<T> {
  //Converts an object to a Map data structure
  Map<String, dynamic>? toJson();
  // Create a new Object T type
  T createObject();
  //Creates an object from the Map data structure
  T fromJson(Map<String, dynamic> json);
}
