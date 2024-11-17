import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/models/task_model.dart';

class FirebaseFunctions {
  static CollectionReference<TaskModel> getTasksCol() =>
      FirebaseFirestore.instance.collection('tasks').withConverter<TaskModel>(
            fromFirestore: (snapshot, _) =>
                TaskModel.fromJson(snapshot.data()!),
            toFirestore: (task, _) => task.toJson(),
          );

  static Future<void> addTaskToFirestore(TaskModel task) async {
    CollectionReference<TaskModel> tasksCollection = getTasksCol();
    DocumentReference<TaskModel> taskDoc = tasksCollection.doc();
    task.id = taskDoc.id;
    return taskDoc.set(task);
  }

  static Future<List<TaskModel>> getTasksFromFirestore() async {
    CollectionReference<TaskModel> tasksCollection = getTasksCol();

    QuerySnapshot<TaskModel> querySnapshot = await tasksCollection.get();

    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }
}