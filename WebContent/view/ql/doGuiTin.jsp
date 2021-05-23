<%@page import="java.lang.ProcessBuilder.Redirect,java.sql.Timestamp"%>
<%@page import="java.net.InetAddress,java.util.Properties,javax.mail.*,javax.mail.internet.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, java.util.Date, dao.*,model.*"%>

<%
	ArrayList<Customer> listCustomer = (ArrayList<Customer>) session.getAttribute("listCusSend");
	String idString = request.getParameter("id");
	int id = 0;
	if (idString != null) {
		id = Integer.parseInt(idString);
	} 
	String str2[]={};
	if (id==2){
	str2=request.getParameterValues("message1");
	}
	String ontime[];
	String onday[];
	String cutday[];
	String cuttime[];
	String str1="";
	String str0="";
	if (id==1){
		ontime = request.getParameterValues("ontime");
		cuttime = request.getParameterValues("cuttime");
		onday = request.getParameterValues("onday");
		cutday= request.getParameterValues("cutday");
  		str1="Chào bạn!\n Chúng tôi rất xin lỗi khi phải thông báo điều này với bạn. Nước sẽ bị cắt từ thời điểm: "+cuttime[0]+" ngày "+cutday[0]+" đến thời điểm :"+ontime[0]+" ngày "+onday[0]+". Mong nhận được sự thông cảm từ các bạn";
		}
  	for (int i=0;i < listCustomer.size();i++){
  		PaymentDAO paymentDAO = new PaymentDAO();
  		ArrayList<Payment> listPayment = paymentDAO.getPaymentbyId(String.valueOf(listCustomer.get(i).getId())) ;
  		float tongtien=0;
  		if (listPayment.size()>0){
  		Timestamp issue_time = listPayment.get(listPayment.size()-1).getIssue_time();
  		for (int j=0;j<listPayment.size();j++) tongtien+=listPayment.get(j).getPrice();
  		str0="Chào bạn!\nTiền nước đến ngày "+issue_time+" của bạn là: "+tongtien+". Hãy đến địa điểm gần nhất để đóng tiền.\n Sau 10 ngày kể từ ngày nhận thông báo, nếu chủ hộ chưa đóng tiền, công ty sẽ tiến hành cắt nước.\n Xin chân thành cảm ơn"; 
  		} else { str0="Bạn đã thanh toán hoá đơn thành công";}
  		final String username = "aquamansqa2021@gmail.com";
		final String password = "Abcd1235";
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
		Session sessio = Session.getInstance(props, new javax.mail.Authenticator() {
		    protected PasswordAuthentication getPasswordAuthentication() {
		        return new PasswordAuthentication(username, password);
		    }
		});

		Message mess = new MimeMessage(sessio);
		mess.setFrom(new InternetAddress(listCustomer.get(i).getEmail()));
		mess.setRecipients(Message.RecipientType.TO, 
				InternetAddress.parse(listCustomer.get(i).getEmail(),false));
		if (id==1) {
			mess.setSubject("Thông báo thời gian cắt nước");
			mess.setText(str1);
		} else if (id==0) {
			mess.setSubject("Thông báo hoá đơn tiền nước");
			mess.setText(str0);
		} else {
			mess.setSubject("Thông báo của công ty nước địa phương");
			mess.setText(str2[0]);
		}
		
		mess.setSentDate(new Date());
		try {
			Transport.send(mess);
	   } catch(MessagingException e) {
		   System.out.println("Messaging Exception:  "+e);
	   }
  	} 
  	
    String redirectURL = "GDChinhNVQuanly.jsp?result=SMSuccess";
    response.sendRedirect(redirectURL);
	
%>
<script>
function myFunction() {
  alert("Hello\nHow are you?");
}
</script>