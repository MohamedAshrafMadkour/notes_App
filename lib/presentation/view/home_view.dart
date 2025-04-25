import 'package:flutter/material.dart';
import 'package:notes_app/presentation/widget/custom_app_bar.dart';

import 'package:notes_app/presentation/widget/item_list_view.dart';
import 'package:notes_app/presentation/widget/notes_show.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            CustomAppBar(
              icon: Icons.search,
              textBar: 'Notes',
            ),
            Expanded(
              child: ItemListView(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        backgroundColor: const Color(0xffFFCC80),
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return const NotesShow();
              });
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
