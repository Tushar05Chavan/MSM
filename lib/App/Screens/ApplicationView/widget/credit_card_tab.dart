import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:msm_unify/App/common/AppConfig/common_textfiled.dart';
import 'package:msm_unify/App/common/AppConfig/support_section.dart';
import 'package:msm_unify/App/common/color_constant.dart';

class CreditCardTab extends StatefulWidget {
  @override
  _CreditCardTabState createState() => _CreditCardTabState();
}

class _CreditCardTabState extends State<CreditCardTab> {
  String? _selectedCardType;
  final List<String> _cardType = ['VISA', 'MASTER', 'American Express'];

  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  TextEditingController _expiryDate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  height: Get.height * 0.12,
                  width: Get.width * 0.80,
                  decoration: BoxDecoration(
                      color: kGrey6, borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Card Type',
                        style: TextStyle(
                            color: Color(0xff79747E),
                            fontFamily: 'Poppins',
                            fontSize: 16),
                      ),
                      Text(
                        'NA',
                        style: TextStyle(
                            color: Color(0xff192A3E),
                            fontFamily: 'Poppins',
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return SimpleDialog(
                            shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(color: kRed)),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Credit Card Info',
                                          style: TextStyle(
                                              color: kNavy,
                                              fontFamily: 'Poppins',
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
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
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
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
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    DropdownButtonHideUnderline(
                                      child: DropdownButtonFormField(
                                          decoration: InputDecoration(
                                            labelText: 'Card Type',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          hint: const Text("Card Type"),
                                          value: _selectedCardType,
                                          items: _cardType.map((cardType) {
                                            return DropdownMenuItem(
                                                value: cardType,
                                                child: Text(
                                                  cardType,
                                                  style: const TextStyle(
                                                      color: kGrey4,
                                                      fontFamily: "Roboto",
                                                      fontSize: 13),
                                                ));
                                          }).toList(),
                                          onChanged: (newValue) {
                                            setState(() {
                                              _selectedCardType =
                                                  newValue as String?;
                                            });
                                          }),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    commontextfiled(hintText: 'Card Number  '),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    commontextfiled(
                                        hintText: 'Name Of Card Holder'),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    commontextfiled(hintText: 'CVV'),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: _expiryDate,
                                      cursorColor: kRed,
                                      decoration: InputDecoration(
                                          suffixIcon: IconButton(
                                            icon: Icon(Icons.today),
                                            onPressed: () async {
                                              DateTime date = DateTime(1900);
                                              FocusScope.of(context)
                                                  .requestFocus(FocusNode());

                                              date = (await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(1900),
                                                  lastDate: DateTime.now()))!;
                                              _expiryDate.text =
                                                  formatter.format(date);
                                            },
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: const BorderSide(
                                                color: Colors.black,
                                              )),
                                          hintStyle: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.2),
                                              fontFamily: 'Roboto'),
                                          hintText: 'Expiry Date',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          )),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    commontextfiled(
                                        hintText: 'Address(Card issued In)'),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    Container(
                                      height: Get.height * 0.05,
                                      width: Get.width * 0.27,
                                      decoration: BoxDecoration(
                                        color: kRed,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Update',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 11,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        });
                  },
                  child: Container(
                    height: Get.height * 0.04,
                    width: Get.width * 0.09,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                          topRight: Radius.circular(8),
                        )),
                    child: const Icon(
                      Icons.edit_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: Get.height * 0.12,
              width: Get.width * 0.80,
              decoration: BoxDecoration(
                  color: kGrey6, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Card Number',
                    style: TextStyle(
                        color: Color(0xff79747E),
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                  Text(
                    'NA',
                    style: TextStyle(
                        color: Color(0xff192A3E),
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: Get.height * 0.12,
              width: Get.width * 0.80,
              decoration: BoxDecoration(
                  color: kGrey6, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'CVV',
                    style: TextStyle(
                        color: Color(0xff79747E),
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                  Text(
                    'NA',
                    style: TextStyle(
                        color: Color(0xff192A3E),
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: Get.height * 0.12,
              width: Get.width * 0.80,
              decoration: BoxDecoration(
                  color: kGrey6, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Expiry Date',
                    style: TextStyle(
                        color: Color(0xff79747E),
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                  Text(
                    'NA',
                    style: TextStyle(
                        color: Color(0xff192A3E),
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: Get.height * 0.12,
              width: Get.width * 0.80,
              decoration: BoxDecoration(
                  color: kGrey6, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Name of card Holder',
                    style: TextStyle(
                        color: Color(0xff79747E),
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                  Text(
                    'NA',
                    style: TextStyle(
                        color: Color(0xff192A3E),
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: Get.height * 0.12,
              width: Get.width * 0.80,
              decoration: BoxDecoration(
                  color: kGrey6, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Address',
                    style: TextStyle(
                        color: Color(0xff79747E),
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                  Text(
                    'NA',
                    style: TextStyle(
                        color: Color(0xff192A3E),
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            supportSection(),
          ],
        ),
      ),
    );
  }
}
