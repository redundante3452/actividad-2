import 'dart:convert';
import 'package:http/http.dart' as http;

class Pokemon {
  String nombre;
  int altura;
  int peso;
  String tipo;

  Pokemon(this.nombre, this.altura, this.peso, this.tipo);

  String mostrarInfo() {
    return 'Nombre: $nombre\nAltura: $altura\nPeso: $peso\nTipo: $tipo';
  }
}


mixin PokemonApi {
  Future<Pokemon> obtenerPokemon(String nombre) async {
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$nombre'));

    if (response.statusCode == 200) {
      var datos = json.decode(response.body);
      return Pokemon(
        datos['name'],
        datos['height'],
        datos['weight'],
        datos['types'][0]['type']['name'],
      );
    } else {
      throw Exception('No se pudo obtener el Pokémon');
    }
  }
}

class PokemonService with PokemonApi {
  Future<Pokemon> cargarDatos(String nombre) async {
    return await obtenerPokemon(nombre);
  }
}