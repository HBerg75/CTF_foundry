### README - Exploitation du contrat HackMeIfYouCan

1. **Contribuer au contrat** :  
   - Nous avons effectué une petite contribution pour initialiser notre solde et potentiellement devenir le propriétaire.

2. **Manipulation de la fonction `goTo`** :  
   - En utilisant le contrat `AttackGoto`, nous avons trompé le contrat en pensant que nous n'étions pas au dernier étage, ce qui nous a permis de manipuler `userFloor` et d'augmenter nos points.

3. **Exploitation de la fonction `receive`** :  
   - Nous avons envoyé de l'ether au contrat pour déclencher la fonction `receive` et gagner des points.

4. **Appel de la fonction `addPoint` via un contrat intermédiaire** :  
   - Nous avons utilisé le contrat `AttackAddPoint` pour appeler `addPoint` avec `tx.origin` différent de `msg.sender`, ajoutant ainsi des points.

5. **Exécution de la fonction `transfer`** :  
   - Nous avons réalisé un transfert pour tester la condition de solde supérieur à 1000000, bien que cette étape ne soit pas nécessaire pour les attaques de points.
