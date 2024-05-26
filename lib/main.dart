import 'package:auto_animated/auto_animated.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oderfoodapp_flutter/model/restaurant_model.dart';
import 'package:oderfoodapp_flutter/strings/main_strings.dart';
import 'package:oderfoodapp_flutter/viewmodel/main_view_model_imp.dart';
import 'package:oderfoodapp_flutter/widgets/main/main_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'abennnnn',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final viewModel = MainViewModelImp();

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          restaurantText,
          style: GoogleFonts.jetBrainsMono(
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 10,
      ),
      body: FutureBuilder(
        future: viewModel.displayRestaurantList(),
        builder: (context, AsyncSnapshot<List<RestaurantModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Lỗi: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Không có dữ liệu'));
          } else {
            var lst = snapshot.data!;
            return LiveList.options(
              options: const LiveOptions(
                showItemInterval: Duration(milliseconds: 150),
                showItemDuration: Duration(milliseconds: 350),
                reAnimateOnVisibility: true,
              ),
              itemCount: lst.length,
              itemBuilder: (context, index, animation) =>
                  buildAnimatedItem(context, index, animation, lst),
            );
          }
        },
      ),
    );
  }

  Widget buildAnimatedItem(BuildContext context, int index,
      Animation<double> animation, List<RestaurantModel> lst) {
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.1),
          end: Offset.zero,
        ).animate(animation),
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          child: InkWell(
            onTap: () {},
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2.5 * 1.222,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RestaurantImageWidget(
                      imageUrl: lst[index].imageUrl), //tách thành widget
                  RestaurantInfoCard(
                    name:lst[index].name,
                    address:lst[index].address) // tach thanh widget
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

