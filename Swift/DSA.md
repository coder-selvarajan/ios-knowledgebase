# Data Structures and Algorithms

DSA is a collection of algorithms and data structures that are used in computer science. DSA is about the efficiency of algorithms and the correctness of data structures. Sometimes the efficiency also means the complexity. The implementation would be complex where as the efficiency of the code would be top notch.

However it all depends on the space and time. How long the program takes and how much space it occupied. Lets look at this by an example. If you want to get a haircut done you may do it in two ways.

- Taking each strand of hair, measuring it and cutting it precisely based on other hair. The job result would be very precise, however we would hav e taken a crazy amount of time.
- We can take a bunch of hair and cut it out based on other area. If the result is good enough, we would have taken less time.

The second one is efficient since we have achieved something good in less amount of time.

> Efficiency can rely heavily on your creativity and your ability to get the most done with minimal resources. But there are a lot of tips and tricks that you are expected to know in a technical interview.

Algorithm is a series of steps in solving the problem.

We can describe the efficiency of code with something called Big O Notation O(n).

For example:

```
// psudo code
func decode(input) {
    // do something
    create output string
    loop each letter in the input
        get cipher for each letter
        add the cipher to output string
    loop end
    print output string
}
```

Above psudo code will have the Big O notation as O(2(n)+2).

- The `+2` represents the creation of output string and the print of it.
- The first `2(n)` represents two lines of code in the loop for each letter.

If the input has 10 letters then the Big O notation would be O(2(10)+2) = 22.

However if we include the computation into the account then the notation would be something like this O(29n+2). Its the worst case scenario which includes the 26 letter check for every letter. In real scenario it wont be that much becuase the letter check might happen within few attempts, not all of them takes 26 attempts.

### Some more samples for Big O Notation

```swift
/*
 input manatees: an array of "manatees", where one manatee is represented by a dictionary
 a single manatee has properties like "name", "age", et cetera
 n = the number of elements in "manatees"
 m = the number of properties per "manatee" (i.e. the number of items in a manatee dictionary)
 */

func example1(manatees: [[String : Any]]) {
    for manatee in manatees {
        print(manatee["name"])
    }
}
// Efficiency:  We iterate over every manatee in the manatees list with the for loop. Since we're given that manatees has n elements, our code will take approximately O(n) time to run.


func example2(manatees: [[String : Any]]) {
    print(manatees[0]["name"])
    print(manatees[0]["age"])
}
//Efficiency:  We look at two specific properties of a specific manatee. We aren't iterating over anything - just doing constant-time lookups on lists and dictionaries. Thus the code will complete in constant, or O(1), time.


func example3(manatees: [[String : Any]]) {
    for manatee in manatees {
        for (key, value) in manatee {
            print("\(key) : \(value)")
        }
    }
}
// Efficiency:  There are two for loops, and nested for loops are a good sign that you need to multiply two runtimes. Here, for every manatee, we check every property. If we had 4 manatees, each with 5 properties, then we would need 5+5+5+5 steps. This logic simplifies to the number of manatees times the number of properties, or O(nm).


func example4(manatees: [[String : Any]]) {
    var oldestManatee = "No manatees here!"

    for manatee1 in manatees {
        for manatee2 in manatees {
            if (manatee1["age"] as! Int) < (manatee2["age"] as! Int) {
                oldestManatee = manatee2["name"] as! String
            } else {
                oldestManatee = manatee1["name"] as! String
            }
        }
    }
    print(oldestManatee)
}
// Efficiency: Again we have nested for loops. This time we're iterating over the manatees list twice - every time we see a manatee, we compare it to every other manatee's age. We end up with O(nn), or O(n^2) (which is read as "n squared").
```
