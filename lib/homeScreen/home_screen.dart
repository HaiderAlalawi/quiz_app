import 'package:computiqquizapp/app_tools/services.dart';
import 'package:computiqquizapp/homeScreen/tools/appbar/logo_image.dart';
import 'package:computiqquizapp/homeScreen/tools/appbar/logout_button.dart';
import 'package:computiqquizapp/homeScreen/tools/category_move_card.dart';
import 'package:computiqquizapp/homeScreen/tools/category_text.dart';
import 'package:computiqquizapp/homeScreen/tools/image_clip.dart';
import 'package:computiqquizapp/homeScreen/tools/team_start_row.dart';
import 'package:flutter/material.dart';
import '../app_tools/app_theme.dart';
import '../app_tools/data_from_json/category_json.dart';
import '../core/Responsive/responsive_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<CategoryJson>> data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = Services.getProductList();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    ResponsiveScreenApp _sizeResponsove =
        ResponsiveScreenApp(context, queryData);

    return Scaffold(
      backgroundColor: AppTheme.backGround,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: LogoImage(sizeResponsove: _sizeResponsove),
        actions: [LogOutButton(sizeResponsove: _sizeResponsove)],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ImageClip(sizeResponsove: _sizeResponsove),
            CategoryText(sizeResponsove: _sizeResponsove, text: 'Category'),
            CategoryMoveCard(sizeResponsove: _sizeResponsove, data: data),
            CategoryText(
                sizeResponsove: _sizeResponsove, text: 'Enter Number Of Teams'),
            const TeamStartRow(),
          ],
        ),
      ),
    );
  }
}
