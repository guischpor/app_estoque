import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../controller/home_controller.dart';
import '../../../../../core/styles/app_color.dart';
import '../../../../../core/routes/named_routes.dart';
import '../../../../../core/dependencies/injection_dependencies.dart';
import 'package:app_estoque/presentation/presenter/widgets/custom_drawer.dart';
import 'package:app_estoque/presentation/presenter/widgets/custom_app_bar.dart';
import 'package:app_estoque/presentation/presenter/controllers/app_controller/app_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final homeController = getIt<HomeController>();
  final appController = getIt<AppController>();
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: customAppBar(
        context: context,
        isLeading: false,
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColors.white,
          unselectedLabelColor: AppColors.black.withOpacity(0.6),
          tabs: const [
            Tab(
              text: 'Pendentes',
              icon: Icon(Icons.pending_actions),
            ),
            Tab(
              text: 'Enviados',
              icon: Icon(Icons.send),
            ),
          ],
        ),
      ),
      drawer: const CustomDrawer(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.blue,
        onPressed: () async {
          context.goNamed(
            NamedPaths.createListForm,
            pathParameters: {
              'isAdd': 'true',
              'isEdit': 'false',
              'id': 'null',
            },
          );
        },
        child: const Icon(
          Icons.add,
          color: AppColors.white,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Center(
            child: Text("It's cloudy here"),
          ),
          Center(
            child: Text("It's rainy here"),
          ),
        ],
      ),
    );
  }
}
