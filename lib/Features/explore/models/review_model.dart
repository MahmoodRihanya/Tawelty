class ReviewModel {
  final String? title;
  final String? rating;
  final String? date;
  final String? summary;
  final String? author;
  final String? url;

  ReviewModel({
    required this.author,
    required this.date,
    required this.rating,
    required this.summary,
    required this.title,
    required this.url,
  });

  factory ReviewModel.fromjson(jsondata) {
    return ReviewModel(
      author: jsondata["author"],
      date:
          jsondata["published_date"]
              .toString()
              .split('T')
              .first, //In order to abbreviate the hour and minute of today's date
      rating: jsondata["rating"],
      summary: jsondata["summary"],
      title: jsondata["title"],
      url: jsondata["url"],
    );
  }
}
