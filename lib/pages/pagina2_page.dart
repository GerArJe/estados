import 'package:flutter/material.dart';

import 'package:estados/services/usuario_service.dart';

import 'package:estados/models/usuario.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: usuarioService.usuarioStream,
          builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
            return snapshot.hasData
                ? Text(
                    'Nombre: ${snapshot.data!.nombre}',
                  )
                : Text(
                    'Pagina 2',
                  );
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                final nuevoUsuario = Usuario(
                  nombre: 'Fernando',
                  edad: 35,
                );
                usuarioService.cargarUsuario(nuevoUsuario);
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
                usuarioService.cambiarEdad(30);
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
              onPressed: () {},
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
