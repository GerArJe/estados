import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estados/models/usuario.dart';
import 'package:estados/bloc/usuario/usuario_bloc.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<UsuarioBloc>(context).add(BorrarUsuario());
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: BlocBuilder<UsuarioBloc, UsuarioState>(
        builder: (_, state) {
          if (state.existeUsuario) {
            return InformacionUsuario(state.usuario!);
          } else {
            return const Center(
              child: Text('No hay usuario seleccionado'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'pagina2');
        },
        child: const Icon(Icons.accessibility_new),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;

  const InformacionUsuario(
    this.usuario,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'General',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          ListTile(
            title: Text('Nombre: ${usuario.nombre}'),
          ),
          ListTile(
            title: Text('Edad: ${usuario.edad}'),
          ),
          const Text(
            'Profesiones',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          ...?usuario.profesiones?.map(
            (profesion) => ListTile(
              title: Text(profesion),
            ),
          ),
        ],
      ),
    );
  }
}
