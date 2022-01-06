extension Array where Element == Int {
    
    func totalSum() -> Int {
        var total = 0
        for each in 0..<self.count {
            total += self[each]
        }
        return total
    }
    
    func bracketed() -> String {
        var newString = ""
        for each in 0..<self.count {
            newString.append("\(self[each]), ")
        }
        newString.removeLast()
        newString.removeLast()
        newString.insert("[", at: newString.startIndex)
        newString.insert("]", at: newString.endIndex)
        return newString
    }
}

class DiceRoller {
    
    func roll(qty:Int,sides:Int) -> [Int] {
        var allResults:[Int] = []
        for _ in 0..<qty {
            var rollResult = 0
            rollResult = Int.random(in: 1...sides)
            allResults.append(rollResult)
        }
        return allResults.sorted()
    }
    
    func rollWithMessage(qty:Int,sides:Int,includeTotal: Bool=true) -> String {
        var returnString = ""
        let results = roll(qty: qty, sides: sides)
        let resultString = results.bracketed()
        if qty < 1 || sides < 2 {
            if qty < 1 && sides < 2 {
                returnString = "You must have at least one die with two sides to roll."
            } else if qty < 1 && sides >= 2 {
                returnString = "You must have at least one die to roll."
            } else if qty > 1 && sides < 2 {
                returnString = "Your \(sides)-sided die must have at least two sides to roll."
            }
        } else if qty > 1 && includeTotal == true {
            returnString = "You've rolled \(qty) \(sides)-sided dice with a result of \(resultString) for a total of \(results.totalSum())."
            // You've rolled 3 4-sided dice with a result of [1, 2, 3] for a total of 6.
        } else if qty > 1 && includeTotal == false {
            returnString = "You've rolled \(qty) \(sides)-sided dice with a result of \(resultString)."
            // You've rolled 3 4-sided dice with a result of [1, 2, 3].
        } else if qty == 1 {
            returnString = "You've rolled a \(sides)-sided die with a result of \(resultString)."
            // // You've a 4-sided dice with a result of [4]
        }
        return returnString
    }
    
    //MARK: Standard Dice
    func rolld20(qty:Int=1) -> [Int] {
        return roll(qty: 1, sides: 20).sorted()
    }
    
    func rolld12(qty:Int=1) -> [Int] {
        return roll(qty: 1, sides: 12).sorted()
    }
    
    func rolld8(qty:Int=1) -> [Int] {
        return roll(qty: 1, sides: 8).sorted()
    }
    
    func rolld6(qty:Int=1) -> [Int] {
        return roll(qty: 1, sides: 6).sorted()
    }
    
    func rolld4(qty:Int=1) -> [Int] {
        return roll(qty: 1, sides: 4).sorted()
    }
    
    func rolld2(qty:Int=1) -> [Int] {
        return roll(qty: 1, sides: 2).sorted()
    }
}
