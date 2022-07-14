import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msm_unify/App/Screens/Dashboard/widgets/dashboard_body.dart';
import 'package:msm_unify/App/common/AppConfig/CommonDrawer/widget/common_drawer.dart';
import 'package:msm_unify/viewModel/student_list_view_model.dart';

import '../../common/AppConfig/CommonAppBar/widget/common_app_bar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool isEx = false;
  bool isEx1 = false;
  bool isEx2 = false;
  final StudentListViewModel _studentListViewModel =
      Get.put(StudentListViewModel());
  @override
  void initState() {
    super.initState();
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
        // appBar: buildPreferredSize(context, _key),
        endDrawer: commonDrawer(context),
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildPreferredSize(context, _key),
              DashboardBody(),
            ],
          ),
        ),
      ),
    );
  }
}
