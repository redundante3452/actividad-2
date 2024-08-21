import 'dart:io';
import 'pokemon.dart';

void main() async {
  var pokemonService = PokemonService();
  
  print('Ingrese el nombre del Pokémon:');
  String? nombre = stdin.readLineSync();

  if (nombre != null && nombre.isNotEmpty) {
    try {
      Pokemon pokemon = await pokemonService.cargarDatos(nombre.toLowerCase());
      print('\nInformación del Pokémon:\n');
      print(pokemon.mostrarInfo());
    } catch (e) {
      print('Error: $e');
    }
  } else {
    print('Por favor, ingrese un nombre válido.');
  }
}