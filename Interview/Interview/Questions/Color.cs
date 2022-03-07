namespace Interview
{
    public class Color
    {
        private int r { get; set; }
        private int g { get; set; }
        private int b { get; set; }
        private int a { get; set; } = 255;

        public Color(string hex)
        {
        }

        public string ColorValue()
        {
            if (a != 255)
                return "rgba(" + r + "," + g + "," + b + "," + ((float)a / (float)255).ToString("0.00", System.Globalization.CultureInfo.InvariantCulture) + ")";
            else
                return "rgb(" + r + "," + g + "," + b + ")";
        }
    }
}