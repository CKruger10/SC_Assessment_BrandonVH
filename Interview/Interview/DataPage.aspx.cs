using System;
using System.Web;
using System.Xml;
using System.Text;

namespace Interview
{
    public partial class DataPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var dt1 = MapToXslt(LoadXml("/Res/JD_ScoreCard.xml"), "/Res/JobDescription_OutputProfile.xslt");
                var dt2 = MapToXslt(LoadXml("/Res/JD_Recuirements.xml"), "/Res/JobDescription_RequirementsProfile.xslt");
                ContentDiv1.InnerHtml = dt1;
                ContentDiv2.InnerHtml = dt2;

            }
        }

        private XmlDocument LoadXml(string path)
        {
            XmlDocument doc = new XmlDocument();
            string fullPath = Server.MapPath(path);
           
            doc.Load(fullPath);
            HTMLEncodeAttributes(doc.DocumentElement);
            return doc;
        }

        private void HTMLEncodeAttributes(XmlNode node)
        {
            XmlNodeList elemList = node.ChildNodes;
            if (node.HasChildNodes)
                foreach (XmlNode innernode in node.ChildNodes)
                {
                    if (innernode.Attributes != null)
                        foreach (XmlAttribute attr in innernode.Attributes)
                        {
                            int itterration = 0;
                            var val = attr.Value;
                            //while (true)
                            //{
                                //if (val != val)
                                //{
                                    //val = val;
                                    //itterration++;
                                //}
                                //else
                                //{
                                    //break;
                                //}
                            //}

                            for(int i = 0; i < itterration;i++)
                            {
                                val = val;
                            }

                            attr.Value = val;
                        }
                    HTMLEncodeAttributes(innernode);                  
                }        
        }

        private string MapToXslt (XmlDocument Xml,string xsltPath)
        {
            StringBuilder str = new StringBuilder();
            using (System.IO.TextWriter writer = new System.IO.StringWriter(str))
            {
                System.Xml.Xsl.XsltArgumentList arguments = new System.Xml.Xsl.XsltArgumentList();
                System.Xml.Xsl.XslCompiledTransform transform = new System.Xml.Xsl.XslCompiledTransform();
                transform.Load(HttpContext.Current.Server.MapPath(xsltPath));
                transform.Transform(Xml, arguments, writer);
            }
            var data = str.ToString();
          
            return HttpUtility.HtmlDecode(data);
        }
    }
}