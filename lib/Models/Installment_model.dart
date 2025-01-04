// ignore_for_file: public_member_api_docs, sort_constructors_first

class InstallmentModel {
  int? id;
  String? monthlyInstallment;
  String? deadTime;
  String? note;

  InstallmentModel({
    this.id,
    this.monthlyInstallment,
    this.deadTime,
    this.note,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'monthlyInstallment': monthlyInstallment,
      'deadTime': deadTime,
      'note': note,
    };
  }
}
