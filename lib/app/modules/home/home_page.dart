import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sizer/sizer.dart';

import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  late ScrollController scrolltroller;
  @override
  void initState() {
    super.initState();
    scrolltroller = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    scrolltroller.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    print(scrolltroller.position.extentAfter);
    if (scrolltroller.position.extentAfter == 0) {
      store.populateMoreCharacters();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marvelpedia'),
      ),
      body: Container(
          color: Colors.black,
          constraints: BoxConstraints(
            minWidth: 100.w,
            minHeight: 100.h,
          ),
          child: FutureBuilder(
              future: store.populateCharacters(),
              builder: (context, snapshot) {
                return Observer(
                  builder: (_) {
                    return RawScrollbar(
                      thumbColor: Colors.redAccent,
                      child: GridView.builder(
                        controller: scrolltroller,
                        itemCount: store.characters.length,
                        itemBuilder: (_, i) {
                          return InkWell(
                            onTap: () =>
                                store.gotoHeroDetails(store.characters[i]),
                            child: Card(
                              child: Stack(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Image.network(store.characters[i]
                                                .thumbnail!.path! +
                                            '.' +
                                            store.characters[i].thumbnail!
                                                .extension!),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: 64,
                                            color: Colors.red.withOpacity(0.7),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Center(
                                                child: Text(
                                                  store.characters[i].name
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 11.sp,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                      ),
                    );
                  },
                );
              })),
    );
  }
}
