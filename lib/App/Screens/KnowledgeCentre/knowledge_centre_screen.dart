import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/App/common/AppConfig/CommonAppBar/widget/common_app_bar.dart';
import 'package:msm_unify/App/common/AppConfig/CommonDrawer/widget/common_drawer.dart';
import 'package:msm_unify/App/common/AppConfig/support_section.dart';
import 'package:msm_unify/App/common/color_constant.dart';
import 'package:msm_unify/model/responseModek/get_knowledge_by_id_response_model.dart';
import 'package:msm_unify/model/responseModek/knowledge_center_response_model.dart';
import 'package:msm_unify/viewModel/get_knowledge_by_id_view_model.dart';
import 'package:msm_unify/viewModel/knowledge_center_view_model.dart';
import 'package:url_launcher/url_launcher.dart';

class KnowledgeCenterScreen extends StatefulWidget {
  const KnowledgeCenterScreen({Key? key}) : super(key: key);

  @override
  _KnowledgeCenterScreenState createState() => _KnowledgeCenterScreenState();
}

class _KnowledgeCenterScreenState extends State<KnowledgeCenterScreen> {
  String? _selectedCountry;
  final List<String> _country = [
    'Yemen',
    'India',
    "USA",
    "Afghanistan",
    "Argentina"
  ];
  String? _selectedPartner;
  final List<String> _partner = ['All', 'GMO', 'MSM Unify'];
  final KnowledgeCenterViewModel _knowledgeCenterViewModel =
      Get.put(KnowledgeCenterViewModel());
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final TextEditingController _search = TextEditingController();
  final GetKnowledgeByIdViewModel _getKnowledgeByIdViewModel =
      Get.put(GetKnowledgeByIdViewModel());
  @override
  void initState() {
    _knowledgeCenterViewModel.knowledgeCenterViewModel(keyword: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
        endDrawer: commonDrawer(context),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //buildPreferredSize(context, _key),
              SearchBar(keyGlobal: _key),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/back.svg',
                        height: 22,
                        width: 22,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Back',
                        style: TextStyle(
                            color: kGrey5,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Knowledge Base',
                  style: TextStyle(
                    color: kNavy,
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: _search,
                  onChanged: (value) {
                    _knowledgeCenterViewModel.knowledgeCenterViewModel(
                        keyword: _search.text);
                  },
                  decoration: InputDecoration(
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.2),
                      ),
                      hintText: 'Category Search here',
                      suffixIcon: Icon(Icons.search_outlined),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: kRed)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: kRed),
                      )),
                ),
              ),
              GetBuilder<KnowledgeCenterViewModel>(
                builder: (controller) {
                  if (controller.apiResponse.status == Status.COMPLETE) {
                    List<KnowledgeCenterResponseModel> response =
                        controller.apiResponse.data;
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: response.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${response[index].category}',
                                    style: const TextStyle(
                                      color: kRed,
                                      fontFamily: 'Poppins',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: response[index].data!.length,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index1) {
                                        return Container(
                                          padding: EdgeInsets.all(10),
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 15),
                                          width: Get.width,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(color: kRed),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(10.0),
                                                child: Text(
                                                  "${response[index].data![index1].documentTitle}",
                                                  textAlign: TextAlign.left,
                                                  style: const TextStyle(
                                                      color: Color(0xff858796),
                                                      fontWeight: FontWeight.w600,
                                                      fontFamily: 'Poppins',
                                                      fontSize: 20),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  _getKnowledgeByIdViewModel
                                                      .getKnowledgeByIdViewModel(
                                                          id: response[index]
                                                              .data![index1]
                                                              .knowledgeCid);
                                                  showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return GetBuilder<
                                                            GetKnowledgeByIdViewModel>(
                                                          builder:
                                                              (controller) {
                                                            if (controller
                                                                    .apiResponse
                                                                    .status ==
                                                                Status
                                                                    .COMPLETE) {
                                                              GetKnowledgeByIdResponseModel
                                                                  respons =
                                                                  controller
                                                                      .apiResponse
                                                                      .data;
                                                              return SimpleDialog(
                                                                shape: RoundedRectangleBorder(
                                                                    side: const BorderSide(
                                                                        color: Color(
                                                                            0xffe8252a)),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10)),
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            12),
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Flexible(
                                                                              child: Text(
                                                                                '${respons.documentTitle} ',
                                                                                style: const TextStyle(color: kNavy, fontFamily: 'Poppins', fontWeight: FontWeight.w600),
                                                                              ),
                                                                            ),
                                                                            GestureDetector(
                                                                              onTap: () {
                                                                                Get.back();
                                                                              },
                                                                              child: Container(
                                                                                height: Get.height * 0.04,
                                                                                width: Get.width * 0.08,
                                                                                decoration: BoxDecoration(
                                                                                  color: kRed,
                                                                                  borderRadius: BorderRadius.circular(10),
                                                                                ),
                                                                                child: const Icon(
                                                                                  Icons.close,
                                                                                  color: Colors.white,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              30,
                                                                        ),
                                                                        Container(
                                                                          height:
                                                                              Get.height * 0.35,
                                                                          width:
                                                                              Get.width,
                                                                          decoration: BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(10),
                                                                              border: Border.all(color: kRed)),
                                                                          child:
                                                                              Center(
                                                                            child: Html(
                                                                                data: '${respons.documentDescription} ',
                                                                                onLinkTap: (String? url, RenderContext context, Map<String, String> attributes, d) async {
                                                                                  //open URL in webview, or launch URL in browser, or any other logic here
                                                                                  if (!await launchUrl(Uri.parse(url!))) throw 'Could not launch $url';
                                                                                }),
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              20,
                                                                        ),
                                                                        Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            const Text(
                                                                              'Attachments',
                                                                              style: TextStyle(
                                                                                color: kRed,
                                                                                fontFamily: 'Poppins',
                                                                                fontSize: 14,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                            ),
                                                                            const SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Container(
                                                                              height: Get.height * 0.03,
                                                                              width: Get.width,
                                                                              child: ListView.builder(
                                                                                scrollDirection: Axis.horizontal,
                                                                                itemCount: respons.attachments!.length,
                                                                                itemBuilder: (context, index) {
                                                                                  return Row(
                                                                                    children: [
                                                                                      const Icon(
                                                                                        Icons.attach_file,
                                                                                        size: 25,
                                                                                      ),
                                                                                      const SizedBox(
                                                                                        width: 10,
                                                                                      ),
                                                                                      GestureDetector(
                                                                                          onTap: () async {
                                                                                            String url = 'newsData[index].link';

                                                                                            if (!await launchUrl(Uri.parse("${'https://msmqastorage.blob.core.windows.net/files/files//knowledge-centre/'}${respons.attachments![index].docPath.toString()}"))) throw 'Could not launch $url';
                                                                                          },
                                                                                          // onTap: () {
                                                                                          //   Hero(
                                                                                          //     tag: 'imageHero',
                                                                                          //     child: Image.network('https://msmqastorage.blob.core.windows.net/files/files//knowledge-centre/9be2bb28-427c-4434-9a9f-8581dc67d263.png'),

                                                                                          //   );
                                                                                          // },
                                                                                          child: Text("${respons.attachments![index].documentName} ")),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  )
                                                                ],
                                                              );
                                                            } else {
                                                              if (controller
                                                                      .apiResponse
                                                                      .status ==
                                                                  Status
                                                                      .ERROR) {
                                                                return const Center(
                                                                  child: Text(
                                                                      'Somthing Went Wrong'),
                                                                );
                                                              }
                                                              return const Center(
                                                                child:
                                                                    CircularProgressIndicator(),
                                                              );
                                                            }
                                                          },
                                                        );
                                                      });
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: Container(
                                                    width: Get.width * 0.42,
                                                    height: Get.height * 0.05,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                12),
                                                        color: kRed),
                                                    child: const Center(
                                                      child: Text(
                                                        'Document/Video',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily: 'Poppins',
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  } else {
                    if (controller.apiResponse.status == Status.ERROR) {
                      return const Text('No Data Found');
                    }
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
              supportSection(),
            ],
          ),
        ),
      ),
    );
  }
}
