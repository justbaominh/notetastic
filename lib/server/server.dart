import 'package:mongo_dart/mongo_dart.dart';
import 'package:sevr/sevr.dart';

void start() async {
  final db = await Db.create(
      'mongodb+srv://mckenzie:29112001@notetastic.3bklz.mongodb.net/test?retryWrites=true&w=majority');
  await db.open();
  final coll = db.collection("note-data");

  const port = 8082;
  final server = Sevr();

  server.get("/", [
    (ServRequest req, ServResponse res) async {
      final notes = await coll.find().toList();
      return res.status(200).json({"notes": notes});
    },
  ]);

  server.post("/", [
    (ServRequest req, ServResponse res) async {
      await coll.save(req.body);
      return res.json(await coll.findOne(where.eq("title", req.body["title"])));
    }
  ]);

	server.delete("/:id", [
		(ServRequest req, ServResponse res) async {
			await coll.remove(where.eq("_id", ObjectId.fromHexString(req.params["id"])));
			return res.status(200);
		}
	]);

  server.listen(port, callback: () {
    print("Server listening on port $port");
  });
}
