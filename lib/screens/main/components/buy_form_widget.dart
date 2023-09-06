// ignore_for_file: avoid_print, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:wow_goldbuy_v3/api/buy_form_model.dart';
import 'package:wow_goldbuy_v3/constants.dart';
import 'package:wow_goldbuy_v3/screens/main/number_formatter.dart/number_formatter.dart';

class BuyFomWidget extends StatefulWidget {
  const BuyFomWidget({Key? key}) : super(key: key);

  @override
  State<BuyFomWidget> createState() => _BuyFomWidgetState();
}

class _BuyFomWidgetState extends State<BuyFomWidget> {
  _BuyFomWidgetState() {
    _selectedServer = srversEU[0];
    _selectedDeliveryMethod = auctionHouses[0];
  }

  final _formKey = GlobalKey<FormState>();
  final _goldAmoutController = TextEditingController(text: '500');
  String name = '';
  String email = '';
  String delivery = 'Trade';
  String server = '';
  String nickname = '';
  String amountGold = '500';
  String amountUSD = '';

  @override
  void initState() {
    super.initState();

    _goldAmoutController.addListener(_setStartValue);
  }

  @override
  void dispose() {
    _goldAmoutController.dispose();
    super.dispose();
  }

  _setStartValue() {
    setState(() {
      _currentvalue = 500;
      _currentvalue = double.parse(_goldAmoutController.text).roundToDouble();
    });
  }

  _setServers() {
    setState(() {
      if (region == 'EU') {
        selectedListOfServers = srversEU;
        _selectedServer = srversEU[0];
      } else if (region == 'US') {
        selectedListOfServers = serversUS;
        _selectedServer = serversUS[0];
      }
    });
  }

  double _currentvalue = 500.0;
  final _minValue = 500.0;
  final _maxValue = 100000.0;

  bool _swapRegion = false;
  bool _swapFaction = false;
  List<String> selectedListOfServers = [];
  String region = '';
  String faction = 'Horde';

  String _selectedServer = '';
  String _selectedDeliveryMethod = '';

  @override
  Widget build(BuildContext context) {
    var amountUSD = '${(_currentvalue / 500).toStringAsFixed(2)}\$';
    return MediaQuery.of(context).size.width >= 820
        ? Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text(
                      'FACTION',
                      style: GoogleFonts.ubuntu(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ToggleSwitch(
                      minWidth: 250,
                      minHeight: 30,
                      fontSize: 20,
                      activeBgColor: const [Colors.white12],
                      activeFgColor: Colors.white,
                      activeBorders: [
                        Border.all(
                          color: Colors.white,
                          width: 1,
                        )
                      ],
                      cornerRadius: 20,
                      radiusStyle: true,
                      inactiveBgColor: bgColor,
                      inactiveFgColor: Colors.grey[500],
                      totalSwitches: 2,
                      initialLabelIndex: _swapFaction ? 1 : 0,
                      labels: const ['Horde', 'Alliance'],
                      onToggle: ((index) => {
                            if (index == 0)
                              {faction = 'Horde', print(faction)}
                            else if (index == 1)
                              {faction = 'Alliance', print(faction)}
                            else
                              {faction = ''},
                            setState(
                              () => _swapFaction = !_swapFaction,
                            )
                          }),
                    ),
                  ],
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'REGION',
                                style: GoogleFonts.ubuntu(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              ToggleSwitch(
                                minWidth: 100,
                                minHeight: 30,
                                fontSize: 20,
                                activeBgColor: const [Colors.white12],
                                activeFgColor: Colors.white,
                                activeBorders: [
                                  Border.all(
                                    color: Colors.white,
                                    width: 1,
                                  )
                                ],
                                cornerRadius: 20,
                                radiusStyle: true,
                                inactiveBgColor: bgColor,
                                inactiveFgColor: Colors.grey[500],
                                totalSwitches: 2,
                                initialLabelIndex: _swapRegion ? 1 : 0,
                                labels: const ['EU', 'US'],
                                onToggle: ((index) => {
                                      if (index == 0)
                                        {region = 'EU', print(region)}
                                      else if (index == 1)
                                        {region = 'US', print(region)}
                                      else
                                        {region = ''},
                                      setState(() => {
                                            _setServers(),
                                            _swapRegion = !_swapRegion,
                                          })
                                    }),
                              ),
                            ],
                          ),
                          const SizedBox(height: defaultPadding),
                          SizedBox(
                            width: 300,
                            child: TextFormField(
                              validator: (value) {
                                if (value != null && value.length < 3) {
                                  return 'Enter min. 3 characters.';
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (value) => {name = value},
                              decoration: InputDecoration(
                                labelText: 'Name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: defaultPadding),
                          SizedBox(
                            width: 300,
                            child: TextFormField(
                              validator: (email) => email != null &&
                                      !EmailValidator.validate(email)
                                  ? 'Enter valid email'
                                  : null,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onChanged: (value) => {email = value},
                            ),
                          ),
                          const SizedBox(
                            height: defaultPadding,
                          ),
                          Container(
                            width: 300,
                            height: 55,
                            child: DropdownButtonFormField(
                              value: _selectedDeliveryMethod,
                              validator: (value) =>
                                  value == null ? 'field required' : null,
                              items: auctionHouses
                                  .map((e) => DropdownMenuItem(
                                      value: e, child: Text(e)))
                                  .toList(),
                              onChanged: ((value) => {
                                    setState(
                                      () => {
                                        _selectedDeliveryMethod =
                                            value as String,
                                        delivery = value,
                                      },
                                    ),
                                  }),
                              decoration: InputDecoration(
                                labelText: 'Choose delivery method',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              menuMaxHeight: 250.0,
                            ),
                          ),
                          const SizedBox(
                            height: defaultPadding,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                    Column(
                      children: [
                        Text(
                          'SERVER',
                          style: GoogleFonts.ubuntu(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: defaultPadding,
                        ),
                        Container(
                          width: 300,
                          height: 55,
                          child: DropdownButtonFormField(
                            value: _selectedServer,
                            validator: (value) =>
                                value == null ? 'field required' : null,
                            items: selectedListOfServers
                                .map((e) =>
                                    DropdownMenuItem(value: e, child: Text(e)))
                                .toList(),
                            onChanged: ((value) => {
                                  setState(
                                    () => {
                                      _selectedServer = value as String,
                                      server = value,
                                    },
                                  ),
                                }),
                            decoration: InputDecoration(
                              labelText: 'Choose server',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            menuMaxHeight: 250.0,
                            isExpanded: false,
                          ),
                        ),
                        const SizedBox(
                          height: defaultPadding,
                        ),
                        SizedBox(
                          width: 300.0,
                          child: TextFormField(
                            validator: (value) {
                              if (value != null && value.length < 3) {
                                return 'Enter min. 3 characters.';
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) => {nickname = value},
                            decoration: InputDecoration(
                                labelText: 'Nickname',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'AMOUNT',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.ubuntu(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      width: 105,
                      child: TextFormField(
                        controller: _goldAmoutController,
                        inputFormatters: [
                          LimitRangeTextInputFormatter(500, 100000),
                          LengthLimitingTextInputFormatter(6),
                        ],
                        decoration: InputDecoration(
                            labelText: 'gold',
                            hintText: 'min 500',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                            )),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      width: 280,
                      child: Slider(
                        value: _currentvalue,
                        min: _minValue,
                        max: _maxValue,
                        divisions: 10000,
                        label: _currentvalue.ceil().toString(),
                        onChanged: (value) {
                          setState(() {
                            _currentvalue = value.roundToDouble();
                            _goldAmoutController.text =
                                value.roundToDouble().toString();
                            amountGold = _goldAmoutController.text;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      amountUSD,
                      style: const TextStyle(fontSize: 17),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (faction.isNotEmpty &&
                            region.isNotEmpty &&
                            name.isNotEmpty &&
                            email.isNotEmpty &&
                            delivery.isNotEmpty &&
                            server.isNotEmpty &&
                            nickname.isNotEmpty &&
                            amountGold.isNotEmpty &&
                            amountUSD.isNotEmpty &&
                            _formKey.currentState!.validate()) {
                          BuyFormData buyFormData = BuyFormData(
                              faction: faction,
                              region: region,
                              name: name,
                              email: email,
                              delivery: delivery,
                              server: server,
                              nickname: nickname,
                              amountGold: amountGold,
                              amountUsd: amountUSD);

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );

                          print(buyFormData.toJson());
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Fill all required fields'),
                              backgroundColor:
                                  Color.fromARGB(255, 222, 163, 158),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding,
                            vertical: defaultPadding),
                        backgroundColor: primaryColor,
                        textStyle: const TextStyle(fontSize: 25),
                      ),
                      child: const Text(
                        'Pay',
                        style: TextStyle(color: bgColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        : Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'FACTION',
                        style: GoogleFonts.ubuntu(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ToggleSwitch(
                        minWidth: 120,
                        minHeight: 30,
                        fontSize: 20,
                        activeBgColor: const [Colors.white12],
                        activeFgColor: Colors.white,
                        activeBorders: [
                          Border.all(
                            color: Colors.white,
                            width: 1,
                          )
                        ],
                        cornerRadius: 20,
                        radiusStyle: true,
                        inactiveBgColor: bgColor,
                        inactiveFgColor: Colors.grey[500],
                        totalSwitches: 2,
                        initialLabelIndex: _swapFaction ? 1 : 0,
                        labels: const ['Horde', 'Alliance'],
                        onToggle: ((index) => {
                              if (index == 0)
                                {faction = 'Horde', print(faction)}
                              else if (index == 1)
                                {faction = 'Alliance', print(faction)}
                              else
                                {faction = ''},
                              setState(
                                () => _swapFaction = !_swapFaction,
                              )
                            }),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'REGION',
                      style: GoogleFonts.ubuntu(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ToggleSwitch(
                      minWidth: 100,
                      minHeight: 30,
                      fontSize: 20,
                      activeBgColor: const [Colors.white12],
                      activeFgColor: Colors.white,
                      activeBorders: [
                        Border.all(
                          color: Colors.white,
                          width: 1,
                        )
                      ],
                      cornerRadius: 20,
                      radiusStyle: true,
                      inactiveBgColor: bgColor,
                      inactiveFgColor: Colors.grey[500],
                      totalSwitches: 2,
                      initialLabelIndex: _swapRegion ? 1 : 0,
                      labels: const ['EU', 'US'],
                      onToggle: ((index) => {
                            if (index == 0)
                              {region = 'EU', print(region)}
                            else if (index == 1)
                              {region = 'US', print(region)}
                            else
                              {region = ''},
                            setState(() => {
                                  _setServers(),
                                  _swapRegion = !_swapRegion,
                                })
                          }),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  validator: (value) {
                    if (value != null && value.length < 3) {
                      return 'Enter min. 3 characters.';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) => {name = value},
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                          ? 'Enter valid email'
                          : null,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onChanged: (value) => {email = value},
                ),
                const SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField(
                  value: _selectedDeliveryMethod,
                  validator: (value) => value == null ? 'field required' : null,
                  items: auctionHouses
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: ((value) => {
                        setState(
                          () => {
                            _selectedDeliveryMethod = value as String,
                            delivery = value,
                          },
                        ),
                      }),
                  decoration: InputDecoration(
                    labelText: 'Choose delivery method',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  menuMaxHeight: 250.0,
                ),
                const SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField(
                  value: _selectedServer,
                  validator: (value) => value == null ? 'field required' : null,
                  items: selectedListOfServers
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: ((value) => {
                        setState(
                          () => {
                            _selectedServer = value as String,
                            server = value,
                          },
                        ),
                      }),
                  decoration: InputDecoration(
                    labelText: 'Choose server',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  menuMaxHeight: 250.0,
                  isExpanded: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    if (value != null && value.length < 3) {
                      return 'Enter min. 3 characters.';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) => {nickname = value},
                  decoration: InputDecoration(
                      labelText: 'Nickname',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'AMOUNT',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.ubuntu(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      width: 105,
                      child: TextFormField(
                        controller: _goldAmoutController,
                        inputFormatters: [
                          LimitRangeTextInputFormatter(500, 100000),
                          LengthLimitingTextInputFormatter(6),
                        ],
                        decoration: InputDecoration(
                            labelText: 'gold',
                            hintText: 'min 500',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                            )),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      amountUSD,
                      style: const TextStyle(fontSize: 17),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (faction.isNotEmpty &&
                            region.isNotEmpty &&
                            name.isNotEmpty &&
                            email.isNotEmpty &&
                            delivery.isNotEmpty &&
                            server.isNotEmpty &&
                            nickname.isNotEmpty &&
                            amountGold.isNotEmpty &&
                            amountUSD.isNotEmpty &&
                            _formKey.currentState!.validate()) {
                          BuyFormData buyFormData = BuyFormData(
                              faction: faction,
                              region: region,
                              name: name,
                              email: email,
                              delivery: delivery,
                              server: server,
                              nickname: nickname,
                              amountGold: amountGold,
                              amountUsd: amountUSD);

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );

                          print(buyFormData.toJson());
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Fill all required fields'),
                              backgroundColor:
                                  Color.fromARGB(255, 222, 163, 158),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding,
                            vertical: defaultPadding),
                        backgroundColor: primaryColor,
                        textStyle: const TextStyle(fontSize: 25),
                      ),
                      child: const Text(
                        'Pay',
                        style: TextStyle(color: bgColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
