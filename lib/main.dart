import 'package:flutter/material.dart';
import 'package:mygetxusers/usersapi/Address.dart';
import 'package:mygetxusers/usersapi/Users.dart';
import 'package:get/get.dart';
import 'Apiservice.dart';

class Controller extends GetxController {

RxList<Address>addlist=<Address>[].obs;
  RxList<Users> userlist=<Users>[].obs;

  ApiService apiService=ApiService();
  Future<void> Fetch() async {

    var list =await apiService.fetchdata();
    userlist.assignAll(list as Iterable<Users>);
    update();
    addlist.assignAll(list as Iterable<Address>);
    update();
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // title: 'Flutter Demo',
      // theme: ThemeData(
      //
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      home: First(),
    );
  }
}
class First extends StatelessWidget {
  const First({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller());
    controller.Fetch();

    return Scaffold(
      body:
      Center(
        child: GetBuilder<Controller>(
            builder: (_)
            {
              return ListView.builder(
                itemCount: controller.userlist.length,
                itemBuilder: (BuildContext context, int index) {

                  Users u=controller.userlist[index];
                  return ListTile(
                    title: Text("${u.email}"),
                  //  title: Text("${u.firstName}"),
                   // subtitle: Text("${u.firstName}"),
                    subtitle:Text("${u.firstName}"),
                    leading:CircleAvatar(backgroundImage: NetworkImage("${u.image}"),),
trailing: ElevatedButton(onPressed: (){
  Get.to(Second());
}, child: Text("Address")),
                  );


                },

              );

            }
        ),
      ),

    );
  }
}

class Second extends StatelessWidget {
  const Second({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller());
    controller.Fetch();
    return Scaffold(
      body:  Center(
        child: GetBuilder<Controller>(
            builder: (_)
            {
              return ListView.builder(
                itemCount: controller.addlist.length,
                itemBuilder: (BuildContext context, int index) {

                  Address a=controller.addlist[index];
                  return ListTile(
                    title: Text("${a.address}"),
                   
                    subtitle: Text("${a.city}"),
                    leading:Text("${a.state}"),
                    trailing: ElevatedButton(onPressed: (){}, child: child),
                  );


                },
                

              );

            }
        ),
      ),
    );
  }
}
