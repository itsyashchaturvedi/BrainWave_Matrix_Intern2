import 'package:flutter/material.dart';
import 'package:newsapp/data_model.dart';
import 'package:newsapp/fetchnews.dart';
import 'package:newsapp/newscontainer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading=true;
   static late DataModel dataModel;
  getData() async
  {
    dataModel=await FetchNews.fetchNews();
    setState(() {
      isLoading=false;
    });
  }
  @override

  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: PageView.builder(
          onPageChanged: (value)
          {
            setState(() {
              isLoading=true;
            });
            getData();
          },
          scrollDirection: Axis.vertical,
          itemBuilder: (context,index){
            return isLoading? const Center(child: CircularProgressIndicator(backgroundColor: Colors.black12,semanticsLabel: "Loading...",)):
            NewsContainer(
                imgUrl: dataModel.imgUrl,
                newsHead: dataModel.newsHead,
                newsDesc: dataModel.newsDesc,
                newsCnt: dataModel.newsCnt,
                newsUrl: dataModel.newsUrl
            );
      }),
    );
  }

}
