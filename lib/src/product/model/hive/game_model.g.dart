// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GameModelAdapter extends TypeAdapter<GameModel> {
  @override
  final int typeId = 1;

  @override
  GameModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GameModel(
      gameName: fields[0] as String,
      teamCount: fields[1] as int,
      createdPlayer: fields[2] as String,
      playerType: (fields[3] as List).cast<String>(),
      playerAbility: (fields[4] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, GameModel obj) {
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
      ..writeByte(4)
      ..write(obj.playerAbility);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
