import 'package:habitera/features/habit_tracker/data/models/habit_checkin_isar.dart';
import 'package:habitera/isar_service.dart';
import 'package:habitera/utils/day_key.dart';
import 'package:isar/isar.dart';

//. Handle all checkin related stuffs here that the UI doesn't need to know about
//. will handle all isar operations so the ui doesn't handle that

//. CORE RESPONSIBILITES
//. Ensure “one check-in per habit per day”
//. Toggle (insert/delete)

  //. this is what happens when the user taps the checkbox
class CheckinRepository {
  Future<void> toggleDone(int habitId) async {
    final today = dayKey(DateTime.now());

    final existing = await IsarService.isar.habitCheckinIsars
        .filter()
        .habitIdEqualTo(habitId)
        .dayKeyEqualTo(today)
        .findFirst();

    await IsarService.isar.writeTxn(() async {
      if (existing != null) {
        await IsarService.isar.habitCheckinIsars.delete(existing.id);
      } else {
        final checkin = HabitCheckinIsar()
          ..habitId = habitId
          ..dayKey = today;
        await IsarService.isar.habitCheckinIsars.put(checkin);
      }
    });
  }

  Future<Set<int>> doneHabitIdsToday() async {
    final today = dayKey(DateTime.now());

    final doneCheckinsToday = await IsarService.isar.habitCheckinIsars
        .filter()
        .dayKeyEqualTo(today)
        .findAll();

    return doneCheckinsToday.map((doneCheckin) => doneCheckin.habitId).toSet();
  }
}

  // Future<Set<int>> doneHabitDays(int habitId) async {
  //   final last7 = generate
  //   final checkedInHabit = await IsarService.isar.habitCheckinIsars
  //       .filter()
  //       .habitIdEqualTo(habitId)
  //       .findAll();

  //   return checkedInHabit.map((checkedInHabit) {
  //     return checkedInHabit.dayKey;
  //   }).toSet();
  // }


//. All i need is a bool that lets me know if a checkin was done on a particular day
//. or a day among thos last 7 days



//. CLARITY on the Daily Check-in feature

//. When checkbox is pressed, at that point i only know that habit.The habit i am pressing  
//. The simple goal is Habit X was done on Day Y
//. I couldn't add day as a property of a Habit because a Habit is not tied to just 1 day (a habit can be marked done on day 1, day 2, day 3)
//.   The 'day' is an event
//. Now for this I have created a separate model called HabitCheckInIsar and it only has the identity of the habit and the day the habit is marked as done:
//. The purpose of @Index() is to make query easy
// -----------------
//. @collection
//. class HabitCheckinIsar {
//. Id id = Isar.autoIncrement;

//. @Index()
//. late int habitId;

//. @Index()
//. late DateTime day;
//. }
// -----------------
//. So now how do I use HabitCheckinIsar?
//. I have created a CheckinRepository to handle all operations relating to CheckIn
//. In this Repo i will have methods 
//.  The method i will add now is toggleDone()
//.  Now how should a Habit be toggled as done?
//.   Remember when i tap on the checkbox i only know the habit i am marking as done, so i want to pass that habit as an argument into the toggleDone() method as habitId
//.   Next thing i want to do is to create today object
//.   Then query the HabitCheckInIsar database 
//.   To check if a checkin exists in the database
//.   If the checkin record that exists in the database is not equal to null then delete it
//.   If it doesn't exist then create a HabitCheckIn record
//.   Now the toggleDone() method is complete
//. 
//. What next now?
//. Get all the habitIds of the habits done today
//. query the HabitCheckin database and check for where day equal to today
//.







// . The goal is to check if habit id is equal to the 