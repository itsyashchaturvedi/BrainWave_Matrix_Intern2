import 'package:flutter/material.dart';
import 'package:newsapp/newsearch.dart';
class NewsContainer extends StatelessWidget {

  String imgUrl;
  String newsHead;
  String newsDesc;
  String newsUrl;
  String newsCnt;

  NewsContainer({super.key, required this.imgUrl, required this.newsHead,
    required this.newsDesc, required this.newsUrl, required this.newsCnt});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInImage.assetNetwork(
            placeholder: 'Assets/images/breaking.jpg',
            image: imgUrl,
            height: 375,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10,),
                newsHead.length<120?Text(newsHead,style: const TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),):
                Text(newsHead.substring(0,100),style: const TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),

            ])
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 205,
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10,),
                      const SizedBox(height: 7.0,),
                      if(newsDesc!=0) Text(newsDesc, style: const TextStyle(fontSize: 12.0,color: Colors.black54),)
                      else Text(newsDesc),
                      const SizedBox(height: 7.0,),
                      newsCnt!="--" && newsCnt.length>20 ? Text("${newsCnt.toString().substring(
                              0, newsCnt.length - 15)}...",
                            style: const TextStyle(fontSize: 14.0),):Text(newsCnt),
                        ]),
              )
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () async{
                    Navigator.push(context,MaterialPageRoute(builder: (context) => NewSearch(newsUrl: newsUrl) ) );
                  },
                  child: const Text("Read More"),
              ),
            ]),
          ),
          const SizedBox(height: 20)


        ],
      ),
    );
  }
}
