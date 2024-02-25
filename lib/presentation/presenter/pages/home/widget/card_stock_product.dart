import 'package:flutter/material.dart';
import '../../../../../core/styles/app_color.dart';
import 'package:app_estoque/core/styles/app_text_style.dart';
import 'package:app_estoque/core/extensions/app_extensions.dart';
import 'package:app_estoque/presentation/presenter/widgets/transform_widget_button.dart';
import 'package:app_estoque/presentation/presenter/pages/home/widget/icon_panel_button.dart';

class CardStockProduct extends StatefulWidget {
  final DateTime date;
  final String unitNameStore;
  final int statusID;
  final void Function()? onView;
  final void Function()? onEdit;
  final void Function()? onDelete;

  const CardStockProduct({
    super.key,
    required this.date,
    required this.unitNameStore,
    required this.statusID,
    this.onView,
    this.onEdit,
    this.onDelete,
  });

  @override
  State<CardStockProduct> createState() => _CardStockProductState();
}

class _CardStockProductState extends State<CardStockProduct> {
  @override
  Widget build(BuildContext context) {
    return TransformWidgetButton(
      onTap: widget.onView!,
      backgroundColor: AppColors.blue.withOpacity(0.3),
      borderRadius: 10,
      splashColor: AppColors.blue.withOpacity(0.3),
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.date.toStringDDMMYYYY(),
                      style: AppTextStyle.nunitotBlack18.font16,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).longestSide * 0.2,
                      child: Text(
                        widget.unitNameStore,
                        style: AppTextStyle.nunitotBlack18.font16.w500,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Icon(
                              widget.statusID == 0
                                  ? Icons.pending_actions
                                  : Icons.send,
                              color: widget.statusID == 0
                                  ? AppColors.red
                                  : AppColors.green,
                              size: 18,
                            ),
                          ),
                          Text(
                            widget.statusID == 0 ? 'Pendente' : 'Enviado',
                            style: AppTextStyle.nunitotBlack18.font14.bold
                                .copyWith(
                              color: widget.statusID == 0
                                  ? AppColors.red
                                  : AppColors.green,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              _panelButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _panelButton() {
    return Row(
      children: [
        TransformWidgetButton(
          onTap: widget.onEdit!,
          backgroundColor: AppColors.blue.withOpacity(0.8),
          borderRadius: 10,
          splashColor: AppColors.blue.withOpacity(0.3),
          child: const IconPanelButton(
            icon: Icons.edit,
            backgroundColor: Colors.transparent,
          ),
        ),
        TransformWidgetButton(
          onTap: widget.onDelete!,
          backgroundColor: AppColors.red.withOpacity(0.8),
          borderRadius: 10,
          splashColor: AppColors.red.withOpacity(0.3),
          child: const IconPanelButton(
            icon: Icons.delete,
            backgroundColor: Colors.transparent,
          ),
        )
      ],
    );
  }
}
