import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

final GoogleSignIn googleSignIn = GoogleSignIn();

String name;
String email;
String imageurl;
String uid;
String phonenumber;
Future<String> signInWithGoogle() async  {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();

  final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    idToken: googleSignInAuthentication.idToken, 
    accessToken: googleSignInAuthentication.accessToken,
    );
  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;

  assert(!user.isAnonymous);
  assert(await user.getIdToken()!=null);
  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);
  assert(user.email!=null);
  assert(user.displayName!=null);
  assert(user.photoUrl!=null);
  assert(user.uid!=null);
  // assert(user.phoneNumber!=null);
  if(user.phoneNumber!=null)
  phonenumber = user.phoneNumber;
  else
  phonenumber = "No Phone Number Available";

  name = user.displayName;
  email = user.email;
  imageurl = user.photoUrl;
  uid= user.uid;
  
  return 'signInWithGoogle succeeded : $user';
}
Future signOutGoogle() async{
  await googleSignIn.signOut();

  
}