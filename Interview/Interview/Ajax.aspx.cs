using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml;
using System.Xml.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace Interview
{
    public partial class Ajax: System.Web.UI.Page
    {

        /*
         * 
         * Before you start please remember that you are developing in asp.Net
         * Some usefull hints...
         * 1. Ajax Calls Are Case Sensitive
         * 2. To Make a Function visible to the ajax, both [WebMethod] and static should be applied
         * 3. We are using an old version of js, so please return all data as a string (otherwise your anser will not be shown)
         * 
         */ 

        [WebMethod]
        public static string CalculateSaturdays(string date)
        {
            CultureInfo provider = CultureInfo.InvariantCulture; 
            DateTime dt = DateTime.ParseExact(date,"dd MMM yyyy", provider); 


            //Question Defaults (Testing the ability to simply apply parameters to a function , and write the function)
            string res = Questions.CountSaturdays(1,1).ToString();
            return res;
        }


        public static bool TestAnagram(string w1, string w2)
        {
            return Questions.IsAnagram(w1, w2); 
        }

        [WebMethod]
        public static string CircleCollide(Circle c1, Circle c2)
        {
            //Test ability to solve complex mathematical problems
            return c1.Collide(c2).ToString();
        }

        //Emit static by default
        [WebMethod]
        public string HexToRGB(string hex)
        {
            return Questions.FromHex(hex).ToString();
        }

        [WebMethod]
        public static string ListCombine(string[] A, string[] B)
        {
            //Test ability to use a List
            string ret = "";

            var retList = Questions.Combine(A.ToList(), B.ToList());

            foreach(var l in retList)
            {
                ret += l.ToString() + ", ";
            }
            return ret;

        }


        //Remove this function as it tests very little
        [WebMethod]
        public static string CreateNumber(List<int> Data)
        {
            return Questions.Largest(Data);
        }
    }
}
 