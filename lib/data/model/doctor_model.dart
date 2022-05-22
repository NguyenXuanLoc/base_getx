final String tableDoctor = 'doctor';

class DoctorField {
  static final List<String> values = [id, name, avatar,specialization];

  static final String id = '_id';
  static final String name = 'name';
  static final String avatar = 'avatar';
  static final String specialization = 'specialization';
}

class DoctorModel {
  final int? id;
  final String? name;
  final String? avatar;
  final String? specialization;

  const DoctorModel({
    required this.id,
    required this.name,
    required this.avatar,
    required this.specialization,
  });

  DoctorModel copy({
    int? id,
    String? name,
    String? avatar,
  }) =>
      DoctorModel(
        id: id ?? this.id,
        name: name ?? this.name,
        avatar: avatar ?? this.avatar,
        specialization: specialization ?? this.specialization,
      );

  static DoctorModel fromJson(Map<String, Object?> json) => DoctorModel(
        id: json[DoctorField.id] as int?,
        name: json[DoctorField.name] as String?,
        avatar: json[DoctorField.avatar] as String?,
        specialization: json[DoctorField.specialization] as String?,
      );

  Map<String, Object?> toJson() => {
        DoctorField.id: id,
        DoctorField.name: name,
        DoctorField.avatar: avatar,
        DoctorField.specialization: specialization
      };
}
