import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:orange/modules/scan/qr_scanner_overlay.dart';
import 'package:orange/shared/styles/colors.dart';

class ScanScreen extends StatefulWidget {

 const ScanScreen( {Key? key}) : super(key: key);

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  MobileScannerController cameraController=MobileScannerController();
  String? value;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   cameraController.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            MobileScanner(
                allowDuplicates: false,
                controller: cameraController,
                onDetect: (barcode, args) {
                  setState(() {
                    value = barcode.rawValue;
                  });
                  debugPrint('BarCode Found! ${barcode.rawValue!}');
                }),
            QRScannerOverlay(overlayColour: Colors.black.withOpacity(.5)),
            Positioned(
                bottom: 100,
                left: 30,
                right: 30,
                child:
                    value!=null?
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey.withOpacity(.6),
                  ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                  children: [
                      Expanded(
                        child: Text(
                          value! ,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 6
                        ),
                      ),
                      const Spacer(),
                      CircleAvatar(backgroundColor: defaultColor,child: IconButton(onPressed: (){}, icon: SvgPicture.asset('assets/icons/arrow_right.svg')))

                  ],
                ),
                    )) : Container()),
          ],
        ),
      ),
    );
  }
}
