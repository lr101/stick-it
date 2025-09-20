// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_image_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(groupProfilePictureById)
const groupProfilePictureByIdProvider = GroupProfilePictureByIdFamily._();

final class GroupProfilePictureByIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<Uint8List>,
          Uint8List,
          FutureOr<Uint8List>
        >
    with $FutureModifier<Uint8List>, $FutureProvider<Uint8List> {
  const GroupProfilePictureByIdProvider._({
    required GroupProfilePictureByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'groupProfilePictureByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$groupProfilePictureByIdHash();

  @override
  String toString() {
    return r'groupProfilePictureByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Uint8List> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Uint8List> create(Ref ref) {
    final argument = this.argument as String;
    return groupProfilePictureById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupProfilePictureByIdProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$groupProfilePictureByIdHash() =>
    r'8e14966bae9a0242c11ed2b9fdfbe46715e4bb7c';

final class GroupProfilePictureByIdFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Uint8List>, String> {
  const GroupProfilePictureByIdFamily._()
    : super(
        retry: null,
        name: r'groupProfilePictureByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GroupProfilePictureByIdProvider call(String groupId) =>
      GroupProfilePictureByIdProvider._(argument: groupId, from: this);

  @override
  String toString() => r'groupProfilePictureByIdProvider';
}

@ProviderFor(groupProfilePictureSmallById)
const groupProfilePictureSmallByIdProvider =
    GroupProfilePictureSmallByIdFamily._();

final class GroupProfilePictureSmallByIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<Uint8List>,
          Uint8List,
          FutureOr<Uint8List>
        >
    with $FutureModifier<Uint8List>, $FutureProvider<Uint8List> {
  const GroupProfilePictureSmallByIdProvider._({
    required GroupProfilePictureSmallByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'groupProfilePictureSmallByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$groupProfilePictureSmallByIdHash();

  @override
  String toString() {
    return r'groupProfilePictureSmallByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Uint8List> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Uint8List> create(Ref ref) {
    final argument = this.argument as String;
    return groupProfilePictureSmallById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupProfilePictureSmallByIdProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$groupProfilePictureSmallByIdHash() =>
    r'5fa7e69442528e19ce53f1b9a065515170ac60a8';

final class GroupProfilePictureSmallByIdFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Uint8List>, String> {
  const GroupProfilePictureSmallByIdFamily._()
    : super(
        retry: null,
        name: r'groupProfilePictureSmallByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GroupProfilePictureSmallByIdProvider call(String groupId) =>
      GroupProfilePictureSmallByIdProvider._(argument: groupId, from: this);

  @override
  String toString() => r'groupProfilePictureSmallByIdProvider';
}

@ProviderFor(groupPinImageById)
const groupPinImageByIdProvider = GroupPinImageByIdFamily._();

final class GroupPinImageByIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<Uint8List>,
          Uint8List,
          FutureOr<Uint8List>
        >
    with $FutureModifier<Uint8List>, $FutureProvider<Uint8List> {
  const GroupPinImageByIdProvider._({
    required GroupPinImageByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'groupPinImageByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$groupPinImageByIdHash();

  @override
  String toString() {
    return r'groupPinImageByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Uint8List> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Uint8List> create(Ref ref) {
    final argument = this.argument as String;
    return groupPinImageById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupPinImageByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$groupPinImageByIdHash() => r'5b6665b376f67cc070663da29093c66528e1a170';

final class GroupPinImageByIdFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Uint8List>, String> {
  const GroupPinImageByIdFamily._()
    : super(
        retry: null,
        name: r'groupPinImageByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GroupPinImageByIdProvider call(String groupId) =>
      GroupPinImageByIdProvider._(argument: groupId, from: this);

  @override
  String toString() => r'groupPinImageByIdProvider';
}
