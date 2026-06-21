import Testing
@testable import Conditionals

@Suite("Core Conditions")
struct CoreConditionTests {
    @Test func alwaysTrueConditionIsSatisfied() {
        #expect(ConditionKey<AlwaysTrue>().isSatisfied)
    }

    @Test func alwaysFalseConditionIsNotSatisfied() {
        #expect(!ConditionKey<AlwaysFalse>().isSatisfied)
    }

    @Test func notInvertsSatisfiedCondition() {
        #expect(!ConditionKey<Not<AlwaysTrue>>().isSatisfied)
    }

    @Test func notInvertsUnsatisfiedCondition() {
        #expect(ConditionKey<Not<AlwaysFalse>>().isSatisfied)
    }

    @Test func anyOfReturnsTrueWhenOneBranchMatches() {
        #expect(ConditionKey<AnyOf<AlwaysFalse, AlwaysTrue>>().isSatisfied)
    }

    @Test func anyOfReturnsFalseWhenNoBranchMatches() {
        #expect(!ConditionKey<AnyOf<AlwaysFalse, AlwaysFalse>>().isSatisfied)
    }

    @Test func allOfReturnsTrueWhenBothBranchesMatch() {
        #expect(ConditionKey<AllOf<AlwaysTrue, AlwaysTrue>>().isSatisfied)
    }

    @Test func allOfReturnsFalseWhenOneBranchDoesNotMatch() {
        #expect(!ConditionKey<AllOf<AlwaysTrue, AlwaysFalse>>().isSatisfied)
    }

    @Test func callAsFunctionSelectsThenBranchForTrueCondition() {
        let value = ConditionKey<AlwaysTrue>()(
            then: { 1 },
            else: { 2 }
        )

        #expect(value == 1)
    }

    @Test func callAsFunctionSelectsElseBranchForFalseCondition() {
        let value = ConditionKey<AlwaysFalse>()(
            then: { 1 },
            else: { 2 }
        )

        #expect(value == 2)
    }
}
