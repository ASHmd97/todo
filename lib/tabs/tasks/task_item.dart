import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/app_theme.dart';
import 'package:todo/models/task_model.dart';

class TaskItem extends StatelessWidget {
  const TaskItem(this.task, {super.key});
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Slidable(
        key: const ValueKey(0),
        startActionPane: ActionPane(
          // A motion is a widget used to control how the pane animates.
          motion: const DrawerMotion(),

          // A pane can dismiss the Slidable.
          dismissible: DismissiblePane(onDismissed: () {}),

          // All actions are defined in the children parameter.
          children: [
            // A SlidableAction can have an icon and/or a label.
            SlidableAction(
              onPressed: (context) {},
              backgroundColor: AppTheme.red,
              foregroundColor: AppTheme.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
            SlidableAction(
              onPressed: (context) {},
              backgroundColor: AppTheme.primary,
              foregroundColor: AppTheme.white,
              icon: Icons.edit,
              label: 'Edit',
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 4,
              height: 62,
              decoration: BoxDecoration(
                color: AppTheme.primary,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppTheme.primary,
                        ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    task.description,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: AppTheme.black),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              width: 69,
              height: 34,
              decoration: BoxDecoration(
                color: AppTheme.primary,
                borderRadius: BorderRadius.circular(5),
              ),
              alignment: Alignment.center,
              child: const Center(
                  child: Icon(Icons.check, color: AppTheme.white, size: 32)),
            ),
          ],
        ),
      ),
    );
  }
}
