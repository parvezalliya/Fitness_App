import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/models/firebaseUser.dart';

class FirestoreService {
  final CollectionReference _todosCollection =
      FirebaseFirestore.instance.collection('FirebaseUser');

  Stream<List<FirebaseUser>> getTodos() {
    return _todosCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return FirebaseUser(
          id: data['id'],
          Name: data['Name'],
          Weight: data['Weight'],
          Height: data['Height'],
        );
      }).toList();
    });
  }

  Future<void> addTodo(FirebaseUser todo) {
    return _todosCollection.add({
      'id':todo.id,
      'Name': todo.Name,
      'Weight': todo.Weight,
      'Height': todo.Height,
    });
  }

  // Future<void> updateTodo(Todo todo) {
  //   return _todosCollection.doc(todo.id).update({
  //     'title': todo.title,
  //     'completed': todo.completed,
  //     'price': todo.price,
  //     'qty': todo.qty,
  //   });
  // }

  // Future<void> deleteTodo(String todoId) {
  //   return _todosCollection.doc(todoId).delete();
  // }
}