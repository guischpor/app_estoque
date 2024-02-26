import 'package:flutter/material.dart';
import '../../../../../core/styles/app_color.dart';
import 'package:app_estoque/core/styles/app_text_style.dart';
import 'package:app_estoque/core/extensions/app_extensions.dart';
import 'package:app_estoque/presentation/presenter/widgets/transform_widget_button.dart';
import 'package:app_estoque/presentation/presenter/pages/home/widget/icon_panel_button.dart';

class CardProductItem extends StatefulWidget {
  final String? expirationDate;
  final String? productName;
  final String? quantity;
  final void Function()? onView;
  final void Function()? onEdit;
  final void Function()? onDelete;

  const CardProductItem({
    super.key,
    required this.expirationDate,
    required this.productName,
    required this.quantity,
    this.onView,
    this.onEdit,
    this.onDelete,
  });

  @override
  State<CardProductItem> createState() => _CardProductItemState();
}

class _CardProductItemState extends State<CardProductItem> {
  @override
  Widget build(BuildContext context) {
    final quantity = widget.quantity == '0' ? '0' : widget.quantity;
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
                      widget.expirationDate != null
                          ? DateTime.parse(widget.expirationDate!)
                              .toStringDDMMYYYY()
                          : 'Sem data',
                      style: AppTextStyle.nunitotBlack18.font14,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).longestSide * 0.2,
                      child: Text(
                        widget.productName != null ? widget.productName! : '',
                        style: AppTextStyle.nunitotBlack18.font14.w500,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      'Quantidade: ${quantity}',
                      style: AppTextStyle.nunitotBlack18.font14.w500,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
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
