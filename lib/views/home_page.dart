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
    return DefaultTabController(
      initialIndex: 1,
        length: 3, child: Scaffold(
      appBar: AppBar(
        title: Text("News"),
        bottom: TabBar(tabs: [
          Tab(text: "Entertainment",icon: Icon(Icons.live_tv),),
          Tab(text: "Technology",icon: Icon(Icons.light_rounded),),
          Tab(text: "Business",icon: Icon(Icons.business),),
        ]),
      ),
      backgroundColor: Colors.grey.shade500,
      body:TabBarView(children: [
        Expanded(
          flex: 10,
          child: FutureBuilder(
              future: ApiServices.apiServices.fetchNews("Entertainment"),
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
        ),
        Expanded(
          flex: 10,
          child: FutureBuilder(
              future: ApiServices.apiServices.fetchNews("Technology"),
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
        ),
        Expanded(
          flex: 10,
          child: FutureBuilder(
              future: ApiServices.apiServices.fetchNews("Business"),
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
        ),

      ],

      )

    ));
  }
}
