import UIKit

extension NSNumber {
    
    /// Converts an NSNumber into a formatted currency string, device's current Locale.
    var currency: String {
        return self.currency(for: Locale.current)
    }
    
    /// Converts an NSNumber into a formatted currency string, using Locale as a parameter.
    func currency(for locale: Locale) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.usesGroupingSeparator = locale.groupingSeparator != nil
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = locale
        
        return numberFormatter.string(from: self)!
    }
}

extension Double {
    
    /// Converts a Double into a formatted currency string, device's current Locale.
    var currency: String {
        return NSNumber(value: self).currency(for: Locale.current)
    }
    
    /// Converts a Double into a formatted currency string, using Locale as a parameter.
    func currency(for locale: Locale) -> String {
        return NSNumber(value: self).currency(for: locale)
    }
}

extension Float {
    
    /// Converts a Float into a formatted currency string, device's current Locale.
    var currency: String {
        return NSNumber(value: self).currency(for: Locale.current)
    }
    
    /// Converts a Float into a formatted currency string, using Locale as a parameter.
    func currency(for locale: Locale) -> String {
        return NSNumber(value: self).currency(for: locale)
    }
}

let amount = 3927.75 // Can be either Double or Float, since we have both extensions.

let usLocale = Locale(identifier: "en-US") // US
let brLocale = Locale(identifier: "pt-BR") // Brazil
let frLocale = Locale(identifier: "fr-FR") // France

print("\(Locale.current.identifier) -> " + amount.currency) // default current device's Locale.
print("\(usLocale.identifier) -> " + amount.currency(for: usLocale))
print("\(brLocale.identifier) -> " + amount.currency(for: brLocale))
print("\(frLocale.identifier) -> " + amount.currency(for: frLocale))

// will print something like this:
// en_US -> $3,927.75
// en-US -> $3,927.75
// pt-BR -> R$ 3.927,75
// fr-FR -> 3 927,75 €
