-- Listez les prénoms et noms des joueurs et des agents
SELECT prenom, nom
FROM joueur 
UNION
SELECT prenom, nom 
FROM agent;  

-- Listez les prénoms et noms des joueurs qui ont été vendu pour un montant plus cher que leurs valeurs marchandes
SELECT prenom, nom
FROM joueur NATURAL JOIN transfert
WHERE montantTransfert > valeurMarchande;

-- Listez les noms des clubs qui ont acheté un joueur libre ainsi que le prénom et nom du joueur
SELECT DISTINCT club.nom, prenom, joueur.nom 
FROM club INNER JOIN transfert ON idClub = idClubAcheteur INNER JOIN joueur ON transfert.idJoueur = joueur.idJoueur
WHERE montantTransfert = 0;

-- Triez les noms des clubs en fonction du nombre de joueurs qu'ils ont acheté 
SELECT nom, COUNT(idClubAcheteur) as "nbJoueursAchetés"
FROM club INNER JOIN transfert ON idClub = idClubAcheteur
GROUP BY nom
ORDER BY COUNT(idClubAcheteur) DESC;


-- Triez le nom des agences en fonction du nombre de joueurs qu'ils représentent
SELECT nomAgence, COUNT(idJoueur) as "nbJoueursReprésentés"
FROM agent INNER JOIN joueur on agent.idAgent = joueur.idAgent
GROUP BY nomAgence
ORDER BY COUNT(idJoueur) DESC;
