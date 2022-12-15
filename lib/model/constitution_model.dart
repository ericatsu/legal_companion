
class Constitution {
  final String id;
  final String title;
  final String preamble;
  final String createdAt;
  final String updatedAt;

  Constitution({
    required this.id,
    required this.title,
    required this.preamble,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Constitution.fromJson(Map<String, dynamic> json) {
    return Constitution(
      id: json['_id'] as String,
      title: json['title'] as String,
      preamble: json['preamble'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );
  }
}

class Chapter {
  final String id;
  final String constitution;
  final String title;
  final String description;
  final String createdAt;
  final String updatedAt;

  Chapter({
    required this.id,
    required this.constitution,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) {
    return Chapter(
      id: json['_id'] as String,
      constitution: json['constitution'],
      title: json['title'] as String,
      description: json['description'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );
  }
}

class Section {
  final String id;
  final String constitution;
  final String chapter;
  final String title;
  final String content;
  
  

  Section({
    required this.id,
    required this.constitution,
    required this.chapter,
    required this.title,
    required this.content,
  });

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
      id: json['_id'] as String,
      constitution: json['constitution'] as String,
      chapter: json['chapter'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
    );
  }
}
