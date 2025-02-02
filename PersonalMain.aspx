﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PersonalMain.aspx.cs" Inherits="PersonalMain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <span style="font-size: 9pt">
            <asp:Literal runat="server" Text="<%$ Resources:basic_information%>" />
            <%= Session["username"].ToString() %>
            <%= Session["role"].ToString() %>
            <%= Session["department_name"].ToString() %>
        </span>

        <table cellpadding="0" cellspacing="0"  Width="471px">
            <tr align =left >
                <td colspan="3"  valign =top align =left >
                    <asp:DataList ID="points" runat="server"  Font-Size="9pt">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0" style="width: 600px">
                                <tr>
                                    <td><asp:Label ID="Label10" runat="server" Font-Size="9pt"  Text='<%# DataBinder.Eval(Container.DataItem,"no") %>'></asp:Label></td>
                                    <td><asp:Label ID="labID" runat="server" Font-Size="9pt"  Text='<%# DataBinder.Eval(Container.DataItem,"department") %>'></asp:Label></td>
                                    <td><asp:Label ID="Label1" runat="server" Font-Size="9pt"  Text='<%# DataBinder.Eval(Container.DataItem,"username") %>'></asp:Label></td>
                                    <td><asp:Label ID="Label2" runat="server" Font-Size="9pt"  Text='<%# DataBinder.Eval(Container.DataItem,"event_time") %>'></asp:Label></td>
                                    <td><asp:Label ID="Label3" runat="server" Font-Size="9pt"  Text='<%# DataBinder.Eval(Container.DataItem,"point_value") %>'></asp:Label></td>  
                                    <td><asp:Label ID="Label4" runat="server" Font-Size="9pt"  Text='<%# DataBinder.Eval(Container.DataItem,"event_category") %>'></asp:Label></td>  
                                    <td><asp:Label ID="Label5" runat="server" Font-Size="9pt"  Text='<%# DataBinder.Eval(Container.DataItem,"fill_user") %>'></asp:Label></td>   
                                    <td><asp:Label ID="Label6" runat="server" Font-Size="9pt"  Text='<%# DataBinder.Eval(Container.DataItem,"operate_user") %>'></asp:Label></td>
                                    <td><asp:Label ID="Label7" runat="server" Font-Size="9pt"  Text='<%# DataBinder.Eval(Container.DataItem,"operate_time") %>'></asp:Label></td>  
                                    <td><asp:Label ID="Label8" runat="server" Font-Size="9pt"  Text='<%# DataBinder.Eval(Container.DataItem,"update_time") %>'></asp:Label></td>  
                                    <td><asp:Label ID="Label9" runat="server" Font-Size="9pt"  Text='<%# DataBinder.Eval(Container.DataItem,"event") %>'></asp:Label></td>  
                                </tr> 
                            </table>
                        </ItemTemplate>
                        <HeaderTemplate>
                            <table>
                                <tr>
                                    <td><asp:Literal runat="server" Text="<%$ Resources:no%>" /></td>
                                    <td><asp:Literal runat="server" Text="<%$ Resources:department%>" /></td>
                                    <td><asp:Literal runat="server" Text="<%$ Resources:name%>" /></td>
                                    <td><asp:Literal runat="server" Text="<%$ Resources:event_time%>" /></td>
                                    <td><asp:Literal runat="server" Text="<%$ Resources:point_value%>" /></td>
                                    <td><asp:Literal runat="server" Text="<%$ Resources:event_category%>" /></td>
                                    <td><asp:Literal runat="server" Text="<%$ Resources:fill_user%>" /></td>
                                    <td><asp:Literal runat="server" Text="<%$ Resources:operate_user%>" /></td>
                                    <td><asp:Literal runat="server" Text="<%$ Resources:operate_time%>" /></td>
                                    <td><asp:Literal runat="server" Text="<%$ Resources:update_time%>" /></td>
                                    <td><asp:Literal runat="server" Text="<%$ Resources:event%>" /></td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <HeaderStyle BackColor="#0973DC" Font-Bold="True" ForeColor="White" />
                    </asp:DataList>                    
                    </td>
            </tr>
            <tr>
                <td style="width: 471px; text-align: center; font-size: 9pt; height: 16px;" >
                    <asp:Label ID="labCP" runat="server" Text="<%$ Resources:current_page%>"></asp:Label><asp:Label ID="labPage" runat="server" Text="1"></asp:Label>
                    <asp:Label ID="labTP" runat="server" Text="<%$ Resources:total_page%>"></asp:Label><asp:Label ID="labBackPage" runat="server"></asp:Label>
                    <asp:LinkButton ID="lnkbtnOne" runat="server" Font-Underline="False" ForeColor="Red" OnClick="lnkbtnOne_Click" CausesValidation="False"><asp:Literal runat="server" Text="<%$ Resources:frist_page%>" /></asp:LinkButton>
                    <asp:LinkButton ID="lnkbtnUp" runat="server" Font-Underline="False" ForeColor="Red" OnClick="lnkbtnUp_Click" CausesValidation="False"><asp:Literal runat="server" Text="<%$ Resources:previous_page%>" /></asp:LinkButton>
                    <asp:LinkButton ID="lnkbtnNext" runat="server" Font-Underline="False" ForeColor="Red" OnClick="lnkbtnNext_Click" CausesValidation="False"><asp:Literal runat="server" Text="<%$ Resources:next_page%>" /></asp:LinkButton>&nbsp;
                    <asp:LinkButton ID="lnkbtnBack" runat="server" Font-Underline="False" ForeColor="Red" OnClick="lnkbtnBack_Click" CausesValidation="False"><asp:Literal runat="server" Text="<%$ Resources:last_page%>" /></asp:LinkButton>&nbsp;&nbsp;
                </td>
            </tr>
        </table>        
    </div>
    </form>
</body>
</html>
