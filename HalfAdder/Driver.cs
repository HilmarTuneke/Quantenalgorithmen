using System;

using Microsoft.Quantum.Simulation.Core;
using Microsoft.Quantum.Simulation.Simulators;

namespace Quantum.HalfAdder
{
    class Driver
    {
        static void Main(string[] args)
        {
            using (var qsim = new QuantumSimulator())
            {
                var (sum, carry) = HalfAdd.Run(qsim, Result.Zero, Result.Zero).Result;
                System.Console.WriteLine($"0 + 0 = {sum},  carry = {carry}");

                (sum, carry) = HalfAdd.Run(qsim, Result.Zero, Result.One).Result;
                System.Console.WriteLine($"0 + 1 = {sum},  carry = {carry}");

                (sum, carry) = HalfAdd.Run(qsim, Result.One, Result.Zero).Result;
                System.Console.WriteLine($"1 + 0 = {sum},  carry = {carry}");
                
                (sum, carry) = HalfAdd.Run(qsim, Result.One, Result.One).Result;
                System.Console.WriteLine($"1 + 1 = {sum},  carry = {carry}");
            }
        }
    }
}
