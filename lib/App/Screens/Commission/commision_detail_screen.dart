import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msm_unify/App/common/AppConfig/support_section.dart';

class CommissionDetailScreen extends StatefulWidget {
  const CommissionDetailScreen({Key? key}) : super(key: key);

  @override
  State<CommissionDetailScreen> createState() => _CommissionDetailScreenState();
}

class _CommissionDetailScreenState extends State<CommissionDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.025,
                ),
                SizedBox(
                  height: Get.height * 0.025,
                ),
                Container(
                  height: Get.height * 0.130,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Institution",
                          style: TextStyle(
                              color: Color(0xff79747E),
                              fontFamily: 'Poppins',
                              fontSize: 16),
                        ),
                        Text(
                          'Acadia University',
                          style: TextStyle(
                              color: Color(0xff192A3E),
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.025,
                ),
                Container(
                  height: Get.height * 0.130,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Institute Partner Type",
                          style: TextStyle(
                              color: Color(0xff79747E),
                              fontFamily: 'Poppins',
                              fontSize: 16),
                        ),
                        Text(
                          'GMO',
                          style: TextStyle(
                              color: Color(0xff192A3E),
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.025,
                ),
                Container(
                  height: Get.height * 0.130,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Country",
                          style: TextStyle(
                              color: Color(0xff79747E),
                              fontFamily: 'Poppins',
                              fontSize: 16),
                        ),
                        Text(
                          'Canada',
                          style: TextStyle(
                              color: Color(0xff192A3E),
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.025,
                ),
                Container(
                  height: Get.height * 0.130,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "ESL",
                          style: TextStyle(
                              color: Color(0xff79747E),
                              fontFamily: 'Poppins',
                              fontSize: 16),
                        ),
                        Text(
                          'No',
                          style: TextStyle(
                              color: Color(0xff192A3E),
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.025,
                ),
                Container(
                  height: Get.height * 0.130,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Level of Education",
                          style: TextStyle(
                              color: Color(0xff79747E),
                              fontFamily: 'Poppins',
                              fontSize: 16),
                        ),
                        Text(
                          'N/A',
                          style: TextStyle(
                              color: Color(0xff192A3E),
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.025,
                ),
                Container(
                  height: Get.height * 0.130,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Programs",
                          style: TextStyle(
                              color: Color(0xff79747E),
                              fontFamily: 'Poppins',
                              fontSize: 16),
                        ),
                        Text(
                          'N/A',
                          style: TextStyle(
                              color: Color(0xff192A3E),
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.025,
                ),
                Container(
                  height: Get.height * 0.130,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Intake",
                          style: TextStyle(
                              color: Color(0xff79747E),
                              fontFamily: 'Poppins',
                              fontSize: 16),
                        ),
                        Text(
                          'N/A',
                          style: TextStyle(
                              color: Color(0xff192A3E),
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.025,
                ),
                Container(
                  height: Get.height * 0.130,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Commission",
                          style: TextStyle(
                              color: Color(0xff79747E),
                              fontFamily: 'Poppins',
                              fontSize: 16),
                        ),
                        Text(
                          '1350.00 Fixed amount per semester',
                          style: TextStyle(
                              color: Color(0xff192A3E),
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.025,
                ),
                Container(
                  height: Get.height * 0.130,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Number of semester / course / credit / year",
                          style: TextStyle(
                              color: Color(0xff79747E),
                              fontFamily: 'Poppins',
                              fontSize: 16),
                        ),
                        Text(
                          '2',
                          style: TextStyle(
                              color: Color(0xff192A3E),
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.025,
                ),
                Container(
                  height: Get.height * 0.130,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Maximum amount of commission",
                          style: TextStyle(
                              color: Color(0xff79747E),
                              fontFamily: 'Poppins',
                              fontSize: 16),
                        ),
                        Text(
                          'N/A',
                          style: TextStyle(
                              color: Color(0xff192A3E),
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.025,
                ),
                Container(
                  height: Get.height * 0.130,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Currency",
                          style: TextStyle(
                              color: Color(0xff79747E),
                              fontFamily: 'Poppins',
                              fontSize: 16),
                        ),
                        Text(
                          'CAD',
                          style: TextStyle(
                              color: Color(0xff192A3E),
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.025,
                ),
                Container(
                  height: Get.height * 0.130,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Impact base",
                          style: TextStyle(
                              color: Color(0xff79747E),
                              fontFamily: 'Poppins',
                              fontSize: 16),
                        ),
                        Text(
                          'N/A',
                          style: TextStyle(
                              color: Color(0xff192A3E),
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.025,
                ),
                supportSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
