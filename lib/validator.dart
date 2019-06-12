import 'dart:async';


mixin Validators{


  var emailValidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (email,sink){
      if(email.contains("@")){
        sink.add(email);
      }else{
        sink.addError("Email is not valid");
      }
    }
  );


  var nameValidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (name,sink){
      if(name.length>4){
        sink.add(name);
      }else{
        sink.addError("Name length should be greater than 4 chars.");
      }
    }
  );


  var feedbackValidator = StreamTransformer<String,String>.fromHandlers(
      handleData: (feedback,sink){
        if(feedback.length>4){
          sink.add(feedback);
        }else{
          sink.addError("Feedback length should be greater than 4 chars.");
        }
      }
  );


}