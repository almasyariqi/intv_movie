abstract class ApiResponseState {
  const ApiResponseState();
}

class InitialApiResponseState extends ApiResponseState {
  const InitialApiResponseState();
}

class ResLoading extends ApiResponseState {}

class ResSuccess extends ApiResponseState {}

class ResFailed extends ApiResponseState {
  final String message;

  ResFailed({this.message = "Failed!"});
}