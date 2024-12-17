import 'package:flutter/material.dart';
import 'package:healthystate/presention/resources/color_manager.dart';

///////////////////////////////defultTextForm//////////////////////////
Widget defultTextForm({
  validate,
  onChanged,
  onTab,
  sufixIcon,
  prefixIcon,
  hintText,
  sufixPressed,
  controller,
  label,
  keyboardType,
  bool showpassword = false,
}) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        validator: validate,
        onTap: onTab,
        onChanged: onChanged,
        keyboardType: keyboardType,
        obscureText: showpassword,
        decoration: InputDecoration(
          labelText: label,
          suffixIconColor: ColorManager.primary,
          prefixIconColor: ColorManager.primary,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorManager.primary, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(30.0))),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ColorManager.primary,
                style: BorderStyle.solid,
                width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(30.0)),
          ),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorManager.red, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(30))),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorManager.red, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(30))),
          labelStyle: (TextStyle(color: ColorManager.button2)),
          prefixIcon: prefixIcon,
        ),
      ),
    );
Widget textformdelivery({keyboardType, onTap, icon, label, cotroller, hint}) =>
    TextFormField(
      keyboardType: keyboardType,
      onTap: onTap,
      controller: cotroller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey[350]),
        prefixIconColor: Colors.green,
        labelText: label,
        prefixIcon: icon,
        labelStyle: (TextStyle(color: ColorManager.button2)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.green, style: BorderStyle.solid, width: 3),
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
      ),
    );
//////////////////////////////////defultButton/////////////////////////////////////////////
Widget defultButton({
  required label,
  required onPressed,
  width,
  defultcolor = Colors.green,
}) =>
    Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: defultcolor,
        borderRadius: const BorderRadius.all(Radius.circular(40.0)),
        boxShadow: const [
          // BoxShadow(
          //   color: Colors.orange,
          //   blurRadius: 5.0, // soften the shadow
          //   spreadRadius: -5.0, //extend the shadow
          //   offset: Offset(
          //     5.0, // Move to right 10  horizontally
          //     5.0, // Move to bottom 10 Vertically
          //   ),
          // )
        ],
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
Widget defultElvatedButton({
  required label,
  required onPressed,
  defultcolor = Colors.green,
  required child,
}) =>
    Container(
      width: 185,
      height: 50,
      color: defultcolor,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.orange,
            blurRadius: 5.0, // soften the shadow
            spreadRadius: -5.0, //extend the shadow
            offset: Offset(
              5.0, // Move to right 10  horizontally
              5.0, // Move to bottom 10 Vertically
            ),
          )
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
//////////////////////////////////
// void displayErrorMotionToast(context) {
//   MotionToast.error(
//     title: const Text(
//       'Error',
//       style: TextStyle(
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//     description: const Text('Please check your email and password'),
//     position: MotionToastPosition.top,
//     barrierColor: Colors.black.withOpacity(0.3),
//     width: 300,
//     height: 80,
//     dismissable: false,
//   ).show(context);
// }
/////////////////////////////////////SIGNOUT////////////////////////
// void signOut(context)=> CacheHelper.removeData(Key: 'uId').then((value){
//   if(value){
//     Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>loginView()));
//   }
// });
//////////////////////////////////ToastFLutter//////////////////////////////////////
// void toast({
//   required Color color,
//   required String text,
// })=>   Fluttertoast.showToast(
//     msg: text,
//     toastLength: Toast.LENGTH_LONG,
//     gravity: ToastGravity.BOTTOM,
//     timeInSecForIosWeb: 5,
//     backgroundColor: color,
//     textColor: Colors.white,
//     fontSize: 16.0
// );
/////////////////////////////////////SIGNOUT////////////////////////
// void signOut(context)=> CacheHelper.removeData(Key: 'token').then((value){
//   if(value){
//     Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>LoginScreen()));
//   }
// });
/////////
//     bottomNavigationBar: BottomNavigationBar(
//   backgroundColor:Colors.brown,
//     unselectedItemColor:Colors.grey,
//     selectedItemColor:Colors.brown,
//   items: [
//   BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
//   BottomNavigationBarItem(icon: Icon(Icons.apps),label: 'Categories'),
//   BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favorite'),
//   BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),
// ],
//   currentIndex: cubit.Curentindex,
//   onTap: (index){
//     cubit.changeScreen(index);
//   },),