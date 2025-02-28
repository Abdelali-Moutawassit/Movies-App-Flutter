import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          "Mon Profil",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.indigo],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          _buildProfileHeader(),
          _buildTabBar(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildPersonalInfo(),
                _buildPreferences(),
                _buildSettings(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 250,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://static.vecteezy.com/ti/photos-gratuite/t2/22555530-3d-abstrait-rouge-et-noir-contexte-par-ai-genere-pouvez-etre-utilisation-comme-facebook-couverture-gratuit-photo.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 250,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black.withOpacity(0.6), Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  "https://www.w3schools.com/howto/img_avatar.png"),
            ),
            const SizedBox(height: 10),
            const Text(
              "John Doe",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const Text(
              "john.doe@example.com",
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    return Container(
      color: Colors.white,
      child: TabBar(
        controller: _tabController,
        labelColor: Colors.indigo,
        unselectedLabelColor: Colors.grey,
        indicatorColor: Colors.indigo,
        tabs: const [
          Tab(icon: Icon(Icons.info), text: "Infos"),
          Tab(icon: Icon(Icons.favorite), text: "Préférences"),
          Tab(icon: Icon(Icons.settings), text: "Paramètres"),
        ],
      ),
    );
  }

  Widget _buildPersonalInfo() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildInfoTile(Icons.person, "Nom", "John Doe"),
        _buildInfoTile(Icons.email, "Email", "john.doe@example.com"),
        _buildInfoTile(Icons.phone, "Téléphone", "+33 6 12 34 56 78"),
        _buildInfoTile(
            Icons.location_on, "Adresse", "123 Rue des Films, Paris, France"),
        _buildInfoTile(Icons.cake, "Date de Naissance", "12 Mars 1990"),
      ],
    );
  }

  Widget _buildPreferences() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildInfoTile(Icons.movie, "Genre Favori", "Science-fiction"),
        _buildInfoTile(Icons.star, "Film Préféré", "Interstellar"),
        _buildInfoTile(Icons.person, "Acteur Favori", "Leonardo DiCaprio"),
        _buildInfoTile(Icons.play_circle_fill, "Dernier Film Vu", "Dune 2"),
      ],
    );
  }

  Widget _buildSettings() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildSwitchTile("Recevoir des notifications", true),
        _buildSwitchTile("Mode sombre", false),
        _buildSwitchTile("Activer les sous-titres", true),
      ],
    );
  }

  Widget _buildInfoTile(IconData icon, String title, String value) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(icon, color: Colors.indigo, size: 28),
        title: Text(title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        subtitle: Text(value,
            style: const TextStyle(fontSize: 14, color: Colors.grey)),
      ),
    );
  }

  Widget _buildSwitchTile(String title, bool value) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: SwitchListTile(
        title: Text(title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        value: value,
        onChanged: (newValue) {},
        activeColor: Colors.indigo,
      ),
    );
  }
}
