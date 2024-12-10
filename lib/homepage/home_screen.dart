import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joke_app/enum/base_state_enum.dart';
import 'package:joke_app/homepage/bloc/home_page_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomePageBloc>();
    return BlocConsumer<HomePageBloc, HomePageState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            forceMaterialTransparency: true,
            title: Text(
              'Joke App'.toUpperCase(),
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: 15.w,
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              bloc.add(const GetJokeEvent());
            },
            child: const Icon(
              Icons.refresh,
            ),
          ),
          body: Center(
            child: Padding(
              padding: EdgeInsets.all(8.0.w),
              child: state.stateEnum == BaseStateEnum.initial
                  ? const Offstage()
                  : state.stateEnum == BaseStateEnum.error
                      ? Text(
                          state.errorMessage ?? 'Something Went Wrong',
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 20.h),
                          child: Card(
                            elevation: 20,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                                vertical: 20.h,
                              ),
                              child: state.stateEnum == BaseStateEnum.loading
                                  ? const CircularProgressIndicator()
                                  : Text(
                                      state.jokeModel?.joke ?? '',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                      ),
                                    ),
                            ),
                          ),
                        ),
            ),
          ),
        );
      },
    );
  }
}
