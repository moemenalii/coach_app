// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:health_state/presention/resources/Constant.dart';
// import 'package:health_state/presention/resources/assets_Manager.dart';
// import 'package:health_state/presention/resources/color_manager.dart';
// import 'package:health_state/presention/resources/routes_Manager.dart';
// import 'package:health_state/presention/resources/strings_Manager.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//
// import '../resources/values_manager.dart';
//
//
// class OnBoardingView extends StatefulWidget {
//   const OnBoardingView({super.key});
//
//   @override
//   State<OnBoardingView> createState() => _OnBoardingViewState();
// }
//
// class _OnBoardingViewState extends State<OnBoardingView> {
//   var _pageSliderController =PageController();
//   late final List<sliderObject> _list = _getSliderData();
//   int _currentIndex=0;
//   List<sliderObject> _getSliderData() => [
//         sliderObject(ImagesAssets.onboarding_logo1,
//             AppStrings.onBoardingSubTitle1, AppStrings.onBoardingSubTitle1),
//         sliderObject(ImagesAssets.onboarding_logo2,
//             AppStrings.onBoardingSubTitle2, AppStrings.onBoardingSubTitle2),
//         sliderObject(ImagesAssets.onboarding_logo3,
//             AppStrings.onBoardingSubTitle3, AppStrings.onBoardingSubTitle3),
//       ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorManager.white,
//       appBar: AppBar(
//         backgroundColor: ColorManager.white,
//         systemOverlayStyle: SystemUiOverlayStyle(
//           statusBarBrightness: Brightness.dark,
//             statusBarColor: ColorManager.white),
//         elevation: 0.00,
//       ),
//       body: PageView.builder(itemBuilder: (context,index)=>ItemBuilder(_list[index]),itemCount: _list.length,onPageChanged: (value) {
//         setState(() {
//           _currentIndex=value;
//         });
//       },controller:_pageSliderController ),
//       bottomSheet: Container(
//         height: AppSize.s16,
//       color: ColorManager.white,
//         child:Column(children: [
//           Align(
//             alignment: Alignment.center,
//             child: TextButton(child:Text(AppStrings.skip,style: TextStyle(color: ColorManager.primary),),onPressed:(){} ,),
//           ),
//           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               IconButton(onPressed: (){
//                 if(_list.length>3){
//                   Navigator.pushReplacementNamed(context, Routes.loginRoute);
//                 }else{
//                   _pageSliderController.nextPage(duration:const Duration(milliseconds: AppConstants.sliderPage),curve: Curves.easeInOutCubicEmphasized);
//                 }
//               }, icon: Icon(Icons.arrow_back_ios)),
//               SmoothPageIndicator(controller:_pageSliderController , count:_list.length,effect:WormEffect(dotWidth: .5,dotHeight: .2), ),
//               IconButton(onPressed: (){
//                 if(_list.length>3){
//                 Navigator.pushReplacementNamed(context, Routes.loginRoute);
//               }else{
//                 _pageSliderController.previousPage(duration:const Duration(milliseconds:AppConstants.sliderPage),curve: Curves.easeInOutCubicEmphasized);
//               }
//               }, icon: Icon(Icons.arrow_forward_ios)),
//
//               ],)
//         ],) ,),
//     );
//   }
// }
//
// class sliderObject {
//   String title;
//   String subTitle;
//   String image;
//   sliderObject(this.image, this.title, this.subTitle);
// }
//   class ItemBuilder extends StatelessWidget {
//    final  sliderObject _sliderObject;
//     const ItemBuilder(this._sliderObject,{super.key});
//
//     @override
//     Widget build(BuildContext context) {
//       return Column(children: [
//     Padding(
//       padding: const EdgeInsets.all(AppPadding.p8),
//       child: Text(_sliderObject.title,style: Theme.of(context).textTheme.displayLarge,),
//     ),
//     const SizedBox(height:AppSize.s4,),
//     Padding(
//       padding: const EdgeInsets.all(AppPadding.p20),
//       child: Text(_sliderObject.subTitle,),
//     ),
//     const SizedBox(height: AppSize.s8,),
//       Image(image: AssetImage(_sliderObject.image))
//
//   ],);
//     }
//   }
//
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:healthystate/presention/resources/routes_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../resources/assets_manager.dart';

class BoardingModel {
  final String title;
  final String body;
  final String image;
  BoardingModel({required this.title, required this.body, required this.image});
}

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  var boardController = PageController();

  bool isLast = false;

  // void submit (){
  // CacheHelper.saveData(Key: 'boarding', value:true ).then((value) {
  //   if(value){
  //     Navigator.pushReplacementNamed(context, Routes.loginRoute);
  //   }
  // });
  // }
  List<BoardingModel> boarding = [
    BoardingModel(
        title: 'Fitness ',
        body: 'Keep your body fit',
        image: 'assets/images/on1.png'),
    BoardingModel(
        title: 'Diet',
        body: 'Choose the appropriate diet',
        image: 'assets/images/on2.png'),
    BoardingModel(
        title: 'Food System',
        body: 'make your life more healthy',
        image: 'assets/images/on3.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //   // appBar: AppBar(),
        //     appBar: AppBar(
        //     systemOverlayStyle: SystemUiOverlayStyle(
        //     statusBarColor: Colors.transparent,
        //     statusBarBrightness: Brightness.dark,
        // ),),
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 60,
          ),
          const Image(image: AssetImage(ImagesAssets.Logo)),
          Expanded(
            child: PageView.builder(
              onPageChanged: (int index) {
                if (index == boarding.length - 1) {
                  isLast = true;
                }
              },
              controller: boardController,
              itemBuilder: (context, index) => BuildItem(boarding[index]),
              itemCount: boarding.length,
            ),
          ),
          Row(
            children: [
              //لخطوط بتاعت البوردينج بتاعت الصفحات
              SmoothPageIndicator(
                controller: boardController,
                count: boarding.length,
                effect: const ExpandingDotsEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    spacing: 5,
                    activeDotColor: Colors.green),
              ),
              const Spacer(),
              FloatingActionButton(
                onPressed: () {
                  if (isLast == true) {
                    Navigator.pushNamed(context, Routes.GenderSelectionScreenRoute);
                  } else {
                    boardController.nextPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOutCubicEmphasized);
                  }
                },
                backgroundColor: Colors.green,
                child: const Icon(Icons.arrow_forward_outlined),
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    ));
  }
}

Widget BuildItem(BoardingModel model) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Image.asset(model.image)),
        const SizedBox(
          height: 30,
        ),
        Text(
          model.title,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          model.body,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[300]),
        ),
      ],
    );
