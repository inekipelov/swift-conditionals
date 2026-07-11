import Testing
@testable import Conditionals

@Suite("Conditional Value")
struct ConditionalValueTests {
    @Test func conditionalValueSelectsThenBranchForTrueCondition() {
        let value = Int.value(ConditionKey<AlwaysTrue>(), 1, else: 2)

        #expect(value == 1)
    }

    @Test func conditionalValueSelectsElseBranchForFalseCondition() {
        let value = Int.value(ConditionKey<AlwaysFalse>(), 1, else: 2)

        #expect(value == 2)
    }

    @Test func standardLibraryConditionalValuesCompile() {
        let boolValue = Bool.value(ConditionKey<AlwaysTrue>(), true, else: false)
        let stringValue = String.value(ConditionKey<AlwaysTrue>(), "then", else: "else")
        let optionalValue = Optional<Int>.value(ConditionKey<AlwaysTrue>(), 1, else: nil)
        let arrayValue = [Int].value(ConditionKey<AlwaysTrue>(), [1, 2], else: [])
        let dictionaryValue = [String: Int].value(
            ConditionKey<AlwaysTrue>(),
            ["one": 1],
            else: [:]
        )
        let setValue = Set<String>.value(ConditionKey<AlwaysTrue>(), ["one"], else: [])

        _ = boolValue
        _ = stringValue
        _ = optionalValue
        _ = arrayValue
        _ = dictionaryValue
        _ = setValue
    }

    @Test func readmeSwiftExampleCompiles() {
        let buttonTitle = String.value(
            .allOf(.iOS26, .not(.iPad)),
            "Continue",
            else: "Open"
        )

        _ = buttonTitle
    }
}
