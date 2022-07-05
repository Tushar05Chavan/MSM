import 'package:flutter/material.dart';
import 'package:msm_unify/App/Screens/Profile/widget/EvaluationForm/widget/evaluation_form_document_tab.dart';
import 'package:msm_unify/App/Screens/Profile/widget/EvaluationForm/widget/evaluation_form_status_tab.dart';

class EvaluationTabScreen extends StatefulWidget {
  const EvaluationTabScreen({Key? key}) : super(key: key);

  @override
  _EvaluationTabScreenState createState() => _EvaluationTabScreenState();
}

class _EvaluationTabScreenState extends State<EvaluationTabScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController1;
  @override
  void initState() {
    _tabController1 = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TabBar(
            controller: _tabController1,
            isScrollable: true,
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.red,
            labelColor: Colors.red,
            tabs: const [
              Tab(
                child: Text('Evaluation Form Status'),
              ),
              Tab(
                child: Text('Evaluation Form Documents'),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController1,
              children: [
                EvaluationFormStatusTabScreen(),
                EvaluationFormDocumentTabScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
