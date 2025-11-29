import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/auth/custom_auth/auth_util.dart';

List<String> shuffleList(List<String>? listToShuffle) {
  // 1. listToShuffle이 null이거나 비어있는지 확인합니다.
  if (listToShuffle == null || listToShuffle.isEmpty) {
    return []; // 비어있으면 빈 리스트를 반환합니다.
  }

  // 2. 원본 리스트를 복사하여 'shuffledList'라는 새 리스트를 만듭니다.
  //    (원본을 훼손하지 않기 위함)
  List<String> shuffledList = List<String>.from(listToShuffle);

  // 3. 새 리스트를 섞습니다.
  shuffledList.shuffle();

  // 4. 섞인 새 리스트를 반환합니다.
  return shuffledList;
}

List<String> createEmptySlots(List<String> sourceList) {
  return List<String>.filled(sourceList.length, "");
}

String? combineChunks(List<String> chunks) {
  // List<String> 타입의 'chunks' 리스트를 입력받아,
  // 리스트의 모든 항목을 공백("") 없이 하나의 String으로 합쳐서 반환합니다.
  // 예: ["誰だ", "お前"]  ->  "誰だお前"
  return chunks.join("");
}
