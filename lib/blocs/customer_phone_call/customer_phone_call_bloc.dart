import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';

part 'customer_phone_call_event.dart';
part 'customer_phone_call_state.dart';

class CustomerPhoneCallBloc
    extends Bloc<CustomerPhoneCallEvent, CustomerPhoneCallState> {
  CustomerPhoneCallBloc() : super(CustomerPhoneCallBlocInitial()) {
    on<StartCallEvent>(startCallEventHandler);
    on<StopRecordingEvent>(stopRecordingEventHandler);
  }

  FutureOr<void> stopRecordingEventHandler(event, emit) async {
    FlutterSoundRecorder? recorder = event.recorder;
    await _stopRecording(recorder);
    emit(const CallState(isRecording: false));
  }

  FutureOr<void> startCallEventHandler(event, emit) async {
    FlutterSoundRecorder? recorder = event.recorder;
    bool? isRecording = await _makeCall("8826112702", recorder);
    emit(CallState(isRecording: isRecording!));
  }

  Future<bool?> _makeCall(String number, FlutterSoundRecorder? recorder) async {
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
    if (res != null && res) {
      bool? isRecording = await _startRecording(recorder);
      return isRecording;
    }
    return null;
  }

  Future<bool?> _dummyStartRecording(FlutterSoundRecorder? recorder) async {
    // Get the app's documents directory
    final directory = await getApplicationDocumentsDirectory();

    // Define the recording path within the documents directory
    String recordingPath =
        '${directory.path}/assets/${DateTime.now()}_call_recording.aac';

    print("recoding path: $recordingPath");

    // Ensure the directory exists (Flutter doesn't allow dynamic creation of folders inside assets)
    await Directory('${directory.path}/assets').create(recursive: true);

    await recorder?.openRecorder();
    await recorder?.startRecorder(
      toFile: recordingPath,
      codec: Codec.aacADTS,
    );

    return recorder?.isRecording;
  }

  Future<bool?> _startRecording(FlutterSoundRecorder? recorder) async {
    Directory? externalDir = await getExternalStorageDirectory();
    String recordingPath =
        '${externalDir?.path}/${DateTime.now()}call_recording.aac';
    /*final directory = await getApplicationDocumentsDirectory();
    _recordingPath = '${directory.path}/call_recording.aac';*/

    print("recoding path: $recordingPath");

    await recorder?.openRecorder();
    await recorder?.startRecorder(
      toFile: recordingPath,
      codec: Codec.aacADTS,
    );

    return recorder?.isRecording;
  }

  Future<void> _stopRecording(FlutterSoundRecorder? recorder) async {
    await recorder?.stopRecorder();
    await recorder?.closeRecorder();
  }
}
