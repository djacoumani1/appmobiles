WHACK-A-MOLE (CRUD)

Apres avoir cliqué le bouton highscores, on a une liste des scores qui s'affichent (s'il y en a).
le bouton add new highscore permet d'ajouter un nouveau highscore en allant sur une nouvelle page.
Pour remplir le formulaire, juste une validation pour les cases vides a été faite. Donc apres les avoir remplis, un popup affichera.
Pour la modification, il faut swiper la donnée de la droite vers la gauche.
Je n'ai pas crée de page ni de textcontroller pour en remettre donc je l'ai codée en dur directement dans le code: (await HighscoresDB.instance.update(Highscores(id:snapshot.data![index].id! ,date: "19-10-2022", name: "Souleymane", score: "99"));).
Pour la suppression, il faut swiper la donnée de la gauche vers la droite et la donnée disparait automatiquement.