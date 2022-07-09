//Clase modelo
class UserMessage {
  final String mensaje;
  //agregar en futuro las listas

  const UserMessage({
    required this.mensaje,

  });

  //Método constructor a partir de json
  factory UserMessage.fromJson(Map<Object, dynamic> json) {
    print('fromjson');
    print(json['user']['subscribers']);
    return UserMessage(
      mensaje: json['msg'],
    );
  }
}
