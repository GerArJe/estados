import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estados/models/usuario.dart';
import 'package:estados/bloc/usuario/usuario_bloc.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarioBloc = BlocProvider.of<UsuarioBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                final newUser = Usuario(
                  nombre: 'Fernando Herrera',
                  edad: 34,
                  profesiones: ['Fullstack developer'],
                );

                usuarioBloc.add(ActivarUsuario(newUser));
              },
              child: const Text(
                'Establecer Usuario',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.blue,
            ),
            MaterialButton(
              onPressed: () {
                usuarioBloc.add(
                  CambiarEdad(30),
                );
              },
              child: const Text(
                'Cambiar edad',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.blue,
            ),
            MaterialButton(
              onPressed: () {
                usuarioBloc.add(
                  AgregarProfesion('Nueva profesion'),
                );
              },
              child: const Text(
                'Añadir profesion',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
