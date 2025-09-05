# DD1337 Week 2

## Reading recommendation

It's recommended that you read up to chapter 6 in the book [Learn You a Haskell](https://learnyouahaskell.github.io/).

## Install Haskell

1. Download and install [ghcup](https://www.haskell.org/ghcup/).
2. Follow the [installation instructions](https://www.haskell.org/ghcup/install), you only *need* ghc and cabal, the rest are optional.

## Assignment

### Kattis problems

This week, you're going to learn the basics by solving easier [Kattis](https://kth.kattis.com) problems. For each problem you solve, create a new file in your repo. Include a screenshot of your Kattis submission to prove solution. See [./minimal_scalar_product](./minimal_scalar_product/) for a Kattis solution example.

Solve at least one of the following problems:

- [Summera tal](https://kth.kattis.com/courses/DD2016/plusplus24/assignments/q4npcz/problems/kth.javap.sumsort)
- [Avstånd till kanten](https://kth.kattis.com/courses/DD2016/plusplus24/assignments/q4npcz/problems/kth.javap.kant)
- [Cyber-Clara och anmälningslistorna](https://kth.kattis.com/courses/DD2016/plusplus24/assignments/q4npcz/problems/kth.grupdat.anmalningslistorna)

*(optional fun)*:

- [Game Rank](https://open.kattis.com/problems/gamerank)
- [Quantum](https://open.kattis.com/problems/quantum)

*(optional challenge)*:

- All the problems are a bit lacking in the statistics for Haskell, see if you can take the top spot in any of them (time or length)!
- A example solution to the Kattis problem [Minimal Scalar Product](https://open.kattis.com/problems/minimumscalar) can be found in `./minimal_scalar_product`. This solution runs at 0.01s. See the [statistics](https://open.kattis.com/problems/minimumscalar/statistics) for the Haskell language. As you can see, it's possible to solve this problem in much less time. Write your own solution, which may be based on the example solution, and which runs quicker than 0.03s.

### Questions

Be prepared to answer the following questions during the next övning.

1. What's printed?

    ```haskell
    let numbers = [(a, b) | (a, b) <- flip zip [1,3..29] [0..]]
    print numbers
    ```

2. Why does the following code work in Haskell

    ```haskell
    sum :: Integral n, Num n => n -> n -> n
    sum s 0 = s
    sum s n = sum (s + n) (pred n)
    ```

    but not in JavaScript (and other languages)?

    ```javascript
    function sum(s, n) {
        if(n == 0){
            return s;
        } else{
            return sum(s + n, n - 1);
        }
    }
    ```
