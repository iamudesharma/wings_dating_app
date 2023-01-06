enum Role {
  doNotShow("Do not show"),
  top("Top"),
  versTop("Vers Top"),
  versatile("Versatile"),
  versBottom("vers Bottom"),

  bottom("Bottom");

  final String value;

  const Role(this.value);
}

enum BodyType {
  doNotShow("Do not show"),
  slim("Slim"),
  average("Average"),
  athletic("Athletic"),
  muscular("Muscular"),
  large("Large"),
  fit("Fit"),
  stocky("Stocky"),

  heavy("Heavy");

  final String value;

  const BodyType(this.value);
}

enum RelationshipStatus {
  doNotShow("Do not show"),
  single("Single"),
  dating("Dating"),
  openRelationship("Open Relationship"),
  married("Married"),
  divorced("Divorced"),
  widowed("Widowed"),
  complicated("Complicated"),
  inLove("In Love"),
  engaged("Engaged"),

  partnered("Partnered");

  final String value;

  const RelationshipStatus(this.value);
}

enum Ethnicity {
  doNotShow("Do not show"),
  asian("Asian"),
  black("Black"),
  caucasian("Caucasian"),
  hispanic("Hispanic"),
  indian("Indian"),
  middleEastern("Middle Eastern"),
  nativeAmerican("Native American"),
  pacificIslander("Pacific Islander"),
  mixed("Mixed"),
  other("Other"),

  partnered("Partnered");

  final String value;

  const Ethnicity(this.value);
}

enum LookingFor {
  doNotShow("Do not show"),

  chat("Chat"),
  dates("Dates"),
  friends("Friends"),
  networking("Networking"),
  longTerm("Long Term"),
  shortTerm("Short Term"),
  casual("Casual"),
  rightNow("Right Now");

  final String value;

  const LookingFor(this.value);
}

enum WhereToMeet {
  doNotShow("Do not show"),

  myPlace("My Place"),
  yourPlace("Your Place"),
  hotel("Hotel"),
  bar("Bar"),
  restaurant("Restaurant"),
  coffeeShop("Coffee Shop");

  final String value;

  const WhereToMeet(this.value);
}
