using System;
using System.Collections.Generic;

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
            DateTime startDate = new DateTime(year, month, 1);

            int days = DateTime.DaysInMonth(year, month);
            int CountSaturdays = 0;
            for (int day = 0; day < days; ++day)
            {
                CountSaturdays += startDate.AddDays(day).DayOfWeek == DayOfWeek.Saturday ? 1 : 0;
            }

            return CountSaturdays;
        }

        // Question 2
        // Write a function that test for anagramity.
        // Am anagram is a word that containts exactly the same letters and
        // frequency thereof as another word.
        // for example, the word anagram can be rearranged into "nagaram"
        public static string IsAnagram(string a, string b)
        {
            if (a.Length != b.Length)
            {
                return "No";
            }
            char[] firstCharsArray = a.ToLower().ToCharArray();
            char[] secondCharsArray = b.ToLower().ToCharArray();
            Array.Sort(firstCharsArray);
            Array.Sort(secondCharsArray);
            for (int i = 0; i < firstCharsArray.Length; i++)
            {
                if (firstCharsArray[i].ToString() != secondCharsArray[i].ToString())
                {
                    return "No";
                }
            }

            return "Yes";
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
            int ListLen = a.Count + b.Count;
            int k = 0, j = 0;
            List<string> c = new List<string>();
            for (int i = 0; i < ListLen; i++)
            {
                c.Add(i % 2 == 0 ? a[j++] : b[k++]);
            }
            return c;
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