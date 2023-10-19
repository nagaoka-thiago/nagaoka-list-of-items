import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nagaoka_list_items/features/home/view/pages/widgets/item_widget.dart';

import '../controller/home_page_controller.dart';
import 'widgets/add_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = Modular.get<HomePageController>();
  final _scrollController = ScrollController();
  
  @override
  void initState() {
    super.initState();

    _controller.initializeList();
  }
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) => Scaffold(appBar: AppBar(title: Text('List of items')),
                    body: SingleChildScrollView(
                      controller: _scrollController,
                      child: Column(children: [
                        ListView.builder(controller: _scrollController ,shrinkWrap: true, itemCount: _controller.items.length, itemBuilder: (context, i) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(height: 16,),
                                ItemWidget(itemEntity: _controller.items[i], onPressed: () {
                                  Modular.to.navigate('/form/', arguments: {
                                                                              'itemEntity': _controller.items[i]
                                                                          }
                                                    );
                                },
                                onDeletePressed: () async{
                                  final deleted = await _controller.deleteItem(_controller.items[i]);

                                  if(deleted) {
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Item deleted on Isar')));
                                    _controller.initializeList();
                                  }
                                  else {
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Error')));
                                  }
                                },),
                                SizedBox(height: 45,),
                              ],
                            );
                      })]),
                    ),
                    floatingActionButton: AddButton(onPressed: () {
                      Modular.to.navigate('/form/', arguments: {
                        'itemEntity': null
                      });
                      _controller.initializeList();
                    },),
                  ));
  }
}