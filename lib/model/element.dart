import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ELement {
  final String nom;
  final String symbol;
  final String numeroAtomique;
  final String masseAtomique;
  final int x;
  final int y;

  ELement(
    {
      required this.nom,
      required this.symbol,
      required this.masseAtomique,
      required this.numeroAtomique,
      required this.x,
      required this.y
    }
  );

}