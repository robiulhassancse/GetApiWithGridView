import 'package:flutter/material.dart';
import 'package:simplegridview/Model/model.dart';

class PhotoDetails extends StatefulWidget {
  const PhotoDetails({super.key, required this.photoList});
  final Photo photoList;

  @override
  State<PhotoDetails> createState() => _PhotoDetailsState();
}

class _PhotoDetailsState extends State<PhotoDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Details Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(11),
        child: Column(
          children: [
            SizedBox(height: 50,),
            Image.network('${widget.photoList.url}'),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
              child: Text('Title : ${widget.photoList.title}',),
            ),
            SizedBox(height: 5,),
            Text('ID: ${widget.photoList.id}')
            
          ],
        ),
      ),
    );
  }
}
