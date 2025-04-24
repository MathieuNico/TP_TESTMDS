Feature: Gestion des utilisateurs administrateurs dans OrangeHRM

  Scenario: Connexion réussie
    Given Je suis sur la page de connexion d’OrangeHRM
    When Je saisis un identifiant valide "Admin" et un mot de passe valide "admin123"
    And Je clique sur le bouton de connexion
    Then Je devrais être redirigé vers le tableau de bord

  Scenario: Ajouter un nouvel utilisateur admin
    Given Je suis connecté en tant qu’administrateur
    And Je navigue vers le module PIM
    When Je clique sur "Add" pour ajouter un employé
    And Je remplis les champs avec "Tom", "Greg", "Poitier"
    And Je clique sur "Save"
    Then Le nouvel employé devrait apparaître dans la liste

  Scenario: Rechercher un utilisateur admin
    Given Je suis connecté et sur le module PIM
    When Je saisis le nom complet "Tom Greg Poitier" dans le champ de recherche
    And Je clique sur "Search"
    Then L'utilisateur correspondant devrait apparaître dans la liste

  Scenario: Modifier l’identifiant d’un admin
    Given Je suis connecté et l’utilisateur "Tom Greg Poitier" est affiché
    When Je clique sur l’icône d’édition
    And Je modifie l’identifiant de l’employé par "6667"
    And Je clique sur "Save"
    Then L'identifiant de l’employé doit être mis à jour

  Scenario: Supprimer un utilisateur admin
    Given Je suis connecté et l’utilisateur "Tom Greg Poitier" est affiché dans la liste
    When Je clique sur l’icône de suppression
    And Je confirme la suppression
    Then L’utilisateur ne devrait plus apparaître dans la liste
