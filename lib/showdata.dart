import 'package:flutter/material.dart';
import 'package:rest_api_samp_prj/api_service.dart';
//import 'package:rest_api_samp_prj/api_service.dart';
import 'package:rest_api_samp_prj/constants.dart';
import 'package:rest_api_samp_prj/modal/usermodel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<UserModel>? _userModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = await (ApiService().getUsers());
    Future.delayed(const Duration(seconds: 3)).then((value) => setState(
          () {},
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Rest Api Example'),
        ),
        body: _userModel == null || _userModel!.isEmpty
            ? const Center()
            : GridView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: _userModel!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: ((context, index) {
                  return Card(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(_userModel![index].id.toString()),
                          Text(_userModel![index].username),
                          Text(
                            _userModel![index].email,
                            overflow: TextOverflow.clip,
                            softWrap: false,
                            textAlign: TextAlign.center,
                          ),
                          Text(_userModel![index].website)
                        ]),
                  );
                }))

        /*ListView.builder(
              itemCount: _userModel!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_userModel![index].id.toString()),
                          Text(_userModel![index].username),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_userModel![index].email),
                          Text(_userModel![index].website),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),*/
        );
  }
}
