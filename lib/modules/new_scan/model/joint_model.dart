import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class JointValue {
  final String label;
  final Color color;

  const JointValue(this.label, this.color);
}

class JointRow {
  final String title;
  final JointValue? right;
  final JointValue? left;

  const JointRow({required this.title, this.right, this.left});
}

// Replace these with your real measurement data.
const frontViewJoints = [
  JointRow(title: 'Head'),
  JointRow(
    title: 'Shoulders',
    right: JointValue('45°, Side dominance', AppColors.warning),
    left: JointValue('45°, Side dominance', AppColors.warning),
  ),
  JointRow(title: 'Spine'),
  JointRow(
    title: 'Hips',
    right: JointValue('50°, Hip shifting', AppColors.warning),
    left: JointValue('50°, Hip shifting', AppColors.warning),
  ),
  JointRow(
    title: 'Knees',
    right: JointValue('60°', AppColors.success),
    left: JointValue('50°', AppColors.success),
  ),
  JointRow(
    title: 'Ankles',
    right: JointValue('30°', AppColors.warning),
    left: JointValue('40°', AppColors.warning),
  ),
];

const sideViewJointsFront = [
  JointRow(
    title: 'Head',
    right: JointValue('Firm neck', AppColors.success),
    left: JointValue('Firm neck', AppColors.success),
  ),
  JointRow(
    title: 'Shoulder',
    right: JointValue('Aligned', AppColors.success),
    left: JointValue('Aligned', AppColors.success),
  ),
  JointRow(
    title: 'Spine',
    right: JointValue('Firm', AppColors.success),
    left: JointValue('Firm', AppColors.success),
  ),
  JointRow(
    title: 'Hip',
    right: JointValue('Normal', AppColors.success),
    left: JointValue('Normal', AppColors.success),
  ),
  JointRow(
    title: 'Right Knee',
    right: JointValue('Normal', AppColors.success),
    left: JointValue('Normal', AppColors.success),
  ),
];

const sideViewJointsSide =
    sideViewJointsFront; // swap for real side-specific values
