<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Asp.net_Web_application_Web_Form_and_Mssql._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
         <style type="text/css">
        body
        {
            font-family: Arial;
            font-size: 10pt;
        }
        table
        {
            border: 1px solid #ccc;
            border-collapse: collapse;
            background-color: #fff;
        }
        table th
        {
            background-color: #B8DBFD;
            color: #333;
            font-weight: bold;
        }
        table th, table td
        {
            padding: 5px;
            border: 1px solid #ccc;
        }
        table, table table td
        {
            border: 0px solid #ccc;
        }
        
    </style>
    <main aria-labelledby="title">

    <div id="dvGrid" style="padding: 10px; width: 450px">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
               
                <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse">
                    <tr>
                        <td style="width: 150px">
                            First Name:<br />
                            <asp:TextBox ID="txtFirstName" runat="server" Width="140" />
                        </td>
                        <td style="width: 150px">
                            Last Name:<br />
                            <asp:TextBox ID="txtLastName" runat="server" Width="140" />
                        </td>
                         <td style="width: 150px">
                            Division:<br />
                            <asp:TextBox ID="txtDivision" runat="server" Width="140" />
                        </td>
                         <td style="width: 150px">
                            Building:<br />
                            <asp:TextBox ID="txtBuilding" runat="server" Width="140" />
                        </td>
                         <td style="width: 150px">
                            Title:<br />
                            <asp:TextBox ID="txtTitle" runat="server" Width="140" />
                        </td>
                         <td style="width: 150px">
                            Room:<br />
                            <asp:TextBox ID="txtRoom" runat="server" Width="140" />
                        </td>
                        <td style="width: 150px">
                            <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="InsertEmployee" />
                        </td>
                    </tr>
                </table>
                 <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse">
                    <tr>
                        <td style="width: 150px">
                            <asp:TextBox ID="EmpID" runat="server" Width="140" />
                        </td>
                        <td style="width: 150px">
                            <asp:Button ID="Search" runat="server" Text="Search" OnClick="SearchEmployee" />
                        </td>
                        <td style="width: 150px">
                            <asp:Button ID="ImportXMLData" runat="server" Text="Import XML Data" OnClick="ImportXMLAndDisplayData" />
                        </td>
                    </tr>
                </table>
                 <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" 
                    DataKeyNames="ID" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit"
                    PageSize="5" AllowPaging="true" OnPageIndexChanging="OnPaging" OnRowUpdating="UpdateEmployeeRecord"
                    OnRowDeleting="DeleteEmployeeRecord" EmptyDataText="No records has been added." Width="450">
                    <Columns>
                           <asp:TemplateField HeaderText="ID" ItemStyle-Width="150">
                            <ItemTemplate>
                                <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID") %>' Width="140"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="First Name" ItemStyle-Width="150">
                            <ItemTemplate>
                                <asp:Label ID="lblFirstName" runat="server" Text='<%# Eval("FirstName") %>' Width="140"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtFirstName" runat="server" Text='<%# Eval("FirstName") %>' Width="140"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Last Name" ItemStyle-Width="150">
                            <ItemTemplate>
                                <asp:Label ID="lblLastName" runat="server" Text='<%# Eval("LastName") %>' Width="140"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtLastName" runat="server" Text='<%# Eval("LastName") %>' Width="140"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Division" ItemStyle-Width="150">
                            <ItemTemplate>
                                <asp:Label ID="lblDivision" runat="server" Text='<%# Eval("Division") %>' Width="140"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDivision" runat="server" Text='<%# Eval("Division") %>' Width="140"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Building" ItemStyle-Width="150">
                            <ItemTemplate>
                                <asp:Label ID="lblBuilding" runat="server" Text='<%# Eval("Building") %>' Width="140"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtBuilding" runat="server" Text='<%# Eval("Building") %>' Width="140"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Title" ItemStyle-Width="150">
                            <ItemTemplate>
                                <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Title") %>' Width="140"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtTitle" runat="server" Text='<%# Eval("Title") %>' Width="140"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Room" ItemStyle-Width="150">
                            <ItemTemplate>
                                <asp:Label ID="lblRoom" runat="server" Text='<%# Eval("Room") %>' Width="140"></asp:Label>
                            </ItemTemplate>
                         <EditItemTemplate>
                                <asp:TextBox ID="txtRoom" runat="server" Text='<%# Eval("Room") %>' Width="140"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:CommandField ButtonType="Link" ShowEditButton="true" 
                            ItemStyle-Width="150" />
                        <asp:CommandField ButtonType="Link"  ShowDeleteButton="true"
                            ItemStyle-Width="150" />
                         
                    </Columns>
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>


    </main>
   
</asp:Content>
