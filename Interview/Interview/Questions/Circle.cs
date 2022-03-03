using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Interview
{
    public class Circle
    {
        public decimal X { get; set; }
        public decimal Y { get; set; }
        public decimal Radius { get; set; }

        public bool Collide(Circle other)
        {
            return true;
        }
    }
}
