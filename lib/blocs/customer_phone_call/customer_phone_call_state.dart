part of 'customer_phone_call_bloc.dart';

sealed class CustomerPhoneCallState extends Equatable {
  const CustomerPhoneCallState();

  @override
  List<Object> get props => [];
}

final class CustomerPhoneCallBlocInitial extends CustomerPhoneCallState {}

final class CallState extends CustomerPhoneCallState {
  final bool isRecording;

  const CallState({required this.isRecording});

  @override
  List<Object> get props => [isRecording];
}
