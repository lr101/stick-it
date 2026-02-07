// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_image_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(groupProfilePictureById)
final groupProfilePictureByIdProvider = GroupProfilePictureByIdFamily._();

final class GroupProfilePictureByIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<Uint8List>,
          Uint8List,
          FutureOr<Uint8List>
        >
    with $FutureModifier<Uint8List>, $FutureProvider<Uint8List> {
  GroupProfilePictureByIdProvider._({
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
    r'ea7d1bf4a2be882520454b0e6fe99184a1e4a2dd';

final class GroupProfilePictureByIdFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Uint8List>, String> {
  GroupProfilePictureByIdFamily._()
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
final groupProfilePictureSmallByIdProvider =
    GroupProfilePictureSmallByIdFamily._();

final class GroupProfilePictureSmallByIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<Uint8List>,
          Uint8List,
          FutureOr<Uint8List>
        >
    with $FutureModifier<Uint8List>, $FutureProvider<Uint8List> {
  GroupProfilePictureSmallByIdProvider._({
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
    r'b8729fe5ecd84a9731356ac2e6f39b397566e0f1';

final class GroupProfilePictureSmallByIdFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Uint8List>, String> {
  GroupProfilePictureSmallByIdFamily._()
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
final groupPinImageByIdProvider = GroupPinImageByIdFamily._();

final class GroupPinImageByIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<Uint8List>,
          Uint8List,
          FutureOr<Uint8List>
        >
    with $FutureModifier<Uint8List>, $FutureProvider<Uint8List> {
  GroupPinImageByIdProvider._({
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

String _$groupPinImageByIdHash() => r'1b8a79b4002e93062c5f1796fb478b5e75ffcf68';

final class GroupPinImageByIdFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Uint8List>, String> {
  GroupPinImageByIdFamily._()
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
