import 'package:flutter/material.dart';
import 'package:mnaaa/Models/Massage.dart';

class Massage extends StatefulWidget {
  const Massage({required this.massg, required this.id});
  final massage massg;
  final massage id;

  @override
  State<Massage> createState() => _MassageState();
}

class _MassageState extends State<Massage> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 7, left: 5),
        child: Container(
          margin: const EdgeInsets.only(left: 2, bottom: 1, top: 1, right: 0),
          padding:
              const EdgeInsets.only(left: 10, bottom: 10, top: 7, right: 10),
          decoration: BoxDecoration(
              color: Colors.grey.shade700,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: Column(
            children: [
              Text(
                widget.massg.Massage,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Massagefriend extends StatelessWidget {
  const Massagefriend({required this.massg, required this.id});
  final massage massg;
  final massage id;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 0.2, left: 5),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          left: 2, bottom: 1, top: 1, right: 5),
                      padding: const EdgeInsets.only(
                          left: 10, bottom: 10, top: 7, right: 10),
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Column(
                        children: [
                          Text(
                            massg.Massage,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "from: ${id.id}\n",
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 11,
              ),
            ),
            const SizedBox(
              height: 1,
            )
          ],
        ),
      ],
    );
  }
}
