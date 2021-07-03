import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payflow/modules/insert_boleto/insert_boleto_controller.dart';

import 'package:payflow/shared/themes/appcolors.dart';
import 'package:payflow/shared/themes/apptextstyles.dart';
import 'package:payflow/shared/widgets/input_text/input_text_widget.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons.dart';

class InsertBoletoPage extends StatefulWidget {
  final String? barcode;
  const InsertBoletoPage({
    Key? key,
    this.barcode,
  }) : super(key: key);

  @override
  _InsertBoletoPageState createState() => _InsertBoletoPageState();
}

class _InsertBoletoPageState extends State<InsertBoletoPage> {
  final controller = InsertBoletoController();

  @override
  void initState() {
    if (widget.barcode != null) {
      barcodeInputTextController.text = widget.barcode!;
    }
    super.initState();
  }

  final moneyInputTextController = MoneyMaskedTextController(
    leftSymbol: "R\$",
    decimalSeparator: ',',
  );

  final dueDateInputTextController = MaskedTextController(mask: "00/00/0000");

  final barcodeInputTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: BackButton(
          color: AppColors.input,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 93,
                ),
                child: Text(
                  'Preencha os dados do boleto',
                  style: TextStyles.titleBoldHeading,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    InputTextWidget(
                      label: 'Nome do boleto',
                      icon: Icons.description_outlined,
                      onChanged: (value) {
                        controller.change(
                          nome: value,
                        );
                      },
                      validator: controller.validateNome,
                    ),
                    InputTextWidget(
                      controller: dueDateInputTextController,
                      label: 'Vencimento',
                      icon: FontAwesomeIcons.timesCircle,
                      onChanged: (value) {
                        controller.change(
                          dueDate: value,
                        );
                      },
                      validator: controller.validateVencimento,
                    ),
                    InputTextWidget(
                      controller: moneyInputTextController,
                      validator: (_) => controller
                          .validateValor(moneyInputTextController.numberValue),
                      label: 'Valor',
                      icon: FontAwesomeIcons.wallet,
                      onChanged: (value) {
                        controller.change(
                          value: moneyInputTextController.numberValue,
                        );
                      },
                    ),
                    InputTextWidget(
                      controller: barcodeInputTextController,
                      validator: controller.validateCodigo,
                      label: 'Código',
                      icon: FontAwesomeIcons.barcode,
                      onChanged: (value) {
                        controller.change(
                          barcode: value,
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: SetLabelButtons(
        primaryLabel: 'Cancelar',
        primaryOnPressed: () {
          Navigator.of(context).pop();
        },
        secundaryLabel: "Cadastrar",
        secundaryOnPressed: () async {
          await controller.cadastrarBoleto();
          Navigator.of(context).pop();
        },
        enableSecundaryColor: true,
      ),
    );
  }
}
