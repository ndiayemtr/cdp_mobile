import './model/model_menu.dart';
import 'package:flutter/material.dart';

// ignore: constant_identifier_names
const DATA_MENU = [
  ModelMenu(
      id: '1', title: 'MISSIONS', icon: Icons.trending_up, url: 'mission'),
  ModelMenu(
      id: '2',
      title: 'DEPOSER UNE PLAINTE',
      icon: Icons.note_alt,
      url: 'plainte'),
  ModelMenu(
      id: '3',
      title: 'FAIRE UN SIGNALEMENT',
      icon: Icons.remove_red_eye,
      url: 'signalement'),
  ModelMenu(
      id: '4',
      title: 'NOS RESEAUX SOCIAUX',
      icon: Icons.phonelink_ring,
      url: 'reseaux-sociaux'),
  ModelMenu(
      id: '5',
      title: 'NOUS CONTACTER',
      icon: Icons.quick_contacts_mail,
      url: 'contact'),
  ModelMenu(
      id: '6',
      title: '   APPELER LA CDP',
      icon: Icons.phone,
      url: 'appeler-cdp'),
];
