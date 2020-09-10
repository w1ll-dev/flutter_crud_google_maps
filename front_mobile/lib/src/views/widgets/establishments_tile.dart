import 'package:flutter/material.dart';
import '../../models/establishment_model.dart';

class EstablishmentsTile extends StatelessWidget {
  final Establishment establishment;

  EstablishmentsTile({
    @required this.establishment,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.map),
      title: Text("${establishment.name}"),
      subtitle: Text("lat: ${establishment.lat} | lng: ${establishment.lng}"),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.edit,
                color: Colors.yellow,
              ),
              onPressed: () => {},
            ),
            IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                // onPressed: () => showDialog(
                //   context: context,
                //   builder: (context) => AlertDelete(
                //     user: user,
                //     usersController: usersController,
                //   ),
                // ),
                onPressed: () => {})
          ],
        ),
      ),
    );
  }
}
