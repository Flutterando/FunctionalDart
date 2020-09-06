import 'package:dartz/dartz.dart';

import 'payment_method.dart';

/// A shopping cart that may have the user [ShoppingItem]s.
abstract class ShoppingCart {
  const ShoppingCart._();

  /// Matches for the possible carts and returns accordingly to the cart type.
  /// All parameters are required, so our match is exhaustive, and there's no
  /// chance for the user to forget to match any case.
  T fold<T>({
    required T Function() empty,
    required T Function(List<ShoppingItem> items) active,
    required T Function(List<ShoppingItem> items) paid,
  }) {
    final _this = this;
    if (this is _EmptyCart) {
      return empty();
    } else if (_this is ActiveCart) {
      return active(_this.items);
    } else {
      return paid((_this as PaidCart).items);
    }
  }
}

/// An empty [ShoppingCart].
///
/// As our domain requires, an empty cart has no data besides itself.
///
/// We are using the same technique employed in [_Cash] to force the API to only
/// provide the singleton [_EmptyCart] value.
class _EmptyCart extends ShoppingCart {
  const _EmptyCart() : super._();
}

/// The only value for a empty cart.
const EmptyCart = _EmptyCart();

/// An active [ShoppingCart].
///
/// As our domain requires, an active cart necessarily has [ShoppingItem]s.
class ActiveCart extends ShoppingCart {
  final List<ShoppingItem> items;

  const ActiveCart._(this.items) : super._();
}

/// Creates a new [ActiveCart].
///
/// An empty cart is an invalid [ActiveCart], so, if this is the case, [None] is
/// returned.
Option<ActiveCart> createActiveCart(List<ShoppingItem> items) =>
    items.isEmpty ? None() : Some(ActiveCart._((items)));

/// A paid [ShoppingCart].
///
/// Like our [ActiveCart], it has, necessarily, [ShoppingItem]s.
class PaidCart extends ShoppingCart {
  final List<ShoppingItem> items;

  const PaidCart._(this.items) : super._();
}

/// An stub shopping item.
class ShoppingItem {
  const ShoppingItem();
}

/// Try to add [item] to [cart].
///
/// If the [cart] is a [PaidCart], [None] is returned, as it's not a valid
/// [cart]. Else, a new [ShoppingCart] is returned with the added [item].
///
/// Note the use here of [fold] to exhaustively match all possible
/// [ShoppingCart] option.
Option<ActiveCart> addToCart(ShoppingCart cart, ShoppingItem item) => cart.fold(
      empty: () => Some(ActiveCart._([item])),
      active: (items) => Some(ActiveCart._([...items, item])),
      paid: (_) => const None<ActiveCart>(),
    );

/// Removes the item at [index] from a [cart].
///
/// If the card had only one item, an [EmptyCart] is returned. Note that we are
/// using the constant here, instead of the class [_EmptyCart]. Otherwise, an
/// [ActiveCart] is returned with the remaining items.
///
/// Note, also, that by definition we can't remove items from [_EmptyCart]s or
/// [PaidCart]s, as our domain requires.
Either<_EmptyCart, ActiveCart> removeFromCart(ActiveCart cart, int index) =>
    cart.items.length > 1
        ? Right(ActiveCart._(cart.items..removeAt(index)))
        : const Left(EmptyCart);

/// Pays the given [cart] with the given [paymentMethod].
///
/// Again, we can only pay a cart that is not empty nor already paid, so we use
/// [ActiveCart] and constrain our function to behave accordingly to our domain.
PaidCart payCart(ActiveCart cart, PaymentMethod paymentMethod) =>
    PaidCart._(cart.items);
