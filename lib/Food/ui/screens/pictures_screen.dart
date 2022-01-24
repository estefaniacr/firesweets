import 'package:flutter/material.dart';
import 'package:fire_sweet_app/Food/ui/widgets/custom_image_container.dart';
//import 'package:step_progress_indicator/step_progress_indicator.dart';

class Pictures extends StatelessWidget {
  final TabController tabController;

  const Pictures({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text( 'Add 2 or more pictures'),
              SizedBox(height: 20),
              Row(
                children: [
                  CustomImageContainer(),
                  CustomImageContainer(),
                  CustomImageContainer(),
                ],
              ),
              Row(
                children: [
                  CustomImageContainer(),
                  CustomImageContainer(),
                  CustomImageContainer(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/* import 'package:fire_sweet_app/Food/bloc/images/images_bloc.dart';
import 'package:flutter/material.dart';
import 'package:fire_sweet_app/Food/ui/widgets/custom_image_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:step_progress_indicator/step_progress_indicator.dart';

class Pictures extends StatelessWidget {
  final TabController tabController;
  final String imageUrl;

  const Pictures({
    Key? key,
    required this.tabController, required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text( 'Add 2 or more pictures'),
              SizedBox(height: 20),
              BlocBuilder<ImagesBloc, ImagesState>(
                builder: (context, state) {
                  if (state is ImagesLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is ImagesLoaded) {
                    var imagesCount = state.imageUrls.length;
                return Column(
                  children: [
                    Row(
                      children: [
                        (imagesCount > 0)
                    ? CustomImageContainer(imageUrl: state.imageUrls[0])
                    : CustomImageContainer(),
                    CustomImageContainer(),
                    CustomImageContainer(),
                  ],
                ),
                Row(
                children: [
                  CustomImageContainer(),
                  CustomImageContainer(),
                  CustomImageContainer(),
                ],
              ),
            ]);
                  }
                  else {return Text('Something went wrong.');
                }
                }
              ),
            ],
          ),
        ],
    ));
  }
} */