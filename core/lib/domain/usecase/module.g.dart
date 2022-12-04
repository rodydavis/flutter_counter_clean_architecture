// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String $getCounterHash() => r'e64bd7781cbae90e2875306502ba973483bb9e7f';

/// See also [getCounter].
final getCounterProvider = AutoDisposeProvider<GetCounterUseCase>(
  getCounter,
  name: r'getCounterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $getCounterHash,
);
typedef GetCounterRef = AutoDisposeProviderRef<GetCounterUseCase>;
String $setCounterHash() => r'09cc3d5b9bb708b843d00542059876db99d411d1';

/// See also [setCounter].
final setCounterProvider = AutoDisposeProvider<SetCounterUseCase>(
  setCounter,
  name: r'setCounterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $setCounterHash,
);
typedef SetCounterRef = AutoDisposeProviderRef<SetCounterUseCase>;
String $resetCounterHash() => r'7ad2e5fa58156b9af59c38303f869314084e9524';

/// See also [resetCounter].
final resetCounterProvider = AutoDisposeProvider<ResetCounterUseCase>(
  resetCounter,
  name: r'resetCounterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $resetCounterHash,
);
typedef ResetCounterRef = AutoDisposeProviderRef<ResetCounterUseCase>;
String $incrementCounterHash() => r'e4b89fd15b3c3501f28bfdef65da11be35426887';

/// See also [incrementCounter].
final incrementCounterProvider = AutoDisposeProvider<IncrementCounterUseCase>(
  incrementCounter,
  name: r'incrementCounterProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $incrementCounterHash,
);
typedef IncrementCounterRef = AutoDisposeProviderRef<IncrementCounterUseCase>;
String $decrementCounterHash() => r'6abc1dba684442fbfdf2ac5f5d6b0f86daf5a8c5';

/// See also [decrementCounter].
final decrementCounterProvider = AutoDisposeProvider<DecrementCounterUseCase>(
  decrementCounter,
  name: r'decrementCounterProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $decrementCounterHash,
);
typedef DecrementCounterRef = AutoDisposeProviderRef<DecrementCounterUseCase>;
