import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  final bool isFavorite;
  final ValueChanged<bool> valueChanged;

  const FavoriteButton({
    Key? key,
    required this.isFavorite,
    required this.valueChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        valueChanged(!isFavorite);
      },
    );
  }
}

class FavoriteScreen extends StatefulWidget {
  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final List<String> _favorites = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite'),
      ),
      body: ListView(
        children: [
          for (String favorite in _favorites)
            ListTile(
              title: Text(favorite),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tambahkan item ke daftar favorite
          _favorites.add('Item baru');

          // Refresh tampilan
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
