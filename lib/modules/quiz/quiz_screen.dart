import 'package:flutter/material.dart';
import 'package:orange/shared/components/components.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/network/local/cache_helper.dart';
class QuizScreen extends StatefulWidget {
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final PageController controller = PageController();
  int questionNumber = 1;
  int currentIndex = 0;


  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.page?.round() != currentIndex) {
        setState(() {
          currentIndex = controller.page!.round();
        });
      }
    });
  }
  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Course Exam',style: Theme.of(context).textTheme.subtitle1,),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          children: [
            MyButton(height: 20, width: 80, radius: 20, function: (){
              Navigator.pop(context);
            }, text:"Back"),
            MyButton(height: 20, width: 80, radius: 20, function: (){
              final firstDate = DateTime.now();
              CacheHelper.putData(key: 'firstDate', value: firstDate.toString()).then((value) {
                CacheHelper.putData(key: 'validQuiz', value: false);
                AppCubit.get(context).changeQuizValidation();
                Navigator.pop(context);
              });
            }, text:"Finish"),

          ],
        ),
      ),
    );

    //   backgroundColor: Colors.white,
    //   appBar: AppBar(
    //     backgroundColor: Colors.white,
    //     elevation: 0,
    //     title: const Text('Course Exam',
    //       style: TextStyle(
    //         fontFamily: 'Roboto',
    //         fontWeight: FontWeight.w500,
    //         fontSize: 19,
    //         color: Colors.black,
    //       ),
    //     ),
    //   ),
    //   body: PageView.builder(
    //     controller: controller,
    //     itemCount: 10,
    //     physics: const NeverScrollableScrollPhysics(),
    //     itemBuilder: (context , index) => Padding(
    //       padding: const EdgeInsets.all(31.0),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           RichText(
    //             text: TextSpan(
    //               text: 'Question ' ,
    //               style: const TextStyle(color: Colors.black,
    //                 fontFamily: 'Roboto',
    //                 fontWeight: FontWeight.w500,
    //                 fontSize: 36,
    //
    //               ),
    //               children: <TextSpan>[
    //                 TextSpan(
    //                   text: '$questionNumber',
    //                   style: const TextStyle(color: defaultColor,
    //                     fontFamily: 'Roboto',
    //                     fontWeight: FontWeight.w500,
    //                     fontSize: 36,
    //
    //                   ),
    //                 ),
    //                 TextSpan(
    //                   text: '${questions.length}',
    //                   style: TextStyle(
    //                     fontFamily: 'Roboto',
    //                     fontWeight: FontWeight.w500,
    //                     letterSpacing:1,
    //                     fontSize: 14,
    //                     color: Colors.grey.shade500,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           const SizedBox(height: 40,),
    //           SizedBox(
    //             height: 50,
    //             child: PageView.builder(
    //               itemCount: questions.length,
    //               itemBuilder: (context , index){
    //                 final _question = questions[index];
    //                 return buildQuestions(_question );
    //               },
    //               physics: const NeverScrollableScrollPhysics(),
    //
    //             ),
    //           ),
    //           Align(
    //             child:buildElevatedButton(),
    //             alignment: Alignment.bottomRight,
    //           ),
    //           const SizedBox(height: 20,),
    //
    //         ],
    //       ),
    //     ),
    //   ),

  }

  // Column buildQuestions(Questions question) {
  //
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(question.text,
  //         style: const TextStyle(
  //           fontFamily: 'Roboto',
  //           fontWeight: FontWeight.w600,
  //           fontSize: 20,
  //         ),
  //       ),
  //       const SizedBox(height: 32,),
  //       OptionsWidget(),
  //     ],
  //   );
  // }
  //
  // buildElevatedButton(){
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: defaultColor,
  //       borderRadius: BorderRadius.circular(10),
  //
  //     ),
  //     clipBehavior: Clip.hardEdge,
  //     width: 172,
  //     height: 43,
  //     child: MaterialButton(
  //       textColor: Colors.white,
  //       onPressed: (){
  //         if(questionNumber < questions.length){
  //           controller.nextPage(
  //             duration : const Duration(milliseconds: 250,),
  //             curve: Curves.easeInExpo,
  //
  //           );
  //           setState(() {
  //             questionNumber++;
  //           });
  //         }
  //       }, child: Text(
  //       questionNumber < questions.length ? 'Next': 'See the result',
  //     ),),
  //   );
  // }
}


// SafeArea(
// child: Scaffold(
// appBar: AppBar(
// title: const Text("Home"),
// ),
//
// body: Container(
// padding: EdgeInsets.all(30),
// child: Column(
// children: <Widget>[
// Column(
// children: <Widget>[
// InkWell(
// onTap: () {
// setState(() {
// _selection = 1;
// });
// },
// child: Stack(
// children: <Widget>[
// Container(
// height: 40,
// width: 150,
// color: _selection == 1 ? Colors.green : Colors.white,
// ),
// Row(
// children: <Widget>[
// Radio(
// focusColor: Colors.white,
// groupValue: _selection,
// onChanged: selectTime(_selection),
// value: 1,
// ),
// const Text(
// "11:00 - 12:00",
// style: TextStyle(fontWeight: FontWeight.bold),
// ),
// ],
// ),
// ],
// ),
// ),
// InkWell(
// onTap: () {
// setState(() {
// _selection = 2;
// });
// },
// child: Stack(
// children: <Widget>[
// Container(
// height: 40,
// width: 150,
// color: _selection == 2 ? Colors.green : Colors.white,
// ),
// Row(
// children: <Widget>[
// Radio(
// focusColor: Colors.white,
// groupValue: _selection,
// onChanged: selectTime(_selection),
// value: 2,
// ),
// const Text(
// "12:00 - 13:00",
// style: TextStyle(fontWeight: FontWeight.bold),
// ),
// ],
// ),
// ],
// ),
// )
// ],
// ),
// ],
// )),
// ));