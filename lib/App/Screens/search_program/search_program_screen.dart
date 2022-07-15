import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/App/Screens/search_program/controller/search_controller.dart';
import 'package:msm_unify/App/Screens/search_program/model/search_inst_model.dart';
import 'package:msm_unify/App/Screens/search_program/view%20model/search_result_viewMode.dart';
import 'package:msm_unify/App/common/AppConfig/CommonAppBar/widget/common_app_bar.dart';
import 'package:msm_unify/App/common/color_constant.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({Key? key}) : super(key: key);

  @override
  _SearchResultScreenState createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  SearchController searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: SafeArea(
        child: Column(
          children: [
            SearchBar(
              keyGlobal: _key,
              isNotSearchScreen: false,
            ),
            GetBuilder<SearchResultViewModel>(builder: (controller) {
              if (controller.apiResponse.status == Status.LOADING) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (controller.apiResponse.status == Status.COMPLETE) {
                List<SearchResultModel> response = controller.apiResponse.data;
                return Expanded(
                    child: controller.apiResponse.data.isNotEmpty
                        ? ListView.builder(
                            itemCount: searchController.searchResult.length,
                            itemBuilder: (con, index) {
                              final data = searchController.searchResult[index];
                              return Container(
                                child: Card(
                                  color: Colors.white,
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data.programs![0].programName ?? "",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: kRed),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            data.instLogoPath != null &&
                                                    data.instLogoPath!
                                                        .isNotEmpty
                                                ? Container(
                                                    width: 110,
                                                    height: 80,
                                                    child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        child: Image.network(
                                                            "https://msmqastorage.blob.core.windows.net/files/institution/${data.instLogoPath}")))
                                                : Container(
                                                    width: 110,
                                                    height: 80,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      child: Image.asset(
                                                        "assets/icons/logo.png",
                                                        width: Get.width * 0.15,
                                                      ),
                                                    )),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    maxLines: 2,
                                                    data.instName ?? "",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                  Text(
                                                    maxLines: 2,
                                                    "${data.instCity ?? ""} ${data.instCountry ?? ""}",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                  Text(
                                                    maxLines: 2,
                                                    "Duration: ${data.programs![0].durationTime} yrs",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        data.programs![0].intakes != null &&
                                                data.programs![0].intakes!
                                                    .isNotEmpty
                                            ? Column(
                                                children: List.generate(
                                                    data.programs![0].intakes!
                                                        .length, (i) {
                                                  final fees = data
                                                      .programs![0].intakes![i];
                                                  return Column(
                                                    children: [
                                                      Divider(),
                                                      Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                vertical: 6,
                                                                horizontal: 5),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Intake Name: ",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ),
                                                                Spacer(),
                                                                Text(
                                                                    "${fees.intakeName}"),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 8,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Intake Status: ",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ),
                                                                Spacer(),
                                                                Text(
                                                                    "${fees.statusName}"),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 8,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                }),
                                              )
                                            : Container(),
                                        data.programs![0].feeDetail != null &&
                                                data.programs![0].feeDetail!
                                                    .isNotEmpty
                                            ? ExpansionTile(
                                                children: List.generate(
                                                    data.programs![0].feeDetail!
                                                        .length, (i) {
                                                  final fees = data.programs![0]
                                                      .feeDetail![i];
                                                  return Column(
                                                    children: [
                                                      Divider(),
                                                      Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                vertical: 6,
                                                                horizontal: 5),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Fee Type: ",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ),
                                                                Spacer(),
                                                                Text(
                                                                    "${fees.feeType}"),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 8,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Fee Basis: ",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ),
                                                                Spacer(),
                                                                Text(
                                                                    "${fees.feeBasis}"),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 8,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Fee Amount: ",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ),
                                                                Spacer(),
                                                                Text(
                                                                  "${fees.feeAmount}",
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                }),
                                                title: Text("Fee Detail"))
                                            : SizedBox(
                                                height: 10,
                                              )
                                      ],
                                    ),
                                  ),
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 8),
                              );
                            })
                        : Expanded(
                            child: Center(
                              child: Text(
                                "No Data found!",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: kRed),
                              ),
                            ),
                          ));
              } else if (controller.apiResponse.status == Status.ERROR) {
                return Center(
                  child: Text("Error"),
                );
              } else {
                return Container();
              }
            })
          ],
        ),
      ),
    );
  }
}
