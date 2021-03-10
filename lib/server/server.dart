import 'package:mongo_dart/mongo_dart.dart';
import 'package:sevr/sevr.dart';

void start() async {
	final db = await Db.create('mongodb+srv://mckenzie:29112001@notetastic.3bklz.mongodb.net/test?retryWrites=true&w=majority');
	await db.open();
	final coll = db.collection("note-data");
}
