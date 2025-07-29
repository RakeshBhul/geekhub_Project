using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace geekhub_Project
{
    public partial class profileofuser : System.Web.UI.Page
    {
        // Connection string
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                getuserdetails();
            }
        }

        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            userupdate();
        }

        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            deleteuser();
        }

        // Get user details and populate fields
        void getuserdetails()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    if (con.State == ConnectionState.Closed)
                        con.Open();

                    SqlCommand cmd = new SqlCommand("SELECT * FROM usersignup WHERE user_id = @user_id;", con);
                    cmd.Parameters.AddWithValue("@user_id", Session["username"]?.ToString() ?? string.Empty);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        TextBox1.Text = dt.Rows[0]["full_name"].ToString();
                        TextBox2.Text = dt.Rows[0]["dob"].ToString();
                        TextBox3.Text = dt.Rows[0]["contact_no"].ToString();
                        TextBox4.Text = dt.Rows[0]["email"].ToString();
                        DropDownList1.SelectedValue = dt.Rows[0]["provinces"].ToString().Trim();
                        TextBox6.Text = dt.Rows[0]["city"].ToString();
                        TextBox7.Text = dt.Rows[0]["pincode"].ToString();
                        TextBox5.Text = dt.Rows[0]["full_address"].ToString();
                        TextBox8.Text = dt.Rows[0]["user_id"].ToString();
                        TextBox9.Text = dt.Rows[0]["password"].ToString();
                        Label1.Text = dt.Rows[0]["account_status"].ToString().Trim();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error loading user details: " + ex.Message + "');</script>");
            }
        }

        // Update user information
        void userupdate()
        {
            // Server-side validation for contact number (10 digits)
            if (!Regex.IsMatch(TextBox3.Text.Trim(), @"^\d{10}$"))
            {
                Response.Write("<script>alert('Please enter a valid 10-digit contact number.');</script>");
                return;
            }

            // Server-side validation for email
            if (!Regex.IsMatch(TextBox4.Text.Trim(), @"^[^@\s]+@[^@\s]+\.[^@\s]+$"))
            {
                Response.Write("<script>alert('Please enter a valid email address.');</script>");
                return;
            }

            // Use new password if entered, otherwise use old password
            string password = string.IsNullOrWhiteSpace(TextBox10.Text) ? TextBox9.Text.Trim() : TextBox10.Text.Trim();

            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    if (con.State == ConnectionState.Closed)
                        con.Open();

                    SqlCommand cmd = new SqlCommand(
                        "UPDATE usersignup SET full_name=@full_name, dob=@dob, contact_no=@contact_no, email=@email, provinces=@provinces, city=@city, pincode=@pincode, full_address=@full_address, password=@password, account_status=@account_status WHERE user_id=@user_id",
                        con);

                    cmd.Parameters.AddWithValue("@full_name", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@dob", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@contact_no", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@email", TextBox4.Text.Trim());
                    cmd.Parameters.AddWithValue("@provinces", DropDownList1.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@city", TextBox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@pincode", TextBox7.Text.Trim());
                    cmd.Parameters.AddWithValue("@full_address", TextBox5.Text.Trim());
                    cmd.Parameters.AddWithValue("@password", password);
                    cmd.Parameters.AddWithValue("@account_status", "pending");
                    cmd.Parameters.AddWithValue("@user_id", Session["username"]?.ToString() ?? string.Empty);

                    int result = cmd.ExecuteNonQuery();
                    if (result > 0)
                    {
                        Response.Write("<script>alert('Detail Updated');</script>");
                        getuserdetails();
                    }
                    else
                    {
                        Response.Write("<script>alert('Update failed.');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error updating details: " + ex.Message + "');</script>");
            }
        }

        // Delete user
        void deleteuser()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    if (con.State == ConnectionState.Closed)
                        con.Open();

                    SqlCommand cmd = new SqlCommand("DELETE FROM usersignup WHERE user_id = @user_id;", con);
                    cmd.Parameters.AddWithValue("@user_id", Session["username"]?.ToString() ?? string.Empty);

                    cmd.ExecuteNonQuery();
                    con.Close();

                    Response.Write("<script>alert('User Deleted'); window.location='index.aspx';</script>");
                    Session.Clear();
                    Session.Abandon();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error deleting user: " + ex.Message + "');</script>");
            }
        }
    }
}