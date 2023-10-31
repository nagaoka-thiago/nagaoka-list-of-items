import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/database/domain/entities/item_entity.dart';
import '../controller/form_page_controller.dart';

class FormPage extends StatefulWidget {
  final ItemEntity? itemEntity;
  const FormPage({super.key, this.itemEntity});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _controller = Modular.get<FormPageController>();

  @override
  void initState() {
    super.initState();

    if(widget.itemEntity != null) {
      _controller.setDescription(widget.itemEntity!.description!);
      _controller.setPrice(widget.itemEntity!.price!);
      _controller.setQuantity(widget.itemEntity!.quantity!);
      _controller.setTitle(widget.itemEntity!.title!);
      _controller.setItemToEdit(widget.itemEntity!);
    }
    else {
      _controller.setItemToEdit(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.itemEntity != null ? 'Edit ${widget.itemEntity!.title}' : 'Add Item'),),
      body: Column(children: [
        const SizedBox(height: 16,),
        Container(
          padding: const EdgeInsets.only(left: 8),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text('Title'),
            SizedBox(width: 300, child: Observer(builder: (context) => TextFormField(initialValue: _controller.title, onChanged: _controller.setTitle,)))
          ],),
        ),
        const SizedBox(height: 16,),
        Container(
          padding: const EdgeInsets.only(left: 8),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text('Description'),
          SizedBox(width: 300, child: Observer(builder: (context) => TextFormField(initialValue: _controller.description, onChanged: _controller.setDescription,)))
        ],),
        ),
        const SizedBox(height: 16,),
        Container(
          padding: const EdgeInsets.only(left: 8),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text('Price'),
          SizedBox(width: 300, child: Observer(builder: (context) => TextFormField(initialValue: '${_controller.price ?? ''}', onChanged: (newVal) {_controller.setPrice(double.parse(newVal));},)))
        ],),
        ),
        const SizedBox(height: 16,),
        Container(
          padding: const EdgeInsets.only(left: 8),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text('Quantity'),
          SizedBox(width: 300, child: Observer(builder: (context) => TextFormField(initialValue: '${_controller.quantity ?? ''}', onChanged: (newVal) {_controller.setQuantity(int.parse(newVal));},)))
        ],),
        ),
        const SizedBox(height: 16,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Observer(builder: (context) => TextButton(onPressed: () async{
              final result = await _controller.writeToIsa();

              if(result) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Item saved on Isar')));
                Modular.to.navigate('/home');
              }
              else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Error')));
              }
            }, child: Text(widget.itemEntity != null ? 'Edit' : 'Add'))),
            TextButton(onPressed: () async{
              Modular.to.navigate('/home');
            }, child: Text('Back')),
          ],
        )
      ],)
    );
  }
}