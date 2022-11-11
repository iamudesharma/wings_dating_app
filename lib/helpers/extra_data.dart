enum Role {
  doNotShow("Do not show"),
  top("Top"),
  versTop("Vers Top"),
  versatile("Versatile"),
  versBottom("vers Bottom"),

  bottom("Bottom");

  final String role;

  const Role(this.role);
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

  final String bodyType;

  const BodyType(this.bodyType);
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

  final String relationshipStatus;

  const RelationshipStatus(this.relationshipStatus);
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

  final String ethnicity;

  const Ethnicity(this.ethnicity);
}

enum LookingFor {
  chat("Chat"),
  dates("Dates"),
  friends("Friends"),
  networking("Networking"),
  longTerm("Long Term"),
  shortTerm("Short Term"),
  casual("Casual"),
  ightNow("Right Now");

  final String lookingFor;

  const LookingFor(this.lookingFor);
}

enum WhereToMeet {
  myPlace("My Place"),
  yourPlace("Your Place"),
  hotel("Hotel"),
  bar("Bar"),
  restaurant("Restaurant"),
  coffeeShop("Coffee Shop");

  final String whereToMeet;

  const WhereToMeet(this.whereToMeet);
}
