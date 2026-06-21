import 'package:flutter_application_1/data/model/laptop.dart';
import 'package:flutter_application_1/utils/dummy_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LaptopsNotifier extends Notifier<List<Laptop>> {
  @override
  List<Laptop> build() => DummyData.laptops;

  void update(int laptopId, Laptop Function(Laptop) updateFn) {
    state = [
      for (final laptop in state)
        if (laptop.id == laptopId) updateFn(laptop) else laptop,
    ];
  }

  void toggleFavourite(int laptopId) {
    // state = [
    //   for (final laptop in state)
    //     if (laptop.id == laptopId)
    //       laptop.copyWith(isFavourite: !laptop.isFavourite)
    //     else
    //       laptop,
    // ];
    update(laptopId, (l) => l.copyWith(isFavourite: !l.isFavourite));
  }

  void addToCart(int laptopId) {
    update(laptopId, (l) => l.quantity == 0 ? l.copyWith(quantity: 1) : l);
  }

  void increaseQuantity(int laptopId) {
    update(laptopId, (l) => l.copyWith(quantity: l.quantity + 1));
  }

  void decreaseQuantity(int laptopId) {
    update(laptopId,
        (l) => l.copyWith(quantity: l.quantity > 0 ? l.quantity - 1 : 0));
  }

  void removeFromCart(int laptopId) {
    update(laptopId, (l) => l.copyWith(quantity: 0));
  }
}

final laptopsProvider =
    NotifierProvider<LaptopsNotifier, List<Laptop>>(LaptopsNotifier.new);

final bannersProvider = Provider<List<String>>((ref) {
  return DummyData.banners;
});

final favouriteLaptopsProvider = Provider<List<Laptop>>((ref) {
  return ref
      .watch(laptopsProvider)
      .where((laptop) => laptop.isFavourite)
      .toList();
});

final cartLaptopsProvider = Provider<List<Laptop>>((ref) {
  return ref
      .watch(laptopsProvider)
      .where((laptop) => laptop.quantity > 0)
      .toList();
});

final laptopByIdProvider =
    Provider.autoDispose.family<Laptop, int>((ref, laptopId) {
  return ref
      .watch(laptopsProvider)
      .firstWhere((laptop) => laptop.id == laptopId);
});

final totalPriceProvider = Provider<double>((ref) {
  final cartLaptops = ref.watch(cartLaptopsProvider);
  return cartLaptops.fold(
      0, (total, laptop) => total + (laptop.price * laptop.quantity));
});
