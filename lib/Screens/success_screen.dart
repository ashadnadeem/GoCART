import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({required this.nextPage, Key? key}) : super(key: key);
  final Widget nextPage;
  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  bool _isLoading = true;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    setState(() {});
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading ? successPage() : widget.nextPage;
  }

  Widget successPage() {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.done_rounded,
              color: Colors.red,
              size: screenHeight * 0.3,
            ),
            Text(
              'Success!',
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 59, 59, 61),
                fontSize: screenHeight * 0.05,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
