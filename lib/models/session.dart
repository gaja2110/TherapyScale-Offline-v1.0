import 'package:drift/drift.dart';
import 'client.dart';
import 'protocol.dart';

@DataClassName('Session')
class Sessions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get clientId => integer().references(Clients, #id)();
  IntColumn get protocolId => integer().references(Protocols, #id)();
  DateTimeColumn get sessionDate => dateTime()();
  IntColumn get duration => integer()(); // in minutes
  RealColumn get price => real()();
  TextColumn get notes => text().nullable()();
  TextColumn get status => text().withDefault(const Constant('completed'))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}