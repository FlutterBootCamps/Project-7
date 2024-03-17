import 'package:cv_app/extension/colors.dart';
import 'package:cv_app/extension/spase.dart';
import 'package:cv_app/models/cv_model.dart';
import 'package:cv_app/pages/cv/bloc/cv_bloc.dart';
import 'package:cv_app/widgets/explore_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<CvBloc>(context).add(FetchInformationEvent());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(
                Icons.notifications_none_outlined,
                size: 30,
              ),
            ),
          ],
          automaticallyImplyLeading: false,
          title: Text(
            "CV Initiator",
            style:
                GoogleFonts.caveat(fontSize: 25, fontWeight: FontWeight.w800),
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TabBar(
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.explore),
                        SizedBox(width: 5),
                        Text(
                          "Explore",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.favorite),
                        SizedBox(width: 5),
                        Text(
                          "Favorite",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              sizedBox15,
              Expanded(
                child: BlocBuilder<CvBloc, CvState>(
                  builder: (context, state) {
                    print("enter");
                    if (state is SuccessState) {
                      print("enter2");
                      return ListView(
                        children: [
                          for (CvModel cv in state.listResumes)
                            ExploreCard(resume: cv),
                        ],
                      );
                    } else if (state is LoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return const Text("erroe");
                    }
                  },
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
