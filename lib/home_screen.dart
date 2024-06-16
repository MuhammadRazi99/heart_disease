import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:heart_disease_detector/number_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _ageController=TextEditingController();
  final _restingBlood=TextEditingController();
  final _cholesterolController=TextEditingController();
  final _maxHeartRate=TextEditingController();
  final _oldPeak=TextEditingController();
  final _majorVessels=TextEditingController();
  int _gender=0;
  int _chestPain=0;
  int _restingElectroCardiographic=0;
  int _slope=0;
  int _thaliumStressTest=0;
  bool _fastingBloodSugar=false;
  bool _exercise=false;

  @override
  void dispose() {
    // TODO: implement dispose
    _ageController.dispose();
    _restingBlood.dispose();
    _cholesterolController.dispose();
    _maxHeartRate.dispose();
    _oldPeak.dispose();
    _majorVessels.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Form Fill"),centerTitle: true,),
      body: ListView(
        children: [

          //  Age
          const Text("Age"),
          NumberTextField(controller: _ageController,),

          //  Gender
          const Text("Gender"),
          Wrap(
            children: [
              menuButton(context, _gender, ['Male','Female'], (value){setState(() {
                _gender=value!;
              });}),
            ],
          ),

          // Chest Pain Type
          const Text("Chest Pain Type"),
          Wrap(
            children: [
              menuButton(context, _chestPain, ["Typical angina","Atypical angina","Non-anginal pain","Asymptomatic"],(value){setState(() {
                _chestPain=value!;
              });}),
            ],
          ),

          // Resting Blood Pressure
          const Text("Resting Blood Pressure"),
          NumberTextField(controller: _restingBlood,),

          // Cholesterol
          const Text("Cholesterol"),
          NumberTextField(controller: _cholesterolController,),

          // Fasting Blood Sugar Level
          const Text("Fasting Blood Sugar Level above 120 mg/dl"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Yes",style: Theme.of(context).textTheme.bodySmall,),
              Radio(value: true, groupValue: _fastingBloodSugar, onChanged: (value){setState(() {
                _fastingBloodSugar=value!;
              });},activeColor: Theme.of(context).hintColor,),
              Text("No",style: Theme.of(context).textTheme.bodySmall,),
              Radio(value: false, groupValue: _fastingBloodSugar, onChanged: (value){setState(() {
                _fastingBloodSugar=value!;
              });},activeColor: Theme.of(context).hintColor,),
            ],
          ),

        //   Resting ElectroCardiographic
          const Text("Resting Electro Cardiographic"),
          menuButton(context, _restingElectroCardiographic, ["Normal", "Having ST-T wave abnormality","Showing probable or definite left ventricular hypertrophy"],
                  (value) { setState(() {
                    _restingElectroCardiographic=value!;
                  });}),

        //   Maximum Heart Rate at Stress Level
          const Text("Stress Level Maximum Heart Rate"),
          NumberTextField(controller: _maxHeartRate,),

        //   Exercise
          const Text("Exercise"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Yes",style: Theme.of(context).textTheme.bodySmall,),
              Radio(value: true, groupValue: _exercise, onChanged: (value){setState(() {
                _exercise=value!;
              });},activeColor: Theme.of(context).hintColor,),
              Text("No",style: Theme.of(context).textTheme.bodySmall,),
              Radio(value: false, groupValue: _exercise, onChanged: (value){setState(() {
                _exercise=value!;
              });},activeColor: Theme.of(context).hintColor,),
            ],
          ),


          // ST Depression
          const Text("ST Depression induced by Exercise"),
          NumberTextField(controller: _oldPeak,),

        //   Slope of Peak Exercise
          const Text("Slope of Peak Exercise"),
          Wrap(
            children: [
              menuButton(context, _slope, ["Up sloping", "Flat""Down sloping"], (value) {setState(() {
                _slope=value!;
              }); }),
            ],
          ),

        //   Number of Colour Major Vessel
          const Text("Number of Color Major Vessel"),
          NumberTextField(controller: _majorVessels,max: 4,),

        //   Thalium Stress Test
          const Text("Thalium Stress Test"),
          Wrap(
            children: [
              menuButton(context, _thaliumStressTest, ["Normal", "Fixed defect","Reversible defect","Not described"],
                      (value) { setState(() {
                        _thaliumStressTest=value!;
                      });}),
            ],
          ),

        //   Submit Button
          SizedBox(
              width: MediaQuery.of(context).size.width*0.7,
              child: ElevatedButton(onPressed: (){}, child: const Text("Submit",)))
        ]
      ),
    );
  }

  //  menu button
  DropdownButtonFormField<int> menuButton(BuildContext context, int selectedItem, List<String> dropdownItems, ValueChanged<int?> onChanged){
    return DropdownButtonFormField<int>(
      value: selectedItem,
      icon: Icon(Icons.arrow_drop_down, color: Theme.of(context).primaryColor),
      iconSize: 24,
      elevation: 10,
      style: TextStyle(color: Theme.of(context).textTheme.bodyMedium!.color,overflow: TextOverflow.ellipsis),
      onChanged: onChanged,
      isExpanded: true,
      items: List.generate(dropdownItems.length, (index) {
        return DropdownMenuItem<int>(
          value: index,
          child: Text(dropdownItems[index],maxLines: 2,),
        );
      }),
    );
  }
}
