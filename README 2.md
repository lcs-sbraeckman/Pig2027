#  Pig
 You against three fellow opponents, a die, and the chance to test your luck!
## How to play
 
1. First, select a game length: a Short Game, where the winning score is 50 total points, a Normal Game where the winning score is 100 points, or a Long Game where the winning score is 200!
2. After selecting a length, Player 1 is first to roll the die!
3. The player can either decide to Hold, banking the turn total, which in this case would be the number shown on the die, or; 
4. Roll again for a chance to add the previous roll and new roll to the turn total! You can roll again as many times as you want!
5. **B********U********T**: Be careful when rolling again. Rolling a 1 and/or two consecutive 6s will instantly end your turn, passing it to the next player and banking you NO points!
6. The turns, when passed, are given to Player 1, then 2, then 3, and cycle again.
7. The first player to reach or bank over the winning score wins!
8. \*To play again, select New Game, and everything resets!

 
## What I added
 
- I changed the player colours to a theme I personally liked better
- I added a third player from the original two. To do this, I;
  - Defined an *@State var* statement for *playerThreeScore*, allowing for a third score total;
  - Defined a *let *statement for *playerThreeColor*, giving the third player their own unique colour code;
  - Copied the *VStack*s from player 1/2 for a player 3 display showing their name and game total, colour coded appropriately;
  - Edited the *hold* function to *else if* for player 2 and *else* for player 3, along with copying the code adding the turn total to the player total, letting player 3 be able to bank points;
  - Edited the *switchPlayer* function, once again adding *else if* for player 2 and *else* for player 3, changing the colour displayed, and changed the remainder calculation to *% 3 + 1*, letting the game switch to player 3 after player 2.
- I added a new rule: if you roll two 6s in a roll your turn instantly, ends, similar to rolling a 1. To do this, I;
  - Defined an *@State **var* statement for *lastRoll*, so that the previous roll has somewhere to go and be stored;  
  - Put the rule itself into writing in the *rollDie* function, so that previously rolling a 6 and rolling another 6 ends your turn with no points, by using "&&"
  - Added a line of code at the bottom of the *rollDie* function, so that at the end of a roll, that roll is then stored into the *lastRoll* variable
- I added three new buttons: Short Game (Where winningScore = 50), Normal Game (winningScore = 100) and Long Game (winningScore = 200). To do this I;
  - Made winningScore an @State variable instead of a let Statement and have the original value be 0;
  - Created three new buttons, with similar code to the "New Game" button, and gave each one their own unique SF Symbol;
  - Created an @State variable called winningScoreMessage to make it more clear to the player that they need to select a game length/which winningScore they have selected;
  - Disabled Roll/Hold buttons until after a winningScore is selected that is not 0, using "!"
  - Disabled the new game length buttons after a winningScore is selected when the winningScore no longer equates to 0

## How it Works

### One Design Choice
- I decided to add three different levels/game lengths to pig: a short game, where the winning score is 50, a normal game, with the typical 100 winning score, and a long game, where 200 points wins. I added this to give the player more options, and so that they can play pig whenever they want; if they are in a rush and can only play for a little while, or if they have time and want to relax with friends! With the added challenge of two 6s, it can make games longer, and may make players who like to roll over and over again want to select a lower winning score to improve their odds. With an added third player, odds of winning decrease, which is when a higher winning score may be wanted to keep the game going. 


## Testing
| Test                        | Chosen input | Should happen |  Did happen  |
| --- | --- | --- | --- |
|  Player 3 gets possesion of the die |  Die rolls 3 |  The die, roll and hold buttons should be colour coded teal, player 3's assigned colour  | Everything on the screen that should have been coloured the with playerThreeColour, teal, was: |
|Player 3 can bank turn total to the score total | Die rolls 3| After pressing the hold button, player 3's turn total should be added to the score total | Player 3 was able to bank points|
| Rolling two 6s ends your turn | Die rolls 6 | After rolling twice, the turn should be passed to the next player and banks no points | After two rolls of 6, the turn was passed | 
| Rolling neither a 1 nor two 6s ends your turn  | Die rolls 3 | The player can roll as many times as they want without losing points or the turn, and only ends when they press hold  | The player rolled as many time as they wanted without losing (The new two 6s rule did not break the game and works as it should) | 
| Rolling a 1 ends your turn | Die rolls 1 | The turn should end instantly, with no points banked, as soon as they roll| The turn ended instantly (The rolling a 1 rule still works)|
| Short game has a winning score of 50 (No less)| Die rolls 5| After player 1 banking 50 total points, the game ends and player 1 wins| The game ended and player 1 won|
| Short game has a winning score of 50| Die rolls 5 | After banking 45 total points, the game does not end | The game did not end and the turn was passed to the next player|
| Long game has a winning score of 200 (No less)| Die rolls 5 | After banking 195 total points, the game does not end and the turn is passed to the next player | The game did not end and the turn was passed to the next player |
| Long game has a winning score of 200 | Die rolls 5 | After player 1 banking 205 points, the game ends and Player 1 wins| The game ended and Player 1 won |
| Normal game has a winning score of 100 (No less)| Die rolls 5 | After Player 1 banking 95 points, the game does not end and the turn is passed to Player 2 | Player 1 banked 95 points to their total, and the turn was passed to Player 2 |
| Normal game has a winning score of 100 (Rolling over still ends the game) | Die rolls 5 | After Player 1 banks 105 points, the game still ends and Player 1 is displayed as the winner | The game ended and Player 1 won |
| Game length buttons are disabled after selecting one (No cheaters!) | N/A | After selecting "Short Game," the buttons should no longer be clickable| The buttons were disabled |
| By removing the old winningScore constant the game can still end with the new winningScore variable | Die rolls 5 | When selecting short game, the game should end when a player banks 50 points | The game ended and player 1, who banked 50 points, won |
| A player rolls a 6 after the previous player rolls a 6 | Die rolls 6 | The next player's turn would end after rolling just one 6 because there is not code that resets lastRoll for a new player | Player 1's turn ended after rolling twice (Two 6s), Player 2's ended after rolling once, then Player 3's turn ended after rolling once; the next step is to add code where lastRoll resets after a turn ends |
| Player 2 rolls a 6 after the previous player rolls a 6 | Die rolls 6 | The turn should not end and Player 2 can roll again because of the new code added to reset lastRoll | Player 2's turn did not end and was able to roll again |
| Player 2 rolls two 6s after the previous player rolled a 6 | Die rolls 6 | The turn should end and be passed to Player 3 | Player 2's turn ended and was passed to Player 3|
| Player 1 rolls a 6 in a new game after the previous game ended with the last roll being a 6 | Die rolls 6 | After pressing "New Game" when the previous player rolled 6, and rolling, the turn should not end and Player 1 can roll again | Player 1's turn did not end |
| Player 1 rolls two 6s in a row in a new game after the previous game ended with the last roll being a 6 | Die rolls 6 | After rolling two 6s in the new game, Player 1's turn should end and be passed to Player 2 | Player 1's turn ended and was passed to Player 2 |
## Credits
- The starting game was written by Mr. Gordon.
- The third player, colour scheme, two 6s rule and three different game lengths were written by Sam
- Collaborated with Charlotte on how to pass the turn to Player 3 with the remainder
- \*I used no AI or website for other help
