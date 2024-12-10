import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joke_app/common_file/api_calls.dart';
import 'package:joke_app/enum/base_state_enum.dart';
import 'package:joke_app/main.dart';
import 'package:joke_app/models/joke_model.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final ApiCalls apiCalls;
  HomePageBloc(this.apiCalls) : super(const HomePageState()) {
    on<GetJokeEvent>(getJokeList);
    on<UpdateDataEvent>(
      (event, emit) {
        emit(
          state.copyWith(
            jokeModel: event.jokeModel,
            stateEnum: BaseStateEnum.success,
            isJokeStored: event.isJokeStored,
          ),
        );
      },
    );
  }
  FutureOr<void> getJokeList(
    GetJokeEvent event,
    Emitter<HomePageState> emit,
  ) async {
    emit(state.copyWith(stateEnum: BaseStateEnum.loading));

    final response = await apiCalls.getJokeList();
    response.fold(
      (left) {
        emit(
          state.copyWith(
            stateEnum: BaseStateEnum.error,
          ),
        );
        rootScaffoldMessengerKey.currentState?.showSnackBar(
          SnackBar(
            content: Text(
              left,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.red,
          ),
        );
      },
      (right) {
        emit(state.copyWith(
          jokeModel: right,
          stateEnum: BaseStateEnum.success,
        ));
      },
    );
  }
}
