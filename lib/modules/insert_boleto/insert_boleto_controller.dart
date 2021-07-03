import 'package:flutter/cupertino.dart';
import 'package:payflow/shared/models/BoletoModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InsertBoletoController {
  BoletoModel model = BoletoModel();

  final formKey = GlobalKey<FormState>();
  String? validateNome(String? value) =>
      value?.isEmpty ?? true ? "O nome não pode ser vazio" : null;

  String? validateVencimento(String? value) =>
      value?.isEmpty ?? true ? "A data vencimento não pode ser vazia" : null;

  String? validateValor(double value) =>
      value == 0 ? "Insira um valor maior que R\$ 0,00" : null;

  String? validateCodigo(String? value) =>
      value?.isEmpty ?? true ? "O código do boleto não pode ser vazio" : null;

  void change({String? nome, String? dueDate, double? value, String? barcode}) {
    model = model.copyWith(
      name: nome,
      dueDate: dueDate,
      value: value,
      barcode: barcode,
    );
  }

  Future<void> saveBoleto() async {
    final instance = await SharedPreferences.getInstance();
    final boletos = instance.getStringList("boletos") ?? <String>[];
    boletos.add(model.toJson());
    await instance.setStringList("boletos", boletos);
    return;
  }

  Future<void> cadastrarBoleto() async {
    final form = formKey.currentState;
    if (form!.validate()) {
      return await saveBoleto();
    }
  }
}
