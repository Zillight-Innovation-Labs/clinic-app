// To parse this JSON data, do
//
//     final getAllTestModel = getAllTestModelFromJson(jsonString);

import 'dart:convert';

GetAllTestModel getAllTestModelFromJson(String str) => GetAllTestModel.fromJson(json.decode(str));

String getAllTestModelToJson(GetAllTestModel data) => json.encode(data.toJson());

class GetAllTestModel {
    TestDetails? testDetails;

    GetAllTestModel({
         this.testDetails,
    });

    factory GetAllTestModel.fromJson(Map<String, dynamic> json) => GetAllTestModel(
        testDetails: TestDetails.fromJson(json["testDetails"]),
    );

    Map<String, dynamic> toJson() => {
        "testDetails": testDetails!.toJson(),
    };
}

class TestDetails {
    String message;
    bool success;
    int statusCode;
    Data data;

    TestDetails({
        required this.message,
        required this.success,
        required this.statusCode,
        required this.data,
    });

    factory TestDetails.fromJson(Map<String, dynamic> json) => TestDetails(
        message: json["message"],
        success: json["success"],
        statusCode: json["statusCode"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "success": success,
        "statusCode": statusCode,
        "data": data.toJson(),
    };
}

class Data {
    List<Test> test;
    int totalTest;

    Data({
        required this.test,
        required this.totalTest,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        test: List<Test>.from(json["test"].map((x) => Test.fromJson(x))),
        totalTest: json["totalTest"],
    );

    Map<String, dynamic> toJson() => {
        "test": List<dynamic>.from(test.map((x) => x.toJson())),
        "totalTest": totalTest,
    };
}

class Test {
    dynamic id;
    String testName;
    AdminId adminId;
    List<QuestionType> questionTypes;
    List<Recommendation> recommendations;
    String description;
    String? image;
    List<String> answerOptions;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    ExtraDetails? extraDetails;

    Test({
        required this.id,
        required this.testName,
        required this.adminId,
        required this.questionTypes,
        required this.recommendations,
        required this.description,
        this.image,
        required this.answerOptions,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
        this.extraDetails,
    });

    factory Test.fromJson(Map<String, dynamic> json) => Test(
        id: json["_id"],
        testName: json["testName"],
        adminId: adminIdValues.map[json["adminId"]]!,
        questionTypes: List<QuestionType>.from(json["questionTypes"].map((x) => QuestionType.fromJson(x))),
        recommendations: List<Recommendation>.from(json["recommendations"].map((x) => Recommendation.fromJson(x))),
        description: json["description"],
        image: json["image"],
        answerOptions: List<String>.from(json["answerOptions"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        extraDetails: json["extraDetails"] == null ? null : ExtraDetails.fromJson(json["extraDetails"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "testName": testName,
        "adminId": adminIdValues.reverse[adminId],
        "questionTypes": List<dynamic>.from(questionTypes.map((x) => x.toJson())),
        "recommendations": List<dynamic>.from(recommendations.map((x) => x.toJson())),
        "description": description,
        "image": image,
        "answerOptions": List<dynamic>.from(answerOptions.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "extraDetails": extraDetails?.toJson(),
    };
}

enum AdminId {
    // ignore: constant_identifier_names
    THE_63188_D54_BD39520_E68_E62169,
    // ignore: constant_identifier_names
    THE_6415_AAFAEC4_D004364907674
}

final adminIdValues = EnumValues({
    "63188d54bd39520e68e62169": AdminId.THE_63188_D54_BD39520_E68_E62169,
    "6415aafaec4d004364907674": AdminId.THE_6415_AAFAEC4_D004364907674
});

class ExtraDetails {
    String childName;
    String childDob;
    String filledBy;

    ExtraDetails({
        required this.childName,
        required this.childDob,
        required this.filledBy,
    });

    factory ExtraDetails.fromJson(Map<String, dynamic> json) => ExtraDetails(
        childName: json["childName"],
        childDob: json["childDOB"],
        filledBy: json["filledBy"],
    );

    Map<String, dynamic> toJson() => {
        "childName": childName,
        "childDOB": childDob,
        "filledBy": filledBy,
    };
}

class QuestionType {
    String questions;
    dynamic id;

    QuestionType({
        required this.questions,
        required this.id,
    });

    factory QuestionType.fromJson(Map<String, dynamic> json) => QuestionType(
        questions: json["questions"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "questions": questions,
        "_id": id,
    };
}

class Recommendation {
    String info;
    String? score;
    String? interpretation;
    List<String> comment;
    String id;
    String? testName;
    String? testInfo;

    Recommendation({
        required this.info,
        this.score,
        this.interpretation,
        required this.comment,
        required this.id,
        this.testName,
        this.testInfo,
    });

    factory Recommendation.fromJson(Map<String, dynamic> json) => Recommendation(
        info: json["info"],
        score: json["score"],
        interpretation: json["interpretation"],
        comment: List<String>.from(json["comment"].map((x) => x)),
        id: json["_id"],
        testName: json["testName"],
        testInfo: json["testInfo"],
    );

    Map<String, dynamic> toJson() => {
        "info": info,
        "score": score,
        "interpretation": interpretation,
        "comment": List<dynamic>.from(comment.map((x) => x)),
        "_id": id,
        "testName": testName,
        "testInfo": testInfo,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
