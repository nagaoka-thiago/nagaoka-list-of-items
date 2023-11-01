import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nagaoka_list_items/features/home/view/pages/widgets/item_widget.dart';

import '../controller/home_page_controller.dart';
import 'widgets/add_button.dart';

class HomePage extends StatefulWidget {
  final String displayName;
  const HomePage({super.key, required this.displayName});

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
    return Observer(builder: (context) => Scaffold(appBar: AppBar(title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('List of items'),
          Text(widget.displayName, style: TextStyle(color: Colors.black, fontSize: 12)),
        ],),
        _controller.isLoading ? CircularProgressIndicator() :
        TextButton(onPressed: () async{
          _controller.changeIsLoading(true);
          final result = await _controller.signout();

          if(result) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Logged out!')));
            Modular.to.navigate('/');
          }
          _controller.changeIsLoading(false);
        }, child: Text('Logout', style: TextStyle(color: Colors.black)))
      ],
    )),
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