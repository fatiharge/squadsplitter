// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TeamModelAdapter extends TypeAdapter<TeamModel> {
  @override
  final int typeId = 2;

  @override
  TeamModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TeamModel(
      gameName: fields[0] as String,
      teamCount: fields[1] as int,
      createdPlayer: fields[2] as String,
      playerType: (fields[3] as List).cast<String>(),
      gameType: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TeamModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.gameName)
      ..writeByte(1)
      ..write(obj.teamCount)
      ..writeByte(2)
      ..write(obj.createdPlayer)
      ..writeByte(3)
      ..write(obj.playerType)
      ..writeByte(5)
      ..write(obj.gameType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TeamModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
