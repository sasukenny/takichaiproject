//Clase modelo
class User {
  final String name;
  final String email;
  final String description;
  final List<String> subscribers;
  final List<String> subscriptions;
  //agregar en futuro las listas

  const User({
    required this.name,
    required this.email,
    required this.description,
    required this.subscribers,
    required this.subscriptions,

  });

  //Método constructor a partir de json
  factory User.fromJson(Map<Object, dynamic> json) {
    print('fromjson');
    print(json['user']['subscribers']);
    /*
    json['user']['subscribers'].map((suscriber)=>{
      subscribersList.add(suscriber)
    });
     */
    List<String> subscribersList = [];
    for(String sus in json['user']['subscribers']){
      subscribersList.add(sus);
    }

    /*
    json['user']['subscriptions'].map((subscription)=>{
      subscriptionsList.add(subscription)
    });
    */
    List<String>  subscriptionsList = [];
    for(String sus in json['user']['subscriptions']){
      subscriptionsList.add(sus);
    }
    print('lista1');
    print(subscribersList);
    print('lista2');
    print(subscriptionsList);
    return User(
      name: json['user']['name'],
      email: json['user']['email'],
      description: json['user']['description'],
      subscribers: subscribersList,
      subscriptions: subscriptionsList,
    );
  }
}
