import 'package:flutter/material.dart';
import 'package:health_source/modules/new_scan/model/joint_model.dart';

import '../../../core/theme/app_text_styles.dart';


class JointDetailList extends StatelessWidget {
  final List<JointRow> joints;
  final bool showHeaders;

  const JointDetailList({
    required this.joints,
    this.showHeaders = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (showHeaders)
        Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('(Right)', style: AppTextStyles.caption.copyWith(fontSize: 12)),
              Text('(Left)', style: AppTextStyles.caption.copyWith(fontSize: 12)),
            ],
          ),
        ),
      ...joints.map(
        (joint) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: joint.right != null
                    ? Text(
                        joint.right!.label,
                        style: AppTextStyles.caption.copyWith(
                          fontSize: 11,
                          color: joint.right!.color,
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  joint.title,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: joint.left != null
                    ? Text(
                        joint.left!.label,
                        textAlign: TextAlign.right,
                        style: AppTextStyles.caption.copyWith(
                          fontSize: 11,
                          color: joint.left!.color,
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}