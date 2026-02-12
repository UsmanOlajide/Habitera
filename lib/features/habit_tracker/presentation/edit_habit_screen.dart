import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:habitera/constants/enums.dart';
import 'package:habitera/constants/sizes.dart';
import 'package:habitera/features/habit_tracker/data/models/habit_isar.dart';
import 'package:habitera/features/habit_tracker/presentation/habit_provider.dart';
import 'package:habitera/utils/extensions.dart';

class EditHabitScreen extends ConsumerStatefulWidget {
  // const EditHabitScreen({super.key});
  const EditHabitScreen({super.key, required this.habit});

  // late TextEditingController titleController;
  // final HabitType type;
  final HabitIsar habit;

  @override
  ConsumerState<EditHabitScreen> createState() => _EditHabitScreenState();
}

class _EditHabitScreenState extends ConsumerState<EditHabitScreen> {
  late final TextEditingController textController; //question

  final _formKey = GlobalKey<FormState>();

  HabitFrequency _selectedFrequency = HabitFrequency.daily;

  Set<HabitFrequency> _selectedFrequencies = {HabitFrequency.daily};

  bool _isSubmitting = false;

  final List<ButtonSegment<HabitFrequency>> _frequencySegments = [
    ButtonSegment(
      value: HabitFrequency.hourly,
      label: Text('Hourly'),
      enabled: false,
    ),
    ButtonSegment(value: HabitFrequency.daily, label: Text('Daily')),
    ButtonSegment(
      value: HabitFrequency.weekly,
      label: Text('Weekly'),
      enabled: false,
    ),
  ];

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: widget.habit.title);
    _selectedFrequency = HabitFrequency.values[widget.habit.frequency];
    _selectedFrequencies = {_selectedFrequency};
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.habit);
    return Scaffold(
      appBar: AppBar(title: Text('Edit Habit')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    TitleField(
                      controller: textController,
                      title: 'Title',
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter a title';
                        }
                        return null;
                      },
                    ),
                    kSizedBoxH8,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Frequency',
                        style: context.textTheme.labelLarge,
                      ),
                    ),
                    kSizedBoxH8,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SegmentedButton(
                        segments: _frequencySegments,
                        selected: _selectedFrequencies,
                        onSelectionChanged: (newSelection) {
                          setState(() {
                            _selectedFrequencies = newSelection;
                            _selectedFrequency = newSelection.first;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 4),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Hourly & Weekly coming soon',
                        style: context.textTheme.labelSmall?.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                AddHabitButton(
                  formKey: _formKey,
                  ref: ref,
                  textController: textController,
                  widget: widget,
                  selectedFrequency: _selectedFrequency,
                  isSubmitting: _isSubmitting,
                  onPressed: () async {
                    if (!_formKey.currentState!.validate()) return;

                    setState(() => _isSubmitting = true);

                    final repository = ref.read(habitRepositoryProvider);

                    final editedHabit = HabitIsar()
                      ..id = widget.habit.id
                      ..title = textController.text
                      ..type = widget.habit.type
                      ..frequency = _selectedFrequency.index
                      ..createdAt = widget.habit.createdAt;
                    await repository.editHabit(editedHabit);

                    ref.invalidate(habitsProvider);
                    // this is me telling the provider that the database has changed

                    textController.clear();
                    if (context.mounted) {
                      context.pop();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AddHabitButton extends StatelessWidget {
  const AddHabitButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.ref,
    required this.textController,
    required this.widget,
    required this.selectedFrequency,
    required this.isSubmitting,
    required this.onPressed,
    // required this.isValid,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final WidgetRef ref;
  final TextEditingController textController;
  final EditHabitScreen widget;
  final HabitFrequency selectedFrequency;
  final bool isSubmitting;
  final Future<void> Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: !isSubmitting ? onPressed : null,
      child: isSubmitting
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator.adaptive(strokeWidth: 2),
            )
          : Text('Edit'),
    );
  }
}

class TitleField extends StatelessWidget {
  const TitleField({
    super.key,
    required this.title,
    this.prefixIcon,
    this.label,
    this.isDense,
    this.validator,
    this.onChanged,
    this.focusedBorder,
    this.enabledBorder,
    this.controller,
    this.suffixIcon,
    // required this.isCorrect
  });

  final String title;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? label;
  final bool? isDense;
  final Function(String)? onChanged;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextEditingController? controller;
  // final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: context.textTheme.labelLarge),
        kSizedBoxH8,
        SizedBox(
          height: 50.0,
          child: TextFormField(
            controller: controller,
            validator: validator,
            onChanged: onChanged,

            style: context.textTheme.bodySmall?.copyWith(fontSize: 14),
            // keyboardType: TextInputType.name,
            decoration: InputDecoration(
              isDense: isDense,
              prefixIconConstraints: const BoxConstraints(
                minWidth: 34.5,
                minHeight: 48,
              ),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              label: label,
              focusedBorder: focusedBorder,
              enabledBorder: enabledBorder,
              //     .inputDecorationTheme
              //     .focusedBorder
              //     ?.copyWith(
              //         borderSide: BorderSide(
              //             color: isCorrect ? Colors.green : black3)),
            ),
          ),
        ),
      ],
    );
  }
}
