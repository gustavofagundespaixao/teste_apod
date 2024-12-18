// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:teste_apod/app/core/utils/app_date_format.dart';

class ApodModel {
  final String copyright;
  final DateTime date;
  final String explanation;
  final String hdurl;
  final String mediaType;
  final String serviceVersion;
  final String title;
  final String url;

  bool get isImage => mediaType.contains('image');
  bool get isVideo => mediaType.contains('video');

  ApodModel({
    required this.copyright,
    required this.date,
    required this.explanation,
    required this.hdurl,
    required this.mediaType,
    required this.serviceVersion,
    required this.title,
    required this.url,
  });

  ApodModel copyWith({
    String? copyright,
    DateTime? date,
    String? explanation,
    String? hdurl,
    String? mediaType,
    String? serviceVersion,
    String? title,
    String? url,
  }) {
    return ApodModel(
      copyright: copyright ?? this.copyright,
      date: date ?? this.date,
      explanation: explanation ?? this.explanation,
      hdurl: hdurl ?? this.hdurl,
      mediaType: mediaType ?? this.mediaType,
      serviceVersion: serviceVersion ?? this.serviceVersion,
      title: title ?? this.title,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'copyright': copyright,
      'date':
          AppDateFormat.dateToStringFormat(value: date, format: 'yyyy-MM-dd'),
      'explanation': explanation,
      'hdurl': hdurl,
      'mediaType': mediaType,
      'serviceVersion': serviceVersion,
      'title': title,
      'url': url,
    };
  }

  factory ApodModel.fromMap(Map<String, dynamic> map) {
    return ApodModel(
      copyright: map['copyright'] ?? '',
      date: DateTime.parse(map['date']),
      explanation: map['explanation'] ?? '',
      hdurl: map['hdurl'] ?? '',
      mediaType: map['media_type'] ?? '',
      serviceVersion: map['service_version'] ?? '',
      title: map['title'] ?? '',
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ApodModel.fromJson(String source) =>
      ApodModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ApodModel(copyright: $copyright, date: $date, explanation: $explanation, hdurl: $hdurl, mediaType: $mediaType, serviceVersion: $serviceVersion, title: $title, url: $url)';
  }

  @override
  bool operator ==(covariant ApodModel other) {
    if (identical(this, other)) return true;

    return other.copyright == copyright &&
        other.date == date &&
        other.explanation == explanation &&
        other.hdurl == hdurl &&
        other.mediaType == mediaType &&
        other.serviceVersion == serviceVersion &&
        other.title == title &&
        other.url == url;
  }

  @override
  int get hashCode {
    return copyright.hashCode ^
        date.hashCode ^
        explanation.hashCode ^
        hdurl.hashCode ^
        mediaType.hashCode ^
        serviceVersion.hashCode ^
        title.hashCode ^
        url.hashCode;
  }
}
