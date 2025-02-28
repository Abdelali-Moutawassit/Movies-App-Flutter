import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notifications",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        elevation: 4,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.indigo],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.done_all, color: Colors.white),
            onPressed: () {
              // Logique pour marquer toutes les notifications comme lues
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildNotificationItem(
            icon: Icons.movie_creation,
            title: "Nouveau Film Disponible",
            subtitle: "Découvrez 'Avatar 3' maintenant en streaming !",
            time: "Il y a 2 heures",
            color: Colors.blue,
          ),
          _buildNotificationItem(
            icon: Icons.trending_up,
            title: "Top Tendance 🔥",
            subtitle:
                "'Oppenheimer' est le film le plus regardé cette semaine !",
            time: "Il y a 4 heures",
            color: Colors.red,
          ),
          _buildNotificationItem(
            icon: Icons.star,
            title: "Note Exceptionnelle",
            subtitle: "'Interstellar' vient d'atteindre 9.5/10 !",
            time: "Aujourd'hui",
            color: Colors.amber,
          ),
          _buildNotificationItem(
            icon: Icons.local_offer,
            title: "Promotion Spéciale 🎉",
            subtitle: "Profitez de -50% sur les abonnements premium !",
            time: "Hier",
            color: Colors.green,
          ),
          _buildNotificationItem(
            icon: Icons.new_releases,
            title: "Sortie Exclusive",
            subtitle: "'Dune 2' en avant-première ce week-end !",
            time: "Hier",
            color: Colors.purple,
          ),
          _buildNotificationItem(
            icon: Icons.update,
            title: "Mise à jour de l'application",
            subtitle: "Découvrez les nouvelles fonctionnalités et corrections.",
            time: "Cette semaine",
            color: Colors.teal,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String time,
    required Color color,
  }) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: Colors.grey.shade700),
        ),
        trailing: Text(
          time,
          style: TextStyle(color: Colors.grey[600], fontSize: 12),
        ),
      ),
    );
  }
}
