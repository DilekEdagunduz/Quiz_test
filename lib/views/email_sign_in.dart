import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_deneme1/services/auth.dart';
import 'package:provider/provider.dart';
enum FormStatus {signIn,register,reset}

class EmailSignInPage extends StatefulWidget {

  @override
  _EmailSignInPageState createState() => _EmailSignInPageState();
}

class _EmailSignInPageState extends State<EmailSignInPage> {
  FormStatus _formStatus=FormStatus.signIn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:_formStatus==FormStatus.signIn
            ? buildSignInForm()
            :_formStatus==FormStatus.register
                ?buildRegisterForm()
                :buildResetForm(),
      )
    );
  }

 Widget  buildSignInForm() {
    final _signInFormKey = GlobalKey <FormState>();
    TextEditingController _emailController =TextEditingController();
    TextEditingController _passwordController =TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(

        key: _signInFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text ('Lütfen Giriş yapınız',style:TextStyle(fontSize: 25)),
              SizedBox(height:10,),
              TextFormField(
                controller: _emailController,
                validator: (val){
                  if (  !EmailValidator.validate(val)){
                    return 'Lütfen E-mail Adresinizi Giriniz ';

                  }
                  if (!val.contains('@')){ return 'Lütfen Geçerli Bir Adres Giriniz';}
                  else {
                    return null;
                  }

                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: 'E-mail',
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)
                  ),

                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: _passwordController,
                validator: (value){

                  if (  value.isEmpty/*!val.contains('@')*/){
                    return 'Liütfen Şifrenizi Giriniz';

                  }
                  else {
                    return null;
                  }

                },
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: 'Şifre',
                  border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                  ),
              ),
              ),
              ElevatedButton(onPressed: ()async{
                if(_signInFormKey.currentState.validate()){
                  final user = await Provider.of<Auth>(context, listen:false).signInWithEmailAndPassword(_emailController.text, _passwordController.text);
                  if (!user.emailVerified){
                    await _showMyDialog();
                    await Provider.of<Auth>(context,listen: false).signOut();
                    }
                    Navigator.pop(context);

                  }

                },

                child: Text('Giriş'),),
              TextButton(onPressed:(){
                setState(() {

                  _formStatus=FormStatus.register;
                });
              },child:Text('yeni Kayıt için tıklayınız')),
              TextButton(onPressed:(){
                setState(() {

                  _formStatus=FormStatus.reset;
                });
              },child:Text('Şifremi unuttum')),


            ],
          ),
        ),
    );
  }
 Widget  buildResetForm() {
    final _resetFormKey = GlobalKey <FormState>();
    TextEditingController _emailController =TextEditingController();
    //TextEditingController _passwordController =TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(

        key: _resetFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text ('şifre yenileme',style:TextStyle(fontSize: 25)),
            SizedBox(height:10,),
            TextFormField(
              controller: _emailController,
              validator: (val){
                if (  !EmailValidator.validate(val)){
                  return 'Lütfen E-mail Adresinizi Giriniz ';

                }
                if (!val.contains('@')){ return 'Lütfen Geçerli Bir Adres Giriniz';}
                else {
                  return null;
                }

              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                hintText: 'E-mail',
                border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)
                ),

              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: ()async{
              if(_resetFormKey.currentState.validate()){
                await Provider.of<Auth>(context,listen:false).sendPasswordResetEmail(_emailController.text);
                await _showMyDialog();

                Navigator.pop(context);

              }

            },

              child: Text('Gönder'),),



          ],
        ),
      ),
    );
  }


  Widget  buildRegisterForm() {
    final _registerFormKey = GlobalKey <FormState>();
    TextEditingController _emailController =TextEditingController();
    TextEditingController _passwordController =TextEditingController();
    TextEditingController _passwordConfirmController =TextEditingController();




    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key:_registerFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text ('Kayıt formu',style:TextStyle(fontSize: 25)),
              SizedBox(height:10,),
              TextFormField(
                controller: _emailController,
                validator: (value){
                  if (  !EmailValidator.validate(value)){
                    return 'Lütfen E-mail Adresinizi Giriniz ';

                  }
                  if (!value.contains('@')){ return 'Lütfen Geçerli Bir Adres Giriniz';}
                  else {
                    return null;
                  }

                },

                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: 'E-mail',
                  border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                  ),

                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _passwordController,
                validator: (value){
                  if (value.length<6){
                    return 'Şifreniz en az 6 karakter olamlıdır';
                  }else{return null;}
                },
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: 'şifre',
                  border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _passwordConfirmController,
                validator: (value){
                  if(value!=_passwordController.text){
                    return 'Şifreler Uyuşmuyor';
                  }else{return null;}
                }
                ,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: 'Onay',
                  border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(onPressed: ()async { if (_registerFormKey.currentState.validate()){
                final user =await Provider.of <Auth> (context , listen : false).ceateUserWithEmailAndPassword(_emailController.text, _passwordController.text);
                if (!user.emailVerified) {
                  await user.sendEmailVerification();
                }
               await _showMyDialog();
               await Provider.of<Auth>(context,listen: false).signOut();

                setState(() {
                  _formStatus =FormStatus.signIn;
                });

              }}, child: Text('Kayıt'),),
              TextButton(onPressed:(){
                setState(() {

                  _formStatus=FormStatus.signIn;
                });
              },child:Text('Zaten üye misiniz? tıklayınız')),


            ],
          )
      ),
    );
  }
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Onay Gerekiyor'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Lütfen mailinizi kontrol ediniz.'),
                Text('Onay linkini tıklayıp tekrar giriş yapmalısnız.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ANLADIM'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}
