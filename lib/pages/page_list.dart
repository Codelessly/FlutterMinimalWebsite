import 'package:flutter/material.dart';
import 'package:minimal/components/components.dart';

// TODO Replace with object model.
const String listItemTitleText = "A BETTER BLOG FOR WRITING";
const String listItemPreviewText =
    "Sed elementum tempus egestas sed sed risus. Mauris in aliquam sem fringilla ut morbi tincidunt. Placerat vestibulum lectus mauris ultrices eros. Et leo duis ut diam. Auctor neque vitae tempus […]";

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        width: 170,
        backgroundColor: Colors.white,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    headerItems[index].title,
                    style: const TextStyle(
                      color: textPrimary,
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 10.0,
                );
              },
              itemCount: headerItems.length,
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: <Widget>[
                  const MenuBar(),
                  const ListItem(
                    imageUrl:
                        "assets/images/paper_flower_overhead_bw_w1080.jpg",
                    title: listItemTitleText,
                    description: listItemPreviewText,
                  ),
                  divider,
                  const ListItem(
                    imageUrl:
                        "assets/images/iphone_cactus_tea_overhead_bw_w1080.jpg",
                    title: listItemTitleText,
                    description: listItemPreviewText,
                  ),
                  divider,
                  const ListItem(
                    imageUrl: "assets/images/typewriter_overhead_bw_w1080.jpg",
                    title: listItemTitleText,
                    description: listItemPreviewText,
                  ),
                  divider,
                  const ListItem(
                    imageUrl:
                        "assets/images/coffee_paperclips_pencil_angled_bw_w1080.jpg",
                    title: listItemTitleText,
                    description: listItemPreviewText,
                  ),
                  divider,
                  const ListItem(
                    imageUrl:
                        "assets/images/joy_note_coffee_eyeglasses_overhead_bw_w1080.jpg",
                    title: listItemTitleText,
                    description: listItemPreviewText,
                  ),
                  divider,
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 80),
                    child: const ListNavigation(),
                  ),
                  divider,
                  const Footer(),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
