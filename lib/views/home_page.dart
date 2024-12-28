import 'package:flutter/material.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/network/api_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var listCat = ["Entertainment", "Technology", "Business"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
      ),
      backgroundColor: Colors.grey.shade500,
      body: Column(children: [
        Expanded(
          flex: 1,
          child: ListView.builder(
            itemCount: listCat.length,
            itemBuilder: (context, i) =>
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 20,),
                  padding: EdgeInsets.only(left: 15, right: 15),
                  decoration: BoxDecoration(color: Colors.green.shade200,borderRadius: BorderRadius.all( Radius.circular(40)) ),
                  child: Text(listCat[i],style: TextStyle(fontSize: 16),),
                ),
            scrollDirection: Axis.horizontal,
          ),
        ),
        Expanded(
          flex: 10,
          child: FutureBuilder(
              future: ApiServices.apiServices.fetchNews(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print("ERROR:::" + snapshot.error.toString());
                  return Center(
                    child: LinearProgressIndicator(),
                  );
                } else if (snapshot.hasData) {
                  List<Article>? list = snapshot.data;
                  print("list:::" + list.toString());
                  return ListView.builder(
                      itemCount: list!.length,
                      itemBuilder: (context, i) =>Card(
                       margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                        child: Container(
                          padding: EdgeInsets.only(left: 10,right: 10,bottom: 10,top: 10),
                          child: Column(
                            children: [
                              Text(list[i].title,maxLines:2,overflow:TextOverflow.ellipsis,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Text(list[i].description,maxLines:3,overflow:TextOverflow.ellipsis,style: TextStyle(fontSize: 14),),
                              SizedBox(height: 10,),
                              Card(
                                elevation: 0.6,
                                child: Image.network(
                                  fit: BoxFit.fill,
                                  errorBuilder: (context, error, stackTrace) {
                                    if (error is NetworkImageLoadException &&
                                        error.statusCode == 404) {
                                      return Text("Image not found");
                                    }else{
                                      return Icon(Icons.error);
                                    }
                                  },
                                  list[i].urlToImage, height: 200, width: double.infinity,),
                              ),
                              SizedBox(height: 10,),

                              Text(list[i].publishedAt.toString())

                            ],
                          ),
                        ),
                      )


                         /* SizedBox(
                            child: ListTile(
                              title: Text(list[i].title),
                              subtitle: Text(list[i].description),

                              leading: Card(
                                elevation: 0.6,

                                child: Image.network(
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    if (error is NetworkImageLoadException &&
                                        error.statusCode == 404) {
                                      return Text("Image not found");
                                    }else{
                                      return Icon(Icons.error);
                                    }
                                  },
                                  list[i].urlToImage, height: 100, width: 100,),
                              ),
                            ),)*/
                  );
                } else {
                  return LinearProgressIndicator();
                }
              }),
        )
      ]),
    );
  }
}
