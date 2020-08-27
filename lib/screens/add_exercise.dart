import 'package:flutter/cupertino.dart';
import 'package:pixel_fit/models/exercise.dart';
import 'package:pixel_fit/models/muscle.dart';
import 'package:pixel_fit/models/muscle_involvement.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddExercise extends StatefulWidget {
  AddExercise({Key key}) : super(key: key);

  @override
  AddExerciseState createState() => AddExerciseState();
}

class AddExerciseState extends State<AddExercise> {
  bool arm = false;
  bool core = false;
  bool leg = false;
  double points = 1.0;
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Add Exercise"),
            SizedBox(
              height: 50.0,
            ),
            CupertinoTextField(
              placeholder: "Name",
              controller: nameController,
            ),
            Row(
              children: [
                Text("Arms"),
                CupertinoSwitch(
                    value: arm,
                    onChanged: (value) {
                      setState(() {
                        arm = value;
                      });
                    }),
              ],
            ),
            Row(
              children: [
                Text("Core"),
                CupertinoSwitch(
                    value: core,
                    onChanged: (value) {
                      setState(() {
                        core = value;
                      });
                    }),
              ],
            ),
            Row(
              children: [
                Text("Legs"),
                CupertinoSwitch(
                    value: leg,
                    onChanged: (value) {
                      setState(() {
                        leg = value;
                      });
                    }),
              ],
            ),
            Row(
              children: [
                CupertinoSlider(
                  value: points,
                  min: 1.0,
                  max: 100.0,
                  divisions: 100,
                  onChanged: (double value) {
                    setState(() {
                      points = value;
                    });
                  },
                ),
                Text(points.toInt().toString())
              ],
            ),
            CupertinoButton(child: Text("Ok"), onPressed: okPressed)
          ],
        ),
      ),
    );
  }

  okPressed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final muscles = <MuscleInvolvement>[];
    if (arm)
      muscles.add(MuscleInvolvement(muscle: Muscle(name: "Arm"), weight: 1));
    if (core)
      muscles.add(MuscleInvolvement(muscle: Muscle(name: "Core"), weight: 1));
    if (leg)
      muscles.add(MuscleInvolvement(muscle: Muscle(name: "Leg"), weight: 1));
    final exercise = Exercise(
        name: nameController.text, muscles: muscles, points: points.toInt());
    final test = prefs.getString(exercise.name);
    print(test);
    await prefs.setString(exercise.name, exercise.toJson().toString());
    print(exercise);
    nameController.clear();
    setState(() {
      arm = false;
      core = false;
      leg = false;
      points = 1.0;
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }
}
