<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true"
    CodeFile="ViewProduct.aspx.cs" Inherits="ViewProduct" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="container">
            <hr />
            <div class="panel panel-primary" style='margin-top: 100px;'>
                <div class="panel-heading">
                    <h2>Product Report</h2>
                </div>
                <div class="panel-body">
                    <div class="col-md-12">
                        <div class="form-group">
                            <div class="table table-responsive">
                                <asp:GridView ID="GridView1" OnRowEditing='RowEditing' OnRowUpdating='RowUpdating' OnRowDeleting="RowDeleting" runat="server" CssClass="table"
                                    AutoGenerateColumns="false">
                                    <Columns>
                                        <asp:BoundField DataField="pname" HeaderText="Product Name" />
                                        <asp:BoundField DataField="pprice" HeaderText="Purchase Price" />
                                        <asp:BoundField DataField="PSelPrice" HeaderText="Sell Price" />
                                        <asp:CommandField ShowEditButton="true" />
                                        <asp:CommandField ShowDeleteButton="true" />
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <div align="center">No Products.Please add.</div>
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-footer">

                </div>
            </div>
        </div>
    </asp:Content>