// 4: Domain

// Let's make a simple domain with the following specs:

// We want a shopping application domain, where the user will be able
// to (1) add and remove items to the cart, (2) pay your shopping cart and
// (3) receive an e-mail confirming his shopping.

// Some details on our domain:
// 1. User: our user is defined by an name, e-mail, and birthday
//    The name cannot be longer than 700 characters.
//    Our user must have at least 18 years.

// 2. PaymentMethod: the user may pay with cash, cheque or credit card.

// 3. Shopping Cart: Our cart may be empty or not, or a paid cart.
//    An user, obviously, can't remove an item from an empty cart.
//    An user can't change a paid cart.
//    An user can't pay a paid cart.

// 4. Mailing: Our user have an e-mail that will be used to notify him about
//             his shopping status.
//    The user can only be notified if it has a verified e-mail.
//    To verify it's email, the user must click on the link sent to the e-mail
//    that has the verification token.
//
//    The e-mail is also used to reset the password, which can't be done
//    if the e-mail is not verified.
