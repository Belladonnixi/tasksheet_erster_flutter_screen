// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mockDatabaseRepositoryHash() =>
    r'e56de4cb600604ba643c1fe82cbd98eb6a031f95';

/// See also [mockDatabaseRepository].
@ProviderFor(mockDatabaseRepository)
final mockDatabaseRepositoryProvider =
    AutoDisposeFutureProvider<MockDatabaseRepository>.internal(
  mockDatabaseRepository,
  name: r'mockDatabaseRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$mockDatabaseRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MockDatabaseRepositoryRef
    = AutoDisposeFutureProviderRef<MockDatabaseRepository>;
String _$settingsItemsHash() => r'e20f4ac7da51b61bb2af36c923cc9e89215a3467';

/// See also [settingsItems].
@ProviderFor(settingsItems)
final settingsItemsProvider = AutoDisposeFutureProvider<
    Map<SettingsCategory, List<SettingsItem>>>.internal(
  settingsItems,
  name: r'settingsItemsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$settingsItemsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SettingsItemsRef
    = AutoDisposeFutureProviderRef<Map<SettingsCategory, List<SettingsItem>>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
