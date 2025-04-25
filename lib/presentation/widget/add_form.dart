import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/presentation/cubit/add_cubit/cubit/add_cubit_cubit.dart';
import 'package:notes_app/presentation/model/note_model.dart';
import 'package:notes_app/presentation/widget/color_list.dart';
import 'package:notes_app/presentation/widget/custom_container.dart';
import 'package:notes_app/presentation/widget/custom_text_field.dart';
import 'package:intl/intl.dart';

class AddForm extends StatefulWidget {
  const AddForm({
    super.key,
  });

  @override
  State<AddForm> createState() => _AddFormState();
}

final now = DateTime.now();

class _AddFormState extends State<AddForm> {
  String? title, subTitle;
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  final formattedDate = DateFormat.yMMMMd().format(now);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              onSaved: (data) {
                title = data;
              },
              hintText: 'Title',
              maxLines: 1,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              onSaved: (data) {
                subTitle = data;
              },
              hintText: 'Content',
              maxLines: 6,
            ),
            const SizedBox(
              height: 24,
            ),
            const ColorItemsList(),
            const SizedBox(
              height: 24,
            ),
            BlocBuilder<AddCubitCubit, AddCubitState>(
              builder: (context, state) {
                return state is AddCubitLoading
                    ? const CircularProgressIndicator(
                        color: Colors.black,
                      )
                    : Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: CustomContainer(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              var noteModel = NoteModel(
                                  title: title!,
                                  subTitle: subTitle!,
                                  date: formattedDate.toString(),
                                  color: Colors.lightBlueAccent.value);
                              BlocProvider.of<AddCubitCubit>(context)
                                  .addNotes(noteModel);
                            } else {
                              autoValidateMode = AutovalidateMode.always;
                              setState(() {});
                            }
                          },
                        ),
                      );
              },
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}
