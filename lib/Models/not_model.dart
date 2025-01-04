// ignore_for_file: public_member_api_docs, sort_constructors_first

class Note {
  int? id;
  String? title;
  String? content;
  String? dateTimeEdited;
  String? dateTimeCreated;
  Note({
    this.id,
    this.title,
    this.content,
    this.dateTimeEdited,
    this.dateTimeCreated,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'content': content,
      'dateTimeEdited': dateTimeEdited,
      'dateTimeCreated': dateTimeCreated,
    };
  }
}
