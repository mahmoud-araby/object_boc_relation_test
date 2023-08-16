// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'models/order.dart';
import 'models/user.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(2, 6547974627326237735),
      name: 'User',
      lastPropertyId: const IdUid(4, 6922978773635264181),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 732779068710652053),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 4354299417489928240),
            name: 'uid',
            type: 9,
            flags: 34848,
            indexId: const IdUid(2, 5205083684822979650)),
        ModelProperty(
            id: const IdUid(3, 6592453108123981655),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 6922978773635264181),
            name: 'notes',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[
        ModelBacklink(name: 'orders', srcEntity: 'UserOrder', srcField: 'user')
      ]),
  ModelEntity(
      id: const IdUid(3, 2131403676591069818),
      name: 'UserOrder',
      lastPropertyId: const IdUid(5, 1105011720804341842),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 8569494502862485649),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 7129897417810820091),
            name: 'uid',
            type: 9,
            flags: 34848,
            indexId: const IdUid(3, 9160200017178803091)),
        ModelProperty(
            id: const IdUid(3, 3631570635244989845),
            name: 'total',
            type: 8,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 6421008180648945376),
            name: 'discount',
            type: 8,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 1105011720804341842),
            name: 'userId',
            type: 11,
            flags: 520,
            indexId: const IdUid(4, 4192978615394839062),
            relationTarget: 'User')
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Shortcut for [Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [Store.new] for an explanation of all parameters.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// Returns the ObjectBox model definition for this project for use with
/// [Store.new].
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(3, 2131403676591069818),
      lastIndexId: const IdUid(4, 4192978615394839062),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [5770154820684612984],
      retiredIndexUids: const [],
      retiredPropertyUids: const [
        6322773303239321480,
        271976476707477580,
        8466796206178444980,
        32955081365536999
      ],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    User: EntityDefinition<User>(
        model: _entities[0],
        toOneRelations: (User object) => [],
        toManyRelations: (User object) => {
              RelInfo<UserOrder>.toOneBacklink(
                      5, object.id!, (UserOrder srcObject) => srcObject.user):
                  object.orders
            },
        getId: (User object) => object.id,
        setId: (User object, int id) {
          object.id = id;
        },
        objectToFB: (User object, fb.Builder fbb) {
          final uidOffset = fbb.writeString(object.uid);
          final nameOffset = fbb.writeString(object.name);
          final notesOffset = fbb.writeString(object.notes);
          fbb.startTable(5);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addOffset(1, uidOffset);
          fbb.addOffset(2, nameOffset);
          fbb.addOffset(3, notesOffset);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 4);
          final ordersParam = ToMany<UserOrder>();
          final uidParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final nameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final notesParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 10, '');
          final object = User(
              id: idParam,
              orders: ordersParam,
              uid: uidParam,
              name: nameParam,
              notes: notesParam);
          InternalToManyAccess.setRelInfo<User>(
              object.orders,
              store,
              RelInfo<UserOrder>.toOneBacklink(
                  5, object.id!, (UserOrder srcObject) => srcObject.user));
          return object;
        }),
    UserOrder: EntityDefinition<UserOrder>(
        model: _entities[1],
        toOneRelations: (UserOrder object) => [object.user],
        toManyRelations: (UserOrder object) => {},
        getId: (UserOrder object) => object.id,
        setId: (UserOrder object, int id) {
          object.id = id;
        },
        objectToFB: (UserOrder object, fb.Builder fbb) {
          final uidOffset = fbb.writeString(object.uid);
          fbb.startTable(6);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addOffset(1, uidOffset);
          fbb.addFloat64(2, object.total);
          fbb.addFloat64(3, object.discount);
          fbb.addInt64(4, object.user.targetId);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 4);
          final uidParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final totalParam =
              const fb.Float64Reader().vTableGet(buffer, rootOffset, 8, 0);
          final discountParam =
              const fb.Float64Reader().vTableGet(buffer, rootOffset, 10, 0);
          final object = UserOrder(
              id: idParam,
              uid: uidParam,
              total: totalParam,
              discount: discountParam);
          object.user.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0);
          object.user.attach(store);
          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [User] entity fields to define ObjectBox queries.
class User_ {
  /// see [User.id]
  static final id = QueryIntegerProperty<User>(_entities[0].properties[0]);

  /// see [User.uid]
  static final uid = QueryStringProperty<User>(_entities[0].properties[1]);

  /// see [User.name]
  static final name = QueryStringProperty<User>(_entities[0].properties[2]);

  /// see [User.notes]
  static final notes = QueryStringProperty<User>(_entities[0].properties[3]);
}

/// [UserOrder] entity fields to define ObjectBox queries.
class UserOrder_ {
  /// see [UserOrder.id]
  static final id = QueryIntegerProperty<UserOrder>(_entities[1].properties[0]);

  /// see [UserOrder.uid]
  static final uid = QueryStringProperty<UserOrder>(_entities[1].properties[1]);

  /// see [UserOrder.total]
  static final total =
      QueryDoubleProperty<UserOrder>(_entities[1].properties[2]);

  /// see [UserOrder.discount]
  static final discount =
      QueryDoubleProperty<UserOrder>(_entities[1].properties[3]);

  /// see [UserOrder.user]
  static final user =
      QueryRelationToOne<UserOrder, User>(_entities[1].properties[4]);
}
