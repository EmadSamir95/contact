import 'dart:async';
import 'validator.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validators implements BaseBloc {
  final _emailController = BehaviorSubject<String>();
  final _nameController = BehaviorSubject<String>();
  final _feedbackController = BehaviorSubject<String>();

  Function(String) get emailChanged => _emailController.sink.add;
  Function(String) get nameChanged => _nameController.sink.add;
  Function(String) get feedbackChanged => _feedbackController.sink.add;


  Stream<String> get email => _emailController.stream.transform(emailValidator);
  Stream<String> get name =>
      _nameController.stream.transform(nameValidator);
  Stream<String> get feedback =>
      _feedbackController.stream.transform(feedbackValidator);

  Stream<bool> get submitCheck =>
      Observable.combineLatest3(email, name,feedback, (e, n,f) => true);



  @override
  void dispose() {
    _emailController?.close();
    _nameController?.close();
    _feedbackController?.close();
  }


}



abstract class BaseBloc {
  void dispose();
}
