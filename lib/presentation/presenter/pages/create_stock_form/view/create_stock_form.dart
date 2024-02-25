import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../widgets/custom_app_bar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:validatorless/validatorless.dart';
import '../../../../../core/styles/app_color.dart';
import '../../home/controller/home_controller.dart';
import '../../../widgets/form/custom_text_form.dart';
import '../../../../domain/entities/user_entity.dart';
import '../../../../../core/routes/named_routes.dart';
import '../../../../../core/app_consts/app_consts.dart';
import '../../../../../core/styles/app_text_style.dart';
import '../../../widgets/form/custom_drop_down_list.dart';
import '../../../widgets/custom_buttons/custom_button.dart';
import '../../../../domain/entities/status_list_entity.dart';
import '../../../../../core/services/user_service_local.dart';
import '../../../../../core/services/custom_date_picker.dart';
import 'package:app_estoque/core/extensions/app_extensions.dart';
import '../../../../../core/dependencies/injection_dependencies.dart';
import 'package:app_estoque/presentation/domain/entities/stock_product.dart';
import 'package:app_estoque/presentation/presenter/pages/login/controller/login_controller.dart';
import 'package:app_estoque/presentation/presenter/pages/create_stock_form/controller/stock_controller.dart';
// ignore_for_file: must_be_immutable

class CreateStockForm extends StatefulWidget {
  String? listID;
  bool? isEdit;
  bool? isAdd;

  CreateStockForm({
    super.key,
    this.listID,
    this.isEdit,
    this.isAdd,
  });

  @override
  State<CreateStockForm> createState() => _CreateStockFormState();
}

class _CreateStockFormState extends State<CreateStockForm> {
  final homeController = getIt<HomeController>();
  final stockController = getIt<StockController>();
  final loginController = getIt<LoginController>();
  final userServiceLocal = getIt<UserServiceLocal>();

  final _unitStoreController = TextEditingController();
  final _dateController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? selectStatus;
  int? statusID = 0;

  UserEntity user = UserEntity();

  DateTime datetimeNow = DateTime.now();

  @override
  void initState() {
    super.initState();

    getLocalUser();

    if (widget.isEdit == true) {
      getStockProduct();
    } else if (widget.isAdd == true) {
      selectStatus = AppConst().statusList[0].status;
    } else {
      print('Error');
    }
  }

  @override
  void dispose() {
    _unitStoreController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  void getStockProduct() async {
    stockController.setLoading(true);

    await stockController.getStockProduct(context, widget.listID ?? '');

    if (stockController.isSuccess) {
      stockController.setLoading(false);

      populateControllers(stockController.stockProduct);
    }
  }

  void getLocalUser() async {
    final userHasLocal = await userServiceLocal.hasLocalUser();

    if (userHasLocal) {
      final userLocal = await userServiceLocal.getLocalUser();

      user = UserEntity(
        id: userLocal!.id,
        name: userLocal.name,
        email: userLocal.email,
        cpf: userLocal.cpf,
      );
    }
  }

  Future<void> createList() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    stockController.setLoading(true);

    await stockController.createStockProduct(
      context: context,
      unitStore: _unitStoreController.text,
      date: _dateController.text,
      userID: user.id!,
      statusID: statusID!,
    );

    if (stockController.isSuccess) {
      context.go(NamedRoutes.home);
    }
  }

  void populateControllers(StockProductEntity stock) async {
    _unitStoreController.text = stock.unitStore == '' || stock.unitStore == null
        ? ''
        : stock.unitStore!;

    _dateController.text = stock.date == '' || stock.date == null
        ? ''
        : stock.date!.toStringDDMMYYYY();

    statusID = stock.statusID;
    selectStatus = AppConst().statusList[stock.statusID!].status;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        appBar: customAppBar(
          context: context,
          widget: Text(
            'Criar Estoque',
            style: AppTextStyle.nunitoWhite18.font24.bold,
          ),
          isLeading: true,
          onTap: () {
            context.go(NamedRoutes.home);
          },
        ),
        body: stockController.isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.sizeOf(context).longestSide * 0.02,
                      vertical: MediaQuery.sizeOf(context).longestSide * 0.03),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _form(),
                      CustomButton(
                        onPressed: () async => await createList(),
                        label: widget.isEdit == true
                            ? 'EDITAR LISTA'
                            : 'CRIAR LISTA',
                        width: double.infinity,
                        fontSize: 15,
                        padding: const EdgeInsets.all(12),
                        backgroundColor: AppColors.blueLight,
                      ),
                    ],
                  ),
                ),
              ),
      );
    });
  }

  Widget _form() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.sizeOf(context).longestSide * 0.02,
            ),
            child: CustomTextForm(
              keyboardType: TextInputType.datetime,
              controller: _dateController,
              hintText: '${datetimeNow.toStringDDMMYYYY(separator: '/')}',
              labelText: 'Data',
              preffix: const Icon(
                Icons.calendar_today,
                color: AppColors.blueLight,
                size: 20,
              ),
              readOnly: true,
              onTap: () {
                CustomDatePicker().selectDate(
                  context: context,
                  controller: _dateController,
                  format: 'date',
                );
              },
              validator: Validatorless.multiple([
                Validatorless.required('Data é obrigatório!'),
              ]),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.sizeOf(context).longestSide * 0.02,
            ),
            child: CustomTextForm(
              keyboardType: TextInputType.name,
              controller: _unitStoreController,
              labelText: 'Unidade',
              preffix: const Icon(
                Icons.store,
                color: AppColors.blueLight,
                size: 20,
              ),
              validator: Validatorless.multiple([
                Validatorless.required('Unidade é obrigatório!'),
              ]),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.sizeOf(context).longestSide * 0.02,
            ),
            child: _dropDownStatus(),
          )
        ],
      ),
    );
  }

  Widget _dropDownStatus() {
    return CustomDropDownList(
      hint: '',
      value: selectStatus,
      itemsList: AppConst().statusList.map(
        (StatusListEntity item) {
          if (item.status == selectStatus) {
            statusID = item.id;
          }
          return DropdownMenuItem(
            value: item.status,
            child: Text(
              item.status,
              style: AppTextStyle.robotoGrey18.font15.w500,
            ),
          );
        },
      ).toList(),
      onChanged: (item) {
        setState(() {
          selectStatus = item.toString();
        });
      },
    );
  }
}
