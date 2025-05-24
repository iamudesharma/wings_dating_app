import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum Role {
  @JsonValue("Do not show")
  doNotShow("Do not show"),
  @JsonValue("Top")
  top("Top"),
  @JsonValue("Vers Top")
  versTop("Vers Top"),
  @JsonValue("Versatile")
  versatile("Versatile"),
  @JsonValue("Vers Bottom")
  versBottom("Vers Bottom"),
  @JsonValue("Bottom")
  bottom("Bottom");

  final String value;
  const Role(this.value);
}

@JsonEnum()
enum BodyType {
  @JsonValue("Do not show")
  doNotShow("Do not show"),
  @JsonValue("Slim")
  slim("Slim"),
  @JsonValue("Average")
  average("Average"),
  @JsonValue("Athletic")
  athletic("Athletic"),
  @JsonValue("Muscular")
  muscular("Muscular"),
  @JsonValue("Large")
  large("Large"),
  @JsonValue("Fit")
  fit("Fit"),
  @JsonValue("Stocky")
  stocky("Stocky"),
  @JsonValue("Heavy")
  heavy("Heavy");

  final String value;
  const BodyType(this.value);
}

@JsonEnum()
enum RelationshipStatus {
  @JsonValue("Do not show")
  doNotShow("Do not show"),
  @JsonValue("Single")
  single("Single"),
  @JsonValue("Dating")
  dating("Dating"),
  @JsonValue("Open Relationship")
  openRelationship("Open Relationship"),
  @JsonValue("Married")
  married("Married"),
  @JsonValue("Divorced")
  divorced("Divorced"),
  @JsonValue("Widowed")
  widowed("Widowed"),
  @JsonValue("Complicated")
  complicated("Complicated"),
  @JsonValue("In Love")
  inLove("In Love"),
  @JsonValue("Engaged")
  engaged("Engaged"),
  @JsonValue("Partnered")
  partnered("Partnered");

  final String value;
  const RelationshipStatus(this.value);
}

@JsonEnum()
enum Ethnicity {
  @JsonValue("Do not show")
  doNotShow("Do not show"),
  @JsonValue("Asian")
  asian("Asian"),
  @JsonValue("Black")
  black("Black"),
  @JsonValue("Caucasian")
  caucasian("Caucasian"),
  @JsonValue("Hispanic")
  hispanic("Hispanic"),
  @JsonValue("Indian")
  indian("Indian"),
  @JsonValue("Middle Eastern")
  middleEastern("Middle Eastern"),
  @JsonValue("Native American")
  nativeAmerican("Native American"),
  @JsonValue("Pacific Islander")
  pacificIslander("Pacific Islander"),
  @JsonValue("Mixed")
  mixed("Mixed"),
  @JsonValue("Other")
  other("Other");

  final String value;
  const Ethnicity(this.value);
}

@JsonEnum()
enum LookingFor {
  @JsonValue("Do not show")
  doNotShow("Do not show"),
  @JsonValue("Chat")
  chat("Chat"),
  @JsonValue("Dates")
  dates("Dates"),
  @JsonValue("Friends")
  friends("Friends"),
  @JsonValue("Networking")
  networking("Networking"),
  @JsonValue("Long Term")
  longTerm("Long Term"),
  @JsonValue("Short Term")
  shortTerm("Short Term"),
  @JsonValue("Casual")
  casual("Casual"),
  @JsonValue("Right Now")
  rightNow("Right Now");

  final String value;
  const LookingFor(this.value);
}

@JsonEnum()
enum WhereToMeet {
  @JsonValue("Do not show")
  doNotShow("Do not show"),
  @JsonValue("My Place")
  myPlace("My Place"),
  @JsonValue("Your Place")
  yourPlace("Your Place"),
  @JsonValue("Hotel")
  hotel("Hotel"),
  @JsonValue("Bar")
  bar("Bar"),
  @JsonValue("Restaurant")
  restaurant("Restaurant"),
  @JsonValue("Coffee Shop")
  coffeeShop("Coffee Shop");

  final String value;
  const WhereToMeet(this.value);
}
