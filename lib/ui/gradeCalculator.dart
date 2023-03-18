import 'package:flutter/material.dart';
import 'medicen.dart';
import 'otherDepartment.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Image.asset(
                "assets/icons/university_students.png",
                fit:BoxFit.fitWidth,
                height: 700,
              ),
              Column(
                children: [
                  const Padding(
                      padding: EdgeInsets.only(bottom: 110,left: 5,right: 5),
                      child: Text('In which department do you study?',
                          style: TextStyle(
                            backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                              color: Colors.blue,
                              fontFamily: 'Nosifer',
                              fontSize: 13,
                              decorationThickness: 50,
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.italic))),
                  Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: OutlinedButton(
                              style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all(
                                    const Size(150, 20)),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                elevation: MaterialStateProperty.all(5),
                                overlayColor:
                                    MaterialStateProperty.all(Colors.white12),
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return const Medicen();
                                }));
                              },
                              child: const Text('Health'))),
                      Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: OutlinedButton(
                              style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all(
                                    const Size(150, 20)),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                elevation: MaterialStateProperty.all(5),
                                overlayColor:
                                    MaterialStateProperty.all(Colors.white12),
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return const OtherDepartment();
                                }));
                              },
                              child: const Text('OtherDepartments'))),
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
