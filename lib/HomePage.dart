import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> productSize = [
    'S','M','L','XL','XXL','XXXL'
  ];
  List<Color> buttonColors = List.generate(6, (index) => Colors.grey);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Size Selector"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
              child: SizedBox(

          )),
          Expanded(
            flex: 6,
            child: GridView.builder(
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 2.0
                ),
                itemBuilder: (context , index){
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ElevatedButton(
                        onPressed: (){
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Your Selected Size Is : ${productSize[index]}"),
                                duration: const Duration(seconds: 2),
                              )
                          );
                          setState(() {
                            buttonColors = List.generate(6, (index) => Colors.grey);
                            buttonColors[index] = Colors.yellowAccent;

                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColors[index],
                        ),
                        child: Text(productSize[index]),
                      ),
                    );
                }
            ),
          ),
        ],
      ),
    );
  }
}
