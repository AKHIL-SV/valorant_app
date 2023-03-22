import 'package:flutter/material.dart';
import 'package:valorant_app/model/valo_model.dart';
import 'package:valorant_app/services/api_fetch.dart';
import 'package:valorant_app/view/agent_card.dart';
import 'package:valorant_app/view/utls/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Valorant? valo;
  var _isloading = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    valo = await RemoteServices().getValoData();
    if (valo != null) {
      setState(() {
        _isloading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff111923),
        body: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 110,
                alignment: Alignment.center,
                child: Image.network(logoUrl),
              ),
              const SizedBox(
                height: 6,
              ),
              const Text(
                'Choose Your',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.1),
              ),
              const SizedBox(
                height: 6,
              ),
              RichText(
                text: const TextSpan(
                  text: 'Favourite ',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.1),
                  children: [
                    TextSpan(
                      text: 'Agents',
                      style: TextStyle(
                        color: valoRed,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const TabBar(
                indicatorPadding: EdgeInsets.symmetric(horizontal: 25),
                indicatorColor: valoRed,
                labelColor: valoRed,
                overlayColor: MaterialStatePropertyAll(Colors.transparent),
                unselectedLabelColor: Colors.grey,
                labelPadding: EdgeInsetsDirectional.only(bottom: 10),
                tabs: [
                  Text('Agents', textScaleFactor: 1.1),
                  Text('Maps', textScaleFactor: 1.1),
                  Text('Arsenal', textScaleFactor: 1.1),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    AgentCards(valos: valo?.data, isloading: _isloading),
                    const Center(child: Text('Maps')),
                    const Center(child: Text('Arsenal')),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
