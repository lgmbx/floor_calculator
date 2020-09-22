class ResultModel {
  double areaFloor;
  int piecesByWidth;
  int piecesByLenght;

  ResultModel({
    this.areaFloor,
    this.piecesByWidth,
    this.piecesByLenght,
  });

  get amountPieces => piecesByWidth * piecesByLenght;
  get amountFooter => piecesByWidth + piecesByLenght;
  get amountPiecesAndFooter => amountPieces + amountFooter;
  get areaWithoutFooter => amountPieces * areaFloor;
  get areaWithFooter => amountPiecesAndFooter * areaFloor;
}
