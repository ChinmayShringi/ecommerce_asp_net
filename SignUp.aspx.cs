using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net.Mail;
using System.Net;
using System.Data.SqlClient;
using System.Configuration;

public partial class SignUp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
{}
    }

    protected void txtsignup_Click(object sender, EventArgs e)
    {

       if(isformvalid())
        {
if(checkOtp()){
            using (SqlConnection con = new SqlConnection(ConfigurationManager .ConnectionStrings ["MyShoppingDB"].ConnectionString ))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Insert into tblUsers(Username,Password,Email,Name,Usertype) Values('" + txtUname.Text + "','" + txtPass.Text + "','" + txtEmail.Text + "','" + txtName.Text + "','User')", con);
                cmd.ExecuteNonQuery();
                Response.Write("<script> alert('Registration Successfully done');  </script>");
                clr();
                con.Close();
                lblMsg.Text = "Registration Successfully done";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                
            }
            Response.Redirect("~/SignIn.aspx");
        }
        }
       else
        {
            Response.Write("<script> alert('Registration failed');  </script>");
            lblMsg.ForeColor = System.Drawing.Color.Red;
        }

    }

    private bool checkOtp() {
        if(txtOtp.Text==Session["otp"])
        {
            Response.Write("<script> alert('OTP not valid"+Session["otp"]+"');  </script>");
            txtOtp.Focus();
            return false;
        }
        return true;
    }

    protected void sendOtp(object sender, EventArgs e)
    {
        
        if (txtEmail.Text == "")
        {
            Response.Write("<script> alert('Email not valid');  </script>");
            txtEmail.Focus();
            return;
        }
         String num = "0123456789";
        txtOtp.Text = string.Empty;
            int len = num.Length;
            string otp = string.Empty;
            int otpdigit = 6;
            string finaldigit;
            int getindex;
        for (int i = 0; i < otpdigit; i++)
                {
                    do
                    {
                        getindex = new Random().Next(0, len);
                        finaldigit = num.ToCharArray()[getindex].ToString();
                    } while (otp.IndexOf(finaldigit) != -1);
                    otp += finaldigit;
                }
            Session["otp"]=otp;
                String ToEmailAddress = txtEmail.Text;
                String EmailBody ="Hi ,"+txtUname.Text + ",<br/><br/>Use the one time password to login:<br/> <br/> Your One time password:"+otp ;
                MailMessage PassRecMail = new MailMessage("fakeairhead@gmail.com", ToEmailAddress );
                PassRecMail.Body = EmailBody;
                PassRecMail.IsBodyHtml  = true;
                PassRecMail.Subject  = "OTP";              
                using (SmtpClient client = new SmtpClient())
                {
                    client.EnableSsl = true;
                    client.UseDefaultCredentials = false;
                    client.Credentials = new NetworkCredential("fakeairhead@gmail.com", "Awesome@007");
                    client.Host = "smtp.gmail.com";
                    client.Port = 587;
                    client.DeliveryMethod = SmtpDeliveryMethod.Network;
                    client.Send(PassRecMail);
                }

       
    }
   
    private bool isformvalid()
    {
        if (txtUname.Text == "")
        {
            Response.Write("<script> alert('username not valid');  </script>");
            txtUname.Focus();

            return false;
        }
        else if(txtPass.Text  =="")
        {
            Response.Write("<script> alert('Password not valid');  </script>");
            txtPass.Focus();
            return false;
        }
        else if (txtPass.Text != txtCPass.Text )
        {
            Response.Write("<script> alert('confirm Password not valid');  </script>");
            txtCPass.Focus();
            return false;
        }
        else if (txtEmail.Text == "")
        {
            Response.Write("<script> alert('Email not valid');  </script>");
            txtEmail.Focus();
            return false;
        }
        else if (txtName.Text == "")
        {
            Response.Write("<script> alert('Name not valid');  </script>");
            txtName.Focus();
            return false;
        }

        return true;
    }

    private void clr()
    {
        txtName.Text = string.Empty;
        txtPass.Text  = string.Empty;
        txtUname.Text = string.Empty;
        txtEmail.Text = string.Empty;
        txtCPass.Text = string.Empty;
        txtOtp.Text = string.Empty;
    }
}