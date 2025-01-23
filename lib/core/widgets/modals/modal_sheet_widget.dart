import 'package:flutter/material.dart';
import 'package:prueba_tecnica_orn/core/utils/colors.dart';
import 'package:prueba_tecnica_orn/core/widgets/button_widget.dart';
import 'package:prueba_tecnica_orn/core/widgets/text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

/// It shows a modal with a message and a button
class ModalSheetWidget {
  /// Show the primary modal
  static void show({
    required String title,
    required String message,
    required BuildContext context,
    IconData assetIcon = Icons.check_circle_outlined,
    Color iconColor = PTColors.success,
    String btnLabel = 'Aceptar',
    VoidCallback? onTap,
    VoidCallback? onCloseTap,
    bool isDismissible = true,
  }) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(22),
          topRight: Radius.circular(22),
        ),
      ),
      isScrollControlled: true,
      enableDrag: isDismissible,
      isDismissible: isDismissible,
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 8),
                      Container(
                        width: 10.w,
                        height: 0.5.h,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      const SizedBox(height: 48),
                      Icon(
                        assetIcon,
                        size: 70,
                        color: iconColor,
                      ),
                      const SizedBox(height: 24),
                      TextWidget(
                        text: title,
                        style: TextStyle(fontSize: 18.sp),
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 10),
                      TextWidget(
                        text: message,
                        style: TextStyle(fontSize: 16.sp),
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 3.h),
                      ButtonWidget(
                        width: 80.w,
                        height: 5.h,
                        onTap: () {
                          if (onTap == null) {
                            Navigator.pop(context);
                          } else {
                            onTap();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade100,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          btnLabel,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                      SizedBox(height: 1.h),
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 16,
                  child: GestureDetector(
                    onTap: () {
                      if (onCloseTap != null) {
                        onCloseTap();
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    behavior: HitTestBehavior.translucent,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        shape: BoxShape.circle,
                      ),
                      height: 26,
                      width: 26,
                      child: Icon(
                        Icons.close,
                        size: 20,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
