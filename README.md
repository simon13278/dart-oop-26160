# dart-oop-26160
# Dart OOP Assignment: Kigali Bus Card

**Name:** Izabayo Simeon
**Student ID:** 26160
## My numbers
- D = 60, L = 0
- Starting balance = 1000 + (60 × 10) = 1600 RWF
- Bus fare = 200 + 60 = 260 RWF
- Student discount = 10 + 0 = 10%
## Output of main.dart

```text
Error: name too short
Owner: Simeon | Balance: 1600 RWF
Owner: Izabayo Simeon | Balance: 1600 RWF
Error: top-up must be 500 to 50000 RWF
Topped up 2000 RWF
Paid 260 RWF
Paid 260 RWF
Owner: Izabayo Simeon | Balance: 3080 RWF
Student discount: 26 RWF
Paid 234 RWF
Owner: Izabayo Simeon | Balance: 1366 RWF
Student card: 10% off

## Part 1: Why no setter for balance?

If balance had a setter, anyone could write `card.balance = 1000000` and
give themselves free money. The balance should only change through `topUp`
and `pay`, because those two methods check the rules (top-up from 500 to
50000, and no paying more than the balance). With only a getter, other code
can read the balance but cannot change it by mistake or by cheating.

## Part 2: What does ~/ do?
`~/` is integer division: it divides and throws away the decimal part.
`print(237 * 17 / 100);` prints `40.29` because `/` always gives a double.
`print(237 * 17 ~/ 100);` prints `40` because `~/` cuts off the `.29` and
gives an int. In `StudentCard.pay` this gives a whole number of RWF for
the discount.

## Part 4: Bug table
 
| Bug | The line | Why it is wrong (your words) | Your fix |
|-----|----------|------------------------------|----------|
| 1 | `String _brand;` and `int _battery;` (lines 2 and 3) | These variables have no starting value, and Dart needs one. | `String _brand = '';` and `int _battery = 0;` |
| 2 | `SmartPhone(String brand, int battery, String system) {` (line 18) | The child does not pass brand and battery to the parent `Phone`. | Add `: super(brand, battery)` before the `{` |
| 3 | `@override` above `void restart()` (line 22) | `@override` needs the parent to have `restart()`, but `Phone` does not. | Delete the `@override` line |
| 4 | `p.battery = 100;` (line 30) | There is no setter, so I cannot change the battery. | Add `set battery(int value)` that only accepts 0 to 100 |
| 5 | `print(p.battery());` (line 31) | `battery` is a getter, so I read it without `()`. | `print(p.battery);` |
| Not a bug | `Phone p = new Phone('Tecno', 50);` (line 29) | `new` is old style, but Dart still allows it. | (none) |
 
The fixed program prints `100`.

## Part 5
My prediction: it prints `1` and then `5`.
Why: `a.add()` makes `_items` 1. `a.items = -5` is refused because the setter
only accepts values that are 0 or more, so `a.items` is still 1. For `b`, a
`BigBag` overrides `add()` and calls `super.add()` twice, so each `add()` adds
2. Two calls make 4, and then `b.items = b.items + 1` sets it to 5 (allowed).

 ##Part 5
### My prediction

```text
1
5
```

The first `Bag` starts at 0. `add()` makes it 1. Assigning `-5` is rejected by the setter because it only accepts values at least 0, so it remains 1.

`BigBag.add()` calls the parent's `add()` twice, so the items become 2. Then `b.items = b.items + 1` adds one more, giving 5.

### Real output

```text
1
5
```

### Was I right?


Yes. My prediction was correct because the actual output matches my prediction.

## GitHub commit checklist

Make at least these 5 commits, as required:

1. `Part 1: BusCard`
2. `Part 2 and 3: StudentCard and main`
3. `Part 4: bug hunt fixed`
4. `Part 5: prediction`
5. `Part 5: real output and README`

## How to run

From the project directory:

```bash
dart run main.dart
dart run bug_hunt.dart
```

For Part 5, create a separate file with the Bag/BigBag code from the assignment, commit your prediction first, then run it and add the real output to this README.

## Submission

Repository name: `dart-oop-26160`



























