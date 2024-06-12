//to do data class
class ToDo {
  //to do varibles
  final String? title;
  final String? discription;
  final bool? isComplete;

  //constructor
  ToDo({this.title = "", this.discription = "", this.isComplete = false});

  //method for set the to do data
  ToDo copyWith(String title, String discription, bool isComplete) {
    return ToDo(title: title, discription: discription, isComplete: isComplete ?? this.isComplete);
  }

  //to Json
  Map<String, dynamic> toJson() {
    return {"title":title,"discription":discription,"isComplete":isComplete};
  }

  //from Json
  factory ToDo.fromJson(Map<String, dynamic> json) {
    return ToDo(title: json["title"],discription: json["discription"],isComplete: json["isComplete"]);
  }

  
}
