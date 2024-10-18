import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:miel_work_request_square_web/models/request_square.dart';

class RequestSquareService {
  String collection = 'requestSquare';
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String id() {
    return firestore.collection(collection).doc().id;
  }

  void create(Map<String, dynamic> values) {
    firestore.collection(collection).doc(values['id']).set(values);
  }

  Future<RequestSquareModel?> selectData(String id) async {
    RequestSquareModel? ret;
    await firestore.collection(collection).doc(id).get().then((value) {
      ret = RequestSquareModel.fromSnapshot(value);
    });
    return ret;
  }
}
