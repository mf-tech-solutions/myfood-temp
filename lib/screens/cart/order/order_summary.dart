import 'package:MyFood/modules/cart/components/general/input_formatters.dart';
import 'package:flutter/material.dart';

import '../../../components/app_bar/app_bar.dart';
import '../../../modules/cart/components/order_summary_screen/items_section.dart';
import '../../../modules/cart/models/deliver_type.dart';
import '../../../modules/cart/models/order.dart';
import '../../../modules/cart/models/payment_mothod_type.dart';
import '../../../modules/cart/store/selectors.dart';
import '../../../modules/cart/utils.dart';

class OrderSummaryScreen extends StatelessWidget {
  final Order order;
  final _socialIdFormatter = CpfInputFormatter();

  OrderSummaryScreen({
    Key key,
    @required this.order,
  }) : super(key: key);

  Widget sectionContainer({Widget child, double horizontalPadding}) {
    return Container(
      child: child,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: horizontalPadding ?? 8,
      ),
    );
  }

  Widget buildDeliverSection() {
    final deliverType = order.deliverInfo.deliverType;
    final address = order.deliverInfo.address;

    if (deliverType == DeliverType.deliver) {
      String formatAddress() {
        final complement =
            address.complement != null ? ' ${address.complement}' : '';
        return '${address.street}, ${address.number}$complement - ${address.zipcode}';
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: Text('Entrega para:'),
          ),
          Text(formatAddress()),
        ],
      );
    }

    return Text('Retirada no local');
  }

  Widget buildPaymentMethodSection() {
    final paymentMethod = order.paymentMethod;
    final paymentType = paymentMethod.type;
    final paidWithCard = paymentType == PaymentMethodType.CARD;
    final card =
        paidWithCard ? getCardById(cardId: paymentMethod.cardId) : null;
    final message = paidWithCard
        ? 'Pago com cartão ${Utils.formatCardLastDigits(card.lastDigits)}'
        : 'Pago em dinheiro';

    return Text(message);
  }

  @override
  Widget build(BuildContext context) {
    if (order == null) {
      return Container();
    }

    final textTheme = Theme.of(context).textTheme;

    final itemsSection = sectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(4, 0, 0, 16),
            child: Text(
              'Itens',
              style: textTheme.headline6,
            ),
          ),
          OrderSummaryItemsSection(
            order: order,
          ),
        ],
      ),
    );

    final deliverSection = sectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Text(
              'Envio',
              style: textTheme.headline6,
            ),
          ),
          buildDeliverSection(),
        ],
      ),
      horizontalPadding: 12,
    );

    final paymentSection = sectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Text(
              'Pagamento',
              style: textTheme.headline6,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: buildPaymentMethodSection(),
          ),
          Text(
            order.socialIdInNote != null
                ? 'CPF na nota: ${_socialIdFormatter.maskText(order.socialIdInNote)}'
                : 'CPF não incluso',
          )
        ],
      ),
      horizontalPadding: 12,
    );

    return Scaffold(
      appBar: MyAppBar(
        title: Utils.formatOrderId(order.orderId),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 8),
        children: [
          itemsSection,
          deliverSection,
          paymentSection,
        ],
      ),
    );
  }
}
