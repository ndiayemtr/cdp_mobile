import './models/model_menu.dart';
import 'package:flutter/material.dart';

// ignore: constant_identifier_names
const DATA_MENU = [
  ModelMenu(
      id: '1', title: 'MISSIONS', icon: Icons.trending_up, url: 'mission'),
  ModelMenu(
    id: '2',
    title: 'DEPOSER UNE PLAINTE',
    icon: Icons.note_alt,
    url: 'deposer_plainte',
  ),
  ModelMenu(
    id: '3',
    title: 'FAIRE UN SIGNALEMENT',
    icon: Icons.remove_red_eye,
    url: 'signalement',
  ),
  ModelMenu(
    id: '7',
    title: 'ACTUALITES',
    icon: Icons.info,
    url: 'actualite',
  ),
  ModelMenu(
    id: '5',
    title: 'ASTUCES &  CONSEILS',
    icon: Icons.tips_and_updates_rounded,
    url: 'astucesetconseils',
  ),
  ModelMenu(
    id: '6',
    title: 'QUIZ',
    icon: Icons.quiz,
    url: 'quiz',
  ),
];
