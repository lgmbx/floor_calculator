class ResultModel {
  double areaFloor;
  int piecesByWidth;
  int piecesByLenght;
  double floorPrice;

  ResultModel({
    this.areaFloor,
    this.piecesByWidth,
    this.piecesByLenght,
    this.floorPrice,
  });

  get amountPieces => piecesByWidth * piecesByLenght;
  get amountFooter => piecesByWidth + piecesByLenght;
  get amountPiecesAndFooter => amountPieces + amountFooter;
  get areaWithoutFooter => amountPieces * areaFloor;
  get areaWithFooter => amountPiecesAndFooter * areaFloor;
  get priceWithoutFooter => floorPrice * areaWithoutFooter;
  get priceWithFooter => floorPrice * areaWithFooter;
}
