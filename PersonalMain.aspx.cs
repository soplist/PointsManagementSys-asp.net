using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PersonalMain : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            DB db = new DB();
            Session["page_size"] = 20;
            int pageSize = Convert.ToInt32(Session["page_size"]);
            int user_id = Convert.ToInt32(Session["no"]);
            string countSql = "select count(*) from points_management_DB_points where user_id="+user_id;
            int count = db.resultCount(countSql);
            int pageCount = (int)Math.Ceiling((double)count / pageSize);
            Session["page_count"] = pageCount;
            dlBind();
        }
    }
    public void dlBind()
    {
        DB db = new DB();
        int pageSize = Convert.ToInt32(Session["page_size"]);
        int curpage = Convert.ToInt32(this.labPage.Text);
        int user_id = Convert.ToInt32(Session["no"]);
        string dataSql = "";
        if (curpage == 1)
            dataSql = "select top " + pageSize + " p.no as no,d.department_name as department,u1.real_name as username,p.event_time as event_time,p.point_value as point_value,c.category as event_category,p.fill_user as fill_user,u2.real_name as operate_user,p.operate_time as operate_time,p.update_time as update_time,p.event as event from points_management_DB_points as p inner join points_management_DB_user as u1 on p.user_id=u1.no inner join points_management_DB_user as u2 on p.operate_user=u2.no inner join points_management_DB_event_category as c on p.event_category=c.no inner join points_management_DB_department as d on u1.department_id=d.no where p.user_id = "+user_id;
        else
            dataSql = "select top " + pageSize + " p.no as no,d.department_name as department,u1.real_name as username,p.event_time as event_time,p.point_value as point_value,c.category as event_category,p.fill_user as fill_user,u2.real_name as operate_user,p.operate_time as operate_time,p.update_time as update_time,p.event as event from points_management_DB_points as p inner join points_management_DB_user as u1 on p.user_id=u1.no inner join points_management_DB_user as u2 on p.operate_user=u2.no inner join points_management_DB_event_category as c on p.event_category=c.no inner join points_management_DB_department as d on u1.department_id=d.no where p.no not in(select top " + pageSize * (curpage - 1) + "  p.no from points_management_DB_points as p inner join points_management_DB_user as u1 on p.user_id=u1.no inner join points_management_DB_user as u2 on p.operate_user=u2.no inner join points_management_DB_event_category as c on p.event_category=c.no inner join points_management_DB_department as d on u1.department_id=d.no) and p.user_id = "+user_id;
        DataTable pageDataTable = db.reDt(dataSql);

        this.lnkbtnUp.Enabled = true;
        this.lnkbtnNext.Enabled = true;
        this.lnkbtnBack.Enabled = true;
        this.lnkbtnOne.Enabled = true;
        if (curpage == 1)
        {
            this.lnkbtnOne.Enabled = false;
            this.lnkbtnUp.Enabled = false;
        }

        int pageCount = Convert.ToInt32(Session["page_count"]);
        if (curpage == pageCount)
        {
            this.lnkbtnNext.Enabled = false;
            this.lnkbtnBack.Enabled = false;
        }
        this.labBackPage.Text = Convert.ToString(pageCount);
        this.points.DataSource = pageDataTable;
        this.points.DataKeyField = "no";
        this.points.DataBind();

    }

    protected void lnkbtnOne_Click(object sender, EventArgs e)
    {
        this.labPage.Text = "1";
        this.dlBind();
    }
    protected void lnkbtnUp_Click(object sender, EventArgs e)
    {
        this.labPage.Text = Convert.ToString(Convert.ToInt32(this.labPage.Text) - 1);
        this.dlBind();
    }
    protected void lnkbtnNext_Click(object sender, EventArgs e)
    {
        this.labPage.Text = Convert.ToString(Convert.ToInt32(this.labPage.Text) + 1);
        this.dlBind();
    }
    protected void lnkbtnBack_Click(object sender, EventArgs e)
    {
        this.labPage.Text = this.labBackPage.Text;
        this.dlBind();

    }
}