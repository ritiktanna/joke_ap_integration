part of 'home_page_bloc.dart';

class HomePageState extends Equatable {
  final JokeModel? jokeModel;
  final BaseStateEnum stateEnum;
  final String? errorMessage;
  final bool? isJokeStored;
  const HomePageState({
    this.jokeModel,
    this.stateEnum = BaseStateEnum.initial,
    this.errorMessage,
    this.isJokeStored,
  });

  @override
  List<Object?> get props => [
        jokeModel,
        errorMessage,
        stateEnum,
        isJokeStored,
      ];

  HomePageState copyWith({
    JokeModel? jokeModel,
    String? errorMessage,
    BaseStateEnum? stateEnum,
    bool? isJokeStored,
  }) =>
      HomePageState(
        jokeModel: jokeModel ?? this.jokeModel,
        errorMessage: errorMessage,
        stateEnum: stateEnum ?? this.stateEnum,
        isJokeStored: isJokeStored ?? this.isJokeStored,
      );
}
