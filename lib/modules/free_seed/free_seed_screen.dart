import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orange/layout/layout_screen.dart';
import 'package:orange/shared/components/components.dart';
import 'package:orange/shared/components/constants.dart';
import 'package:orange/layout/cubit/cubit.dart';
import 'package:orange/shared/network/local/cache_helper.dart';

class FreeSeedScreen extends StatelessWidget {
  FreeSeedScreen({Key? key}) : super(key: key);
  TextEditingController controller = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                    child: SvgPicture.asset(
                  'assets/images/login_logo.svg',
                  fit: BoxFit.fill,
                )),
              ),
              Text(
                "Get Seeds For Free",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontSize: 22),
              ),
              Text(
                'Enter your Address',
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: Colors.black),
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  myController: controller,
                  height: 90,
                  type: TextInputType.text,
                  hint: "Address",
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'address cannot be empty';
                    } else {
                      return null;
                    }
                  }),
              const SizedBox(
                height: 10,
              ),
              MyButton(
                  height: 40,
                  width: double.infinity,
                  radius: 10,
                  function: () {
                    AppCubit.get(context).getFreeSeed(controller.text);
                    CacheHelper.putData(key: 'freeSeed', value: true);
                    freeSeed = false;
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LayoutScreen()));
                  },
                  text: "Send"),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffF0F0F0),
                ),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LayoutScreen()));
                  },
                  child: Text(
                    'Save For Later',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 16, color: const Color(0xff979797)),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
