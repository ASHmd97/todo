import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/app_theme.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/widgets/custom_elevated_button.dart';
import 'package:todo/widgets/default_text_form_field.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  DateFormat dateFormat = DateFormat('dd/MM/yyyy');
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextStyle titleMedium = Theme.of(context).textTheme.titleMedium!;
    return Container(
        height: MediaQuery.sizeOf(context).height * 0.5,
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Text('Add New Task', style: titleMedium),
              const SizedBox(height: 20),
              DefaultTextFormField(
                hintText: 'Enter Task Title',
                controller: titleController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter task title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              DefaultTextFormField(
                hintText: 'Enter Task Description',
                controller: descriptionController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter task description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Text(
                'Select Date',
                style: titleMedium.copyWith(fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () async {
                  DateTime? date = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                    initialEntryMode: DatePickerEntryMode.calendarOnly,
                  );
                  if (date != null && date != selectedDate) {
                    setState(() {
                      selectedDate = date;
                    });
                  }
                },
                child: Text(
                  dateFormat.format(selectedDate),
                  style: titleMedium.copyWith(
                      fontWeight: FontWeight.w400, color: AppTheme.gray),
                ),
              ),
              const SizedBox(height: 20),
              CustomElevatedButton(
                label: 'Add Task',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    TaskModel task = TaskModel(
                      title: titleController.text,
                      description: descriptionController.text,
                      date: selectedDate,
                    );
                  }
                },
              ),
            ],
          ),
        ));
  }
}
