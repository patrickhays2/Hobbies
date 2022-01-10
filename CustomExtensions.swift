//MARK: Strings
extension String {
    func addCommas(positions:[Int]) -> String {
        var text = self
        for each in 0..<positions.count {
            text.insert(",", at: (text.index(text.endIndex, offsetBy: positions[each])))
        }
        return text
    }
}

// MARK: Ints
extension Int {
    public var asDollarAmount:String {
        func asDollar() -> String {
            let baseInt = self
            var convertedInt = String(baseInt)
            switch convertedInt.count {
            case 4...6: convertedInt = convertedInt.addCommas(positions: [-3])
            case 7...9: convertedInt = convertedInt.addCommas(positions: [-3,-7])
            case 10...12: convertedInt = convertedInt.addCommas(positions: [-3,-7,-11])
            default: convertedInt.count + 0
            }
            let dollarString = ("$\(convertedInt)")
            return dollarString
        }
        return asDollar()
    }
}

//MARK: Doubles
extension Double {
    public var asDollarAmount:String {
        func asDollar() -> String {
            let number = self
            var convertedDouble = String(format: "%0.2f", number)
                let decimalPoint = convertedDouble.firstIndex(of: ".")!
                let totalZeroes = convertedDouble.distance(from: decimalPoint, to: convertedDouble.endIndex)
                if totalZeroes == 2 {
                    convertedDouble.insert("0", at: convertedDouble.endIndex)
                }
                let dollars = convertedDouble[..<decimalPoint]
                switch dollars.count {
                case 4...5: convertedDouble = convertedDouble.addCommas(positions: [-6])
                case 6...8: convertedDouble = convertedDouble.addCommas(positions: [-6,-10])
                case 9...12: convertedDouble = convertedDouble.addCommas(positions: [-6,-10,-14])
                default: convertedDouble.count + 0
                }
            let dollarString = ("$\(convertedDouble)")
            return dollarString
        }
        return asDollar()
    }
}
