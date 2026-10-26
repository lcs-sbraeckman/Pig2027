#  Pig
 
You against two fellow opponent.  
## How to play
 
1. Player 1 is first to roll the die!
2. Either decide to Hold, banking the number of points shown on the die to your total and passing the turn to the next player, or; 
3. Roll again for a chance to add those points to the next roll! You can roll again as many times as you want!
4. **B********U********T**: Be careful when rolling again. Rolling a 1 and/or two consecutive 6s will instantly end your turn, passing it to the next player and banking you NO points!
5. The turns, when passed, are given to Player 1, then 2, then 3, and cycle again.
6. The first player to 100 points wins!

 
## What I added
 
- I changed the player colours to a theme I personally liked better
- I added a third player from the original two. To do this, I;
  - Defined an *@State var* statement for *playerThreeScore*, allowing for a third score total;
  - Defined a *let *statement for *playerThreeColor*, giving the third player their own unique colour code;
  - Copied the *VStack*s from player 1/2 for a player 3 display showing their name and game total, colour coded appropriately;
  - Editied the *hold* function to *else if* for player 2 and *else* for player 3, along with copying the code adding the turn total to the player total, letting player 3 be able to bank points;
  - Edited the *switchPlayer* function, once again adding *else if* for player 2 and *else* for player 3, changing the colour displayed, and changed the remainder calculation to *% 3 + 1*, letting the game switch to player 3 after player 2.
- I added a new rule: if you roll two 6s in a roll your turn instantly, ends, similar to rolling a 1. To do this, I;
  - Defined an *@State **var* statement for *lastRoll*, so that the previous roll has somewhere to go and be stored;  
  - Put the rule itself into writing in the *rollDie* function, so that previously rolling a 6 and rolling another 6 ends your turn with no points, by using &&
  - Added a line of code at the bottom of the *rollDie* function, so that at the end of a roll, that roll is then stored into the *lastRoll* variable

### One Design Choice
- I decided to add three different levels/game lengths to pig: a short game, where the winning score is 50, a normal game, with the typical 100 winning score, and a long game, where 200 points wins. I added this to give the player more options, and so that they can play pig whenever they want; if they are in a rush and can only play for a little while, or if they have time and want to relax with friends! With the added challenge of two 6s, it can make games longer, and may make players who like to roll over and over again want to select a lower winning score to improve their odds. With an added third player, odds of winning decrease, which is when a higher winning score may be wanted to keep the game going. 


## Testing

| Test                        | Chosen input | Should happen |  Did happen  |
| --- | --- | --- | --- | --- |
|  Player 3 gets possesion of the die |  Die rolls 3 |  The die, roll and hold buttons should be colour coded indigo, player 3's assigned colour  | Game was colour coded indigo |
|Player 3 can bank turn total to the score total | Die rolls 3| After pressing the hold button, player 3's turn total should be added to the score total | Player 3 was able to bank points|
| Rolling two 6s ends your turn | Die rolls 6 | After rolling twice, the turn should be passed to the next player and banks no points | After two rolls of 6, the turn was passed | 
| Rolling neither a 1 nor two 6s ends your turn  | Die rolls 3 | The player can roll as many times as they want without losing points or the turn, and only ends when they press hold  | The player rolled as many time as they wanted without losing (The new two 6s rule did not break the game and works as it should) | 
| Rolling a 1 ends your turn | Die rolls 1 | The turn should end instantly, with no points banked, as soon as they roll| The turn ended instantly (The rolling a 1 rule still works)|
| Short game has a winning score of 50 (No more, no less)| Die rolls 5| After player 1 banking 50 total points, the game ends and player 1 wins| The game ended and player 1 won|
| Short game has a winning score of 50| Die rolls 5 | After banking 45 total points, the game does not end | The game did not end and the turn was passed to the next player|
| Long game has a winning score of 200 (No more, no less)| Die rolls 5 | After banking 195 total points, the game does not end and the turn is passed to the next player | The game did not end and the turn was passed to the next player |
| Long game has a winning score of 200 | Die rolls 5 | After player 1 banking 205 points, the game ends and player 1 wins| The game ended and player 1 won |
| Game length buttons are disabled after selecting one (No cheaters!) | |N| |
## Credits
- The starting game was written by Mr. Gordon.
- The third player, colour scheme, two 6s rule and three different game lengths were written by Sam
