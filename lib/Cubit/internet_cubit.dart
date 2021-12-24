import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_communication/Constants/enums.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  StreamSubscription? connectivityStreamSbx;

  InternetCubit({
    required this.connectivity,
    // required this.connectivityStreamSbx,
  }) : super(InternetLoading()) {
   monitorInternetConnection();
  }

  StreamSubscription<ConnectivityResult> monitorInternetConnection(){
    return  connectivityStreamSbx =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
          if (connectivityResult == ConnectivityResult.wifi) {
            emitInternetConnected(ConnectionType.Wifi);
          } else if (connectivityResult == ConnectivityResult.mobile) {
            emitInternetConnected(ConnectionType.Mobile);
          } else if (connectivityResult == ConnectivityResult.none) {
            emitInternetDisconnected();
          }
        });
  }

  void emitInternetConnected(ConnectionType _selection) => emit(
        InternetConnected(connectionType: _selection),
      );

  void emitInternetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    // TODO: implement close
    connectivityStreamSbx!.cancel();
    return super.close();
  }
}
