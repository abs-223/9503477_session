import 'package:_9503477_exam/details_livre.dart';
import 'package:_9503477_exam/librairie.dart';
import 'package:_9503477_exam/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class ListeLivre extends StatefulWidget {
  const ListeLivre({super.key});

  @override
  State<ListeLivre> createState() => _ListelivreState();
}

class _ListelivreState extends State<ListeLivre> {
  // -- 1. Controleur pour le champ de recherche --
  final TextEditingController _searchController = TextEditingController();

  // -- 2. Liste source (toujours complète) --
  final List<Librairie> _librairie = [
    Librairie(
      "1984",
      "Auteur :George Orwell",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpOS6jl9wnZ7XUMtLJ64iamp4N5a2lNn0kzO-FGdEIlCa-yUb28NAGRrf7C5z8zrx-D65As2az8qrDarwCBZivJn1B_y7yVmyyYs8lt2S3&s=10",
      "Ceci est un livre écrit par George et voila très interessant",
    ),
    Librairie(
      "L'Étranger",
      "Auteur : Albert Camus",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGO6ira_bXSuf5OJODwYXpN8HR9yCjZVpWc1zgAwEVCgNieRZI50OmR3_81sk-ly43jh4P5DPMFoIuFa1YQ-9usUKgLKOFWCMkjPgkKd_T&s=10",
      "Livre ecrit par Albert Camus et très interressant",
    ),
    Librairie(
      "Dune",
      "Auteur :Frank Herbert",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6K5koQ5HeFu7UY_dLS0BggHypxn80wINZkW9olASr4mLYT12lo3uoXFfDBPfgD9qSg2RRDF7js4XeS2hC8t3I1YFzgc5uWowh9ZZtFxH0WQ&s=10",
      "Dune qui a été écrit par Frank",
    ),
    Librairie(
      "Petit Pays",
      "Auteur :Gaël Faye",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0xS4Kx7-19v6lwEWX_Ualy7afDQcYEfPo9Q48U6rVtuNyzA0VNNEK6Mz_kDegnZT8t3p2PlT7BERuYu6q9CtEW1zwnx35mirLcaxT1VMs&s=10",
      "Petit pays écrit par Gael",
    ),
    Librairie(
      "Le Chœur des femmes",
      "Auteur : Martin Winckler",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7Uvp8iCz2iqZQcGNRI7wXu-fGV8ngl4jPftMFzLWk582bs44LIHlhOKxnDvutsBwUUn93Pcz3WQ2o2HG11ZCOF-V1XmGHK22YZcu4_8Zptw&s=10",
      "Choeur des femmes écrit par Martin",
    ),
    Librairie(
      "L'Alchimiste",
      "Auteur : Paulo Coelho",
      "https://m.media-amazon.com/images/I/51sDdxuQVNL._AC_UF1000,1000_QL80_.jpg",
      "Paulo est pétard",
    ),
    Librairie(
      "Sapiens",
      "Auteur :Yuval Noah Harari",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjmJ1gQQp6UvRI1E67qLV924ArMsRFKxJeDJNs7p_3AnZqlqyiSei9ILmQ0Cpdda5h9s6ZW-zvM8hvW_XxolYYd0Z_ZAmJZK6i5ElsCwx-Zw&s=10",
      "Yuval en roue livre",
    ),
    Librairie(
      "Cent ans de solitude",
      "Auteur :G. García Márquez",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSS9sTyuZ6DWlukrGZTUIvfmdI7bI4zli_LupyQJnsSC9qIQveYtsl_dzERJwWKri7Ot0VfE7aCVh10wqmktP64Fl3-Oq5WVG_Th-amb4Lr2Q&s=10",
      "Bon Garcia a fait le beat",
    ),
    Librairie(
      "La Nuit des temps",
      "Auteur :René Barjavel",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUxFBGpBjNphZ25rpOLtp88X2oGQM4lPN-EXI2r2_RqNXwtd7hrwAzCUMyxLz11geg9i8ofbnIPDDTjpbE3M63tvDfFvdkPbRWv4BQbOokzg&s=10",
      "La nuit des temps wai ça doit être ça ouais",
    ),
    Librairie(
      "Changer l'eau des fleurs",
      "Auteur :Valérie Perrin",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStRt0MoPUEWPzW3Mq26jDqzPmvC6qfJOJJz07aJUoJTcD5dTtVJbKPA2VUt2botamggCsH5aysS7TZEfaLDqCmgIOIwa3jbYottXSkHCH8&s=10",
      "Valérie qui explose tout",
    ),
    Librairie(
      "Le Meilleur des mondes",
      "Auteur :Aldous Huxley",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxXvqgDn-EJoGFd1rQNYjATXFlMgZNnfmqKgJt2kVGY5pSJ0wu_aPnJQ7QKlo-XvKFoKudX-5su9jVqlJwNqT75a6oBSkr_H7RNsX3xMKB&s=10",
      "Un nom Malien ça non bref Visca Barca ",
    ),
  ];
  Set<int> _favoris = {};

  List<Librairie> _librairieFiltree = [];

  @override
  void initState() {
    super.initState();
    _librairieFiltree = List.from(_librairie);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // Méthode de filtrage (par titre ET par auteur)
  void _filterLivres(String query) {
    final String recherche = query.toLowerCase().trim();

    setState(() {
      if (recherche.isEmpty) {
        _librairieFiltree = List.from(_librairie);
      } else {
        _librairieFiltree = _librairie.where((livre) {
          final bool titreCorrespond = livre.nom.toLowerCase().contains(
            recherche,
          );
          final bool auteurCorrespond = livre.author.toLowerCase().contains(
            recherche,
          );
          return titreCorrespond || auteurCorrespond;
        }).toList();
      }
    });
  }

  Future<void> setConnected(bool connexionState) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setBool('isConnected', connexionState);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Bienvenue"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute<void>(builder: (context) => Login()),
                );
              },
            ),
          ],
        ),

        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: _searchController,
                onChanged: _filterLivres,
                decoration: InputDecoration(
                  hintText: 'Rechercher un livre ou un auteur...',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _searchController.clear();
                            _filterLivres('');
                          },
                        )
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 16,
                  ),
                ),
              ),
            ),

            if (_librairieFiltree.isEmpty)
              const Expanded(
                child: Center(
                  child: Text(
                    'Aucun livre trouvé.',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: _librairieFiltree.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) =>
                                DetailsLivre(livre: _librairieFiltree[index]),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 5,
                        child: ListTile(
                          leading: Image.network(
                            _librairieFiltree[index].photolivre,
                          ),
                          title: Text(_librairieFiltree[index].nom),


                          // Pour ajouter un livre au favoris en chap !!!!!!!!!!!!!
                          trailing: InkWell(
                            onTap: () {
                              setState(() {
                                if (_favoris.contains(index)) {
                                  _favoris.remove(index);
                                } else {
                                  _favoris.add(index);
                                }
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    _favoris.contains(index)
                                        ? 'Ajouter aux favoris avec succès'
                                        : 'Retirer des favoris',
                                  ),
                                ),
                              );
                            },
                            child: Icon(
                              _favoris.contains(index)
                                  ? Icons.star
                                  : Icons.star_border_outlined,
                              color: _favoris.contains(index)
                                  ? Colors.amber
                                  : Colors.grey,
                            ),
                          ),

                          subtitle: Text(_librairieFiltree[index].author),
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
