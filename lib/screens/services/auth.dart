import 'package:firebase_auth/firebase_auth.dart';
import 'package:latest/models/user.dart';

class Authservice{


  final FirebaseAuth _auth = FirebaseAuth.instance;
  User _userfromfirebaseuser(FirebaseUser user){

    return user!=null?User(userid: user.uid):null;

    
  }


  Stream<User> get user{
    return _auth.onAuthStateChanged.map(_userfromfirebaseuser);
  }

Future registerUsingEmail(String email,String password)async{
try{

 AuthResult authResult = await _auth.createUserWithEmailAndPassword(email: email, password: password);
FirebaseUser user = authResult.user;
  return _userfromfirebaseuser(user);


}catch(e){

  print(e.message);
  return null;


}





}



Future signInWIthEmail(String email,String password)async{
try{

 AuthResult authResult = await _auth.signInWithEmailAndPassword(email: email, password: password);
FirebaseUser user = authResult.user;
  return _userfromfirebaseuser(user);


}catch(e){

  print(e.message);
  return null;


}





}







Future signout()async{




  try {


   return await _auth.signOut();
    


  } catch (e) {


    print(e.toString());
  }
}

Future signanonymous()async{

try {
  AuthResult result = await  _auth.signInAnonymously();

  FirebaseUser user = result.user;
return _userfromfirebaseuser(user);


} catch (e) {

  print(e.toString());
  return null;
}









}











}