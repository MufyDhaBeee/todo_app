class TaskModel {
   String? title;
   String? description;
   final DateTime createdAt;
   final int endedDate;
   // final int time;
   int? priority;
   dynamic category;

   TaskModel({required this.title,
      required this.description,
      required this.createdAt,
      required this.endedDate,
      required this.priority,
      required this.category
   });

}






