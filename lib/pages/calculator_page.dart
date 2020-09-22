import 'package:floor_calculator/controllers/calculator_controller.dart';
import 'package:floor_calculator/dialogs/result_dialog.dart';
import 'package:floor_calculator/helpers/validator_helper.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final _formKey = GlobalKey<FormState>();
  final _controller = CalculatorController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Floor Calculator'),
        actions: _clearAllTextButton(),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: _buildFormInputText(),
        ),
      ),
    );
  }

  List<Widget> _clearAllTextButton() {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.clear_all),
        onPressed: _formKey.currentState.reset,
      )
    ];
  }

  Form _buildFormInputText() {
    var buildHeaderText = _buildHeaderText('Room dimensions');
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildHeaderText,
          _buildVerticalSpace(),
          _buildNumberInputText(
            'Width (meters)',
            onSaved: _controller.setRoomWidth,
          ),
          _buildVerticalSpace(),
          _buildNumberInputText(
            'Lenght (meters)',
            onSaved: _controller.setRoomLenght,
          ),
          _buildVerticalSpace(),
          _buildHeaderText('Floor area'),
          _buildVerticalSpace(),
          _buildNumberInputText(
            'Width (centimeters)',
            onSaved: _controller.setFloorWidth,
          ),
          _buildVerticalSpace(),
          _buildNumberInputText(
            'Lenght (centimeters)',
            onSaved: _controller.setFloorLenght,
          ),
          _buildVerticalSpace(),
          _buildNumberInputText(
            'Price by meter',
            onSaved: _controller.setFloorPrice,
          ),
          _buildVerticalSpace(),
          _buildCalculateButton(),
        ],
      ),
    );
  }

  Widget _buildNumberInputText(String label, {Function(String) onSaved}) {
    return TextFormField(
      onSaved: onSaved,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
      validator: ValidatorHelper.isValidText,
    );
  }

  void _calculate() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      final result = _controller.calculate();
      showDialog(
        context: context,
        builder: (context) => ResultDialog(result),
      );
    }
  }

  Widget _buildVerticalSpace({double height = 20}) {
    return SizedBox(height: height);
  }

  Widget _buildCalculateButton() {
    return RaisedButton(
      child: Text('Calculate'),
      onPressed: _calculate,
    );
  }

  Widget _buildHeaderText(String label) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.25),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
