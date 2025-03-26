// Copyright (c) 2025, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// This file is generated, do not edit.
// File generated by pkgs/hook/tool/generate_syntax.dart.
// Must be rerun when pkgs/code_assets/doc/schema/ is modified.

// ignore_for_file: unused_element

import 'dart:io';

class AndroidCodeConfig {
  final Map<String, Object?> json;

  final List<Object> path;

  JsonReader get _reader => JsonReader(json, path);

  AndroidCodeConfig.fromJson(this.json, {this.path = const []});

  AndroidCodeConfig({required int targetNdkApi}) : json = {}, path = const [] {
    _targetNdkApi = targetNdkApi;
    json.sortOnKey();
  }

  int get targetNdkApi => _reader.get<int>('target_ndk_api');

  set _targetNdkApi(int value) {
    json.setOrRemove('target_ndk_api', value);
  }

  List<String> _validateTargetNdkApi() =>
      _reader.validate<int>('target_ndk_api');

  List<String> validate() => [..._validateTargetNdkApi()];

  @override
  String toString() => 'AndroidCodeConfig($json)';
}

class Architecture {
  final String name;

  const Architecture._(this.name);

  static const arm = Architecture._('arm');

  static const arm64 = Architecture._('arm64');

  static const ia32 = Architecture._('ia32');

  static const riscv32 = Architecture._('riscv32');

  static const riscv64 = Architecture._('riscv64');

  static const x64 = Architecture._('x64');

  static const List<Architecture> values = [
    arm,
    arm64,
    ia32,
    riscv32,
    riscv64,
    x64,
  ];

  static final Map<String, Architecture> _byName = {
    for (final value in values) value.name: value,
  };

  Architecture.unknown(this.name) : assert(!_byName.keys.contains(name));

  factory Architecture.fromJson(String name) {
    final knownValue = _byName[name];
    if (knownValue != null) {
      return knownValue;
    }
    return Architecture.unknown(name);
  }

  bool get isKnown => _byName[name] != null;

  @override
  String toString() => name;
}

class Asset {
  final Map<String, Object?> json;

  final List<Object> path;

  JsonReader get _reader => JsonReader(json, path);

  factory Asset.fromJson(
    Map<String, Object?> json, {
    List<Object> path = const [],
  }) {
    final result = Asset._fromJson(json, path: path);
    if (result.isNativeCodeAsset) {
      return result.asNativeCodeAsset;
    }
    return result;
  }

  Asset._fromJson(this.json, {this.path = const []});

  Asset({required String? type}) : json = {}, path = const [] {
    _type = type;
    json.sortOnKey();
  }

  String? get type => _reader.get<String?>('type');

  set _type(String? value) {
    json.setOrRemove('type', value);
  }

  List<String> _validateType() => _reader.validate<String?>('type');

  List<String> validate() => [..._validateType()];

  @override
  String toString() => 'Asset($json)';
}

class CCompilerConfig {
  final Map<String, Object?> json;

  final List<Object> path;

  JsonReader get _reader => JsonReader(json, path);

  CCompilerConfig.fromJson(this.json, {this.path = const []});

  CCompilerConfig({
    required Uri ar,
    required Uri cc,
    required Uri? envScript,
    required List<String>? envScriptArguments,
    required Uri ld,
    required Windows? windows,
  }) : json = {},
       path = const [] {
    _ar = ar;
    _cc = cc;
    _envScript = envScript;
    _envScriptArguments = envScriptArguments;
    _ld = ld;
    _windows = windows;
    json.sortOnKey();
  }

  Uri get ar => _reader.path$('ar');

  set _ar(Uri value) {
    json['ar'] = value.toFilePath();
  }

  List<String> _validateAr() => _reader.validatePath('ar');

  Uri get cc => _reader.path$('cc');

  set _cc(Uri value) {
    json['cc'] = value.toFilePath();
  }

  List<String> _validateCc() => _reader.validatePath('cc');

  Uri? get envScript => _reader.optionalPath('env_script');

  set _envScript(Uri? value) {
    json.setOrRemove('env_script', value?.toFilePath());
  }

  List<String> _validateEnvScript() =>
      _reader.validateOptionalPath('env_script');

  List<String>? get envScriptArguments =>
      _reader.optionalStringList('env_script_arguments');

  set _envScriptArguments(List<String>? value) {
    json.setOrRemove('env_script_arguments', value);
  }

  List<String> _validateEnvScriptArguments() =>
      _reader.validateOptionalStringList('env_script_arguments');

  Uri get ld => _reader.path$('ld');

  set _ld(Uri value) {
    json['ld'] = value.toFilePath();
  }

  List<String> _validateLd() => _reader.validatePath('ld');

  Windows? get windows {
    final jsonValue = _reader.optionalMap('windows');
    if (jsonValue == null) return null;
    return Windows.fromJson(jsonValue, path: [...path, 'windows']);
  }

  set _windows(Windows? value) {
    json.setOrRemove('windows', value?.json);
  }

  List<String> _validateWindows() {
    final mapErrors = _reader.validate<Map<String, Object?>?>('windows');
    if (mapErrors.isNotEmpty) {
      return mapErrors;
    }
    return windows?.validate() ?? [];
  }

  List<String> validate() => [
    ..._validateAr(),
    ..._validateCc(),
    ..._validateEnvScript(),
    ..._validateEnvScriptArguments(),
    ..._validateLd(),
    ..._validateWindows(),
  ];

  @override
  String toString() => 'CCompilerConfig($json)';
}

class CodeConfig {
  final Map<String, Object?> json;

  final List<Object> path;

  JsonReader get _reader => JsonReader(json, path);

  CodeConfig.fromJson(this.json, {this.path = const []});

  CodeConfig({
    required AndroidCodeConfig? android,
    required CCompilerConfig? cCompiler,
    required IOSCodeConfig? iOS,
    required LinkModePreference linkModePreference,
    required MacOSCodeConfig? macOS,
    required Architecture targetArchitecture,
    required OS targetOs,
  }) : json = {},
       path = const [] {
    _android = android;
    _cCompiler = cCompiler;
    _iOS = iOS;
    _linkModePreference = linkModePreference;
    _macOS = macOS;
    _targetArchitecture = targetArchitecture;
    _targetOs = targetOs;
    json.sortOnKey();
  }

  AndroidCodeConfig? get android {
    final jsonValue = _reader.optionalMap('android');
    if (jsonValue == null) return null;
    return AndroidCodeConfig.fromJson(jsonValue, path: [...path, 'android']);
  }

  set _android(AndroidCodeConfig? value) {
    json.setOrRemove('android', value?.json);
  }

  List<String> _validateAndroid() {
    final mapErrors = _reader.validate<Map<String, Object?>?>('android');
    if (mapErrors.isNotEmpty) {
      return mapErrors;
    }
    return android?.validate() ?? [];
  }

  CCompilerConfig? get cCompiler {
    final jsonValue = _reader.optionalMap('c_compiler');
    if (jsonValue == null) return null;
    return CCompilerConfig.fromJson(jsonValue, path: [...path, 'c_compiler']);
  }

  set _cCompiler(CCompilerConfig? value) {
    json.setOrRemove('c_compiler', value?.json);
  }

  List<String> _validateCCompiler() {
    final mapErrors = _reader.validate<Map<String, Object?>?>('c_compiler');
    if (mapErrors.isNotEmpty) {
      return mapErrors;
    }
    return cCompiler?.validate() ?? [];
  }

  IOSCodeConfig? get iOS {
    final jsonValue = _reader.optionalMap('ios');
    if (jsonValue == null) return null;
    return IOSCodeConfig.fromJson(jsonValue, path: [...path, 'ios']);
  }

  set _iOS(IOSCodeConfig? value) {
    json.setOrRemove('ios', value?.json);
  }

  List<String> _validateIOS() {
    final mapErrors = _reader.validate<Map<String, Object?>?>('ios');
    if (mapErrors.isNotEmpty) {
      return mapErrors;
    }
    return iOS?.validate() ?? [];
  }

  LinkModePreference get linkModePreference {
    final jsonValue = _reader.get<String>('link_mode_preference');
    return LinkModePreference.fromJson(jsonValue);
  }

  set _linkModePreference(LinkModePreference value) {
    json['link_mode_preference'] = value.name;
  }

  List<String> _validateLinkModePreference() =>
      _reader.validate<String>('link_mode_preference');

  MacOSCodeConfig? get macOS {
    final jsonValue = _reader.optionalMap('macos');
    if (jsonValue == null) return null;
    return MacOSCodeConfig.fromJson(jsonValue, path: [...path, 'macos']);
  }

  set _macOS(MacOSCodeConfig? value) {
    json.setOrRemove('macos', value?.json);
  }

  List<String> _validateMacOS() {
    final mapErrors = _reader.validate<Map<String, Object?>?>('macos');
    if (mapErrors.isNotEmpty) {
      return mapErrors;
    }
    return macOS?.validate() ?? [];
  }

  Architecture get targetArchitecture {
    final jsonValue = _reader.get<String>('target_architecture');
    return Architecture.fromJson(jsonValue);
  }

  set _targetArchitecture(Architecture value) {
    json['target_architecture'] = value.name;
  }

  List<String> _validateTargetArchitecture() =>
      _reader.validate<String>('target_architecture');

  OS get targetOs {
    final jsonValue = _reader.get<String>('target_os');
    return OS.fromJson(jsonValue);
  }

  set _targetOs(OS value) {
    json['target_os'] = value.name;
  }

  List<String> _validateTargetOs() => _reader.validate<String>('target_os');

  List<String> validate() => [
    ..._validateAndroid(),
    ..._validateCCompiler(),
    ..._validateIOS(),
    ..._validateLinkModePreference(),
    ..._validateMacOS(),
    ..._validateTargetArchitecture(),
    ..._validateTargetOs(),
    ..._validateExtraRules(),
  ];

  List<String> _validateExtraRules() {
    final result = <String>[];
    if (_reader.tryTraverse(['target_os']) == 'macos') {
      result.addAll(_reader.validate<Object>('macos'));
    }
    if (_reader.tryTraverse(['target_os']) == 'ios') {
      result.addAll(_reader.validate<Object>('ios'));
    }
    if (_reader.tryTraverse(['target_os']) == 'android') {
      result.addAll(_reader.validate<Object>('android'));
    }
    if (_reader.tryTraverse(['target_os']) == 'windows') {
      final objectErrors = _reader.validate<Map<String, Object?>?>(
        'c_compiler',
      );
      result.addAll(objectErrors);
      if (objectErrors.isEmpty) {
        final jsonValue = _reader.get<Map<String, Object?>?>('c_compiler');
        if (jsonValue != null) {
          final reader = JsonReader(jsonValue, [...path, 'c_compiler']);
          result.addAll(reader.validate<Object>('windows'));
        }
      }
    }
    return result;
  }

  @override
  String toString() => 'CodeConfig($json)';
}

class Config {
  final Map<String, Object?> json;

  final List<Object> path;

  JsonReader get _reader => JsonReader(json, path);

  Config.fromJson(this.json, {this.path = const []});

  Config({required CodeConfig? code, required ConfigExtensions? extensions})
    : json = {},
      path = const [] {
    this.code = code;
    this.extensions = extensions;
    json.sortOnKey();
  }

  CodeConfig? get code {
    final jsonValue = _reader.optionalMap('code');
    if (jsonValue == null) return null;
    return CodeConfig.fromJson(jsonValue, path: [...path, 'code']);
  }

  set code(CodeConfig? value) {
    json.setOrRemove('code', value?.json);
    json.sortOnKey();
  }

  List<String> _validateCode() {
    final mapErrors = _reader.validate<Map<String, Object?>?>('code');
    if (mapErrors.isNotEmpty) {
      return mapErrors;
    }
    return code?.validate() ?? [];
  }

  ConfigExtensions? get extensions {
    final jsonValue = _reader.optionalMap('extensions');
    if (jsonValue == null) return null;
    return ConfigExtensions.fromJson(jsonValue, path: [...path, 'extensions']);
  }

  set extensions(ConfigExtensions? value) {
    json.setOrRemove('extensions', value?.json);
    json.sortOnKey();
  }

  List<String> _validateExtensions() {
    final mapErrors = _reader.validate<Map<String, Object?>?>('extensions');
    if (mapErrors.isNotEmpty) {
      return mapErrors;
    }
    return extensions?.validate() ?? [];
  }

  List<String> validate() => [..._validateCode(), ..._validateExtensions()];

  @override
  String toString() => 'Config($json)';
}

class ConfigExtensions {
  final Map<String, Object?> json;

  final List<Object> path;

  JsonReader get _reader => JsonReader(json, path);

  ConfigExtensions.fromJson(this.json, {this.path = const []});

  ConfigExtensions({required CodeConfig? codeAssets})
    : json = {},
      path = const [] {
    this.codeAssets = codeAssets;
    json.sortOnKey();
  }

  CodeConfig? get codeAssets {
    final jsonValue = _reader.optionalMap('code_assets');
    if (jsonValue == null) return null;
    return CodeConfig.fromJson(jsonValue, path: [...path, 'code_assets']);
  }

  set codeAssets(CodeConfig? value) {
    json.setOrRemove('code_assets', value?.json);
    json.sortOnKey();
  }

  List<String> _validateCodeAssets() {
    final mapErrors = _reader.validate<Map<String, Object?>?>('code_assets');
    if (mapErrors.isNotEmpty) {
      return mapErrors;
    }
    return codeAssets?.validate() ?? [];
  }

  List<String> validate() => [..._validateCodeAssets()];

  @override
  String toString() => 'ConfigExtensions($json)';
}

class DeveloperCommandPrompt {
  final Map<String, Object?> json;

  final List<Object> path;

  JsonReader get _reader => JsonReader(json, path);

  DeveloperCommandPrompt.fromJson(this.json, {this.path = const []});

  DeveloperCommandPrompt({required List<String> arguments, required Uri script})
    : json = {},
      path = const [] {
    _arguments = arguments;
    _script = script;
    json.sortOnKey();
  }

  List<String> get arguments => _reader.stringList('arguments');

  set _arguments(List<String> value) {
    json['arguments'] = value;
  }

  List<String> _validateArguments() => _reader.validateStringList('arguments');

  Uri get script => _reader.path$('script');

  set _script(Uri value) {
    json['script'] = value.toFilePath();
  }

  List<String> _validateScript() => _reader.validatePath('script');

  List<String> validate() => [..._validateArguments(), ..._validateScript()];

  @override
  String toString() => 'DeveloperCommandPrompt($json)';
}

class DynamicLoadingBundleLinkMode extends LinkMode {
  DynamicLoadingBundleLinkMode.fromJson(super.json, {super.path})
    : super._fromJson();

  DynamicLoadingBundleLinkMode() : super(type: 'dynamic_loading_bundle');

  @override
  List<String> validate() => [...super.validate()];

  @override
  String toString() => 'DynamicLoadingBundleLinkMode($json)';
}

extension DynamicLoadingBundleLinkModeExtension on LinkMode {
  bool get isDynamicLoadingBundleLinkMode => type == 'dynamic_loading_bundle';

  DynamicLoadingBundleLinkMode get asDynamicLoadingBundleLinkMode =>
      DynamicLoadingBundleLinkMode.fromJson(json, path: path);
}

class DynamicLoadingExecutableLinkMode extends LinkMode {
  DynamicLoadingExecutableLinkMode.fromJson(super.json, {super.path})
    : super._fromJson();

  DynamicLoadingExecutableLinkMode()
    : super(type: 'dynamic_loading_executable');

  @override
  List<String> validate() => [...super.validate()];

  @override
  String toString() => 'DynamicLoadingExecutableLinkMode($json)';
}

extension DynamicLoadingExecutableLinkModeExtension on LinkMode {
  bool get isDynamicLoadingExecutableLinkMode =>
      type == 'dynamic_loading_executable';

  DynamicLoadingExecutableLinkMode get asDynamicLoadingExecutableLinkMode =>
      DynamicLoadingExecutableLinkMode.fromJson(json, path: path);
}

class DynamicLoadingProcessLinkMode extends LinkMode {
  DynamicLoadingProcessLinkMode.fromJson(super.json, {super.path})
    : super._fromJson();

  DynamicLoadingProcessLinkMode() : super(type: 'dynamic_loading_process');

  @override
  List<String> validate() => [...super.validate()];

  @override
  String toString() => 'DynamicLoadingProcessLinkMode($json)';
}

extension DynamicLoadingProcessLinkModeExtension on LinkMode {
  bool get isDynamicLoadingProcessLinkMode => type == 'dynamic_loading_process';

  DynamicLoadingProcessLinkMode get asDynamicLoadingProcessLinkMode =>
      DynamicLoadingProcessLinkMode.fromJson(json, path: path);
}

class DynamicLoadingSystemLinkMode extends LinkMode {
  DynamicLoadingSystemLinkMode.fromJson(super.json, {super.path})
    : super._fromJson();

  DynamicLoadingSystemLinkMode({required Uri uri})
    : super(type: 'dynamic_loading_system') {
    _uri = uri;
    json.sortOnKey();
  }

  /// Setup all fields for [DynamicLoadingSystemLinkMode] that are not in
  /// [LinkMode].
  void setup({required Uri uri}) {
    _uri = uri;
    json.sortOnKey();
  }

  Uri get uri => _reader.path$('uri');

  set _uri(Uri value) {
    json['uri'] = value.toFilePath();
  }

  List<String> _validateUri() => _reader.validatePath('uri');

  @override
  List<String> validate() => [...super.validate(), ..._validateUri()];

  @override
  String toString() => 'DynamicLoadingSystemLinkMode($json)';
}

extension DynamicLoadingSystemLinkModeExtension on LinkMode {
  bool get isDynamicLoadingSystemLinkMode => type == 'dynamic_loading_system';

  DynamicLoadingSystemLinkMode get asDynamicLoadingSystemLinkMode =>
      DynamicLoadingSystemLinkMode.fromJson(json, path: path);
}

class IOSCodeConfig {
  final Map<String, Object?> json;

  final List<Object> path;

  JsonReader get _reader => JsonReader(json, path);

  IOSCodeConfig.fromJson(this.json, {this.path = const []});

  IOSCodeConfig({required String targetSdk, required int targetVersion})
    : json = {},
      path = const [] {
    _targetSdk = targetSdk;
    _targetVersion = targetVersion;
    json.sortOnKey();
  }

  String get targetSdk => _reader.get<String>('target_sdk');

  set _targetSdk(String value) {
    json.setOrRemove('target_sdk', value);
  }

  List<String> _validateTargetSdk() => _reader.validate<String>('target_sdk');

  int get targetVersion => _reader.get<int>('target_version');

  set _targetVersion(int value) {
    json.setOrRemove('target_version', value);
  }

  List<String> _validateTargetVersion() =>
      _reader.validate<int>('target_version');

  List<String> validate() => [
    ..._validateTargetSdk(),
    ..._validateTargetVersion(),
  ];

  @override
  String toString() => 'IOSCodeConfig($json)';
}

class LinkMode {
  final Map<String, Object?> json;

  final List<Object> path;

  JsonReader get _reader => JsonReader(json, path);

  factory LinkMode.fromJson(
    Map<String, Object?> json, {
    List<Object> path = const [],
  }) {
    final result = LinkMode._fromJson(json, path: path);
    if (result.isDynamicLoadingBundleLinkMode) {
      return result.asDynamicLoadingBundleLinkMode;
    }
    if (result.isDynamicLoadingExecutableLinkMode) {
      return result.asDynamicLoadingExecutableLinkMode;
    }
    if (result.isDynamicLoadingProcessLinkMode) {
      return result.asDynamicLoadingProcessLinkMode;
    }
    if (result.isDynamicLoadingSystemLinkMode) {
      return result.asDynamicLoadingSystemLinkMode;
    }
    if (result.isStaticLinkMode) {
      return result.asStaticLinkMode;
    }
    return result;
  }

  LinkMode._fromJson(this.json, {this.path = const []});

  LinkMode({required String type}) : json = {}, path = const [] {
    _type = type;
    json.sortOnKey();
  }

  String get type => _reader.get<String>('type');

  set _type(String value) {
    json.setOrRemove('type', value);
  }

  List<String> _validateType() => _reader.validate<String>('type');

  List<String> validate() => [..._validateType()];

  @override
  String toString() => 'LinkMode($json)';
}

class LinkModePreference {
  final String name;

  const LinkModePreference._(this.name);

  static const dynamic = LinkModePreference._('dynamic');

  static const preferDynamicOld = LinkModePreference._('prefer-dynamic');

  static const preferStaticOld = LinkModePreference._('prefer-static');

  static const preferDynamic = LinkModePreference._('prefer_dynamic');

  static const preferStatic = LinkModePreference._('prefer_static');

  static const static = LinkModePreference._('static');

  static const List<LinkModePreference> values = [
    dynamic,
    preferDynamicOld,
    preferStaticOld,
    preferDynamic,
    preferStatic,
    static,
  ];

  static final Map<String, LinkModePreference> _byName = {
    for (final value in values) value.name: value,
  };

  LinkModePreference.unknown(this.name) : assert(!_byName.keys.contains(name));

  factory LinkModePreference.fromJson(String name) {
    final knownValue = _byName[name];
    if (knownValue != null) {
      return knownValue;
    }
    return LinkModePreference.unknown(name);
  }

  bool get isKnown => _byName[name] != null;

  @override
  String toString() => name;
}

class MacOSCodeConfig {
  final Map<String, Object?> json;

  final List<Object> path;

  JsonReader get _reader => JsonReader(json, path);

  MacOSCodeConfig.fromJson(this.json, {this.path = const []});

  MacOSCodeConfig({required int targetVersion}) : json = {}, path = const [] {
    _targetVersion = targetVersion;
    json.sortOnKey();
  }

  int get targetVersion => _reader.get<int>('target_version');

  set _targetVersion(int value) {
    json.setOrRemove('target_version', value);
  }

  List<String> _validateTargetVersion() =>
      _reader.validate<int>('target_version');

  List<String> validate() => [..._validateTargetVersion()];

  @override
  String toString() => 'MacOSCodeConfig($json)';
}

class NativeCodeAsset extends Asset {
  NativeCodeAsset.fromJson(super.json, {super.path}) : super._fromJson();

  NativeCodeAsset({
    required Architecture architecture,
    required Uri? file,
    required String id,
    required LinkMode linkMode,
    required OS os,
  }) : super(type: 'native_code') {
    _architecture = architecture;
    _file = file;
    _id = id;
    _linkMode = linkMode;
    _os = os;
    json.sortOnKey();
  }

  /// Setup all fields for [NativeCodeAsset] that are not in
  /// [Asset].
  void setup({
    required Architecture architecture,
    required Uri? file,
    required String id,
    required LinkMode linkMode,
    required OS os,
  }) {
    _architecture = architecture;
    _file = file;
    _id = id;
    _linkMode = linkMode;
    _os = os;
    json.sortOnKey();
  }

  Architecture get architecture {
    final jsonValue = _reader.get<String>('architecture');
    return Architecture.fromJson(jsonValue);
  }

  set _architecture(Architecture value) {
    json['architecture'] = value.name;
  }

  List<String> _validateArchitecture() =>
      _reader.validate<String>('architecture');

  Uri? get file => _reader.optionalPath('file');

  set _file(Uri? value) {
    json.setOrRemove('file', value?.toFilePath());
  }

  List<String> _validateFile() => _reader.validateOptionalPath('file');

  String get id => _reader.get<String>('id');

  set _id(String value) {
    json.setOrRemove('id', value);
  }

  List<String> _validateId() => _reader.validate<String>('id');

  LinkMode get linkMode {
    final jsonValue = _reader.map$('link_mode');
    return LinkMode.fromJson(jsonValue, path: [...path, 'link_mode']);
  }

  set _linkMode(LinkMode value) {
    json['link_mode'] = value.json;
  }

  List<String> _validateLinkMode() {
    final mapErrors = _reader.validate<Map<String, Object?>>('link_mode');
    if (mapErrors.isNotEmpty) {
      return mapErrors;
    }
    return linkMode.validate();
  }

  OS get os {
    final jsonValue = _reader.get<String>('os');
    return OS.fromJson(jsonValue);
  }

  set _os(OS value) {
    json['os'] = value.name;
  }

  List<String> _validateOs() => _reader.validate<String>('os');

  @override
  List<String> validate() => [
    ...super.validate(),
    ..._validateArchitecture(),
    ..._validateFile(),
    ..._validateId(),
    ..._validateLinkMode(),
    ..._validateOs(),
    ..._validateExtraRules(),
  ];

  List<String> _validateExtraRules() {
    final result = <String>[];
    if ([
      'dynamic_loading_bundle',
      'static',
    ].contains(_reader.tryTraverse(['link_mode', 'type']))) {
      result.addAll(_reader.validate<Object>('file'));
    }
    return result;
  }

  @override
  String toString() => 'NativeCodeAsset($json)';
}

extension NativeCodeAssetExtension on Asset {
  bool get isNativeCodeAsset => type == 'native_code';

  NativeCodeAsset get asNativeCodeAsset =>
      NativeCodeAsset.fromJson(json, path: path);
}

class OS {
  final String name;

  const OS._(this.name);

  static const android = OS._('android');

  static const iOS = OS._('ios');

  static const linux = OS._('linux');

  static const macOS = OS._('macos');

  static const windows = OS._('windows');

  static const List<OS> values = [android, iOS, linux, macOS, windows];

  static final Map<String, OS> _byName = {
    for (final value in values) value.name: value,
  };

  OS.unknown(this.name) : assert(!_byName.keys.contains(name));

  factory OS.fromJson(String name) {
    final knownValue = _byName[name];
    if (knownValue != null) {
      return knownValue;
    }
    return OS.unknown(name);
  }

  bool get isKnown => _byName[name] != null;

  @override
  String toString() => name;
}

class StaticLinkMode extends LinkMode {
  StaticLinkMode.fromJson(super.json, {super.path}) : super._fromJson();

  StaticLinkMode() : super(type: 'static');

  @override
  List<String> validate() => [...super.validate()];

  @override
  String toString() => 'StaticLinkMode($json)';
}

extension StaticLinkModeExtension on LinkMode {
  bool get isStaticLinkMode => type == 'static';

  StaticLinkMode get asStaticLinkMode =>
      StaticLinkMode.fromJson(json, path: path);
}

class Windows {
  final Map<String, Object?> json;

  final List<Object> path;

  JsonReader get _reader => JsonReader(json, path);

  Windows.fromJson(this.json, {this.path = const []});

  Windows({required DeveloperCommandPrompt? developerCommandPrompt})
    : json = {},
      path = const [] {
    _developerCommandPrompt = developerCommandPrompt;
    json.sortOnKey();
  }

  DeveloperCommandPrompt? get developerCommandPrompt {
    final jsonValue = _reader.optionalMap('developer_command_prompt');
    if (jsonValue == null) return null;
    return DeveloperCommandPrompt.fromJson(
      jsonValue,
      path: [...path, 'developer_command_prompt'],
    );
  }

  set _developerCommandPrompt(DeveloperCommandPrompt? value) {
    json.setOrRemove('developer_command_prompt', value?.json);
  }

  List<String> _validateDeveloperCommandPrompt() {
    final mapErrors = _reader.validate<Map<String, Object?>?>(
      'developer_command_prompt',
    );
    if (mapErrors.isNotEmpty) {
      return mapErrors;
    }
    return developerCommandPrompt?.validate() ?? [];
  }

  List<String> validate() => [..._validateDeveloperCommandPrompt()];

  @override
  String toString() => 'Windows($json)';
}

class JsonReader {
  /// The JSON Object this reader is reading.
  final Map<String, Object?> json;

  /// The path traversed by readers of the surrounding JSON.
  ///
  /// Contains [String] property keys and [int] indices.
  ///
  /// This is used to give more precise error messages.
  final List<Object> path;

  JsonReader(this.json, this.path);

  T get<T extends Object?>(String key) {
    final value = json[key];
    if (value is T) return value;
    throwFormatException(value, T, [key]);
  }

  List<String> validate<T extends Object?>(String key) {
    final value = json[key];
    if (value is T) return [];
    return [
      errorString(value, T, [key]),
    ];
  }

  List<T> list<T extends Object?>(String key) =>
      _castList<T>(get<List<Object?>>(key), key);

  List<String> validateList<T extends Object?>(String key) {
    final listErrors = validate<List<Object?>>(key);
    if (listErrors.isNotEmpty) {
      return listErrors;
    }
    return _validateListElements(get<List<Object?>>(key), key);
  }

  List<T>? optionalList<T extends Object?>(String key) =>
      switch (get<List<Object?>?>(key)?.cast<T>()) {
        null => null,
        final l => _castList<T>(l, key),
      };

  List<String> validateOptionalList<T extends Object?>(String key) {
    final listErrors = validate<List<Object?>?>(key);
    if (listErrors.isNotEmpty) {
      return listErrors;
    }
    final list = get<List<Object?>?>(key);
    if (list == null) {
      return [];
    }
    return _validateListElements(list, key);
  }

  /// [List.cast] but with [FormatException]s.
  List<T> _castList<T extends Object?>(List<Object?> list, String key) {
    for (final (index, value) in list.indexed) {
      if (value is! T) {
        throwFormatException(value, T, [key, index]);
      }
    }
    return list.cast();
  }

  List<String> _validateListElements<T extends Object?>(
    List<Object?> list,
    String key,
  ) {
    final result = <String>[];
    for (final (index, value) in list.indexed) {
      if (value is! T) {
        result.add(errorString(value, T, [key, index]));
      }
    }
    return result;
  }

  Map<String, T> map$<T extends Object?>(String key) =>
      _castMap<T>(get<Map<String, Object?>>(key), key);

  List<String> validateMap<T extends Object?>(String key) {
    final mapErrors = validate<Map<String, Object?>>(key);
    if (mapErrors.isNotEmpty) {
      return mapErrors;
    }
    return _validateMapElements<T>(get<Map<String, Object?>>(key), key);
  }

  Map<String, T>? optionalMap<T extends Object?>(String key) =>
      switch (get<Map<String, Object?>?>(key)) {
        null => null,
        final m => _castMap<T>(m, key),
      };

  List<String> validateOptionalMap<T extends Object?>(String key) {
    final mapErrors = validate<Map<String, Object?>?>(key);
    if (mapErrors.isNotEmpty) {
      return mapErrors;
    }
    final map = get<Map<String, Object?>?>(key);
    if (map == null) {
      return [];
    }
    return _validateMapElements<T>(map, key);
  }

  /// [Map.cast] but with [FormatException]s.
  Map<String, T> _castMap<T extends Object?>(
    Map<String, Object?> map_,
    String parentKey,
  ) {
    for (final MapEntry(:key, :value) in map_.entries) {
      if (value is! T) {
        throwFormatException(value, T, [parentKey, key]);
      }
    }
    return map_.cast();
  }

  List<String> _validateMapElements<T extends Object?>(
    Map<String, Object?> map_,
    String parentKey,
  ) {
    final result = <String>[];
    for (final MapEntry(:key, :value) in map_.entries) {
      if (value is! T) {
        result.add(errorString(value, T, [parentKey, key]));
      }
    }
    return result;
  }

  List<String>? optionalStringList(String key) => optionalList<String>(key);

  List<String> validateOptionalStringList(String key) =>
      validateOptionalList<String>(key);

  List<String> stringList(String key) => list<String>(key);

  List<String> validateStringList(String key) => validateList<String>(key);

  Uri path$(String key) => _fileSystemPathToUri(get<String>(key));

  List<String> validatePath(String key) => validate<String>(key);

  Uri? optionalPath(String key) {
    final value = get<String?>(key);
    if (value == null) return null;
    return _fileSystemPathToUri(value);
  }

  List<String> validateOptionalPath(String key) => validate<String?>(key);

  List<Uri>? optionalPathList(String key) {
    final strings = optionalStringList(key);
    if (strings == null) {
      return null;
    }
    return [for (final string in strings) _fileSystemPathToUri(string)];
  }

  List<String> validateOptionalPathList(String key) =>
      validateOptionalStringList(key);

  static Uri _fileSystemPathToUri(String path) {
    if (path.endsWith(Platform.pathSeparator)) {
      return Uri.directory(path);
    }
    return Uri.file(path);
  }

  String _jsonPathToString(List<Object> pathEnding) =>
      [...path, ...pathEnding].join('.');

  Never throwFormatException(
    Object? value,
    Type expectedType,
    List<Object> pathExtension,
  ) {
    throw FormatException(errorString(value, expectedType, pathExtension));
  }

  String errorString(
    Object? value,
    Type expectedType,
    List<Object> pathExtension,
  ) {
    final pathString = _jsonPathToString(pathExtension);
    if (value == null) {
      return "No value was provided for '$pathString'."
          ' Expected a $expectedType.';
    }
    return "Unexpected value '$value' (${value.runtimeType}) for '$pathString'."
        ' Expected a $expectedType.';
  }

  /// Traverses a JSON path, returns `null` if the path cannot be traversed.
  Object? tryTraverse(List<String> path) {
    Object? json = this.json;
    for (final key in path) {
      if (json is! Map<String, Object?>) {
        return null;
      }
      json = json[key];
    }
    return json;
  }
}

extension on Map<String, Object?> {
  void setOrRemove(String key, Object? value) {
    if (value == null) {
      remove(key);
    } else {
      this[key] = value;
    }
  }
}

extension on List<Uri> {
  List<String> toJson() => [for (final uri in this) uri.toFilePath()];
}

extension<K extends Comparable<K>, V extends Object?> on Map<K, V> {
  void sortOnKey() {
    final result = <K, V>{};
    final keysSorted = keys.toList()..sort();
    for (final key in keysSorted) {
      result[key] = this[key] as V;
    }
    clear();
    addAll(result);
  }
}
