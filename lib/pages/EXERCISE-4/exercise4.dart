import 'package:flutter/material.dart';
import 'package:w8_practice/pages/EXERCISE-4/model/jokes_model.dart';

Color appColor = Colors.green[300] as Color;

class Exercise4 extends StatefulWidget {
  List<JokesModel> jokesData;
  Exercise4({super.key, required this.jokesData});

  @override
  State<Exercise4> createState() => _Exercise4State();
}

class _Exercise4State extends State<Exercise4> {
  List<Widget> _getJokes() {
    return widget.jokesData
        .map(
          (joke) => FavoriteCard(
            joke: joke,
            onFavoriteSelected: () => setIsFavorite(joke),
          ),
        )
        .toList();
  }

  JokesModel? isSelectedFavorite;

  void setIsFavorite(JokesModel joke) {
    setState(() {
      // Reset All Jokes
      for (var j in widget.jokesData) {
        j.isFavorite = false;
      }

      // Set the selected joke
      joke.isFavorite = true;
      isSelectedFavorite = joke;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text("Favorite Dad Jokes"),
      ),
      body: ListView(
        children: [
          Column(children: [..._getJokes()]),
        ],
      ),
    );
  }
}

class FavoriteCard extends StatefulWidget {
  final JokesModel joke;
  final VoidCallback onFavoriteSelected;
  const FavoriteCard({
    super.key,
    required this.joke,
    required this.onFavoriteSelected,
  });

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  void onFavoriteClick() {
    setState(() {
      widget.joke.isFavorite = !widget.joke.isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: .5, color: Colors.grey)),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.joke.title,
                  style: TextStyle(
                    color: appColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(widget.joke.description),
              ],
            ),
          ),
          IconButton(
            onPressed: widget.onFavoriteSelected,
            icon: Icon(
              widget.joke.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: widget.joke.isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
