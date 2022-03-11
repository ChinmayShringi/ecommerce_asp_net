using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class ViewProduct : System.Web.UI.Page
{
    public static String CS = ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack){
            //when page first time run then this code will execute
            BindGridview1();
        }
    }

    protected void deleteProduct(string productId)
{
            SqlConnection conn = new SqlConnection(CS);
            string sql = "DELETE FROM tblProductImages WHERE PID=" + productId + ";";
            string sql1 = "DELETE FROM tblProductSizeQuantity WHERE PID=" + productId + ";";
            string sql2 = "DELETE FROM tblProducts WHERE PID=" + productId + ";";
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlCommand cmd1 = new SqlCommand(sql1, conn);
            SqlCommand cmd2 = new SqlCommand(sql2, conn);
            cmd.ExecuteNonQuery();
            cmd1.ExecuteNonQuery();
            cmd2.ExecuteNonQuery();
            conn.Close();
            conn.Dispose();
    }
private void MsgBox(string sMessage)    
    {    
        string msg = "<script language=\"javascript\">";    
        msg += "alert('" + sMessage + "');";    
        msg += "</script>";    
        Response.Write(msg);    
    }

protected void RowUpdating(object sender, GridViewUpdateEventArgs e)
{
  int index = Convert.ToInt32(e.RowIndex);
    DataTable dt = ViewState["dt"] as DataTable;
    ViewState["dt"] = dt;
  
     //Update the values.
    GridViewRow row = GridView1.Rows[e.RowIndex];
    string pname = ((TextBox)row.Cells[0].Controls[0]).Text;
    string pprice = ((TextBox)row.Cells[1].Controls[0]).Text;
    string sprice = ((TextBox)row.Cells[2].Controls[0]).Text;
     SqlConnection conn = new SqlConnection(CS);
            string sql = "UPDATE tblProducts SET pname='"+pname+"',pprice='"+pprice+"',PSelPrice='"+sprice+"' WHERE PID='"+dt.Rows[index][0].ToString()+"';";
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            conn.Dispose();
    GridView1.EditIndex = -1;
    BindGridview1();
}

protected void RowEditing(object sender, GridViewEditEventArgs e)
{
    GridView1.EditIndex = e.NewEditIndex;
    BindGridview1();
}
protected void RowDeleting(object sender, GridViewDeleteEventArgs e)
{
    int index = Convert.ToInt32(e.RowIndex);
    DataTable dt = ViewState["dt"] as DataTable;
    ViewState["dt"] = dt;
        deleteProduct(dt.Rows[index][0].ToString());
    BindGridview1();
}
    private void BindGridview1()
    {
        SqlConnection con = new SqlConnection(CS);
        SqlCommand cmd = new SqlCommand(" select pid,pname,pprice,PSelPrice from tblProducts;",con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        ViewState["dt"] = dt;
        if (dt.Rows.Count > 0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        else
        {
            GridView1.DataSource = null;
            GridView1.DataBind();
        }
        

    }
}