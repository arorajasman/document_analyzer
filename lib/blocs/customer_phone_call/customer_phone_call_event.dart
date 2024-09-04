part of 'customer_phone_call_bloc.dart';

sealed class CustomerPhoneCallEvent extends Equatable {
  const CustomerPhoneCallEvent();

  @override
  List<Object> get props => [];
}

/// event to make a call
class StartCallEvent extends CustomerPhoneCallEvent {
  final FlutterSoundRecorder? recorder;

  const StartCallEvent({this.recorder});

  @override
  List<Object> get props => [recorder!];
}


class StopRecordingEvent extends CustomerPhoneCallEvent {
  final FlutterSoundRecorder? recorder;

  const StopRecordingEvent({this.recorder});

  @override
  List<Object> get props => [recorder!];
}
