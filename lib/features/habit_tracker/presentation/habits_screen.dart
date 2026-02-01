// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:habitera/constants/color_picker.dart';
import 'package:habitera/constants/enums.dart';
import 'package:habitera/constants/sizes.dart';
import 'package:habitera/features/habit_tracker/data/models/habit_isar.dart';
import 'package:habitera/features/habit_tracker/presentation/habit_provider.dart';
import 'package:habitera/features/habit_tracker/presentation/widgets/date_section.dart';
import 'package:habitera/features/habit_tracker/presentation/widgets/habit_type_bottom_sheet.dart';
import 'package:habitera/router/app_router.dart';
import 'package:habitera/utils/extensions.dart';

// -----------------------------
//* THIS SCREEN IS WHERE THE HABITS ARE SHOWN
// -----------------------------

class HabitsScreen extends ConsumerStatefulWidget {
  const HabitsScreen({super.key});

  @override
  ConsumerState<HabitsScreen> createState() => _HabitsScreenState();
}

class _HabitsScreenState extends ConsumerState<HabitsScreen> {
  late String currentGreeting;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    currentGreeting = Greeting.currentGreeting;

    timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      final newGreeting = Greeting.currentGreeting;
      if (newGreeting != currentGreeting) {
        setState(() {
          currentGreeting = newGreeting;
        });
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final habits = ref.watch(habitsProvider);
    final repo = ref.read(habitRepositoryProvider);

    // print(habits);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                currentGreeting,
                style: GoogleFonts.nunitoSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
              kSizedBoxh20,
              DateSection(),
              kSizedBoxh20,
              Text(
                'YOUR HABITS',
                // 'TODAY',
                style: GoogleFonts.nunitoSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 15.0,
                ),
              ),
              const SizedBox(height: 10.0),
              Expanded(
                child: habits.when(
                  data: (habits) {
                    if (habits.isEmpty) {
                      Center(child: Text('No habits yet'));
                    }

                    return ListView.separated(
                      itemBuilder: (_, i) {
                        final habit = habits[i];
                        return HabitTile(
                          habit: habit,
                          type: habit.type,
                          habitTitle: habit.title,
                          createdAt: habit.createdAt,
                          onDelete: () async {
                            print('Delete called for habit: ${habit.id}');
                            await repo.deleteHabit(habit.id);
                            ref.invalidate(habitsProvider);
                          },
                          onTapDelete: () async {
                            final deletedHabit = habit;
                            await repo.deleteHabit(deletedHabit.id);
                            ref.invalidate(habitsProvider);

                            if (!context.mounted) return;

                            final messenger = ScaffoldMessenger.of(context);
                            messenger.hideCurrentSnackBar();
                            messenger.showSnackBar(
                              SnackBar(
                                duration: Duration(seconds: 8),
                                content: Text('Habit deleted'),
                                action: SnackBarAction(
                                  label: 'UNDO',
                                  onPressed: () async {
                                    final repository = ref.read(
                                      habitRepositoryProvider,
                                    );
                                    await repository.addHabit(deletedHabit);
                                    ref.invalidate(habitsProvider);

                                    messenger.showSnackBar(
                                      SnackBar(
                                        duration: Duration(seconds: 2),
                                        content: Text('Habit restored'),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        );
                      },
                      separatorBuilder: (_, _) => const SizedBox(height: 10.0),
                      itemCount: habits.length,
                    );
                  },
                  error: (error, stack) => Center(child: Text('Error: $error')),
                  loading: () =>
                      Center(child: CircularProgressIndicator.adaptive()),
                ),
              ),
              CreateHabitButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class CreateHabitButton extends StatelessWidget {
  const CreateHabitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Create new habit', style: context.textTheme.bodyLarge),
        IconButton(
          onPressed: () async {
            final type = await showModalBottomSheet<HabitType>(
              context: context,
              builder: (_) => HabitTypeBottomSheet(),
            );

            if (type == null || !context.mounted) return;

            final added = await context.pushNamed<bool>(
              AppRoutes.addHabitsScreen.name,
              pathParameters: {'type': type.name},
            );

            if (!context.mounted) return;

            if (added == true) {
              final messenger = ScaffoldMessenger.of(context);
              messenger.hideCurrentSnackBar();
              messenger.showSnackBar(
                SnackBar(
                  duration: Duration(seconds: 2),
                  content: Text('Habit added'),
                ),
              );
            }
          },
          icon: Icon(Icons.add),
        ),
        // if (type != null && context.mounted) {
        //   final added = await context.pushNamed<bool>(
        //     AppRoutes.addHabitsScreen.name,
        //     pathParameters: {'type': type.name},
        //   );
        //   if (context.mounted && added == true) {
        //     ScaffoldMessenger.of(
        //       context,
        //     ).showSnackBar(SnackBar(content: Text('Habit added')));
        //   }
        // }
      ],
    );
  }
}

class HabitTile extends StatelessWidget {
  const HabitTile({
    super.key,
    required this.habitTitle,
    required this.type,
    required this.createdAt,
    this.onEdit,
    this.onDelete,
    this.onTapDelete,
    required this.habit,
  });

  final String habitTitle;
  // final String habitCreatedTime;
  final int type;
  final DateTime createdAt;
  final VoidCallback? onEdit;
  final Future<void> Function()? onDelete;
  final void Function()? onTapDelete;
  final HabitIsar habit;

  String createdDate(DateTime createdAt) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final createdDay = DateTime(createdAt.year, createdAt.month, createdAt.day);

    final diffDays = today.difference(createdDay).inDays;

    if (diffDays == 0) return 'Created today';
    if (diffDays == 1) return 'Created yesterday';
    if (diffDays == 0) return 'Created today';

    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    return 'Created ${months[createdAt.month - 1]} ${createdAt.day}';
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (_) {},
            icon: Icons.edit,
            backgroundColor: Colors.grey,
          ),
          SlidableAction(
            onPressed: (_) async {
              await onDelete?.call();
            },
            icon: Icons.delete,
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        ],
      ),
      child: Container(
        height: 74.0,
        // padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(13.0),
        ),
        child: Container(
          // color: Colors.blue.shade200,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 10.0,
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // color: Colors.red.shade200,

                      // height: 20,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              habitTitle,
                              style: context.textTheme.bodyLarge,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // color: Colors.green.shade200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Text(
                            'Daily • ${createdDate(createdAt)}',
                            style: context.textTheme.bodySmall?.copyWith(
                              // color: Colors.black38,
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurfaceVariant,
                            ),
                          ),
                          TypeChip(type: type),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 6,
                top: 2,
                child: Container(
                  // color: Colors.orange.shade200,
                  // height: 10,
                  child: PopupMenuButton(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.more_horiz),

                    itemBuilder: (_) {
                      return [
                        PopupMenuItem(
                          onTap: () {
                            context.goNamed(
                              AppRoutes.editHabitsScreen.name,
                              extra: habit,
                            );
                          },
                          child: Text('Edit'),
                        ),
                        // PopupMenuItem(
                        //   padding: const EdgeInsets.symmetric(vertical: 5),
                        //   height: 1,
                        //   enabled: false,
                        //   child: Container(
                        //     height: 1,
                        //     color: ColorPicker.dividerColor,
                        //   ),
                        // ),
                        PopupMenuItem(
                          onTap: onTapDelete,
                          child: Text('Delete'),
                        ),
                      ];
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // child: Container(
      //   height: 74.0,
      //   padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      //   decoration: BoxDecoration(
      //     color: Colors.grey.shade200,
      //     borderRadius: BorderRadius.circular(13.0),
      //   ),
      //   child: Stack(
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.only(
      //           right: 36,
      //         ), // keep content away from the menu
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Text(habitTitle, style: context.textTheme.bodyLarge),
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Text(
      //                   'Daily • ${createdDate(createdAt)}',
      //                   style: context.textTheme.bodySmall?.copyWith(
      //                     color: Theme.of(context).colorScheme.onSurfaceVariant,
      //                   ),
      //                 ),
      //                 TypeChip(type: type),
      //               ],
      //             ),
      //           ],
      //         ),
      //       ),

      //       Positioned(
      //         top: 0,
      //         right: 0,
      //         child: Theme(
      //           data: Theme.of(context).copyWith(
      //             materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      //             visualDensity: VisualDensity.compact,
      //           ),
      //           child: PopupMenuButton(
      //             padding: EdgeInsets.zero,
      //             child: const SizedBox(
      //               width: 20,
      //               height: 20,
      //               child: Center(child: Icon(Icons.more_horiz, size: 20)),
      //             ),
      //             itemBuilder: (_) => [
      //               PopupMenuItem(onTap: () {}, child: const Text('Edit')),
      //               PopupMenuItem(
      //                 onTap: () async {
      //                   await onDelete?.call();
      //                 },
      //                 child: const Text('Delete'),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

// child: Transform.translate(
//   offset: const Offset(2, -7),
//   child: Icon(Icons.more_horiz, size: 20),
// ),
class TypeChip extends StatelessWidget {
  const TypeChip({super.key, required this.type});

  final int type;

  @override
  Widget build(BuildContext context) {
    final isHabitType = type == 0;
    final label = isHabitType ? 'START' : 'BREAK';

    // final bg = isHabitType ?
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade100,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        label,
        style: context.textTheme.labelSmall?.copyWith(
          fontWeight: FontWeight.w700,
          letterSpacing: 0.6,
        ),
      ),
    );
  }
}

//* OLD getter for current greeting

// String get greeting {
//   final hour = DateTime.now().hour;

//   if (hour >= 0 && hour < 12) {
//     return 'Good Morning';
//   } else if (hour >= 12 && hour < 18) {
//     return 'Good Afternoon';
//   } else {
//     return 'Good Evening';
//   }
// }

class CustomCard extends ConsumerWidget {
  CustomCard({
    super.key,
    required this.title,
    required this.titleColor,
    this.trailingWidget,
    this.menuPadding,
    this.width,
    this.height,
    this.dividerBottomSpace,
    required this.itemBuilder,
    this.onSelected,
    required this.children,
    this.isEnabled,
  });

  final String title;
  final Color? titleColor;
  final Widget? trailingWidget;
  final EdgeInsetsGeometry? menuPadding;
  final double? width;
  final double? height;
  final double? dividerBottomSpace;
  final void Function(String)? onSelected;
  final List<PopupMenuEntry<String>> Function(BuildContext) itemBuilder;
  final List<Widget> children;
  bool? isEnabled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          right: 15,
          left: 15,
          // bottom: 13,
          bottom: 15,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: titleColor,
                  ),
                ),
                if (trailingWidget != null) ...[
                  const SizedBox(width: 8.0),
                  trailingWidget!,
                ],
                PopupMenuButton<String>(
                  // shadowColor: ColorPicker.dividerColor,
                  offset: const Offset(14, 0),
                  padding: const EdgeInsets.only(left: 6),
                  menuPadding: menuPadding,
                  // menuPadding: const EdgeInsets.only(
                  //     left: 9, right: 9, top: 9, bottom: 7),
                  icon: SvgPicture.asset(
                    "assets/icons/options.svg",
                    height: 8,
                    fit: BoxFit.scaleDown,
                  ),
                  onSelected: onSelected,
                  enabled: isEnabled ?? true,
                  itemBuilder: itemBuilder,
                  constraints: BoxConstraints.tightFor(width: width),
                  // constraints: const BoxConstraints.tightFor(width: 121.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ],
            ),
            // const CustomDivider(),
            SizedBox(height: dividerBottomSpace),
            // const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: children,
            ),
          ],
        ),
      ),
    );
  }
}
