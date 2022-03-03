using System;
using System.Collections.Generic;
using System.Linq;

namespace Interview
{
    public static class Questions
    {
        // Question 1
        // Wite a function that counts the number of Saturdays of the given 
        // year and months.
        // Example: CountSaturdays(2017, 5) would return 4
        public static int CountSaturdays(int year, int month)
        {
            

            return 1;
        }

        // Question 2
        // Write a function that test for anagramity.
        // Am anagram is a word that containts exactly the same letters and 
        // frequency thereof as another word.
        // for example, the word anagram can be rearranged into "nagaram"
        public static bool IsAnagram(string a, string b)
        {
            return true;
        }

        // Question 4
        // Write a function that converts a hex string in the format '#rrggbb' 
        // to a Color object. Write implementation in Color.cs
        // For example: give the hex #ff00ff, r = 255, g = 0, b = 255
        // use function Convert.ToUInt32(hex, 16) for hex conversions
        public static string FromHex(string hex)
        {
            try
            {
                return new Color(hex).ColorValue();
            }
            catch { return "Invalid Hex"; }
        }

        // Question 5
        // Write a function that combines two lists by alternatingly 
        // taking elements. For example: given the two 
        // lists[a, b, c] and[1, 2, 3], the function should return [a, 1, b, 2, c, 3].
        public static List<string> Combine(List<string> a, List<string> b)
        {
            return a;
        }

        // Question 6
        // Write a function that given a list of non negative integers, 
        // arranges them such that they form the largest possible number.
        // For example, given[50, 2, 1, 9], the largest formed number is 95021.
        public static string Largest(List<int> list)
        {
            return "";
        }

    }
}
