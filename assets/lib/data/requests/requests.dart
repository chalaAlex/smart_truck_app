class LoginRequest {
  String password;
  String email;
  LoginRequest(
    this.email,
    this.password,
  );
}

class OrderRequest {
  String itemName;
  String senderName;
  String recieverName;
  String agentName;
  String price;
  String senderPhone;
  String recieverPhone;
  String weight;
  String weightUnit;
  String origin;
  String destination;
  String urgency;
  String category;
  String estimatedDelieryTime;

  OrderRequest(
    this.itemName,
    this.senderName,
    this.recieverName,
    this.price,
    this.senderPhone,
    this.recieverPhone,
    this.weight,
    this.origin,
    this.weightUnit,
    this.destination,
    this.urgency,
    this.category,
    this.estimatedDelieryTime,
    this.agentName,
  );
}