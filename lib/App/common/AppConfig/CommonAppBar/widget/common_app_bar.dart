import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/App/Screens/NewUserTask/new_user_task_screen.dart';
import 'package:msm_unify/App/common/AppConfig/CommonAppBar/controller/app_bar_controller.dart';
import 'package:msm_unify/App/common/color_constant.dart';
import 'package:msm_unify/model/responseModek/get_feedback_list_response_model.dart';
import 'package:msm_unify/model/responseModek/what_do_you_want_response_model.dart';
import 'package:msm_unify/repo/what_do_you_want_repo.dart';
import 'package:msm_unify/viewModel/get_notification_count_view_model.dart';
import 'package:msm_unify/viewModel/what_do_you_want_view_model.dart';

import '../../../../../viewModel/get_feedback_list_view_model.dart';
import '../../../../Screens/Forms/forms_screen.dart';
import '../../../../Screens/KnowledgeCentre/knowledge_centre_screen.dart';
import '../../../../Screens/Notification/notification_screen.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';


PreferredSize buildPreferredSize(
    BuildContext context, GlobalKey<ScaffoldState> key) {
  String? selectedCountry;
  String? selectedPartner;
  bool _checkvalue = false;
  final _cmtController = TextEditingController();
  final List<String> _partner = ['All', 'GMO', 'MSM Unify'];

  CommonAppBarController commonAppBarController =
      Get.put(CommonAppBarController());

  final GetNotificationCountViewModel getNotificationCountViewModel =
      Get.put(GetNotificationCountViewModel());

  GetFeedBackListViewModel getFeedBackListViewModel =
      Get.put(GetFeedBackListViewModel());
  return PreferredSize(
    preferredSize: Size(MediaQuery.of(context).size.height, 205),
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          height: 50,
          width: Get.width,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/icons/logo.png",
                width: Get.width * 0.15,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(const KnowledgeCenterScreen());
                    },
                    child: SvgPicture.asset(
                      'assets/icons/Knowladge-base.svg',
                      height: Get.height * 0.022,
                      width: Get.width * 0.10,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(const FormScreen());
                    },
                    child: SvgPicture.asset(
                      'assets/icons/Forms.svg',
                      height: Get.height * 0.030,
                      width: Get.width * 0.10,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return SimpleDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(color: Colors.red)),
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  children: [
                                    Row(children: [
                                      const Text(
                                        'Feedback',
                                        style: TextStyle(
                                            color: kNavy,
                                            fontFamily: 'Poppins',
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Spacer(),
                                      InkWell(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: Container(
                                          height: Get.height * 0.03,
                                          width: Get.width * 0.06,
                                          decoration: BoxDecoration(
                                              color: kRed,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: const Icon(
                                            Icons.close,
                                            color: Colors.white,
                                            size: 25,
                                          ),
                                        ),
                                      ),
                                    ]),
                                    SizedBox(
                                      height: Get.height * 0.02,
                                    ),
                                    Container(
                                      height: Get.height * 0.2,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: kGrey4),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: TextFormField(
                                        controller: _cmtController,
                                        decoration: InputDecoration(
                                            hintStyle: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.2)),
                                            hintText:
                                                'Write down your comments here.....',
                                            border: InputBorder.none),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        StatefulBuilder(
                                          builder: (BuildContext context,
                                              void Function(void Function())
                                                  setState) {
                                            return Checkbox(
                                              activeColor: Colors.red,
                                              value: _checkvalue,
                                              onChanged: (value) {
                                                setState(() {
                                                  _checkvalue = value!;
                                                });
                                              },
                                            );
                                          },
                                        ),
                                        const Text(
                                          "Include Screenshot",
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: Get.height * 0.05,
                                      width: Get.width * 0.20,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: kRed),
                                      child: const Center(
                                        child: Text(
                                          'Update',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Roboto',
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            'Recent Feedbacks',
                                            style: TextStyle(color: kRed),
                                          ),
                                        ),
                                      ],
                                    ),
                                    GetBuilder<GetFeedBackListViewModel>(
                                      builder: (controller) {
                                        if (controller.apiResponse.status ==
                                            Status.COMPLETE) {
                                          List<GetFeedbackListResponseModel>
                                              response =
                                              controller.apiResponse.data;
                                          return Container(
                                            height: Get.height * 0.3,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                border:
                                                    Border.all(color: kGrey4),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: Get.height * 0.02,
                                                  ),
                                                  Text(
                                                      '${response[0].feedbackMessage}',
                                                      style: TextStyle(
                                                          color: Colors.black
                                                              .withOpacity(0.5),
                                                          fontFamily: 'Roboto',
                                                          fontSize: 15)),
                                                  SizedBox(
                                                    height: Get.height * 0.02,
                                                  ),
                                                  Container(
                                                    height: Get.height * 0.2,
                                                    width: Get.width,
                                                    child: Image(
                                                      fit: BoxFit.fill,
                                                      image: NetworkImage(
                                                          'https://msmqastorage.blob.core.windows.net/files/files/feedback/${response[0].attachmentPath}'),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        } else {
                                          if (controller.apiResponse.status ==
                                              Status.ERROR) {
                                            return const Center(
                                              child:
                                                  Text('Somthing went wrong'),
                                            );
                                          }
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                      );
                    },
                    child: SvgPicture.asset(
                      'assets/icons/Feedback.svg',
                      height: Get.height * 0.030,
                      width: Get.width * 0.10,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(NewUserTaskScreen());
                    },
                    child: SvgPicture.asset(
                      'assets/icons/Task.svg',
                      height: Get.height * 0.030,
                      width: Get.width * 0.10,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  GetBuilder<GetNotificationCountViewModel>(
                    builder: (controller) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(const NotificationScreen());
                        },
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/Notification.svg',
                              height: Get.height * 0.030,
                              width: Get.width * 0.10,
                            ),
                            Positioned(
                              top: -5,
                              right: -5,
                              child: Container(
                                height: 18,
                                width: 18,
                                decoration: const BoxDecoration(
                                  color: kRed,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    '${controller.notification}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 8,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  // GestureDetector(
                  //   onTap: () {},
                  //   child: Container(
                  //     height: Get.height * 0.03,
                  //     width: Get.width * 0.10,
                  //     decoration: BoxDecoration(
                  //       border: Border.all(color: Colors.black),
                  //       shape: BoxShape.circle,
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   width: 8,
                  // ),
                  // PopupMenuButton(
                  //   padding: EdgeInsets.all(0),
                  //   shape: const RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(20),
                  //     bottomLeft: Radius.circular(20),
                  //   )),
                  //   child: SvgPicture.asset(
                  //     'assets/icons/drop_down_arrow.svg',
                  //     height: Get.height * 0.012,
                  //     width: Get.width * 0.10,
                  //   ),
                  //   itemBuilder: (BuildContext context) => [
                  //     PopupMenuItem(
                  //       onTap: () {
                  //         Get.to(const ProfileScreen());
                  //       },
                  //       child: const Text('Profile'),
                  //     ),
                  //     PopupMenuItem(
                  //       onTap: () {
                  //         Get.to(const ChangePassScreen());
                  //       },
                  //       child: const Text('Change Password'),
                  //     ),
                  //     PopupMenuItem(
                  //       onTap: () {
                  //         Get.to(const AccountManScreen());
                  //       },
                  //       child: const Text('Account Manager'),
                  //     ),
                  //     PopupMenuItem(
                  //       onTap: () {
                  //         Get.to(const UserScreen());
                  //       },
                  //       child: const Text('Users'),
                  //     ),
                  //     PopupMenuItem(
                  //       onTap: () {
                  //         Get.to(const LoginScreen());
                  //       },
                  //       child: const Text('Log Out'),
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(
                  //   width: 8,
                  // ),
                  GestureDetector(
                    onTap: () {
                      key.currentState!.openEndDrawer();
                    },
                    child: SvgPicture.asset(
                      'assets/icons/hamburger-red.svg',
                      height: Get.height * 0.022,
                      width: Get.width * 0.10,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        GetBuilder<CommonAppBarController>(builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Search program to apply",
                  style: TextStyle(
                      color: Color(0xff555555),
                      fontFamily: 'Roboto',
                      fontSize: 11),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: Get.height * 0.060,
                      width: Get.width*0.50,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: kGrey4),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: true,
                            borderRadius: BorderRadius.circular(5),
                            hint: const Text("Nationalities"),
                            value: selectedCountry,
                            items: controller.countryS.map((country) {
                              return DropdownMenuItem(

                                  value: country.countryName.toString(),
                                  child: Text(
                                    country.countryName.toString(),
                                    style: const TextStyle(
                                        color: kGrey4,
                                        fontFamily: "Roboto",
                                        fontSize: 13),
                                  ));
                            }).toList(),
                            onChanged: (newValue) {
                              selectedCountry = newValue as String?;
                            }),
                      ),
                    ),
                    SizedBox(width: 6,),
                    Flexible(
                      child: 
                      SizedBox(
                        height: Get.height * 0.060,
                        width: Get.width * 0.55,
                        child:  
                      // GetBuilder<WhatDoYouWantViewModel>(
                      //                 builder: (controller) {
                      //                   if (controller.apiResponse.status ==
                      //                       Status.COMPLETE) {
                      //                     List<WhatDoYouWantResponseModel>
                      //                         response =
                      //                         controller.apiResponse.data;
                      //                           return TypeAheadField<WhatDoYouWantResponseModel?>(
                      //                            suggestionsCallback: WhatDoYouWantRepo.whatDoYouWantRepo,
                      //                             : (context, WhatDoYouWantResponseModel? suggestion ){
                      //                                 final result = suggestion!;

                      //                                    return ListTile(
                      //                                          title:  Text(),
                      //                                        );
                      //                                   },)
                        TextFormField(
                          decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.2)),
                              hintText: 'What do you Want to study?',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                       )
                      //   //                  
                      //      }
                      //                 }
                      //   )
                       ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: Get.height * 0.060,
                      width: Get.width * 0.30,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintStyle:
                                TextStyle(color: Colors.black.withOpacity(0.2)),
                            hintText: 'Destination',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                    ),
                    Container(
                      height: Get.height * 0.060,
                      width: Get.width * 0.35,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: kGrey4),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                            borderRadius: BorderRadius.circular(5),
                            hint: const Text("All"),
                            value: selectedPartner,
                            items: _partner.map((partner) {
                              return DropdownMenuItem(
                                  value: partner,
                                  child: Text(
                                    partner,
                                    style: const TextStyle(
                                        color: kGrey4,
                                        fontFamily: "Roboto",
                                        fontSize: 13),
                                  ));
                            }).toList(),
                            onChanged: (newValue) {
                              selectedPartner = newValue as String?;
                            }),
                      ),
                    ),
                    Container(
                      height: Get.height * 0.060,
                      width: Get.width * 0.25,
                      decoration: BoxDecoration(
                          color: kNavy,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text(
                          "Search",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        })
      ],
    ),
  );
}
