class JokeModel {
  bool? error;
  String? category;
  String? type;
  String? joke;
  Flags? flags;
  bool? safe;
  int? id;
  String? lang;

  JokeModel(
      {this.error,
      this.category,
      this.type,
      this.joke,
      this.flags,
      this.safe,
      this.id,
      this.lang});

  JokeModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    category = json['category'];
    type = json['type'];
    joke = json['joke'];
    flags = json['flags'] != null ? Flags.fromJson(json['flags']) : null;
    safe = json['safe'];
    id = json['id'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['category'] = category;
    data['type'] = type;
    data['joke'] = joke;
    if (flags != null) {
      data['flags'] = flags!.toJson();
    }
    data['safe'] = safe;
    data['id'] = id;
    data['lang'] = lang;
    return data;
  }
}

class Flags {
  bool? nsfw;
  bool? religious;
  bool? political;
  bool? racist;
  bool? sexist;
  bool? explicit;

  Flags(
      {this.nsfw,
      this.religious,
      this.political,
      this.racist,
      this.sexist,
      this.explicit});

  Flags.fromJson(Map<String, dynamic> json) {
    nsfw = json['nsfw'];
    religious = json['religious'];
    political = json['political'];
    racist = json['racist'];
    sexist = json['sexist'];
    explicit = json['explicit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nsfw'] = nsfw;
    data['religious'] = religious;
    data['political'] = political;
    data['racist'] = racist;
    data['sexist'] = sexist;
    data['explicit'] = explicit;
    return data;
  }
}
