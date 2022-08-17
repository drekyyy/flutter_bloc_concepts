import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../constants/enums.dart';

part 'internet_state.dart';

//purpose of this cubit is to emit different InternetConnection states based on what is returned by connectivity_plus plugin
class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  StreamSubscription? connectivityStreamSubscription;

  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    monitorInternetConnection();
  }
  void monitorInternetConnection() {
    connectivityStreamSubscription = connectivity.onConnectivityChanged
        .listen((ConnectivityResult connectivityResult) {
      print('connectivityResult= ' + connectivityResult.toString());
      if (connectivityResult == ConnectivityResult.wifi) {
        emitInternetConnected(ConnectionType.wifi);
      } else if (connectivityResult == ConnectivityResult.mobile) {
        emitInternetConnected(ConnectionType.mobile);
      } else if (connectivityResult == ConnectivityResult.none) {
        emitInternetDisconnected();
      }
    });
  }

  void emitInternetConnected(ConnectionType _connectionType) =>
      emit(InternetConnected(connectionType: _connectionType));

  void emitInternetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    connectivityStreamSubscription!.cancel();
    return super.close();
  }
}
