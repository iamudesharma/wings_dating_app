class PromptQA {
  final String prompt;
  final String answer;
  const PromptQA({required this.prompt, required this.answer});

  Map<String, dynamic> toJson() => {
        'prompt': prompt,
        'answer': answer,
      };
  factory PromptQA.fromJson(Map<String, dynamic> json) =>
      PromptQA(prompt: json['prompt'] as String? ?? '', answer: json['answer'] as String? ?? '');
}

class SocialLinks {
  final String? instagram;
  final String? twitter;
  final String? linkedin;
  final String? tiktok;
  final String? website;
  const SocialLinks({this.instagram, this.twitter, this.linkedin, this.tiktok, this.website});

  SocialLinks copyWith({String? instagram, String? twitter, String? linkedin, String? tiktok, String? website}) =>
      SocialLinks(
        instagram: instagram ?? this.instagram,
        twitter: twitter ?? this.twitter,
        linkedin: linkedin ?? this.linkedin,
        tiktok: tiktok ?? this.tiktok,
        website: website ?? this.website,
      );

  Map<String, dynamic> toJson() => {
        'instagram': instagram,
        'twitter': twitter,
        'linkedin': linkedin,
        'tiktok': tiktok,
        'website': website,
      };
  factory SocialLinks.fromJson(Map<String, dynamic> json) => SocialLinks(
        instagram: json['instagram'] as String?,
        twitter: json['twitter'] as String?,
        linkedin: json['linkedin'] as String?,
        tiktok: json['tiktok'] as String?,
        website: json['website'] as String?,
      );
}

class VerificationStatus {
  final bool workVerified;
  final bool educationVerified;
  final bool idVerified;
  final bool workPending;
  final bool educationPending;
  final bool idPending;

  const VerificationStatus({
    this.workVerified = false,
    this.educationVerified = false,
    this.idVerified = false,
    this.workPending = false,
    this.educationPending = false,
    this.idPending = false,
  });

  VerificationStatus copyWith({
    bool? workVerified,
    bool? educationVerified,
    bool? idVerified,
    bool? workPending,
    bool? educationPending,
    bool? idPending,
  }) =>
      VerificationStatus(
        workVerified: workVerified ?? this.workVerified,
        educationVerified: educationVerified ?? this.educationVerified,
        idVerified: idVerified ?? this.idVerified,
        workPending: workPending ?? this.workPending,
        educationPending: educationPending ?? this.educationPending,
        idPending: idPending ?? this.idPending,
      );

  Map<String, dynamic> toJson() => {
        'workVerified': workVerified,
        'educationVerified': educationVerified,
        'idVerified': idVerified,
        'workPending': workPending,
        'educationPending': educationPending,
        'idPending': idPending,
      };
  factory VerificationStatus.fromJson(Map<String, dynamic> json) => VerificationStatus(
        workVerified: json['workVerified'] as bool? ?? false,
        educationVerified: json['educationVerified'] as bool? ?? false,
        idVerified: json['idVerified'] as bool? ?? false,
        workPending: json['workPending'] as bool? ?? false,
        educationPending: json['educationPending'] as bool? ?? false,
        idPending: json['idPending'] as bool? ?? false,
      );
}
