import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              "Nom de l'utilisateur",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            accountEmail: Text("user@email.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://www.w3schools.com/howto/img_avatar.png"),
            ),
            decoration: BoxDecoration(
              color: Colors.indigo,
              image: DecorationImage(
                image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxRvPgzF_r99rWMxOkhk0BsasPwtoxoyh_OeLnNVboCrZsnLTEak9BPcuuJZGwnwjtOIU&usqp=CAU"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          _buildDrawerItem(Icons.home, "Accueil", () {
            Navigator.pop(context);
          }),
          _buildDrawerItem(Icons.movie, "Films", () {}),
          _buildDrawerItem(Icons.favorite, "Favoris", () {}),
          _buildDrawerItem(Icons.settings, "Paramètres", () {}),
          Spacer(),
          Divider(),
          _buildDrawerItem(Icons.exit_to_app, "Déconnexion", () {}),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.indigo),
      title: Text(title, style: TextStyle(fontSize: 16)),
      onTap: onTap,
    );
  }
}
