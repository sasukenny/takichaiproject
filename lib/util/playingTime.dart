class PlayingTime{
  int hours;
  int minutes;
  int seconds;

  double get numEquiv => (hours * 3600 + minutes * 60 + seconds).toDouble();

  PlayingTime(this.hours, this.minutes, this.seconds){
    hours = hours;
    minutes = minutes;
    seconds = seconds;
  }

  PlayingTime.copy(PlayingTime playingTime) : this(playingTime.hours, playingTime.minutes, playingTime.seconds);
}