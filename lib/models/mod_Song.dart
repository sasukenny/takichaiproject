

//Song songFromNewSong(String str) => Song.fromNewSong(jsonDecode(str));
//Song songFromGetSong(String str) => Song.fromGetSong(jsonDecode(str));

//Clase modelo
class Song {
  String name = "";
  String songUrl = "";
  int year = 0;
  String genre = "";
  String description = "";
  //User author = User.emptyUser();
  String author = "";
  String popularity = '0';
  String? imageUrl ;
  String duration = '';
  bool instrumental = false;
  String mood = '';
  String songId = '';
/**/
  Song(
      this.name,
      this.songUrl,
      this.year,
      this.genre,
      this.description,
      this.author,
      this.popularity,
      this.imageUrl,
      this.duration,
      this.instrumental,
      this.mood,
      this.songId
      /**/
      );

  //Método constructor a partir de nueva canción
  Song.fromNewSong(Map<Object, dynamic> json) {
    name = json["song"]["name"];
    songUrl = json["song"]["songUrl"];
    year = json["song"]["year"];
    genre = json["song"]["genre"];
    description = json["song"]["description"];
    //author = User.fromProfileData(json["song"]["author"]);
    author = json["song"]["author"]['_id'];
    popularity = json["song"]["popularity"];
    imageUrl = json["song"]["imageUrl"];
    duration = json["song"]["duration"];
    instrumental = json["song"]["instrumental"];
    mood = json["song"]["mood"];
    /**/
  }

  Song.emptySong(){
    name = "Empty Song";
    songUrl = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3";
    year = 0;
    genre = "Rock";
    description = "Test song";
    //author = User.emptyUser();
    author = "Dan";
    //language = "esp";
    popularity = "";
    imageUrl = "https://i.scdn.co/image/ab67616d0000b273d65e2670b7176415b9d88a59";
    duration = "";
    instrumental = false;
    mood = "";
  }

/*

  //Método constructor a partir de register
  Song.fromGetSong(Map<Object, dynamic> json) {
    name = json["song"]["name"];
    songUrl = json["song"]["songUrl"];
    year = json["song"]["year"];
    genre = json["song"]["genre"];
    description = json["song"]["description"];
    author = json["song"]["author"]['_id'];
    language = json["song"]["language"];
    imageUrl = json["song"]["imageUrl"];
    duration = json["song"]["duration"];
    instrumental = json["song"]["instrumental"];
    mood = json["song"]["mood"];
  }

  Song.fromGetSonglist(Map<Object, dynamic> json) {
    name = json["song"]["name"];
    songUrl = json["song"]["songUrl"];
    year = json["song"]["year"];
    genre = json["song"]["genre"];
    description = json["song"]["description"];
    author = json["song"]["author"];
    language = json["song"]["language"];
    imageUrl = json["song"]["imageUrl"];
    duration = json["song"]["duration"];
    instrumental = json["song"]["instrumental"];
    mood = json["song"]["mood"];
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "songUrl": songUrl,
    "year": year,
    "genre": genre,
    "description": description,
    //"author": author.toJson(),
    "author": author,
    "language": language,
    "popularity": popularity,
    "imageUrl": imageUrl,
    "duration": duration,
    "instrumental": instrumental,
    "mood": mood
  };
*/
}
