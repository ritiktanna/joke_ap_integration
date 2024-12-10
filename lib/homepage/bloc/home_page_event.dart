part of 'home_page_bloc.dart';

sealed class HomePageEvent extends Equatable {
  const HomePageEvent();
}

class GetJokeEvent extends HomePageEvent {
  const GetJokeEvent();
  @override
  List<Object?> get props => [];
}

class UpdateDataEvent extends HomePageEvent {
  final bool isJokeStored;
  final JokeModel jokeModel;

  const UpdateDataEvent(this.isJokeStored, this.jokeModel);
  @override
  List<Object?> get props => [
        isJokeStored,
        jokeModel,
      ];
}
