import 'package:flutter/material.dart';

class Medicen extends StatefulWidget {
  const Medicen({super.key});
  @override
  State<Medicen> createState() => _MedicenState();
}

class _MedicenState extends State<Medicen> {
  final _formKey = GlobalKey<FormState>();
  final _score = TextEditingController();
  final _credit = TextEditingController();
  final _course = TextEditingController();
  List<Map<String, dynamic>> list = [];
  double gradePoint = 0;
  double creditTotal = 0;
  double gradePointTotal = 0;
  List<double> creditList = [];
  List<double> gradePointList = [];
  List<double> angList = [];
  List delate = [];
  String latterGrade = '';
  String course = '';
  double numberGrade = 0;
  void calculator(String course, String score, String credit) {
    setState(() {
      double scorePoint = double.parse(score);
      if ((scorePoint >= 90) && (scorePoint <= 100)) {
        numberGrade = 4;
        latterGrade = 'A+';
      } else if ((scorePoint >= 85) && (scorePoint < 90)) {
        numberGrade = 4;
        latterGrade = 'A';
      } else if ((scorePoint >= 80) && (scorePoint < 85)) {
        numberGrade = 3.75;
        latterGrade = 'A-';
      } else if ((scorePoint >= 75) && (scorePoint < 80)) {
        numberGrade = 3.5;
        latterGrade = 'B+';
      } else if ((scorePoint >= 70) && (scorePoint < 75)) {
        numberGrade = 3;
        latterGrade = 'B';
      } else if ((scorePoint >= 65) && (scorePoint < 70)) {
        numberGrade = 2.5;
        latterGrade = 'C+';
      } else if ((scorePoint >= 60) && (scorePoint < 65)) {
        numberGrade = 2;
        latterGrade = 'C';
      } else if (scorePoint < 60) {
        numberGrade = 1.75;
        latterGrade = 'D';
      }
      int creditValue = int.parse(credit);
      gradePoint = numberGrade * creditValue;
      creditTotal += creditValue;
      gradePointTotal += gradePoint;
      angList.addAll([gradePointTotal / creditTotal]);
      creditList.add(creditTotal);
      gradePointList.add(gradePointTotal);
      list.addAll([
        {
          'course': course,
          'creditValue': creditValue,
          'numberGrade': numberGrade,
          'latterGrade': latterGrade,
          'gradePoint': gradePoint
        }
      ]);
    });
  }

  String angShow() {
    double angValue = 0;
    for (int i = 0; i < angList.length; i++) {
      angValue = angList[i];
    }
    return angValue.toStringAsFixed(2);
  }

  String creditShow() {
    double creditValue = 0;
    for (int i = 0; i < creditList.length; i++) {
      creditValue = creditList[i];
    }
    return creditValue.toStringAsFixed(2);
  }

  String gradeShow() {
    double gradePointValue = 0;
    for (int i = 0; i < gradePointList.length; i++) {
      gradePointValue = gradePointList[i];
    }
    return gradePointValue.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    TableRow? tableRow = const TableRow(children: <Widget>[
      Padding(
          padding: EdgeInsets.only(top: 5, bottom: 5, left: 5),
          child: Text(
            'course',
            style: TextStyle(fontWeight: FontWeight.w900),
          )),
      Padding(
          padding: EdgeInsets.only(top: 5, bottom: 5, left: 5),
          child: Text('credit', style: TextStyle(fontWeight: FontWeight.w900))),
      Padding(
          padding: EdgeInsets.only(top: 5, bottom: 5, left: 5),
          child: Text('number Grade',
              style: TextStyle(fontWeight: FontWeight.w900))),
      Padding(
          padding: EdgeInsets.only(top: 5, bottom: 5, left: 5),
          child: Text('latter Grade',
              style: TextStyle(fontWeight: FontWeight.w900))),
      Padding(
          padding: EdgeInsets.only(top: 5, bottom: 5, left: 5),
          child: Text('grade Point',
              style: TextStyle(fontWeight: FontWeight.w900))),
    ]);

    TableRow tableRowThird = TableRow(children: <Widget>[
      const Padding(
        padding: EdgeInsets.all(5),
        child: Text('Total', style: TextStyle(fontWeight: FontWeight.w900)),
      ),
      Padding(
        padding: const EdgeInsets.all(5),
        child: Text(
          creditShow(),
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(5),
        child: Text('-'),
      ),
      const Padding(
        padding: EdgeInsets.all(5),
        child: Text('-'),
      ),
      Padding(
        padding: const EdgeInsets.all(5),
        child: Text(gradeShow()),
      ),
    ]);
    TableRow tableRowFourth = TableRow(children: <Widget>[
      const Padding(
        padding: EdgeInsets.all(5),
        child: Text('ANG', style: TextStyle(fontWeight: FontWeight.w900)),
      ),
      Padding(
        padding: const EdgeInsets.all(5),
        child: Text(
          angShow(),
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(5),
        child: Text('-'),
      ),
      const Padding(
        padding: EdgeInsets.all(5),
        child: Text('-'),
      ),
      const Padding(
        padding: EdgeInsets.all(5),
        child: Text('-'),
      )
    ]);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Health Departments'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Container(
                color: const Color.fromARGB(207, 250, 243, 243),
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.only(top: 8, left: 20),
                child: Center(
                    child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, right: 20),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'enter value';
                                } else if (value.contains(RegExp(r'[0-9]')) ||
                                    value.contains(RegExp(
                                        r'[.,,,@,#,$,%,&,-,+,(,),>,<,\,=,*,",:,;,!,?,_,/,]'))) {
                                  return 'enter only alphabetical character';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  labelText: 'course',
                                  contentPadding: EdgeInsets.only(left: 10),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  )),
                                  prefixIcon: Icon(Icons.book_outlined)),
                              keyboardType: TextInputType.name,
                              controller: _course,
                              toolbarOptions: const ToolbarOptions(
                                  copy: true,
                                  cut: true,
                                  paste: true,
                                  selectAll: true),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, right: 20),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'enter value';
                                } else if (value.contains(RegExp(r'[A-Z]')) ||
                                    value.contains(RegExp(r'[a-z]')) ||
                                    value.startsWith('.') ||
                                    value.contains(RegExp(
                                        r'[,,@,#,$,%,&,-,+,(,),<,>,\,=,*,",:,;,!,?,_,/,]'))) {
                                  return 'enter only numerical character';
                                } else if (((double.parse(_score.text) < 0) ||
                                    (double.parse(_score.text) > 100))) {
                                  return ' outOfHundred';
                                } else {
                                  return null;
                                }
                              },
                              decoration: const InputDecoration(
                                  labelText: 'score',
                                  errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 3, style: BorderStyle.solid)),
                                  contentPadding: EdgeInsets.only(left: 10),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  )),
                                  prefixIcon: Icon(Icons.numbers)),
                              keyboardType: TextInputType.number,
                              controller: _score,
                              toolbarOptions: const ToolbarOptions(
                                  copy: true,
                                  cut: true,
                                  paste: true,
                                  selectAll: true),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, right: 20),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'enter value';
                                } else if (value.contains(RegExp(r'[A-Z]')) ||
                                    value.contains(RegExp(r'[a-z]')) ||
                                    value.contains(RegExp(
                                        r'[,,@,#,$,%,&,-,+,(,),<,>,\,=,*,",:,;,!,?,_,/,]')) ||
                                    value.startsWith('.')) {
                                  return 'enter only numerical character';
                                } else if (((double.parse(_credit.text) < 0) ||
                                    (double.parse(_credit.text) > 20))) {
                                  return 'less than twenty';
                                } else if (value.length > 3) {
                                  return 'less than three character';
                                } else {
                                  return null;
                                }
                              },
                              decoration: const InputDecoration(
                                  labelText: 'credit',
                                  contentPadding: EdgeInsets.only(left: 10),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  )),
                                  prefixIcon: Icon(Icons.access_time_outlined)),
                              keyboardType: TextInputType.number,
                              controller: _credit,
                              toolbarOptions: const ToolbarOptions(
                                  copy: true,
                                  cut: true,
                                  paste: true,
                                  selectAll: true),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: OutlinedButton(
                                    style: ButtonStyle(
                                      fixedSize: MaterialStateProperty.all(
                                          const Size(130, 20)),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.blue),
                                      elevation: MaterialStateProperty.all(2),
                                      overlayColor: MaterialStateProperty.all(
                                          Colors.green),
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        calculator(_course.text, _score.text,
                                            _credit.text);
                                      }
                                    },
                                    child: const Text(
                                      'calculate',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 19,
                                          fontWeight: FontWeight.w600),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 7),
                                child: OutlinedButton(
                                    style: ButtonStyle(
                                      fixedSize: MaterialStateProperty.all(
                                          const Size(130, 20)),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.blue),
                                      elevation: MaterialStateProperty.all(2),
                                      overlayColor:
                                          MaterialStateProperty.all(Colors.red),
                                    ),
                                    onPressed: () {
                                      _course.clear();
                                      _score.clear();
                                      _credit.clear();
                                    },
                                    child: const Text(
                                      'clear',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 19,
                                          fontWeight: FontWeight.w600),
                                    )),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ))),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                  color: const Color.fromARGB(207, 250, 243, 243),
                  child: Table(
                    border: TableBorder.all(
                        color: Colors.blueGrey,
                        width: 2,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5))),
                    defaultColumnWidth: const FixedColumnWidth(70),
                    children: [
                      tableRow,
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                  color: const Color.fromARGB(207, 250, 243, 243),
                  child: Table(
                    border: TableBorder.all(
                        color: Colors.blueGrey,
                        width: 2,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5))),
                    defaultColumnWidth: const FixedColumnWidth(70),
                    children: [
                      for (var view in list)
                        TableRow(children: [
                          TableCell(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Text('${view['course']}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Text('${view['creditValue']}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Text('${view['numberGrade']}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Text('${view['latterGrade']}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Text('${view['gradePoint']}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400)),
                              ),
                            ],
                          ))
                        ])
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                  color: const Color.fromARGB(207, 250, 243, 243),
                  child: Table(
                    border: TableBorder.all(
                        color: Colors.blueGrey,
                        width: 2,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5))),
                    defaultColumnWidth: const FixedColumnWidth(70),
                    children: <TableRow>[
                      tableRowThird,
                      tableRowFourth,
                    ],
                  )),
            )
          ],
        ));
  }
}
