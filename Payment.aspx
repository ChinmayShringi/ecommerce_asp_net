<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Payment.aspx.cs"
    Inherits="Payment" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <asp:HiddenField ID="hdCartAmount" runat="server" />
        <asp:HiddenField ID="hdCartDiscount" runat="server" />
        <asp:HiddenField ID="hdTotalPayed" runat="server" />
        <asp:HiddenField ID="hdPidSizeID" runat="server" />
        <br />
        <br />
        <button id="btnCart2" runat="server" class="btn btn-primary navbar-btn pull-right"
            onserverclick="btnCart2_ServerClick" type="button">
            Cart <span id="CartBadge" runat="server" class="badge">0</span>
        </button>
        <br />
        <div class="row" style="padding-top: 20px;">
            <div class="col-md-9">
                <div class="form-horizontal">
                    <h3>Delivery Address</h3>
                    <hr />
                    <div class="form-group">
                        <asp:Label ID="Label1" runat="server" CssClass="control-label" Text="Name"></asp:Label>
                        <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" CssClass="text-danger"
                            runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtName">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label2" runat="server" CssClass="control-label" Text="Address"></asp:Label>
                        <asp:TextBox ID="txtAddress" TextMode="MultiLine" CssClass="form-control" runat="server">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server"
                            ErrorMessage="This field is Required !" ControlToValidate="txtAddress">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label3" runat="server" CssClass="control-label" Text="Pin Code"></asp:Label>
                        <asp:TextBox ID="txtPinCode" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="text-danger" runat="server"
                            ErrorMessage="This field is Required !" ControlToValidate="txtPinCode">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label4" runat="server" CssClass="control-label" Text="Mobile Number"></asp:Label>
                        <asp:TextBox ID="txtMobileNumber" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="text-danger" runat="server"
                            ErrorMessage="This field is Required !" ControlToValidate="txtMobileNumber">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div>
                    <asp:GridView ID="gvProducts" runat="server" CssClass="col-md-12" AutoGenerateColumns="false"
                        Visible="false" CellPadding="6" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                        <Columns>
                            <asp:BoundField DataField="PID" HeaderText="Product ID" />
                            <asp:BoundField DataField="PName" HeaderText="Product Name" />
                            <asp:BoundField DataField="Qty" HeaderText="Quantity" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <div class="col-md-3" runat="server" id="divPriceDetails">
                <div style="border-bottom: 1px solid #eaeaec;">
                    <h5 class="proNameViewCart">PRICE DETAILS</h5>
                    <div>
                        <label>Cart Total</label>
                        <span class="float-right priceGray" id="spanCartTotal" runat="server"></span>
                    </div>
                    <div>
                        <label>Cart Discount</label>
                        <span class="float-right priceGreen" id="spanDiscount" runat="server"></span>
                    </div>
                </div>
                <div>
                    <div class="proPriceView">
                        <label>Total</label>
                        <span class="float-right" id="spanTotal" runat="server"></span>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <h3>Choose Payment Mode</h3>
                <hr />
                <ul class="nav nav-tabs">
                    <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#wallets">WALLETS</a></li>
                    <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#cards">CREDIT/DEBIT CARDS</a></li>
                    <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#cod">COD</a></li>
                </ul>
                <div class="tab-content">
                    <div id="wallets" class="tab-pane fade show active">
                        <div class="container" style='margin-top: 20px;'>
                            <asp:Button ID="btnPaytm" OnClick="btnPaytm_Click" runat="server" Text="Pay with Paytm" />
                        </div>
                    </div>
                    <div id="cards" class="tab-pane fade">
                        <div class="container">
                            <div class="row">
                                <!-- You can make it whatever width you want. I'm making it full width
             on <= small devices and 4/12 page width on >= medium devices -->
                                <div class="col-xs-12 col-md-4">
                                    <!-- CREDIT CARD FORM STARTS HERE -->
                                    <div class="panel panel-default credit-card-box">
                                        <div class="panel-heading display-table">
                                            <div class="row display-tr">
                                                <h3 class="panel-title display-td">Payment Details</h3>
                                                <div class="display-td">
                                                    <img class="img-responsive pull-right"
                                                        src="http://i76.imgup.net/accepted_c22e0.png">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel-body">
                                            <form role="form" id="payment-form" method="POST"
                                                action="javascript:void(0);">
                                                <div class="row">
                                                    <div class="col-xs-12">
                                                        <div class="form-group">
                                                            <label for="cardNumber">CARD NUMBER</label>
                                                            <div class="input-group">
                                                                <input type="tel" class="form-control" name="cardNumber"
                                                                    placeholder="Valid Card Number"
                                                                    autocomplete="cc-number" />
                                                                <span class="input-group-addon"><i
                                                                        class="fa fa-credit-card"></i></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-xs-7 col-md-7">
                                                        <div class="form-group">
                                                            <label for="cardExpiry"><span
                                                                    class="hidden-xs">EXPIRATION</span><span
                                                                    class="visible-xs-inline">EXP</span> DATE</label>
                                                            <input type="tel" class="form-control" name="cardExpiry"
                                                                placeholder="MM / YY"   />
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-5 col-md-5 pull-right">
                                                        <div class="form-group">
                                                            <label for="cardCVC">CV CODE</label>
                                                            <input type="tel" class="form-control" name="cardCVC"
                                                                placeholder="CVC"   />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-xs-12">
                                                        <div class="form-group">
                                                            <label for="couponCode">COUPON CODE</label>
                                                            <input type="text" class="form-control" name="couponCode" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-xs-12">
                                                        <asp:Button ID="BtnPlaceNPay12"
                                                            CssClass="subscribe btn btn-success btn-lg btn-block"
                                                            Font-Size="Large" ValidationGroup="PaymentPage"
                                                            runat="server" OnClick="BtnPlaceNPay_Click"
                                                            Text="Place Order" />
                                                    </div>
                                                </div>
                                                <div class="row" style="display:none;">
                                                    <div class="col-xs-12">
                                                        <p class="payment-errors"></p>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <!-- CREDIT CARD FORM ENDS HERE -->
                                </div>
                                <div class="col-xs-12 col-md-8" style="font-size: 12pt; line-height: 2em;">
                                    <p>
                                    <h1>Features:</h1>
                                    <ul>
                                        <li>As-you-type, input formatting</li>
                                        <li>Form field validation (also as you type)</li>
                                        <li>Graceful error feedback for declined card, etc</li>
                                        <li>AJAX form submission w/ visual feedback</li>
                                        <li>Creates a Stripe credit card token</li>
                                    </ul>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="cod" class="tab-pane fade">
                        <h3>Cash on delivery</h3>
                        <h3>Pay easily with cash! Order Away!</h3>

                        <div class="tab-content">
                            <div id="PlaceNPay" class="tab-pane fade in active">
                                <p>Place your order and Pay using our <a 
                                        target="_blank">Accepted
                                        Payments</a> channels, Your order will be dispatched upon receiving full
                                    payment.</p>
                                <asp:Button ID="BtnPlaceNPay" CssClass=" btn btn-info" Font-Size="Large"
                                    ValidationGroup="PaymentPage" runat="server" OnClick="BtnPlaceNPay_Click"
                                    Text="Checkout &raquo;" />
                            </div>
                            <div id="EasyPaisa" class="tab-pane fade">
                                <h3 class="center1">EasyPaisa Payment Gateway Coming Soon</h3>
                                <h4 class="center1">Until that you can send amount @ 0311 0000193</h4>
                                <!--  <asp:Button ID="btnEasyPaisa" CssClass=" btn btn-success" Font-Size="Large" runat="server" Text="Pay with EasyPaisa &raquo;" /> -->
                            </div>
                            <div id="JazzCash" class="tab-pane fade">
                                <h3 class="center1">JazzCash Payment Gateway Coming Soon</h3>
                                <h4 class="center1">Until that you can send amount @ 0300 1888193</h4>
                                <!-- <asp:Button ID="btnJazzCash" CssClass="btn btn-danger" runat="server" Font-Size="Large" Text="Pay with JazzCash &raquo;" /> -->
                            </div>
                            <div id="Div1" class="tab-pane fade">
                                <h3 class="center1">Cash on Delivery - Coming Soon</h3>
                                <!-- <asp:Button ID="btnCOD" CssClass="btn btn-primary" runat="server" Text="CheckOut &raquo;" Font-Size="Large" /> -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </asp:Content>