using System;
using System.Web;
using System.Xml;
using System.Text;
using System.Web.Services;
using System.Data.SqlClient;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Dynamic;
using System.Collections;

namespace Interview
{
    public partial class People : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        [WebMethod]
        public static object GetPeople(int CurrentPage,string Search)
        {
            var paramArr = new List<SqlParameter>();
            paramArr.Add(new SqlParameter("@page_number", CurrentPage));
            paramArr.Add(new SqlParameter("@Search", Search));

            return Newtonsoft.Json.JsonConvert.SerializeObject(RunStoredProcParams("GetPeople", paramArr));
        }

        [WebMethod]
        public static object UpdatePerson(int ID, string Name, int Age)
        {
            var paramArr = new List<SqlParameter>();
            paramArr.Add(new SqlParameter("@ID", ID));
            paramArr.Add(new SqlParameter("@Name", Name));
            paramArr.Add(new SqlParameter("@Age", Age));

            return Newtonsoft.Json.JsonConvert.SerializeObject(RunStoredProcParams("UpdatePerson", paramArr));
        }   
        
        [WebMethod]
        public static object InsertPerson(string Name, string Surname, int Age)
        {
            var paramArr = new List<SqlParameter>();
            paramArr.Add(new SqlParameter("@Name", Name));
            paramArr.Add(new SqlParameter("@Surname", Surname));
            paramArr.Add(new SqlParameter("@Age", Age));

            return Newtonsoft.Json.JsonConvert.SerializeObject(RunStoredProcParams("InsertPerson", paramArr));
        } 
        
        [WebMethod]
        public static object DeletePerson(int ID )
        {
            var paramArr = new List<SqlParameter>();
            paramArr.Add(new SqlParameter("@ID", ID));
       

            return Newtonsoft.Json.JsonConvert.SerializeObject(RunStoredProcParams("DeletePerson", paramArr));
        }

        public static IEnumerable<dynamic> RunStoredProcParams(string SPName,List<SqlParameter> Params)
        {
            SqlConnection conn = null;
            SqlDataReader rdr = null;

            try
            {
                // create and open a connection object
                conn = new
                    SqlConnection("server=localhost;database=Interview;integrated security=true"); // connection string for connecting to interview DB on local SQL Server
                conn.Open();

                // 1. create a command object identifying
                // the stored procedure
                SqlCommand cmd = new SqlCommand(SPName, conn);

                // 2. set the command object so it knows
                // to execute a stored procedure
                cmd.CommandType = CommandType.StoredProcedure;

                // 3. add parameter to command, which
                // will be passed to the stored procedure
                cmd.Parameters.AddRange(Params.ToArray());

                // execute the command
                using (var reader = cmd.ExecuteReader())
                {
                    var names = Enumerable.Range(0, reader.FieldCount).Select(reader.GetName).ToList();
                    foreach (IDataRecord record in reader as IEnumerable)
                    {
                        var expando = new ExpandoObject() as IDictionary<string, object>;
                        foreach (var name in names)
                            expando[name] = record[name];

                        yield return expando;
                    }
                }
            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
                if (rdr != null)
                {
                    rdr.Close();
                }
            }
        }

    }
}