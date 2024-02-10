import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:simplegridview/Model/model.dart';
import 'package:simplegridview/Screen/photo_detail_screen.dart';

class PhotoListScreen extends StatefulWidget {
  const PhotoListScreen({super.key});

  @override
  State<PhotoListScreen> createState() => _PhotoListScreenState();
}

class _PhotoListScreenState extends State<PhotoListScreen> {
  List<Photo> photoList = [];

  @override
  void initState() {
    getPhotoFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo List Screen'),
      ),
      body: GridView.builder(
          itemCount: photoList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 240,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PhotoDetails(photoList: photoList[index]),
                    ),
                  );
                },
                child: Card(
                  child: Column(
                    children: [
                      Image.network(
                        photoList[index].url ?? 'Unknown',
                        // height: 100,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            photoList[index].title ?? ' ',
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 14,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                      Text(photoList[index].id.toString() ?? ''),
                      // SizedBox(height: 10,),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  Future<void> getPhotoFromApi() async {
    Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    Response response = await get(uri);
    // print(response.statusCode);
    // print(response.body);

    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      for (var e in decodedResponse) {
        Photo photo = Photo.fromJson(e);
        photoList.add(photo);
        setState(() {});
      }
    }
  }
}
