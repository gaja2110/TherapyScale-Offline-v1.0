import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlcipher_flutter_libs/sqlcipher_flutter_libs.dart';
import 'package:sqlite3/sqlite3.dart';
import '../models/client.dart';
import '../models/session.dart';
import '../models/protocol.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Clients, Sessions, Protocols])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
      await _insertDefaultProtocols();
    },
  );

  Future<void> _insertDefaultProtocols() async {
    final defaultProtocols = [
      ProtocolsCompanion.insert(
        name: 'Massage Relaxation',
        duration: 60,
        price: 120.0,
        description: 'Massage relaxant complet du corps',
      ),
      ProtocolsCompanion.insert(
        name: 'Massage Thérapeutique',
        duration: 90,
        price: 150.0,
        description: 'Massage thérapeutique ciblé',
      ),
      ProtocolsCompanion.insert(
        name: 'Massage Sportif',
        duration: 75,
        price: 135.0,
        description: 'Massage spécialisé pour sportifs',
      ),
      ProtocolsCompanion.insert(
        name: 'Reflexologie Plantaire',
        duration: 45,
        price: 90.0,
        description: 'Réflexologie des pieds',
      ),
      ProtocolsCompanion.insert(
        name: 'Massage Crânien',
        duration: 30,
        price: 70.0,
        description: 'Massage relaxant du crâne et du cuir chevelu',
      ),
    ];

    for (final protocol in defaultProtocols) {
      await into(protocols).insert(protocol);
    }
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    await applyWorkaroundToOpenSqlCipherOnOldAndroidVersions();
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'therapyscale.db'));
    
    // Configure SQLCipher
    final cipherDb = sqlite3.open(
      file.path,
      mode: SqliteOpenMode.readWriteCreate,
    );
    
    // Set encryption key and parameters
    cipherDb.execute("PRAGMA key = 'ScaleGift_2024_Secure_Key_TherapyScale';");
    cipherDb.execute('PRAGMA cipher_page_size = 4096;');
    cipherDb.execute('PRAGMA kdf_iter = 64000;');
    cipherDb.execute('PRAGMA cipher_hmac_algorithm = HMAC_SHA512;');
    cipherDb.execute('PRAGMA cipher_kdf_algorithm = PBKDF2_HMAC_SHA512;');
    
    cipherDb.dispose();
    
    return NativeDatabase.createInBackground(file);
  });
}