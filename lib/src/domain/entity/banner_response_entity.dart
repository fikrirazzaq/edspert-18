class BannerResponseEntity {
  int status;
  String message;
  List<BannerDataEntity> data;

  BannerResponseEntity({
    required this.status,
    required this.message,
    required this.data,
  });
}

class BannerDataEntity {
  String eventId;
  String eventTitle;
  String eventDescription;
  String eventImage;
  String eventUrl;

  BannerDataEntity({
    required this.eventId,
    required this.eventTitle,
    required this.eventDescription,
    required this.eventImage,
    required this.eventUrl,
  });
}
