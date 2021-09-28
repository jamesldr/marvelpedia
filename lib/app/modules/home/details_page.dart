import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvelpedia/app/models/character_model.dart';
import 'package:marvelpedia/app/modules/home/home_store.dart';
import 'package:sizer/sizer.dart';

class DetailsPage extends StatefulWidget {
  final CharacterModel character;
  const DetailsPage({
    Key? key,
    required this.character,
  }) : super(key: key);
  @override
  DetailsPageState createState() => DetailsPageState();
}

class DetailsPageState extends State<DetailsPage> {
  final HomeStore store = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.character.name!),
      ),
      body: RawScrollbar(
        thumbColor: Colors.red,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.network(widget.character.thumbnail!.path! +
                        '.' +
                        widget.character.thumbnail!.extension!),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(widget.character.name!,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 24.sp,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('\t\t\t\t\t\t\t\t' + widget.character.description!,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 14.sp)),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Aparição nos quadrinhos',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Container(
                color: Colors.red,
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: store.comics.length,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.7,
                    ),
                    itemBuilder: (_, i) {
                      return Container(
                        color: Colors.black,
                        child: Image.network(
                          store.comics[i].thumbnail!.path! +
                              '.' +
                              store.comics[i].thumbnail!.extension!,
                          loadingBuilder: (context, child, progress) {
                            if (progress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: progress.expectedTotalBytes != null
                                    ? progress.cumulativeBytesLoaded /
                                        progress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
