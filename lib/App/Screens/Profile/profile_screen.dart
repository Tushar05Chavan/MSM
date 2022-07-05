import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:msm_unify/App/Screens/Profile/widget/EvaluationForm/evaluation_tab.dart';
import 'package:msm_unify/App/Screens/Profile/widget/agreement_tab.dart';
import 'package:msm_unify/App/Screens/Profile/widget/branch_tab.dart';
import 'package:msm_unify/App/Screens/Profile/widget/details_tab.dart';
import 'package:msm_unify/App/Screens/Profile/widget/document_tab.dart';
import 'package:msm_unify/App/Screens/Profile/widget/reference_tab.dart';
import 'package:msm_unify/App/common/AppConfig/CommonAppBar/widget/common_app_bar.dart';
import 'package:msm_unify/App/common/AppConfig/CommonDrawer/widget/common_drawer.dart';
import 'package:msm_unify/App/common/color_constant.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  String? _selectedCountry;
  String? _selectedPartner;
  final List<String> _country = [
    'Yemen',
    'India',
    "USA",
    "Afghanistan",
    "Argentina"
  ];

  final List<String> _partner = ['All', 'GMO', 'MSM Unify'];
  TabController? _tabController1;
  @override
  void initState() {
    _tabController1 = TabController(length: 6, vsync: this);
    super.initState();
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 6,
        child: Scaffold(
          key: _key,
          endDrawer: commonDrawer(context),
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      buildPreferredSize(context, _key),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: const [
                            Text(
                              'Profile - Edu Global Overseas',
                              style: TextStyle(
                                color: kNavy,
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TabBar(
                      controller: _tabController1,
                      isScrollable: true,
                      unselectedLabelColor: Colors.black,
                      indicatorColor: Colors.red,
                      labelColor: Colors.red,
                      tabs: const [
                        Tab(
                          child: Text('Details'),
                        ),
                        Tab(
                          child: Text('reference'),
                        ),
                        Tab(
                          child: Text('Document'),
                        ),
                        Tab(
                          child: Text('Evaluation Form'),
                        ),
                        Tab(
                          child: Text('Agreement'),
                        ),
                        Tab(
                          child: Text('Branch'),
                        ),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TabBarView(
                controller: _tabController1,
                children: const [
                  DetailsTabScreen(),
                  ReferenceTabScreen(),
                  DocumentScreen(),
                  EvaluationTabScreen(),
                  AgreementScreen(),
                  BranchScreen(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
