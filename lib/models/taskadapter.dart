import 'package:hive_flutter/adapters.dart';
import 'package:taskatii/models/taskmodel.dart';

class Taskadapter extends TypeAdapter<Taskmodel> {
  @override
  Taskmodel read(BinaryReader reader) {
    // TODO: implement read
    return Taskmodel(
      id: reader.readString(),
      title: reader.readString(),
      note: reader.readString(),
      date: reader.readString(),
      startTime: reader.readString(),
      endTime: reader.readString(),
      Color: reader.readInt(),
      isCompleted: reader.readBool(),
    );
  }

  @override
  // TODO: implement typeId
  int get typeId => 0;
  @override
  void write(BinaryWriter writer, Taskmodel obj) {
    // TODO: implement write
    writer.writeString(obj.id);
    writer.writeString(obj.title);
    writer.writeString(obj.note);
    writer.writeString(obj.date);
    writer.writeString(obj.startTime);
    writer.writeString(obj.endTime);
    writer.writeInt(obj.Color);
    writer.writeBool(obj.isCompleted);
  }
}
