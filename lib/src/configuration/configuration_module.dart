import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queue_manager/src/configuration/blocs/configuration_bloc.dart';

final configurationModule = [
  BlocProvider(
    create: (_) => ConfigurationBloc(
      _.read(),
      _.read(),
      _.read(),
      _.read(),
    ),
  )
];
