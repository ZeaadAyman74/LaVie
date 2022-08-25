import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orange/shared/styles/colors.dart';

class MyTextField extends StatelessWidget {

  TextEditingController myController;
  TextInputType type;
  String? Function(String? value) validate;
  bool isPassword ;
  String? label;
  double height;
  int? maxLines=1;

  MyTextField({
    required this.myController,
    required this.type,
    required this.validate,
    this.isPassword=false,
    this.label,
    this.height=90,
    this.maxLines=1,
  }) ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 337,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label??'',style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 14,color: const Color(0xff6F6F6F))),
          const SizedBox(height: 5,),
          SizedBox(
            height: 60,
            child: TextFormField(
              maxLines: 1,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18,fontWeight: FontWeight.w300),
              controller: myController,
              keyboardType: type, // TextInputType.multiline
              validator: validate,
              obscureText: isPassword,
              decoration: const InputDecoration(

                focusedBorder:OutlineInputBorder( borderSide: BorderSide(color: Color(0xff939393))),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff939393)),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                enabledBorder: OutlineInputBorder( borderSide: BorderSide(color: Color(0xff939393))),

              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  double height;
  double width;
  double radius;
  void Function() function;
  String text;

  MyButton({
    Key? key,
    required this.height,
    required this.width,
    required this.radius,
    required this.function,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: myColor,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(text,style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16,color: Colors.white),),
      ),
    );
  }
}


class SearchItem extends StatelessWidget {
   TextEditingController searchController;
  late void Function() onChange;
   SearchItem({Key? key, required this.searchController,required this.onChange}) : super(key: key) ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        onChanged: (value){
          onChange;
        },
        controller: searchController,
        style:
        Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16),
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none),
            filled: true,
            fillColor: const Color(0xffF8F8F8),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(10),
              child: SvgPicture.asset(
                'assets/icons/Search.svg',
              ),
            ),
            hintText: "Search",
            hintStyle: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(fontSize: 16)),
      ),
    );
  }
}




void showToast({required String message,required ToastStates state})=>Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0);

enum ToastStates {SUCCESS,WARNING,ERROR}

Color chooseToastColor(ToastStates state){
  switch(state){
    case ToastStates.ERROR:
      return Colors.red;
    case ToastStates.SUCCESS:
      return Colors.green;
    case ToastStates.WARNING:
      return Colors.amber;
  }

}

