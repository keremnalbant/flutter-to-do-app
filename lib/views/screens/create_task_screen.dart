import 'package:flutter/material.dart';
import 'package:listify/controller/tasks/tasks_provider.dart';
import 'package:listify/services/navigation_service.dart';
import 'package:listify/views/screens/k_base_screen.dart';
import 'package:listify/views/styles/styles.dart';
import 'package:listify/views/widgets/k_app_bar.dart';
import 'package:listify/views/widgets/k_button.dart';
import 'package:listify/views/widgets/k_dropdown_field.dart';
import 'package:listify/views/widgets/k_textfield.dart';
import 'package:nb_utils/nb_utils.dart';

class CreateTaskScreen extends KBaseScreen {
  @override
  _CreateTaskScreenState createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends KBaseState<CreateTaskScreen> {
  final TextEditingController taskTitleController = TextEditingController();
  final TextEditingController taskDetailsController = TextEditingController();
  final TextEditingController dateTimeController = TextEditingController();
  final TextEditingController priorityController =
      TextEditingController(text: 'Low');

  @override
  Widget appBar() {
    return KAppBar(
      titleText: 'New Task',
      onTap: () => Navigation.pop(context),
    );
  }

  @override
  Widget body() {
    return Column(
      children: [
        SizedBox(height: KSize.getHeight(40)),
        KTextFormField(
          hintText: "Task Name",
          controller: taskTitleController,
          multiline: true,
        ),
        SizedBox(height: KSize.getHeight(22)),
        KTextFormField(
          hintText: "Details",
          controller: taskDetailsController,
          multiline: true,
          minimumLines: 5,
        ),
        SizedBox(height: KSize.getHeight(22)),
        KTextFormField(
          hintText: "Date Time",
          controller: dateTimeController,
          isCalenderField: true,
        ),
        SizedBox(height: KSize.getHeight(22)),
        KDropdownField(
          controller: priorityController,
          dropdownFieldOptions: ['Low', 'Medium', 'High'],
        ),
        SizedBox(height: KSize.getHeight(90)),
        KFilledButton(
            buttonText: "Add Task",
            onPressed: () async {
              if (taskTitleController.text.trim().isNotEmpty) {
                await ref.read(tasksProvider).createNewTask(
                      taskTitleController.text,
                      taskDetailsController.text,
                      dateTimeController.text,
                      priorityController.text,
                    );
                Navigation.pop(context);
              } else {
                snackBar(context,
                    title: 'Please enter a task name',
                    backgroundColor: KColors.charcoal);
              }
            })
      ],
    );
  }
}
