import 'package:flutter/material.dart';
import 'package:white_rabbit_task/screens/detail_screen/constants.dart';

import '../../model/user_model.dart';

class DetailScreen extends StatefulWidget {
  final UserModel? userModel;
  const DetailScreen({Key? key, this.userModel}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  widget.userModel?.profileImage ?? '',
                ),
              ),
              Text(
                AppConstants.name + ' ${widget.userModel?.name ?? ''}',
                textAlign: TextAlign.start,
              ),
              Text(
                AppConstants.email + ' ${widget.userModel?.email ?? ''}',
                textAlign: TextAlign.start,
              ),
              Text(
                AppConstants.address +
                    ' ${widget.userModel?.address?.street ?? ''}',
                textAlign: TextAlign.start,
              ),
              Text(AppConstants.zipcode +
                  ' ${widget.userModel?.address?.zipcode ?? ''}'),
              Text(
                  AppConstants.website + ' ${widget.userModel?.website ?? ''}'),
              widget.userModel?.company == null
                  ? Container()
                  : const Text(AppConstants.companyDetails),
              widget.userModel?.company == null
                  ? Container()
                  : Text(AppConstants.companyName +
                      ' ${widget.userModel?.company?.name ?? ''}'),
              widget.userModel?.company == null
                  ? Container()
                  : Text(AppConstants.company +
                      ' ${widget.userModel?.company?.bs ?? ''}'),
            ],
          ),
        ),
      ),
    );
  }
}
