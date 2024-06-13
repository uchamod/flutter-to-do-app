import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/util/constants.dart';
//alret box widget
class ToDoAddAleart extends StatefulWidget {
  final TextEditingController titlecontroller;
 // final TextEditingController discriptioncontroller;

  const ToDoAddAleart({super.key, required this.titlecontroller});

  @override
  State<ToDoAddAleart> createState() => _ToDoAddAleartState();
}

class _ToDoAddAleartState extends State<ToDoAddAleart> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      
      title: Text(
        "Add To Do",
        style: GoogleFonts.inter(
            color: kcaleartBoxText, fontSize: 24, fontWeight: FontWeight.w600),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //title feild
            TextField(
              controller: widget.titlecontroller,
              
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: "Title",
                hintStyle: TextStyle(
                    color: kcaleartBoxText.withOpacity(20),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: kcaleartBoxText),
                ),
              ),
            ),
            //discription feild
            // TextField(
            //   controller: widget.discriptioncontroller,
            //   decoration: InputDecoration(
            //      contentPadding: EdgeInsets.all(10),
            //     hintText: "Discription",
            //     hintStyle: TextStyle(
            //         color: kcaleartBoxText.withOpacity(20),
            //         fontSize: 16,
            //         fontWeight: FontWeight.w400),
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(10),
            //       borderSide: BorderSide(color: kcaleartBoxText),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
