/*
class Welcome {
  String status;
  int totalResults;
  List<Article> articles;

  Welcome({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory Welcome.fromMap(Map<String, dynamic> json) => Welcome(
    status: json["status"],
    totalResults: json["totalResults"],
    articles: List<Article>.from(json["articles"].map((x) => Article.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "totalResults": totalResults,
    "articles": List<dynamic>.from(articles.map((x) => x.toMap())),
  };
}
*/

class Article {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String? content;

  Article({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromMap(Map<String, dynamic> json) => Article(
    author: json["author"]==null?"":json["author"],
    title: json["title"]==null?"":json["title"],
    description: json["description"]==null?"":json["description"],
    url: json["url"]==null?"": json["url"],
    urlToImage: json["urlToImage"]==null?"":json["urlToImage"],
    publishedAt: DateTime.parse(json["publishedAt"]==null?null:json["publishedAt"]),
    content: json["content"]==null?"":json["content"],
  );

  Map<String, dynamic> toMap() => {

    "author": author,
    "title": title,
    "description": description,
    "url": url,
    "urlToImage": urlToImage,
    "publishedAt": publishedAt.toIso8601String(),
    "content": content,
  };
}

class Source {
  String? id;
  String name;

  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromMap(Map<String, dynamic> json) => Source(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
  };
}
