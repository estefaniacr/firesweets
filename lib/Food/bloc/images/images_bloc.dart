import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:fire_sweet_app/services/database_repository.dart';
part 'images_event.dart';
part 'images_state.dart';

class ImagesBloc extends Bloc<ImagesEvent, ImagesState> {
  final DataBaseRepository _dataBaseRepository;
  StreamSubscription? _databaseSuscription;

  ImagesBloc({required DataBaseRepository databaseRepository})
  : _dataBaseRepository = databaseRepository,
  super(ImagesLoading());

  @override
  Stream<ImagesState> mapEventToState(ImagesEvent event) async* {
    if (event is LoadImages) {
      yield* _mapLoadImagesToState();
    }
      if (event is UpdateImages) {
      yield* _mapUpdateImagesToState(event);
    }
  }

  Stream<ImagesState> _mapLoadImagesToState() async* {
    _databaseSuscription?.cancel();

    _dataBaseRepository.getUser()
    .listen(
      (user) => add(
      UpdateImages(user.imageUrls),
      ),
    );
  }

    Stream<ImagesState> _mapUpdateImagesToState(UpdateImages event) async* {
      yield ImagesLoaded(imageUrls: event.imageUrls);

  }

}