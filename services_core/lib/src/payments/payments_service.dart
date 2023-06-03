import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../logger/i_logger.dart';

abstract class IPaymentsService {
  Future<void> setup(String apiKey);
  Future<List<Package>> getPackages();
  Future<bool> purchaseSubscription(Package package);
  Future<bool> isUserPremium();
  Future<bool> restorePurchase();
  Future<bool> hasFreeTrial();
}

class PaymentsService implements IPaymentsService {
  PaymentsService(this._logger);

  final ILogger? _logger;

  @override
  Future<void> setup(String apiKey) async {
    await Purchases.setLogLevel(kDebugMode ? LogLevel.debug : LogLevel.error);
    if (Platform.isAndroid) {
      await Purchases.configure(PurchasesConfiguration(apiKey));
    }
  }

  @override
  Future<List<Package>> getPackages() async {
    try {
      final offerings = await Purchases.getOfferings();

      return offerings.all.values
          .map((e) => e.availablePackages)
          .expand((i) => i)
          .toList();
    } catch (e, s) {
      _logger?.error('getPackages', error: e, stackTrace: s);
      return [];
    }
  }

  @override
  Future<bool> purchaseSubscription(Package package) async {
    try {
      final purchaserInfo = await Purchases.purchasePackage(package);
      if (purchaserInfo.entitlements.all["Premium"] != null) {
        return purchaserInfo.entitlements.all["Premium"]!.isActive;
      }
      return false;
    } catch (e, s) {
      _logger?.error('purchaseSubscription', error: e, stackTrace: s);
      return false;
    }
  }

  @override
  Future<bool> isUserPremium() async {
    try {
      final customerInfo = await Purchases.getCustomerInfo();
      if (customerInfo.entitlements.all["Premium"] != null) {
        return customerInfo.entitlements.all["Premium"]!.isActive;
      }
      return false;
    } catch (e, s) {
      _logger?.error('isUserPremium', error: e, stackTrace: s);
      return false;
    }
  }

  @override
  Future<bool> restorePurchase() async {
    try {
      final restoredInfo = await Purchases.restorePurchases();
      if (restoredInfo.entitlements.all["Premium"] != null) {
        return restoredInfo.entitlements.all["Premium"]!.isActive;
      }
      return false;
    } catch (e, s) {
      _logger?.error('restorePurchase', error: e, stackTrace: s);
      return false;
    }
  }

  @override
  Future<bool> hasFreeTrial() async {
    try {
      final restoredInfo = await Purchases.getCustomerInfo();
      if (restoredInfo.entitlements.all["Premium"] != null) {
        return !restoredInfo.entitlements.all["Premium"]!.isActive &&
            restoredInfo.allPurchasedProductIdentifiers.isEmpty;
      }
      return true;
    } catch (e, s) {
      _logger?.error('hasFreeTrial', error: e, stackTrace: s);
      return true;
    }
  }
}

class PaymentsServiceDesktop implements IPaymentsService {
  @override
  // ignore: no-empty-block
  Future<void> setup(String apiKey) async {}

  @override
  Future<List<Package>> getPackages() async => [];

  @override
  Future<bool> purchaseSubscription(Package package) async => true;

  @override
  Future<bool> isUserPremium() async => true;

  @override
  Future<bool> restorePurchase() async => true;

  @override
  Future<bool> hasFreeTrial() async => false;
}
