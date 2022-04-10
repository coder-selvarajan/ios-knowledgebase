# Swift Coding Challenges

## Find character occurance in a string - Use of 'for loop' VS 'reduce' VS 'NSCountedSet'

```swift
//for loop solution
func challenge5a(input: String, count: Character) -> Int {
    var letterCount = 0

    for letter in input {
        if letter == count {
            letterCount += 1
        }
    }

    return letterCount
}

// Easy and high performance solution
```

### By using 'reduce' function on the string

```swift
// 'reduce' Syntax
func reduce<Result>(_ initialResult: Result,
										_ nextPartialResult: (Result, Character) throws -> Result) rethrows -> Result

// solution
func challenge5b(input: String, count: Character) -> Int {
    return input.reduce(0) {
			$1 == count ? $0 + 1 : $0
    }
}

// Verdict
// “Functional programming does make for shorter code, and the intent here is nice and clear,
// however this is not quite as performant – it’s likely to run about 10% slower than the first solution depending on your configuration.

```

### By using 'NSCountedSet'

```swift
// 'map' syntax
func map<T>(_ transform: (Character) throws -> T) rethrows -> [T]

// solution
func challenge5c(input: String, count: String) -> Int {
    let array = input.map { String($0) }
    let counted = NSCountedSet(array: array)

    return counted.count(for: count)
}

// Verdict
// This is wasteful, for sure, and inefficient too – a massive ten times slower than the original.
```

## Does one string contain another?

Write your own version of the contains() method on String that ignores letter case, and without using the existing contains() method.

```swift
//solution
extension String {
    func fuzzyContains(_ string: String) -> Bool {
        return self.uppercased().range(of: string.uppercased()) != nil
    }
}

//solution2
extension String {
    func fuzzyContains(_ string: String) -> Bool {
        return range(of: string, options: .caseInsensitive) != nil
    }
}
```

## Remove duplicate characters in a string

```swift
//solution 1 - NSOrderedSet
import Foundation
func removeDuplicates(input: String) -> String {
    var array = input.map { String($0) }
    var set = NSOrderedSet(array: array)
    var letters = Array(set) as! Array<String>
    return (letters.joined())
}

//solution 2 - for loop
func removeDuplicates(input: String) -> String {
    var used = [Character]()
    for letter in input {
        if !used.contains(letter) {
            used.append(letter)
        }
    }
    return String(used)
}

//solution 3 - using dictionary & filter method
func challenge6c(string: String) -> String {
    var used = [Character: Bool]()

    let result = string.filter {
        used.updateValue(true, forKey: $0) == nil
    }

    return String(result)
}
```

## Write a function that returns a string with any consecutive spaces replaced with a single space.

Note: The spaces in the front and back also to be converted as single space.

```swift
// if the requirement is not to retain the front & back space then the solution could be
func challenge7(input: String) -> String {
    let components = input.components(separatedBy: .whitespacesAndNewlines)
    return components.filter { !$0.isEmpty }.joined(separator: " ")
}

// solution 2 - is by using the for loop. This is the ideal solution

// however we can solve it by a single lile of code by using reg-ex syntax
func challenge7b(input: String) -> String {
    return input.replacingOccurrences(of: " +", with: " ", options: .regularExpression, range: nil)
}
// Running regular expressions isn’t cheap, so this code runs about 50% the speed of the manual solution-2
```

## String is rotated?

Write a function that accepts two strings, and returns true if one string is rotation of the other, taking letter case into account.

```swift
func challenge8(input: String, rotated: String) -> Bool {
    guard input.count == rotated.count else { return false }
    let combined = input + input
    return combined.contains(rotated)
}
```

## Find pangrams

Write a function that returns true if it is given a string that is an English pangram, ignoring letter case.
Tip: A pangram is a string that contains every letter of the alphabet at least once.

```swift
func challenge9(input: String) -> Bool {
    let set = Set(input.lowercased())
    let letters = set.filter { $0 >= "a" && $0 <= "z" }
    return letters.count == 26
}
```

## Find Vowels and consonants

Given a string in English, return a tuple containing the number of vowels and consonants.

```swift
func getVowelsConsonants(input:String) -> (vowels: Int, consonants: Int) {
    var vowelsCount: Int = 0
    var consonantsCount: Int = 0
    let vowels = "aeiou"
    let consonants = "bcdfghjklmnpqrstvwxyz"

    for letter in input.lowercased() {
        if vowels.contains(letter) {
            vowelsCount += 1
        }
        if consonants.contains(letter) {
            consonantsCount += 1
        }
    }
    return (vowels: vowelsCount, consonants: consonantsCount)
}
```

## Three different letters

Write a function that accepts two strings, and returns true if they are identical in length but have no more than three different letters, taking case and string order into account.

```swift
func challenge11(first: String, second: String) -> Bool {
    guard first.count == second.count else { return false }

    let firstArray = Array(first)
    let secondArray = Array(second)
    var differences = 0

    for (index, letter) in firstArray.enumerated() {
        if secondArray[index] != letter {
            differences += 1

            if differences == 4 {
                return false
            }
				}
    }

    return true
}
```

## Find longest prefix

Write a function that accepts a string of words with a similar prefix, separated by spaces, and returns the longest substring that prefixes all words.

```swift
func challenge12(input: String) -> String {
    let parts = input.components(separatedBy: " ")
    guard let first = parts.first else { return "" }

    var currentPrefix = ""
    var bestPrefix = ""

    for letter in first {
        currentPrefix.append(letter)

        for word in parts {
            if !word.hasPrefix(currentPrefix) {
                return bestPrefix
            }
        }

        bestPrefix = currentPrefix
    }

    return bestPrefix
}

// Sample input and output:
// The string “swift switch swill swim” should return “swi”.
// The string “flip flap flop” should return “fl”.
```

## Run-length encoding

Write a function that accepts a string as input, then returns how often each letter is repeated in a single run, taking case into account.
**Sample input and output**
The string “aabbcc” should return “a2b2c2”.
The strings “aaabaaabaaa” should return “a3b1a3b1a3”
The string “aaAAaa” should return “a2A2a2”

```swift
func challenge13b(input: String) -> String {
    var returnValue = ""
    var letterCounter = 0
    var letterArray = Array(input)

    for i in 0 ..< letterArray.count {
        letterCounter += 1

        if i + 1 == letterArray.count || letterArray[i] != letterArray[i + 1] {
            returnValue += "\(letterArray[i])\(letterCounter)"
            letterCounter = 0
        }
		}
    return returnValue
}
```

## String permutations

Write a function that prints all possible permutations of a given input string.
Tip: A string permutation is any given rearrangement of its letters, for example “boamtw” is a permutation of “wombat”.
**Sample input and output:**
The string “a” should print “a”.
The string “ab” should “ab”, “ba”.
The string “abc” should print “abc”, “acb”, “bac”, “bca”, “cab”, “cba”.
The string “wombat” should print 720 permutations.

```swift
func challenge14(string: String, current: String = "") {
    let length = string.count
    let strArray = Array(string)
		if (length == 0) {
        // there's nothing left to re-arrange; print the result
        print(current)
        print("******")
    } else {
        print(current)

        // loop through every character
        for i in 0 ..< length {
            // get the letters before me
            let left = String(strArray[0 ..< i])

            // get the letters after me
            let right = String(strArray[i+1 ..< length])

            // put those two together and carry on
            challenge14(string: left + right, current: current + String(strArray[i]))
        }
    }
}
```

## Reverse the words in a string

Write a function that returns a string with each of its words reversed but in the original order, without using a loop.
**_Sample input and output_**
The string “Swift Coding Challenges” should return “tfiwS gnidoC segnellahC”.
The string “The quick brown fox” should return “ehT kciuq nworb xof”.

```swift
func challenge15(input: String) -> String {
    let parts = input.components(separatedBy: " ")
    let reversed = parts.map { String($0.reversed()) }
    return reversed.joined(separator: " ")
}
```

## Fizz Buzz

Write a function that counts from 1 through 100, and prints “Fizz” if the counter is evenly divisible by 3, “Buzz” if it’s evenly divisible by 5, “Fizz Buzz” if it’s even divisible by three and five, or the counter number for all other cases.
**Sample input and output**
1 should print “1”
2 should print “2”
3 should print “Fizz”
4 should print “4”
5 should print “Buzz”
15 should print “Fizz Buzz”

```swift
func challenge16c() {
    (1...100).forEach {
        print($0 % 3 == 0 ? $0 % 5 == 0 ? "Fizz Buzz" : "Fizz" : $0 % 5 == 0 ? "Buzz" : "\($0)") }
}
```

## Generate a random number in a range

Write a function that accepts positive minimum and maximum integers, and returns a random number between those two bounds, inclusive.
**Sample input and output**
Given minimum 1 and maximum 5, the return values 1, 2, 3, 4, 5 are valid.
Given minimum 8 and maximum 10, the return values 8, 9, 10 are valid.
Given minimum 12 and maximum 12, the return value 12 is valid.
Given minimum 12 and maximum 18, the return value 7 is invalid.

```swift
func challenge17a(min: Int, max: Int) -> Int {
    return Int.random(in: min...max)
}

func challenge17b(min: Int, max: Int) -> Int {
    return Int(arc4random_uniform(UInt32(max - min + 1))) + min
}
```

## Number is Prime

Write a function that accepts an integer as its parameter and returns true if the number is prime.
Tip: A number is considered prime if it is greater than one and has no positive divisors other than 1 and itself.
Sample input and output
The number 11 should return true.
The number 13 should return true.
The number 4 should return false.
The number 9 should return false.
The number 16777259 should return true.

```swift
func challenge20b(number: Int) -> Bool {
    guard number >= 2 else { return false }
    guard number != 2 else { return true }
    let max = Int(ceil(sqrt(Double(number))))

    for i in 2 ... max {
        if number % i == 0 {
            return false
        }
    }

    return true
}
```

## Backwards Read Prime

```swift
func backwardsPrime(_ start: Int, _ stop: Int) -> [Int] {
    return Array(start...stop).filter{prime($0) && prime($0.reverse) && $0 != $0.reverse}
}

func prime(_ n: Int) -> Bool {
    return n < 2 ? false : n == 2 || n == 3 || (2...Int(Double(n).squareRoot())).filter{n % $0 == 0}.isEmpty
}

extension Int {
    var reverse: Int {
        return Int(String(String(self).reversed()))!
    }
}
// OR
func revNb(_ n: Int) -> Int {
    return Int(String(String(n).characters.reversed()))!
}
```
