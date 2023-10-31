import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class logger extends ProviderObserver {
  @override
  void didAddProvider(ProviderBase<Object?> provider, Object? value,
      ProviderContainer container) {
    // TODO: implement didAddProvider
    super.didAddProvider(provider, value, container);
    log('[didAddProvider] from : ${provider.from} value : ${value}');
    log('[didAddProvider] Name : ${provider.name} value : ${value}');
    log('[didAddProvider] dependencies : ${provider.dependencies} value : ${value}');
    log('[didAddProvider] toString : ${provider.toString()} value : ${value}');
  }

  @override
  void didDisposeProvider(
      ProviderBase<Object?> provider, ProviderContainer container) {
    // TODO: implement didDisposeProvider
    super.didDisposeProvider(provider, container);
    log('[didDisposeProvider] Name : ${provider.toString()}');
  }

  @override
  void didUpdateProvider(ProviderBase<Object?> provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    // TODO: implement didUpdateProvider
    super.didUpdateProvider(provider, previousValue, newValue, container);
    log('[didUpdateProvider] Name : ${provider.name} PreValue : ${previousValue} newValue : ${newValue.toString()} :: ${container.getAllProviderElementsInOrder()}');
  }
}
