// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getUserProfile)
const getUserProfileProvider = GetUserProfileFamily._();

final class GetUserProfileProvider
    extends
        $FunctionalProvider<
          AsyncValue<Uint8List?>,
          Uint8List?,
          Stream<Uint8List?>
        >
    with $FutureModifier<Uint8List?>, $StreamProvider<Uint8List?> {
  const GetUserProfileProvider._({
    required GetUserProfileFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'getUserProfileProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getUserProfileHash();

  @override
  String toString() {
    return r'getUserProfileProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<Uint8List?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Uint8List?> create(Ref ref) {
    final argument = this.argument as String;
    return getUserProfile(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetUserProfileProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getUserProfileHash() => r'f6397c3ab42c29e669d0b6b292b7932609fd6f69';

final class GetUserProfileFamily extends $Family
    with $FunctionalFamilyOverride<Stream<Uint8List?>, String> {
  const GetUserProfileFamily._()
    : super(
        retry: null,
        name: r'getUserProfileProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetUserProfileProvider call(String userId) =>
      GetUserProfileProvider._(argument: userId, from: this);

  @override
  String toString() => r'getUserProfileProvider';
}

@ProviderFor(getUserProfileSmall)
const getUserProfileSmallProvider = GetUserProfileSmallFamily._();

final class GetUserProfileSmallProvider
    extends
        $FunctionalProvider<
          AsyncValue<Uint8List?>,
          Uint8List?,
          Stream<Uint8List?>
        >
    with $FutureModifier<Uint8List?>, $StreamProvider<Uint8List?> {
  const GetUserProfileSmallProvider._({
    required GetUserProfileSmallFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'getUserProfileSmallProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getUserProfileSmallHash();

  @override
  String toString() {
    return r'getUserProfileSmallProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<Uint8List?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Uint8List?> create(Ref ref) {
    final argument = this.argument as String;
    return getUserProfileSmall(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetUserProfileSmallProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getUserProfileSmallHash() =>
    r'3021ddb650452e70423b0bf8c7923468724086ea';

final class GetUserProfileSmallFamily extends $Family
    with $FunctionalFamilyOverride<Stream<Uint8List?>, String> {
  const GetUserProfileSmallFamily._()
    : super(
        retry: null,
        name: r'getUserProfileSmallProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetUserProfileSmallProvider call(String userId) =>
      GetUserProfileSmallProvider._(argument: userId, from: this);

  @override
  String toString() => r'getUserProfileSmallProvider';
}

@ProviderFor(groupProfilePictureById)
const groupProfilePictureByIdProvider = GroupProfilePictureByIdFamily._();

final class GroupProfilePictureByIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<Uint8List?>,
          Uint8List?,
          Stream<Uint8List?>
        >
    with $FutureModifier<Uint8List?>, $StreamProvider<Uint8List?> {
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
  $StreamProviderElement<Uint8List?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Uint8List?> create(Ref ref) {
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
    r'd2d9fde436f4f976ebfb96e126ed4560033e39e5';

final class GroupProfilePictureByIdFamily extends $Family
    with $FunctionalFamilyOverride<Stream<Uint8List?>, String> {
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
          AsyncValue<Uint8List?>,
          Uint8List?,
          Stream<Uint8List?>
        >
    with $FutureModifier<Uint8List?>, $StreamProvider<Uint8List?> {
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
  $StreamProviderElement<Uint8List?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Uint8List?> create(Ref ref) {
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
    r'ebbd7314183e4864288e509571aa1f747e527397';

final class GroupProfilePictureSmallByIdFamily extends $Family
    with $FunctionalFamilyOverride<Stream<Uint8List?>, String> {
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
          AsyncValue<Uint8List?>,
          Uint8List?,
          Stream<Uint8List?>
        >
    with $FutureModifier<Uint8List?>, $StreamProvider<Uint8List?> {
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
  $StreamProviderElement<Uint8List?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Uint8List?> create(Ref ref) {
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

String _$groupPinImageByIdHash() => r'a9faa7a2615f9316ba18e9ec2eae6f845454624b';

final class GroupPinImageByIdFamily extends $Family
    with $FunctionalFamilyOverride<Stream<Uint8List?>, String> {
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

@ProviderFor(getPinImageInfo)
const getPinImageInfoProvider = GetPinImageInfoFamily._();

final class GetPinImageInfoProvider
    extends
        $FunctionalProvider<
          AsyncValue<PinImageInfo?>,
          PinImageInfo?,
          Stream<PinImageInfo?>
        >
    with $FutureModifier<PinImageInfo?>, $StreamProvider<PinImageInfo?> {
  const GetPinImageInfoProvider._({
    required GetPinImageInfoFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'getPinImageInfoProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getPinImageInfoHash();

  @override
  String toString() {
    return r'getPinImageInfoProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<PinImageInfo?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<PinImageInfo?> create(Ref ref) {
    final argument = this.argument as String;
    return getPinImageInfo(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetPinImageInfoProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getPinImageInfoHash() => r'a6833e7bfee57b19cdaa626f447cc415e6744883';

final class GetPinImageInfoFamily extends $Family
    with $FunctionalFamilyOverride<Stream<PinImageInfo?>, String> {
  const GetPinImageInfoFamily._()
    : super(
        retry: null,
        name: r'getPinImageInfoProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetPinImageInfoProvider call(String pinId) =>
      GetPinImageInfoProvider._(argument: pinId, from: this);

  @override
  String toString() => r'getPinImageInfoProvider';
}
