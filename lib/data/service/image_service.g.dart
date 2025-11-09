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
          FutureOr<Uint8List?>
        >
    with $FutureModifier<Uint8List?>, $FutureProvider<Uint8List?> {
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
  $FutureProviderElement<Uint8List?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Uint8List?> create(Ref ref) {
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

String _$getUserProfileHash() => r'cfb2e83ca0010827fe002f08eb3f9bcf1a00f0f6';

final class GetUserProfileFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Uint8List?>, String> {
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
          FutureOr<Uint8List?>
        >
    with $FutureModifier<Uint8List?>, $FutureProvider<Uint8List?> {
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
  $FutureProviderElement<Uint8List?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Uint8List?> create(Ref ref) {
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
    r'0d3f9c098f91d88a90d15ddb23f06fb017805279';

final class GetUserProfileSmallFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Uint8List?>, String> {
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
