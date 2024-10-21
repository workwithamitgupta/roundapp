class TransactionModel {
  bool? status;
  String? message;
  List<Transaction>? transaction;

  TransactionModel({
    this.status,
    this.message,
    this.transaction,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        status: json["status"],
        message: json["message"],
        transaction: json["data"] == null
            ? []
            : List<Transaction>.from(
                json["data"]!.map((x) => Transaction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": transaction == null
            ? []
            : List<dynamic>.from(transaction!.map((x) => x.toJson())),
      };
}

class Transaction {
  int? id;
  String? amount;
  String? direction;
  String? type;
  int? userId;
  String? createdAt;
  Transaction({
    this.id,
    this.amount,
    this.direction,
    this.type,
    this.userId,
    this.createdAt,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["id"],
        amount: json["amount"],
        direction: json["direction"],
        type: json["type"],
        userId: json["user_id"],
        createdAt: json['created_at'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "direction": direction,
        "type": type,
        "user_id": userId,
      };
}
