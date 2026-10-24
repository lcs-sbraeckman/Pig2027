#  Pig
 
You against two fellow opponent.  
## How to play
 
1. Player 1 is first to roll the die!
2. Either decide to Hold, banking the number of points shown on the die to your total and passing the turn to the next player, or; 
3. Roll again for a chance to add those points to the next roll! You can roll again as many times as you want!
4. **B****U****T**: Be careful when rolling again. rolling a 1 and/or two consecutive 6s will instantly end your turn, passing it to the next player and banking you NO points!
5. The turns, when passed, are given to Player 1, then 2, then 3, and cycle again.
6. The first player to 100 points wins!

 
## What I added
 
- I changed the player colours to a theme I personally liked better
- I added a third player from the original two. To do this, I;
  - Defined an *@State var* statement for *playerThreeScore*, allowing for a third score total.
  - Defined a *let *statement for *playerThreeColor*, giving the third player their own unique colour code. 
  - Copied the *VStack*s from player 1/2 for a player 3 display showing their name and game total, colour coded appropriately.
  - Editied the *hold* function to *else if* for player 2 and *else* for player 3, along with copying the code adding the turn total to the player total, letting player 3 be able to bank points.
  - Edited the *switchPlayer* function, once again adding *else if* for player 2 and *else* for player 3, changing the colour displayed, and changed the remainder calculation to *% 3 + 1*, letting the game switch to player 3 after player 2.
- I 

## Testing

| Test                        | Chosen input | Should happen |  Did happen  |
| --- | --- | --- | --- | --- |
|  Player 3 gets possesion of the die |  Die rolls 3 |  The die, roll and hold buttons should be colour coded indigo, player 3's assigned colour  | Game was colour coded indigo |
|Player 3 can bank turn total to the score total | Die rolls 3| After pressing the hold button, player 3's turn total should be added to the score total | Player 3 was able to bank points|
|  |  |  |  |  |
|  |  |  |  |  |
## Credits
- The starting game was written by Mr. Gordon.
