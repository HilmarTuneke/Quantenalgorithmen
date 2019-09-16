namespace Quantum.HalfAdder {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;

    operation Set (desired: Result, q1: Qubit) : Unit {
        if (desired != M(q1)) {
            X(q1);
        }
    }

    operation HalfAdd (summand1Start : Result, summand2Start: Result) : (Int, Int) {
        mutable measuredSum = 0;
        mutable measuredCarry = 0;
        using ((summand1, summand2, sum, carry) = (Qubit(), Qubit(), Qubit(), Qubit())) {
            Set(summand1Start, summand1);
            Set(summand2Start, summand2);

            Controlled X([summand1, summand2], carry);
            CNOT(summand1, summand2);
            CNOT(summand2, sum);
            CNOT(summand1, summand2);

            if(M(sum) == One) {
                set measuredSum = 1;
                Set(Zero, sum);
            }
            if(M(carry) == One) {
                set measuredCarry = 1;
                Set(Zero, carry);
            }
            Set(Zero, summand1);
            Set(Zero, summand2);
        }

        // Return sum and carry bit
        return (measuredSum, measuredCarry);
    }
}
