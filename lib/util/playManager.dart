import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class PlayManager {

  String url = "";
  String songId = "";

  late AudioPlayer _audioPlayer;
  late bool played;
  late bool fullPlayed;

  PlayManager( String url , String songId ) {
    this.url = url;
    this.songId = songId;
    _init();
  }
  void _init() async {

    played = false;
    fullPlayed = false;

    _audioPlayer = AudioPlayer();
    await _audioPlayer.setUrl(url);

    _audioPlayer.playerStateStream.listen((playerState) {
      final isPlaying = playerState.playing;
      final processingState = playerState.processingState;
      if (processingState == ProcessingState.loading ||
          processingState == ProcessingState.buffering) {
        buttonNotifier.value = ButtonState.loading;
      } else if (!isPlaying) {
        buttonNotifier.value = ButtonState.paused;
      } else {
        buttonNotifier.value = ButtonState.playing;
      }
    });

    _audioPlayer.positionStream.listen((position) {

      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: position,
        buffered: oldState.buffered,
        total: oldState.total,
      );
      if (progressNotifier.value.current >= const Duration(seconds: 10) && !played){
        played = true;
        SendPlayed(songId);
        print(songId+": 10 segundos pasaron");
      }
      if (progressNotifier.value.current == progressNotifier.value.total && !fullPlayed){
        fullPlayed = true;
        SendFullPlayed(songId);
        print(songId+": Full played");
      }
    });

    _audioPlayer.bufferedPositionStream.listen((bufferedPosition) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: bufferedPosition,
        total: oldState.total,
      );

    });

    _audioPlayer.durationStream.listen((totalDuration) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: oldState.buffered,
        total: totalDuration ?? Duration.zero,
      );
    });


  }

  final progressNotifier = ValueNotifier<ProgressBarState>(
    ProgressBarState(
      current: Duration.zero,
      buffered: Duration.zero,
      total: Duration.zero,
    ),
  );
  final buttonNotifier = ValueNotifier<ButtonState>(ButtonState.paused);

  void play() {
    _audioPlayer.play();
  }
  void pause() {
    _audioPlayer.pause();
  }

  void seek(Duration position) {
    _audioPlayer.seek(position);
  }

  void dispose() {
    _audioPlayer.dispose();
  }

  Future<void> SendPlayed(String id) async{
    String? token;

    final Map<String,Object>query = {
      'reproductions': 'true'
    };

    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      final url = Uri.https('takichai-backend.herokuapp.com','/api/songs/stats/${id}',query);
      final response = await http.patch(url,
        headers: {"Authorization": 'Bearer $token'},
      );
      print(jsonDecode(response.body));
    }catch(error){
      print(error);
      throw Exception('Failed to send 10 seconds');
    }
  }

  Future<void> SendFullPlayed(String id) async {
    String? token;

    final Map<String, Object>query = {
      'fullReproductions': 'true'
    };

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      final url = Uri.https(
          'takichai-backend.herokuapp.com', '/api/songs/stats/${id}', query);
      final response = await http.patch(url,
        headers: {"Authorization": 'Bearer $token'},
      );
      print(jsonDecode(response.body));
    } catch (error) {
      print(error);
      throw Exception('Failed to send full reproduction');
    }
  }

}


class ProgressBarState {
  ProgressBarState({
    required this.current,
    required this.buffered,
    required this.total,
  });
  final Duration current;
  final Duration buffered;
  final Duration total;
}

enum ButtonState {
  paused, playing, loading

}