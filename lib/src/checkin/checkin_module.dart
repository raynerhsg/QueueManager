import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queue_manager/src/checkin/blocs/checkin_bloc.dart';

final checkinModule = [
  BlocProvider(
    create: (_) => CheckinBloc(
      _.read(),
      _.read(),
      _.read(),
    ),
  )
];
