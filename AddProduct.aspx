<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddProduct.aspx.cs" Inherits="AddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class ="container">
       <div class ="form-horizontal">
           
           <br />
           <br />
           <h2>Add Product</h2>
           <hr />

           <div class ="form-group">
               <asp:Label ID="Label1" runat="server" CssClass ="col-md-2 control-label" Text="Proudct Name"></asp:Label>
               <div class ="col-md-3">
                   <asp:TextBox ID="txtProductName" CssClass ="form-control" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator SetFocusOnError="true" ID="txtParoaductNameRequiredFieldValidator1" runat="server" ErrorMessage="ProductName cannot be blank" ControlToValidate="txtProductName" ForeColor="Red"></asp:RequiredFieldValidator>  
           <br />  


               </div>
           </div>

           <div class ="form-group">
               <asp:Label ID="Label2" runat="server" CssClass ="col-md-2 control-label" Text="Price"></asp:Label>
               <div class ="col-md-3">
                   <asp:TextBox ID="txtPrice" CssClass ="form-control" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator SetFocusOnError="true" ID="txtPriceRequiredFieldValidator1" runat="server" ErrorMessage="Price cannot be blank" ControlToValidate="txtPrice" ForeColor="Red"></asp:RequiredFieldValidator>  
           <br />  
               </div>
           </div>


           <div class ="form-group">
               <asp:Label ID="Label3" runat="server" CssClass ="col-md-2 control-label" Text="SellingPrice"></asp:Label>
               <div class ="col-md-3">
                   <asp:TextBox ID="txtsellPrice" CssClass ="form-control" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator SetFocusOnError="true" ID="txtsellPriceRequiredFieldValidator1" runat="server" ErrorMessage="sellPrice cannot be blank" ControlToValidate="txtsellPrice" ForeColor="Red"></asp:RequiredFieldValidator>  
           <br />  
               </div>
           </div>


           <div class ="form-group">
               <asp:Label ID="Label4" runat="server" CssClass ="col-md-2 control-label" Text="Brand"></asp:Label>
               <div class ="col-md-3">
                   <asp:DropDownList ID="ddlBrand" CssClass ="form-control" runat="server"></asp:DropDownList>
               </div>
           </div>



           <div class ="form-group">
               <asp:Label ID="Label5" runat="server" CssClass ="col-md-2 control-label" Text="Category"></asp:Label>
               <div class ="col-md-3">
                   <asp:DropDownList ID="ddlCategory" CssClass ="form-control" AutoPostBack ="true"  runat="server" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged"></asp:DropDownList>
               </div>
           </div>


           <div class ="form-group">
               <asp:Label ID="Label6" runat="server" CssClass ="col-md-2 control-label" Text="SubCategory"></asp:Label>
               <div class ="col-md-3">
                   <asp:DropDownList ID="ddlSubCategory" CssClass ="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSubCategory_SelectedIndexChanged"></asp:DropDownList>
               </div>
           </div>

           <div class ="form-group">
               <asp:Label ID="Label19" runat="server" CssClass ="col-md-2 control-label" Text="Gender"></asp:Label>
               <div class ="col-md-3">
                   <asp:DropDownList ID="ddlGender" CssClass ="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlGender_SelectedIndexChanged"></asp:DropDownList>
               </div>
           </div>

            <div class ="form-group">
               <asp:Label ID="Label7" runat="server" CssClass ="col-md-2 control-label" Text="Size"></asp:Label>
               <div class ="col-md-3">
                   <asp:CheckBoxList ID="cblSize" CssClass ="form-control" RepeatDirection="Horizontal"  runat="server"></asp:CheckBoxList>
               </div>
           </div>

           <div class ="form-group">
               <asp:Label ID="Label20" runat="server" CssClass ="col-md-2 control-label" Text="Quantity"></asp:Label>
               <div class ="col-md-3">
                   <asp:TextBox ID="txtQuantity" CssClass ="form-control" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator SetFocusOnError="true" ID="txtQuantityRequiredFieldValidator1" runat="server" ErrorMessage="Quantity cannot be blank" ControlToValidate="txtQuantity" ForeColor="Red"></asp:RequiredFieldValidator>  
           <br />  
               </div>
           </div>

            <div class ="form-group">
               <asp:Label ID="Label8" runat="server" CssClass ="col-md-2 control-label" Text="Description"></asp:Label>
               <div class ="col-md-3">
                   <asp:TextBox ID="txtDescription" TextMode ="MultiLine"  CssClass ="form-control" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator SetFocusOnError="true" ID="txtDescriptionRequiredFieldValidator1" runat="server" ErrorMessage="Description cannot be blank" ControlToValidate="txtDescription" ForeColor="Red"></asp:RequiredFieldValidator>  
           <br />  
               </div>
           </div>


            <div class ="form-group">
               <asp:Label ID="Label9" runat="server" CssClass ="col-md-2 control-label" Text="Product Details"></asp:Label>
               <div class ="col-md-3">
                   <asp:TextBox ID="txtPDetail" TextMode ="MultiLine" CssClass ="form-control" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator SetFocusOnError="true" ID="txtPDetailRequiredFieldValidator1" runat="server" ErrorMessage="PDetail cannot be blank" ControlToValidate="txtPDetail" ForeColor="Red"></asp:RequiredFieldValidator>  
           <br />  
               </div>
           </div>

           
            <div class ="form-group">
               <asp:Label ID="Label10" runat="server" CssClass ="col-md-2 control-label" Text="Materials and Care"></asp:Label>
               <div class ="col-md-3">
                   <asp:TextBox ID="txtMatCare" TextMode ="MultiLine" CssClass ="form-control" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator SetFocusOnError="true" ID="txtMatCareRequiredFieldValidator1" runat="server" ErrorMessage="MatCare cannot be blank" ControlToValidate="txtMatCare" ForeColor="Red"></asp:RequiredFieldValidator>  
           <br />  
               </div>
           </div>

            <div class ="form-group">
               <asp:Label ID="Label11" runat="server" CssClass ="col-md-2 control-label" Text="Upload Image"></asp:Label>
               <div class ="col-md-3">
                   <asp:FileUpload accept=".png,.jpg,.jpeg" ID="fuImg01" CssClass ="form-control" runat="server" />
               </div>
           </div>

           <div class ="form-group">
               <asp:Label ID="Label12" runat="server" CssClass ="col-md-2 control-label" Text="Upload Image"></asp:Label>
               <div class ="col-md-3">
                   <asp:FileUpload accept=".png,.jpg,.jpeg" ID="fuImg02" CssClass ="form-control" runat="server" />
               </div>
           </div>

           <div class ="form-group">
               <asp:Label ID="Label13" runat="server" CssClass ="col-md-2 control-label" Text="Upload Image"></asp:Label>
               <div class ="col-md-3">
                   <asp:FileUpload accept=".png,.jpg,.jpeg" ID="fuImg03" CssClass ="form-control" runat="server" />
               </div>
           </div>

           <div class ="form-group">
               <asp:Label ID="Label14" runat="server" CssClass ="col-md-2 control-label" Text="Upload Image"></asp:Label>
               <div class ="col-md-3">
                   <asp:FileUpload accept=".png,.jpg,.jpeg" ID="fuImg04" CssClass ="form-control" runat="server" />
               </div>
           </div>



            <div class ="form-group">
               <asp:Label ID="Label15" runat="server" CssClass ="col-md-2 control-label" Text="Upload Image"></asp:Label>
               <div class ="col-md-3">
                   <asp:FileUpload accept=".png,.jpg,.jpeg" ID="fuImg05" CssClass ="form-control" runat="server" />
               </div>
           </div>

            <div class ="form-group">
               <asp:Label ID="Label16" runat="server" CssClass ="col-md-2 control-label" Text="Free Delivery"></asp:Label>
               <div class ="col-md-3">
                   <asp:CheckBox ID="chFD" runat="server" />
               </div>
           </div>


            <div class ="form-group">
               <asp:Label ID="Label17" runat="server" CssClass ="col-md-2 control-label" Text="30 Days Return"></asp:Label>
               <div class ="col-md-3">
                   <asp:CheckBox ID="ch30Ret" runat="server" />
               </div>
           </div>


            <div class ="form-group">
               <asp:Label ID="Label18" runat="server" CssClass ="col-md-2 control-label" Text="COD"></asp:Label>
               <div class ="col-md-3">
                   <asp:CheckBox ID="cbCOD" runat="server" />
               </div>
           </div>


           <div class ="form-group">
                    <div class ="col-md-2 "> </div>
                    <div class ="col-md-6 ">

                        <asp:Button ID="btnAdd" CssClass ="btn btn-success " runat="server" Text="ADD Product" OnClick="btnAdd_Click"  />
                        
                    </div>
                </div>

       </div>

    </div>

    <div class="container">
   
   <hr />
    <div class="panel panel-primary">
      <div class="panel-heading"><h2>Product Report</h2> </div>
      <div class="panel-body">
           <div class="col-md-12">
              <div class="form-group">
                <div class="table table-responsive">
                    <asp:GridView ID="GridView1" OnRowDeleting="RowDeleting" runat="server" CssClass="table" AutoGenerateColumns="false">
                    <Columns>  
                        <asp:BoundField DataField="pid" HeaderText="ProductId" />
                        <asp:BoundField DataField="pname" HeaderText="Product Name" />  
                        <asp:BoundField DataField="pprice" HeaderText="Purchase Price" />  
                        <asp:BoundField DataField="PSelPrice" HeaderText="Sell Price" />
                        <asp:CommandField ShowEditButton="true" />  
                        <asp:CommandField ShowDeleteButton="true" />
                        
                         </Columns> 
                    </asp:GridView>
                </div>
              
              
              </div>
           
           </div>
      
      
      </div>
      <div class="panel-footer">
        <!-- <div class ="form-group">
            <asp:Label ID="Label13Del" runat="server" CssClass ="col-md-2 control-label" Text="ProductId"></asp:Label>
                <asp:TextBox ID="ProductId" CssClass ="form-control" runat="server"></asp:TextBox>
                <asp:Button ID="btnDel" CssClass ="btn btn-success " runat="server" Text="Delete Product" OnClick="deleteProduct"  />

        </div> -->

      </div>
    </div>
    
</div>
</asp:Content>

