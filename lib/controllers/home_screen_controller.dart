import 'package:dio/dio.dart';
import 'package:finalproject/models/JsonHolderData.dart';
import 'package:finalproject/models/user.dart';
import 'package:get/get.dart';


class HomeScreenController extends GetxController{

    var myValue=0.obs;
    var appBar='Home Screen'.obs;
    var cgpa=4.1.obs;
    var myUserList=[].obs;
    var myMap={}.obs;
    var isActive=false.obs;
    var name=<String>['Foal'].obs;
    var number=<int>[1,2,3].obs;
    var userModel=<UserModel>[].obs;
    var postList=<JsonHolderData>[].obs;


    @override
  void onInit(){
    // print('OnInit Method Called');
      cgpa.value=3.5;
      _fetchPostData();
      _fetchPostData1();
      super.onInit();

    }

  @override
  void onClose(){
      // print('OnClose Method Called');
      cgpa.close();
      super.onClose();

  }

    void increment() {
      myValue.value++;
      myUserList.add('item-${myValue.value}');
    }

    void removeItem(int index){
      myUserList.removeAt(index);
    }

  updateItem(int i) {
      myUserList[i]='Foal';
  }

 // Without parameter

 Future <void> _fetchPostData() async {
   var myUrl = 'http://jsonplaceholder.typicode.com';
   Dio dio = Dio(BaseOptions(
     baseUrl: myUrl,
   ));

   var response = await dio.get('/posts');

   if (response.statusCode == 200) {
     // print('HTTP Method: ${response.requestOptions.method}');
     // print('HTTP Url: ${response.requestOptions.baseUrl}');
     // print('HTTP Path: ${response.requestOptions.path}');
     // print('HTTP Status Code: ${response.statusCode} Status Massage:${response.statusMessage}');

     var myPostData=response.data as List;

     var newList=myPostData.map((e) => JsonHolderData.fromJson(e)).toList();

     postList.addAll(newList);

     // print('def${postList.length}');

   } else {
     // print('Failed to load data');
      }
   }


 //  Using Parameter

 Future <void> _fetchPostData1() async {
   var myUrl = 'https://randomuser.me';
   Dio dio = Dio(BaseOptions(
     baseUrl: myUrl,
   ));

   var response = await dio.get('/api/', queryParameters: {'results':'10'});

   if (response.statusCode == 200) {
     // print('HTTP Method: ${response.requestOptions.method}');
     // print('HTTP Parameter: ${response.requestOptions.queryParameters}');
     // print('HTTP Path: ${response.requestOptions.path}');
     // print('HTTP Status Code: ${response.statusCode} Status Massage:${response.statusMessage}');

     // print(response.data);

   }else {
         // print('Failed to load data');
       }
     }
   }
