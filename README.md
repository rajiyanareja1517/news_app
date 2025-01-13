# news_app

A news_app project created in flutter. news_app supports both ios and android, clone the appropriate branches mentioned below:

* For Mobile: https://github.com/rajiyanareja1517/news_app

Download or clone this repo by using the link below:

```
https://github.com/rajiyanareja1517/news_app.git
```
### Project Features:
- API Integration: use external API to create a News App using both the htip and dio packages.
- UI Display: UI in a user-friendly manner, and any loading or error states must be managed accordingly. Implement HomePage. Also, filter the news category-wise.
- Packages:  http and dio.


### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- assets
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- netwok/
|- utils/
|- model/
|- view/
|- utils/
|- main.dart
```

### view/screens

This directory screens all the screen of the application together in one place. A separate file is created for each type as shown in example below:

```
view/
|- HomePage.dart
|- DetailsScreen.dart

```

### utils

Contains the common file(s) and utilities used in a project. The folder structure is as follows:

```

|- utils/
    |- Constants/

```


### Main

This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.

```dart
import 'package:flutter/material.dart';
import 'package:news_app/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
     debugShowCheckedModeBanner: false,
      home:HomePage()
    );
  }
}


  
```




https://github.com/user-attachments/assets/026aeab1-0055-49e7-bd02-77584322eb81





## Conclusion

Again to note, this is example can appear as my code for what it is - but it is an example only. If you liked my work, don’t forget to ⭐ star the repo to show your support.

