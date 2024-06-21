class DataModel{
  String imgUrl;
  String newsHead;
  String newsDesc;
  String newsCnt;
  String newsUrl;

  DataModel({
    required this.imgUrl,
    required this.newsHead,
    required this.newsDesc,
    required this.newsCnt,
    required this.newsUrl
});

   static DataModel transport(Map<String,dynamic>article){
    return DataModel(
        imgUrl: article["urlToImage"] ?? "https://media.istockphoto.com/id/1192070239/photo/abstract-digital-news-concept.webp?b=1&s=170667a&w=0&k=20&c=gh89_KBMRqNn3nhTcZwjIQfsM45NnhWI_k8SDa9A6NM=",
        newsHead: article["title"] ?? "--",
        newsDesc: article["description"] ?? "--",
        newsCnt: article["content"] ?? "--",
        newsUrl:article["url"] ?? "https://www.bbc.com/news"
    );
  }

}