import 'package:meta/meta.dart';

import 'package:bloc/bloc.dart';

import 'package:estados/models/usuario.dart';

part 'usuario_event.dart';

part 'usuario_state.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  UsuarioBloc() : super(UsuarioState()) {
    on<ActivarUsuario>(
        (event, emit) => emit(state.copyWith(usuario: event.usuario)));

    on<CambiarEdad>(
      (event, emit) => emit(
        state.copyWith(
          usuario: state.usuario?.copyWith(edad: event.edad),
        ),
      ),
    );
    on<AgregarProfesion>(
      (event, emit) {
        final profesiones = [
          ...?state.usuario?.profesiones,
          event.profesion,
        ];

        emit(
          state.copyWith(
            usuario: state.usuario?.copyWith(
              profesiones: profesiones,
            ),
          ),
        );
      },
    );

    on<BorrarUsuario>(
      (event, emit) => emit(state.estadoInicial()),
    );
  }
}
