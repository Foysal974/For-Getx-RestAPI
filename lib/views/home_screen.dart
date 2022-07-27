
import 'package:finalproject/controllers/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {

  static const routeName='/home_screen';

  final HomeScreenController _controller = Get.put(HomeScreenController());

  HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Obx(() => Text('${_controller.myValue.value}'))),
      ),
      body: Obx(() =>
          ListView.builder(
              itemCount: _controller.postList.length,
              itemBuilder: (c, i,) {
                return ListTile(
                  onTap: (){
                    _controller.removeItem(i); },
                  onLongPress:(){_controller.updateItem(i);},

                  title: Text(
                      _controller.postList[i].title.toString()),
                );
              })
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _controller.increment();},
          child: const Text('Add'),
      ),

    );
  }
}
