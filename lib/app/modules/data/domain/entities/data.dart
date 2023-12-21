class DataEntity {
  String label;

  bool completed;

  String? error;

  Function() load;

  DataEntity({
    required this.label,
    this.completed = false,
    this.error,
    required this.load,
  });

  DataEntity copyWith({bool? completed, String? error}) {
    return DataEntity(
      label: label,
      completed: completed ?? this.completed,
      error: error,
      load: load,
    );
  }

  bool get hasError => error != null;
}
