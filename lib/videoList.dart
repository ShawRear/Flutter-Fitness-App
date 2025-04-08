import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'videodataModel.dart';
import 'ytVideoPlayerPage.dart';

class VideoList extends StatelessWidget {
  const VideoList({super.key});

  Future<List<VideoDataModel>> readJsonData() async {
    final jsonData = await rootBundle.loadString('jsonFile/sample_file.json');
    final list = json.decode(jsonData) as List<dynamic>;

    return list.map((e) => VideoDataModel.fromjson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: readJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(child: Text('${data.error}'),);
          } else if (data.hasData) {
            var items = data.data as List<VideoDataModel>;
            return ListView.builder(
                itemCount: items == null ? 0 : items.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                  onTap: (){
                    print(items[index].videoUrl.toString());
                    Navigator.push(context, MaterialPageRoute(builder: (builder) => YtVideoPlayerPage(yturl: items[index].videoUrl.toString())));
                  },
                  child: Card(
                    elevation: 5,
                    child:Container(
                      padding: const EdgeInsets.all(10),
                    child: Text(items[index].title.toString())),
                  ),
                  );
                }
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
