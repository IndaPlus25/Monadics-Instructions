# DD1337 Week 4-5

## Othello Project

With that quick introduction out of the way, we are going to dive deeper into Haskell and write a game-engine! The task for this and next week is to implement the logic for Othello (or reversi).

The implementation will be in the form of a library, that can be used by a GUI. Next task you will have to write GUIs for each other's games, so keep that in mind when you write your API.

### You must

* Use Haskell
* Implement the required features
* Write tests for each of your public functions that proves their functionality
* Document your code completely, *remember that someone else has to use it*
  * Write an additional documentation in a README.md if your API differs from the one detailed below, documenting each of your *public* functions and types.

## Othello

The complete rules for Othello can be found on [wikipedia](https://en.wikipedia.org/wiki/Reversi#Rules). You can represent the board however you want, but the task is written with bitboards in mind. This is common in chess as well and that's the resource you'll find most of. For example there's a [whole wiki](https://www.chessprogramming.org/Othello#Bitboards) covering mainly chess, but they also have some info on other games as well, Othello being one of them. Because the standard Othello game uses an 8x8 grid, we can very easily represent it with a 64 (8 * 8) bit type. In Haskell we have for example `Word64`. Where each bit represents a tile on the board. [Wikipedia also has a page](https://en.wikipedia.org/wiki/Bitboard) about it.

You then use multiple "boards" to keep track of which piece is which, in chess you'd use a few, but here we only need two. With those two "boards" you use bitwise operations to figure out your logic.
Here are some chess resources that should mostly apply to Othello as well:

* [Chess wiki](https://www.chessprogramming.org/Getting_Started)
  * [Board](https://www.chessprogramming.org/Board_Representation)
  * [Moves](https://www.chessprogramming.org/Move_Generation)
* [Array/vec](https://medium.com/@bellerb/building-a-chess-engine-part1-9758da877be7)
* [Bitboards](https://www.chessprogramming.org/Bitboards)

You **do not** need to use a bitboard, feel free to use maps or whatever you think would work for you (I used a HashMap when I wrote my chess engine :) ).

### Required features

* **Core datatype**, you can change them as you wish, the information just needs to exist somewhere:
  * **Game**, all info about the game keeping everything together
  * *Player*, which is either black or white
  * *Tile*, represents a tile on the board
  * *GameState*, tells you what the current state of the game is, for example "Finished" or "In Progress"
* **Initial board setup**, with the 4 central pieces placed
* **Full pseudo-legal moves**, move is ok if the tile is empty and it's next to an opposing color
* **State updates**, if a move is made you should also change the pieces it flipped (if any)
* **Turn indicator**, whose turn it is

### Optional features

* **Actual legal moves**, you also need to check that the move would flip opposing pieces
* **Pass**, if no legal moves can be made
* **Current score**, counting the colors for either player
* **Simple AI**, can be as simple as random placement

You may implement it however you want, but for your comrades sake it is recommended that you create a product type called `Game` with the following public functions:

| **Function**                                | **Description**                                                                                                                                             |
| ------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `new :: Game`                               | Initializes a new board with pieces.                                                                                                                        |
| `makeMove :: Game -> Tile -> Maybe Game`    | If the current game state is `InProgress` and the move is legal, move a piece then, return the resulting state of the game. If it's not then return Nothing |
| `getPossibleMoves ::: Game -> Maybe [Tile]` | Return all possible moves that the current turn person can make, Nothing if no moves are possible                                                           |

You should also export the sum type (enum) `GameState` that contains all valid gamestate values.

> Note: You are of course allowed to change any details of this interface, it might even be necessary to do so depending on your implementation.
>
> 2nd note: You can implement the Enum class for easier Tile -> Binary logic., or maybe you want it for indexing?

#### Expansion

A GUI application could also make use of types such as `Color` and `Piece`. You may also like to make changes to the above API depending on your board representation. If your library API do not reflect the documentation above, write your own complementary documentation in your repository's `README.md` file.

### Prepare assignment

1) Create a repository named `<KTH_ID>-othello` under the `IndaPlus25` organisation and clone it.
2) Navigate into your newly created repository and initialize a Haskell project with `cabal init` and you want to make it a library and executable, a few questions later if will ask if you want tests as well, which you do.

See the template for help with code setup.

### Testing

Since your code will be written as a library, we cannot simply test it by running it. Instead, test your application with unit tests.

The grading on this assignment is based on how well the tests demonstrates the full functionality and game mechanics of your chess engine. The tests are expected to not fail, and print a representation of the board in the case of move demonstrations. *Test at least all of your public functionality from the lists above to prove their functionality.*

Run your unit tests by entering the following command in your terminal:

```bash
cabal test
```

### Documentation

In addition to unit tests, all your public functions, constants, and types **must** have well written documentation comments.  

You can read more about it in the [haddock docs](https://haskell-haddock.readthedocs.io/latest/markup.html). After writing your comments, just run `cabal haddock --open` and it will open up your documentation in your browser.

> Note: I don't expect professional looking documentation, but at least show some effort to try to document your code
