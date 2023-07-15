import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:task/models/jsonapi.dart';
import 'package:dio/dio.dart';
import 'package:task/models/mycard.dart';

final dio = Dio();

class ApiScreen extends StatefulWidget {
  const ApiScreen({super.key});

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

var response;
bool isLoading = true;
List<DataModel> jsonDataCollection = [];

class _ApiScreenState extends State<ApiScreen> {
  void getCharacterData() async {
    response = await dio.get('https://jsonplaceholder.typicode.com/posts');

    // print(response.data[0]);
    setState(() {
      for (int i = 0; i < 100; i++) {
        jsonDataCollection.add(DataModel(
            userID: response.data[i]['userId'],
            id: response.data[i]['id'],
            title: response.data[i]['title'],
            body: response.data[i]['body']));
      }

      for (int i = 0; i < 100; i++) {
        if (kDebugMode) {
          print(jsonDataCollection[i].id);
          print(jsonDataCollection[i].title);
        }
      }
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getCharacterData();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            appBar: AppBar(
              title: const Text('Task'),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: jsonDataCollection.length,
                      itemBuilder: (context, index) {
                        return MyCard(
                            id: jsonDataCollection[index].userID,
                            title: jsonDataCollection[index].title,
                            body: jsonDataCollection[index].body,
                            clr: (jsonDataCollection[index].userID % 3 == 0)
                                ? Colors.green
                                : Colors.white);
                      }),
                )
              ],
            ),
          );
  }
}





/*






*/