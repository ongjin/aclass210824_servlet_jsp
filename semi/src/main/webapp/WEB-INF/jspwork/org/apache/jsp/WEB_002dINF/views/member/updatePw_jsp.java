/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.73
 * Generated at: 2021-12-09 02:47:32 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.member;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class updatePw_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("	");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../common/header.jsp", out, false);
      out.write("\r\n");
      out.write("	\r\n");
      out.write("	<div class=\"container\" id=\"content-main\"  style=\"min-height:700px\" >\r\n");
      out.write("\r\n");
      out.write("		<div class=\"row my-5\">\r\n");
      out.write("			");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "sideMenu.jsp", out, false);
      out.write("\r\n");
      out.write("\r\n");
      out.write("			<div class=\"col-sm-8\">\r\n");
      out.write("				<h3>비밀번호 변경</h3>\r\n");
      out.write("				<hr>\r\n");
      out.write("				<div class=\"bg-white rounded shadow-sm container p-3\">\r\n");
      out.write("					<form method=\"POST\" action=\"updatePw\" onsubmit=\"return updatePwValidate();\" class=\"form-horizontal\" role=\"form\">\r\n");
      out.write("						<!-- 아이디 -->\r\n");
      out.write("						<div class=\"row mb-3 form-row\">\r\n");
      out.write("							<div class=\"col-md-3\">\r\n");
      out.write("								<h6>아이디</h6>\r\n");
      out.write("							</div>\r\n");
      out.write("							<div class=\"col-md-6\">\r\n");
      out.write("								<h5 id=\"id\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${loginMember.memberId }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</h5>\r\n");
      out.write("							</div>\r\n");
      out.write("						</div>\r\n");
      out.write("\r\n");
      out.write("						<hr>\r\n");
      out.write("						<!-- 현재 비밀번호 -->\r\n");
      out.write("						<div class=\"row mb-3 form-row\">\r\n");
      out.write("							<div class=\"col-md-3\">\r\n");
      out.write("								<h6>현재 비밀번호</h6>\r\n");
      out.write("							</div>\r\n");
      out.write("							<div class=\"col-md-6\">\r\n");
      out.write("								<input type=\"password\" class=\"form-control\" id=\"currentPw\" name=\"currentPw\">\r\n");
      out.write("							</div>\r\n");
      out.write("						</div>\r\n");
      out.write("\r\n");
      out.write("						<!-- 새 비밀번호 -->\r\n");
      out.write("						<div class=\"row mb-3 form-row\">\r\n");
      out.write("							<div class=\"col-md-3\">\r\n");
      out.write("								<h6>새 비밀번호</h6>\r\n");
      out.write("							</div>\r\n");
      out.write("							<div class=\"col-md-6\">\r\n");
      out.write("								<input type=\"password\" class=\"form-control\" id=\"newPw1\" name=\"newPw1\">\r\n");
      out.write("							</div>\r\n");
      out.write("						</div>\r\n");
      out.write("\r\n");
      out.write("						<!-- 새 비밀번호 확인-->\r\n");
      out.write("						<div class=\"row mb-3 form-row\">\r\n");
      out.write("							<div class=\"col-md-3\">\r\n");
      out.write("								<h6>새 비밀번호 확인</h6>\r\n");
      out.write("							</div>\r\n");
      out.write("							<div class=\"col-md-6\">\r\n");
      out.write("								<input type=\"password\" class=\"form-control\" id=\"newPw2\" name=\"newPw2\">\r\n");
      out.write("							</div>\r\n");
      out.write("						</div>\r\n");
      out.write("						\r\n");
      out.write("						<hr class=\"mb-4\">\r\n");
      out.write("						<button class=\"btn btn-primary btn-lg btn-block\" type=\"submit\">변경하기</button>\r\n");
      out.write("					</form>\r\n");
      out.write("				</div>\r\n");
      out.write("			</div>\r\n");
      out.write("		</div>\r\n");
      out.write("	</div>\r\n");
      out.write("	");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../common/footer.jsp", out, false);
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("	<script>\r\n");
      out.write("		// 비밀번호 유효성 검사\r\n");
      out.write("		function updatePwValidate(){\r\n");
      out.write("			\r\n");
      out.write("			// 새 비밀번호/확인에 작성된 값을 변수에 저장\r\n");
      out.write("			const newPw1 = document.getElementById(\"newPw1\").value;\r\n");
      out.write("			const newPw2 = document.getElementById(\"newPw2\").value;\r\n");
      out.write("			\r\n");
      out.write("			// 1) 새 비밀번호가 정규식에 맞지 않은 경우\r\n");
      out.write("			const regExp = /^[a-zA-Z\\d\\!\\@#\\-\\_]{6,20}$/;\r\n");
      out.write("			\r\n");
      out.write("			if( !regExp.test(newPw1)  ){\r\n");
      out.write("				alert(\"새 비밀번호가 유효하지 않습니다.\");\r\n");
      out.write("				return false;\r\n");
      out.write("			}\r\n");
      out.write("			\r\n");
      out.write("			// 2) 새 비밀번호/확인 같지 않은 경우\r\n");
      out.write("			if(newPw1 != newPw2){\r\n");
      out.write("				alert(\"새 비밀번호가 일치하지 않습니다.\");\r\n");
      out.write("				return false;\r\n");
      out.write("			}\r\n");
      out.write("			\r\n");
      out.write("			\r\n");
      out.write("			\r\n");
      out.write("		}\r\n");
      out.write("	</script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
