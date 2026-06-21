public extension Conditionals.Case {
    static func not<C: Condition>(
        _ condition: Conditionals.Case<C>
    ) -> Conditionals.Case<Conditionals.Not<C>> {
        Conditionals.Case<Conditionals.Not<C>>()
    }

    static func anyOf<A: Condition, B: Condition>(
        _ lhs: Conditionals.Case<A>,
        _ rhs: Conditionals.Case<B>
    ) -> Conditionals.Case<Conditionals.AnyOf<A, B>> {
        Conditionals.Case<Conditionals.AnyOf<A, B>>()
    }

    static func anyOf<A: Condition, B: Condition, C: Condition>(
        _ lhs: Conditionals.Case<A>,
        _ rhs: Conditionals.Case<B>,
        _ third: Conditionals.Case<C>
    ) -> Conditionals.Case<Conditionals.AnyOf3<A, B, C>> {
        Conditionals.Case<Conditionals.AnyOf3<A, B, C>>()
    }

    static func anyOf<A: Condition, B: Condition, C: Condition, D: Condition>(
        _ lhs: Conditionals.Case<A>,
        _ rhs: Conditionals.Case<B>,
        _ third: Conditionals.Case<C>,
        _ fourth: Conditionals.Case<D>
    ) -> Conditionals.Case<Conditionals.AnyOf4<A, B, C, D>> {
        Conditionals.Case<Conditionals.AnyOf4<A, B, C, D>>()
    }

    static func allOf<A: Condition, B: Condition>(
        _ lhs: Conditionals.Case<A>,
        _ rhs: Conditionals.Case<B>
    ) -> Conditionals.Case<Conditionals.AllOf<A, B>> {
        Conditionals.Case<Conditionals.AllOf<A, B>>()
    }

    static func allOf<A: Condition, B: Condition, C: Condition>(
        _ lhs: Conditionals.Case<A>,
        _ rhs: Conditionals.Case<B>,
        _ third: Conditionals.Case<C>
    ) -> Conditionals.Case<Conditionals.AllOf3<A, B, C>> {
        Conditionals.Case<Conditionals.AllOf3<A, B, C>>()
    }

    static func allOf<A: Condition, B: Condition, C: Condition, D: Condition>(
        _ lhs: Conditionals.Case<A>,
        _ rhs: Conditionals.Case<B>,
        _ third: Conditionals.Case<C>,
        _ fourth: Conditionals.Case<D>
    ) -> Conditionals.Case<Conditionals.AllOf4<A, B, C, D>> {
        Conditionals.Case<Conditionals.AllOf4<A, B, C, D>>()
    }
}
