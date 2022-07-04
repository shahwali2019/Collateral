<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="Collateral_int.WebForm2" %>
<asp:Content ID="Content1" ContentplaceholderID="MainContent" runat="server">
    <br />
    <br />

    <asp:TextBox ID="txtTimeSlotGroupName" runat="server" AutoPostBack="false" 
     ClientIDMode="Static"></asp:TextBox>  
<asp:RequiredFieldValidator ID="RequiredFieldValidator_txtTimeSlotGroupName"
     runat="server" ControlToValidate="txtTimeSlotGroupName" Display="None"
     ErrorMessage="Timeslot Group Required!" ForeColor="Red" InitialValue="0"
     ValidationGroup="TimeSlot"></asp:RequiredFieldValidator>
    <br />
    <asp:Button ID="btnAddTimeSlots" Text="Add Timeslots" CssClass="button" 
     runat="server" OnClick="btnAddTimeSlots_Click" ValidationGroup="TimeSlot" 
     OnClientClick="javascript:shouldsubmit=true;"/>

</asp:Content>
