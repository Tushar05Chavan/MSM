import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:msm_unify/App/common/color_constant.dart';

class AccountManScreen extends StatefulWidget {
  const AccountManScreen({Key? key}) : super(key: key);

  @override
  State<AccountManScreen> createState() => _AccountManScreenState();
}

class _AccountManScreenState extends State<AccountManScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return SimpleDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(color: kColorPrimary)),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Flexible(
                              child: Text(
                                'Account Manager Details',
                                style: TextStyle(
                                    color: kNavy,
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Flexible(
                              child: InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  height: Get.height * 0.03,
                                  width: Get.width * 0.08,
                                  decoration: BoxDecoration(
                                      color: kRed,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        Row(children: const [
                          Flexible(
                            child: Text(
                              'Account Manager for GMO',
                              style: TextStyle(
                                  color: Color(0xff159600),
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              'Account Manager for MSM Unify',
                              style: TextStyle(
                                  color: Color(0xff159600),
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ]),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        Row(children: [
                          Container(
                            height: Get.height * 0.15,
                            width: Get.width * 0.30,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 0.7,
                                      blurRadius: 0.7,
                                      offset: const Offset(0.5, 0.5))
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: SvgPicture.asset(
                              'assets/images/square_empty_agent.svg',
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.07,
                          ),
                          Flexible(
                            child: Container(
                              height: Get.height * 0.15,
                              width: Get.width * 0.35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset('assets/images/avatar.jpg',
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ]),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        Row(children: [
                          Flexible(
                            child: Text(
                              'Account Manager Not Assigned',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontFamily: 'Poppins',
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/ProfilrRed.svg',
                                      height: 20,
                                      width: 20,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Flexible(
                                      child: Text(
                                        'Dweeti Anadkat',
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.7),
                                            fontFamily: 'Roboto',
                                            fontSize: 15),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/phone.svg',
                                      height: 20,
                                      width: 20,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Flexible(
                                      child: Text(
                                        '7573000363',
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.7),
                                            fontFamily: 'Roboto',
                                            fontSize: 16),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/email.svg',
                                      height: 20,
                                      width: 20,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Flexible(
                                      child: Text(
                                        'dweeti.anadkat@msquaremedia.com',
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.7),
                                            fontFamily: 'Roboto',
                                            fontSize: 16),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ]),
                        SizedBox(
                          height: Get.height * 0.20,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'For any queries, e-mail us at ',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontFamily: 'Roboto',
                                fontSize: 18),
                            children: [
                              TextSpan(
                                  text: 'support@msmunify.com',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Roboto',
                                      fontSize: 18)),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          );
        },
        child: Container(
          color: Colors.black.withOpacity(0.5),
        ),
      ),
    );
  }
}
