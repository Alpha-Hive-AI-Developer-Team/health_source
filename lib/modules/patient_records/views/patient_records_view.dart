import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../data/models/patient_model.dart';
import '../../../widgets/cards/patient_summary_card.dart';
import '../../../widgets/dialogs/blurred_overlay.dart';
import '../controllers/patient_records_controller.dart';

class PatientRecordsView extends GetView<PatientRecordsController> {
  const PatientRecordsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
          child: Column(
            children: [
              _Header(
                title: 'Manage Patients',
                action: Icons.search,
                onAction: () {},
              ),
              const SizedBox(height: 25),
            Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () => _showPatientForm(context),
                  borderRadius: BorderRadius.circular(6),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 14,
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Add New Patient',
                        style: AppTextStyles.bodyMedium.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Obx(
                  () => ListView.separated(
                    padding: EdgeInsets.zero,
                    itemCount: controller.patients.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 9),
                    itemBuilder: (context, index) {
                      final patient = controller.patients[index];
                      return PatientSummaryCard(
                        patient: patient,
                        onTap: () => controller.selectPatient(patient),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showPatientForm(BuildContext context) => Get.bottomSheet(
    BlurredOverlay(child: PatientFormSheet(onSubmit: controller.addPatient)),
    isScrollControlled: true,
    barrierColor: Colors.transparent,
  );
}

class _Header extends StatelessWidget {
  final String title;
  final IconData action;
  final VoidCallback onAction;
  const _Header({
    required this.title,
    required this.action,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) => Row(
    children: [
      IconButton(
        onPressed: Get.back,
        icon: const Icon(Icons.arrow_back_ios_new, size: 16),
        padding: EdgeInsets.zero,
      ),
      const SizedBox(width: 2),
      Text(title, style: AppTextStyles.h4.copyWith(fontSize: 15)),
      const Spacer(),
      IconButton(
        onPressed: onAction,
        icon: Icon(action, color: AppColors.primary, size: 19),
        padding: EdgeInsets.zero,
      ),
    ],
  );
}

class PatientFormSheet extends StatefulWidget {
  final PatientModel? patient;
  final void Function(String, String, DateTime) onSubmit;
  const PatientFormSheet({super.key, this.patient, required this.onSubmit});

  @override
  State<PatientFormSheet> createState() => _PatientFormSheetState();
}

class _PatientFormSheetState extends State<PatientFormSheet> {
  late final TextEditingController nameController;
  String gender = 'Female';
  DateTime dateOfBirth = DateTime(1999, 2, 22);

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.patient?.name ?? '');
    gender = widget.patient?.gender ?? 'Female';
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.fromLTRB(
      18,
      28,
      18,
      MediaQuery.viewInsetsOf(context).bottom + 18,
    ),
    decoration: const BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            widget.patient == null
                ? 'Add a new patient'
                : "Edit Patient's Record",
            style: AppTextStyles.h4.copyWith(fontSize: 15),
          ),
        ),
        const SizedBox(height: 5),
        Center(
          child: Text(
            'This helps in maintaining patient’s scan history',
            style: AppTextStyles.caption.copyWith(fontSize: 9),
          ),
        ),
        const SizedBox(height: 24),
        _FormLabel('Full Name'),
        _Input(
          controller: nameController,
          hint: 'Full Name',
          icon: Icons.badge_outlined,
        ),
        const SizedBox(height: 12),
        _FormLabel('Gender'),
        _Select(
          value: gender,
          values: const ['Female', 'Male'],
          onChanged: (value) => setState(() => gender = value),
        ),
        const SizedBox(height: 12),
        _FormLabel('Date of Birth'),
        _DateField(
          date: dateOfBirth,
          onTap: () async {
            final selected = await showDatePicker(
              context: context,
              initialDate: dateOfBirth,
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
              builder: (context, child) => Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: const ColorScheme.dark(
                    primary: AppColors.primary,
                    surface: AppColors.surface,
                  ),
                ),
                child: child!,
              ),
            );
            if (selected != null) setState(() => dateOfBirth = selected);
          },
        ),
        const SizedBox(height: 18),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => widget.onSubmit(
              nameController.text.trim().isEmpty
                  ? 'New Patient'
                  : nameController.text.trim(),
              gender,
              dateOfBirth,
            ),
            child: Text(
              widget.patient == null ? 'Save Details' : 'Save Changes',
            ),
          ),
        ),
      ],
    ),
  );
}

class _FormLabel extends StatelessWidget {
  final String text;
  const _FormLabel(this.text);
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 5),
    child: Text(
      text,
      style: AppTextStyles.caption.copyWith(
        color: AppColors.white,
        fontSize: 11,
      ),
    ),
  );
}

class _Input extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  const _Input({
    required this.controller,
    required this.hint,
    required this.icon,
  });
  @override
  Widget build(BuildContext context) => TextField(
    controller: controller,
    style: AppTextStyles.bodySmall.copyWith(
      color: AppColors.primaryDark,
      fontSize: 13,
    ),
    decoration: InputDecoration(
      hintText: hint,
      prefixIcon: Icon(icon, size: 17, color: AppColors.primary),
      fillColor: AppColors.white,
      filled: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: BorderSide.none,
      ),
    ),
  );
}

class _Select extends StatelessWidget {
  final String value;
  final List<String> values;
  final ValueChanged<String> onChanged;

  _Select({required this.value, required this.values, required this.onChanged});

  final GlobalKey _key = GlobalKey();

  IconData _iconFor(String v) =>
      v.toLowerCase() == 'male' ? Icons.male : Icons.female;

  void _openMenu(BuildContext context) {
    final box = _key.currentContext!.findRenderObject() as RenderBox;
    final pos = box.localToGlobal(Offset.zero);
    final width = box.size.width;
    final height = box.size.height;

    Get.dialog(
      BlurredOverlay(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.only(left: pos.dx, top: pos.dy + height + 6),
          child: Material(
            color: Colors.black,
            borderRadius: BorderRadius.circular(7),
            child: SizedBox(
              width: width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < values.length; i++) ...[
                    InkWell(
                      onTap: () {
                        Get.back();
                        onChanged(values[i]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              _iconFor(values[i]),
                              color: AppColors.primary,
                              size: 17,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              values[i],
                              style: AppTextStyles.caption.copyWith(
                                color: AppColors.white,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (i != values.length - 1)
                      const Divider(color: AppColors.divider, height: 1),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
      barrierColor: Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: _key,
      onTap: () => _openMenu(context),
      borderRadius: BorderRadius.circular(7),
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Row(
          children: [
            Text(
              value,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.grey,
                fontSize: 13,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.primary,
              size: 22,
            ),
          ],
        ),
      ),
    );
  }
}

class _DateField extends StatelessWidget {
  final DateTime date;
  final VoidCallback onTap;

  const _DateField({required this.date, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final label = '${date.day}/${date.month}/${date.year}';
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(7),
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.grey,
                fontSize: 13,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.calendar_month_outlined,
              color: AppColors.primary,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
