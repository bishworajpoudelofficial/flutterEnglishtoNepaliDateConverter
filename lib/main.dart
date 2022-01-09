import 'package:flutter/material.dart';
import 'package:nepali_utils/nepali_utils.dart';


void main()=> runApp(
  const MaterialApp(
    title: "Eng to Nep Date Converter",
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  )
);

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String selectedDate="";
  String nepaliDate = "";

  _selectDate(BuildContext context) async{
    var _selectedDate = await showDatePicker(context: context, initialDate: DateTime(1997), firstDate: DateTime(1997), lastDate: DateTime(2021));

    if(_selectedDate != null){
      setState(() {
        selectedDate = _selectedDate.toString().split(" ")[0];

        String year  = selectedDate.split("-")[0];
        String month  = selectedDate.split("-")[1];
        String day  = selectedDate.split("-")[2];


        NepaliDateTime nt = DateTime(int.parse(year), int.parse(month), int.parse(day), 14, 30, 15).toNepaliDateTime();
          nepaliDate = nt.toString().split(" ")[0];
      
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Eng to Nep Date Converter"),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MaterialButton(
            color: Colors.red,

            height: 25,
          child: const Text("Select Date"),
          onPressed:()=> _selectDate(context),
          ),

          Text('Selected date is '+ selectedDate, style: const TextStyle(fontSize: 20),),
          Text('Converted Nepali date is '+ nepaliDate, style: const TextStyle(fontSize: 20),),
        ],
      ),
    );
  }
}