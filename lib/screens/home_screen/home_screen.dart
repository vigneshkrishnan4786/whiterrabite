import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:white_rabbit_task/screens/home_screen/components/row_widget.dart';
import 'package:white_rabbit_task/screens/home_screen/components/search_widget.dart';

import '../../bloc/bloc/home_bloc.dart';
import '../../model/user_model.dart';
import '../detail_screen/detail_screeen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController search = TextEditingController();
  List<UserModel> usersList = [];
  List<UserModel> tempUsersList = [];

  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).loadUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is LoadUserDataStart) {
            } else if (state is LoadUserDataSuccess) {
              usersList = state.userModel ?? [];
              tempUsersList = usersList;
            } else if (state is SearchDataSuccess) {
              usersList = tempUsersList
                  .where((element) => element.name!
                      .toLowerCase()
                      .contains(state.userModel.toLowerCase()))
                  .toList();
            }
          },
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return Column(children: [
                SearchWidget.searchHeader(
                    context: context,
                    onChangedText: (value) {
                      BlocProvider.of<HomeBloc>(context).searchData(value);
                    },
                    search: search,
                    onclear: () {
                      BlocProvider.of<HomeBloc>(context).searchData('');
                    }),
                Expanded(
                  child: ListView.builder(
                    itemCount: usersList.length,
                    itemBuilder: (context, index) {
                      return RowWidget.customerRow(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                      userModel: usersList[index],
                                    )));
                          },
                          profile: usersList[index].profileImage ?? '',
                          companyName: usersList[index].company?.name ?? '',
                          titleName: usersList[index].name ?? '');
                    },
                  ),
                ),
              ]);
            },
          ),
        ),
      ),
    );
  }
}
