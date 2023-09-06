// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

BuyFormData welcomeFromJson(String str) => BuyFormData.fromJson(json.decode(str));

// ignore: non_constant_identifier_names, avoid_types_as_parameter_names
String welcomeToJson(BuyFormData data, {required String }) => json.encode(data.toJson());

class BuyFormData {
    BuyFormData({
        required this.faction,
        required this.region,
        required this.name,
        required this.email,
        required this.delivery,
        required this.server,
        required this.nickname,
        required this.amountGold,
        required this.amountUsd,
    });

    String faction;
    String region;
    String name;
    String email;
    String delivery;
    String server;
    String nickname;
    String amountGold;
    String amountUsd;

    factory BuyFormData.fromJson(Map<String, dynamic> json) => BuyFormData(
        faction: json["faction"],
        region: json["region"],
        name: json["name"],
        email: json["email"],
        delivery: json["delivery"],
        server: json["server"],
        nickname: json["nickname"],
        amountGold: json["amountGold"],
        amountUsd: json["amountUSD"],
    );

    Map<String, dynamic> toJson() => {
        "faction": faction,
        "region": region,
        "name": name,
        "email": email,
        "delivery": delivery,
        "server": server,
        "nickname": nickname,
        "amountGold": amountGold,
        "amountUSD": amountUsd,
    };
}