public extension Case {
    static func not<C: Condition>(
        _ condition: Case<C>
    ) -> Case<Not<C>> {
        Case<Not<C>>()
    }

    static func anyOf<A: Condition, B: Condition>(
        _ lhs: Case<A>,
        _ rhs: Case<B>
    ) -> Case<AnyOf<A, B>> {
        Case<AnyOf<A, B>>()
    }

    static func anyOf<A: Condition, B: Condition, C: Condition>(
        _ lhs: Case<A>,
        _ rhs: Case<B>,
        _ third: Case<C>
    ) -> Case<AnyOf3<A, B, C>> {
        Case<AnyOf3<A, B, C>>()
    }

    static func anyOf<A: Condition, B: Condition, C: Condition, D: Condition>(
        _ lhs: Case<A>,
        _ rhs: Case<B>,
        _ third: Case<C>,
        _ fourth: Case<D>
    ) -> Case<AnyOf4<A, B, C, D>> {
        Case<AnyOf4<A, B, C, D>>()
    }

    static func allOf<A: Condition, B: Condition>(
        _ lhs: Case<A>,
        _ rhs: Case<B>
    ) -> Case<AllOf<A, B>> {
        Case<AllOf<A, B>>()
    }

    static func allOf<A: Condition, B: Condition, C: Condition>(
        _ lhs: Case<A>,
        _ rhs: Case<B>,
        _ third: Case<C>
    ) -> Case<AllOf3<A, B, C>> {
        Case<AllOf3<A, B, C>>()
    }

    static func allOf<A: Condition, B: Condition, C: Condition, D: Condition>(
        _ lhs: Case<A>,
        _ rhs: Case<B>,
        _ third: Case<C>,
        _ fourth: Case<D>
    ) -> Case<AllOf4<A, B, C, D>> {
        Case<AllOf4<A, B, C, D>>()
    }
}
