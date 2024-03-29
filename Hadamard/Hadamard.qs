﻿// see https://docs.microsoft.com/de-de/quantum/quickstart#creating-a-bell-state-in-q
namespace Quantum.Hadamard {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;

    operation Set (desired: Result, qubit: Qubit) : Unit {
        if (desired != M(qubit)) {
            X(qubit);
        }
    }

    operation HadamardTest (count : Int, initial: Result) : (Int, Int) {
        mutable numOnes = 0;
        using (qubit = Qubit()) {

            for (test in 1..count) {
                Set (initial, qubit);
                // TODO insert Hadamard here:
                // H(qubit);
                let res = M (qubit);

                // Count the number of ones we saw:
                if (res == One) {
                    set numOnes += 1;
                }
            }
            Set(Zero, qubit);
        }

        // Return number of times we saw a |0> and number of times we saw a |1>
        return (count-numOnes, numOnes);
    }
}
