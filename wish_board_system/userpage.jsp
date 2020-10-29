
<html><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>User_page</title>
<style>
    body{
        background: linear-gradient(rgba(111, 171, 208, 0.56), rgba(138, 165, 175, 0.8)), url("wb3.jpg");
        background-size:cover;	
}

img{
    width:110px;
    height:110px;
    border:aliceblue;
    border-radius:30px;
    opacity: 0.8;
    margin-top: 1px;
}

td{
	font-size:20px;	
    font-style:TimesNewRoman;
    color: gold;
}
.sec1{
    float: left;
    width: 88%;
}
.sec2{
    float: right;
    width: 10%;
}
.bothsec{
    border-style: solid solid solid solid;
    height: 18%;
}
.mid1{
    float:left;
    width: 20%;
    height:78%;
    margin: 0 1%;
    border: 2px solid black;
}
.mid2{
    float:left;
    width:50%;
    height:78%;
    margin: 0 1%;
    border: 2px solid black;
    border-bottom: none;
}
.mid3{
    float:left;
    width:20%;
    height:78%;
    margin: 0 1%;
    border: 2px solid black;
}

h3{
    margin-top: 2%;
    text-align: center;
}
.id{
    float:inherit;

}
table{
    border-spacing: 2mm;
    height:auto;
    width:auto;
}
.wish{    
    width: 68%;
    height: 20%;
    margin-left: 16%;
    background-color: cyan;
    font-size: 18px;
    cursor: pointer;
    border-radius: 25%;
}
.logout{
    width:46%;
    height: 8%;
    margin-left: 24%;
    
    background-color: cyan;
    cursor: pointer;
    border-radius: 25%;
}
.wish:hover,.viewresponse:hover{
    background-color: aliceblue;
}
iframe{
    border-top: 1cm;
    width: 100%;
    height: 100%;
    scrollbar-track-color: aqua;
}
.iframe_res{
    width: 95%;
    height: 75%;
} 
.gifimg{
    width: 90%;
    height: 45%;
    margin-left: 6%;
}
.iframe_timeline{
    
}
</style>
</head>

<body>
    <%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%String userid =(String) session.getAttribute("uid");%>
  <% 
response.setContentType("text/html");
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wish","website","12345678");
PreparedStatement ps= con.prepareStatement("Select * from usertable where userid=?");
ps.setString(1, userid);
ResultSet rs=ps.executeQuery();
if(rs.next())
{
    String fname=rs.getString("firstname");
    String lname=rs.getString("lastname");
    String regno=rs.getString("regno");
    String uid=rs.getString("userid");

  %>
    <div class="bothsec">
    <section class="sec1">
        <table>
           <tr>
               <td>Name:</td>
               <td><%out.println(fname);out.println(" "+lname);%></td>
            </tr> 
           <tr>
               <td> Rating:</td>
               <td>89</td>
               <td colspan="3" class="specialtd">UserID:</td>
               <td><%out.println(uid);%></td>
            </tr> 
            <tr>
                <td>Reg.No:</td>
                <td><%out.println(regno);%></td>
            </tr>
        </table>
<%
}
con.close();
}
catch (Exception e) {
out.print(e+"hai ");
}
%>
    </section>
    <section class="sec2">  
        <img src="log_in_files/logo.png" > <!--width="auto" height="auto"-->
    </section>
    </div>

    <div class="mid1">
        <h3><u>Responses from</u></h3>
        <iframe src="Responses.jsp" frameborder="1" class="iframe_res"></iframe>
        <input class="logout" type="button" value="LogOut" onclick="window.location.href='wish_board.html'">
    </div>

    <div class="mid2">
            <h3><u>TimeLine</u></h3>
            <iframe src="timeline.jsp" frameborder="1" name="iframe_timeline"></iframe>

    </div>

    <div class="mid3">
            <h3><u>Wish panel</u></h3>
            <input class="wish" type="button" value="Enter wish" onclick="window.location.href='enter_wish.html'"><br><br>
            <input class="wish" type="button" value="Delete wish" onclick="window.location.href='edit_wish_1.jsp'">
            <img class="gifimg" src="log_in_files/ideaperson.gif" alt="opps!!..noimage">
    </div>
</body></html>