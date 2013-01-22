# INM5001 - Recettes

## Utilisation
Installez Ruby 1.9.3, une fois que c'est fait installer bundler `gem install bundler`.

Pour utiliser le code, faites `git clone https://github.com/alexcp/inm5001` dans le dossier que vous voulez.
Ensuite faites `cd` dans le nouveau dossier et installez les dépendance avec la commande `bundle install`.
Une fois fait, mettez votre base de données à jour avec `rake db:setup` et `rake db:migrate`.

Vous pouvez maintenant lancer le site avec la commande `rails s`.
