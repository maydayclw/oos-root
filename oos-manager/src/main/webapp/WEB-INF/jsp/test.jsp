<%@ page language="java" import="java.sql.*,java.io.*,java.util.*" import="com.mysql.jdbc.Driver"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="GBK" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js">
<head>
  <meta charset="gb2312">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>�Ĵ���ȫ�������ļ����鼼�����񱨸����ϵͳ</title>
  <meta name="description" content="����һ�� table ҳ��">
  <meta name="keywords" content="table">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="assets/css/admin.css">
</head>
<body>
  <!-- content start -->
      <%  
        //����������   
        String driverName = "com.mysql.jdbc.Driver";  
        //���ݿ��û���   
        String userName = "root";  
        //����   
        String userPasswd = "123456";  
        //���ݿ���   
        String dbName = "db_report";  
        //����   
        String tableName = "user";  
        //�����ַ���   
        String url = "jdbc:mysql://localhost:3306/" + dbName + "?user="  
                + userName + "&password=" + userPasswd;  
        Class.forName("com.mysql.jdbc.Driver").newInstance();  
        Connection connection = DriverManager.getConnection(url);  
        Statement statement = connection.createStatement();  
        String sql = "SELECT * FROM " + tableName;  
        ResultSet rs = statement.executeQuery(sql);  
    %> 
<!--[if lte IE 9]>
<p class="browsehappy">������ʹ��<strong>��ʱ</strong>�������������ϵͳ �ݲ�֧�֡� �� <a href="http://browsehappy.com/" target="_blank">���������</a>
  �Ի�ø��õ����飡</p>
<![endif]-->

<header class="am-topbar am-topbar-inverse admin-header">
  <div class="am-topbar-brand">
    <strong>�Ĵ���ȫ�������ļ����鼼�����񱨸����ϵͳ</strong>
  </div>

  <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">�����л�</span> <span class="am-icon-bars"></span></button>

  <div class="am-collapse am-topbar-collapse" id="topbar-collapse">
 
    <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
 <li><a href="javascript:;"><span class="am-icon-envelope-o"></span> �ռ��� <span class="am-badge am-badge-warning">0</span></a></li>
      <li class="am-dropdown" data-am-dropdown>
        <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
          <span class="am-icon-users"></span> ����Ա <span class="am-icon-caret-down"></span>
        </a>
        <ul class="am-dropdown-content">
          
          <li><a href="#"><span class="am-icon-power-off"></span> �˳�</a></li>
        </ul>
      </li>
    </ul>
  </div>
</header>

<div class="am-cf admin-main">
  <!-- sidebar start -->
  <div class="admin-sidebar am-offcanvas" id="admin-offcanvas" style="overflow-y:hidden">
    <div class="am-offcanvas-bar admin-offcanvas-bar">
      <ul class="am-list admin-sidebar-list">
        <li><a href="����Ա����.jsp"><span class="am-icon-user"></span>�û���Ϣ</a></li>
        <li><a href="��ͬ��Ϣ.jsp"><span class="am-icon-table"></span>��ͬ��Ϣ</a></li>
        <li><a href="�û�����.jsp"><span class="am-icon-pencil-square-o am-text-primary"></span><span class="am-text-primary"> �û�����</span></a></li>

      </ul>

      <div class="am-panel am-panel-default admin-sidebar-panel">
        <div class="am-panel-bd">
          <p>��ӭʹ���Ĵ���ȫ�������ļ����鼼�����񱨸����ϵͳ����л�������ǵ�֧�֡�
          </p>
        </div>
      </div>

    </div>
  </div>
  <!-- sidebar end -->


  <div class="admin-content" >
   <div style='position:relative;z-index:999;top:0;'>
    <div class="admin-content-body">
      <div class="am-cf am-padding am-padding-bottom-0" style="float: left">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">�û�����</strong></div>
      </div>
      <div class="am-u-sm-3 am-u-md-3" style="float: right;margin-top: 15px">
            <button class="am-btn am-btn-primary" type="button" id="doc-prompt-toggle"><span class="am-icon-plus"></span>&nbsp;&nbsp;�����û�</button>
        </div>
      </div>
<div style="clear:both;"></div>
      <hr>
      <div class="am-g">
        <div class="am-u-sm-12">
          <form class="am-form">
            <table class="am-table am-table-striped am-table-hover table-main">
              <thead>
              <tr>
               <th class="table-id" style="width: 150px">id</th><th class="table-title">�û�����</th><th>�˺�</th><th class="table-type">Email</th><th>�û�����</th><th>����</th>
              </tr>
              </thead>
              <tbody>
   
        <tr> 

            <td>  
                <%=rs.getString("id") %>
            </td>  
            <td>  
                <%=rs.getString("username") %> 
            </td>  
            <td>  
                <%=rs.getString("count") %>  
            </td>  
            <td>  
                <%=rs.getString("Email") %>  
            </td> 
            <td>  
                <%=rs.getString("user_type") %>  
            </td>  
              } 
               <td>
                  <div class="am-btn-toolbar">
                    <div class="am-btn-group am-btn-group-xs">

                      <button class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"><span class="am-icon-trash-o"></span> ɾ��</button>
                    </div>
                  </div>
                </td>
              </tr>    
    <%
        rs.close();  
        statement.close();  
        connection.close();  
    %> 
              <tr>
                <td>3001</td>
                <td>����Ա</td>
                <td>worker</td>
                <td>jishu@163.com</td>
                <td>03</td>
                <td>
                  <div class="am-btn-toolbar">
                    <div class="am-btn-group am-btn-group-xs">

                      <button class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"><span class="am-icon-trash-o"></span> ɾ��</button>
                    </div>
                  </div>
                </td>
              </tr>
              <tr>
                <td>4001</td>
                <td>���Ա</td>
                <td>���</td>
                <td>shenhe@163.com</td>
                <td>04</td>
                <td>
                  <div class="am-btn-toolbar">
                    <div class="am-btn-group am-btn-group-xs">

                      <button class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"><span class="am-icon-trash-o"></span> ɾ��</button>
                    </div>
                  </div>
                </td>
              </tr>

              </tbody>
            </table>
            <br></br>
            <br></br>
            <br>
            <div class="am-cf">
              �� 3 ����¼
              <div class="am-fr">
                <ul class="am-pagination">
                  <li class="am-disabled"><a href="#">��ǰ</a></li>
                  <li class="am-active"><a href="#">1</a></li>

                </ul>
              </div>
            </div>
            <footer class="admin-content-footer">
              <hr>
              <p class="am-padding-left">Copyright @�Ĵ���ȫ�������ļ����鼼�����񱨸����ϵͳ<br>
               </p>
            </footer>
          </form>
        </div>

      </div>
    </div>
   </div>
  </div>
  <!-- content end -->
</div>

<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>
<div class="am-modal am-modal-prompt" tabindex="-1" id="my-prompt">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">�����û�</div>
    <div class="am-modal-bd">
      <form class="am-form am-form-horizontal">
        <div class="am-form-group">
          <label for="doc-select-1" class="am-u-sm-4 am-form-label">�û�����</label>
          <div class="am-u-sm-8">
            <select id="doc-select-1">
              <option value="option1">��ҵ</option>
              <option value="option2">����Ա</option>
              <option value="option3">���Ա</option>
            </select>
            <span class="am-form-caret"></span>
          </div>
        </div>
        <div class="am-form-group">
          <label for="doc-ipt-3" class="am-u-sm-4 am-form-label">id</label>
          <div class="am-u-sm-8">
            <input type="text" >
          </div>
        </div>
        <div class="am-form-group">
          <label for="doc-ta-1" class="am-u-sm-4 am-form-label">�û�����</label>
          <div class="am-u-sm-8">
            <textarea class="" rows="1" id="doc-ta-1"></textarea>
          </div>
        </div>
        <div class="am-form-group">
          <label for="doc-ta-1" class="am-u-sm-4 am-form-label">�˺�</label>
          <div class="am-u-sm-8">
            <input type="text" >
          </div>
        </div>
        <div class="am-form-group">
          <label for="doc-ta-1" class="am-u-sm-4 am-form-label">����</label>
          <div class="am-u-sm-8">
            <input type="text" >
          </div>
        </div>
        <div class="am-form-group">
          <label for="doc-ta-1" class="am-u-sm-4 am-form-label">Email</label>
          <div class="am-u-sm-8">
            <input type="text" >
          </div>
        </div>


      </form>

    </div>
    <div class="am-modal-footer">
      <span class="am-modal-btn" data-am-modal-cancel>ȡ��</span>
      <span class="am-modal-btn" data-am-modal-confirm>�ύ</span>
    </div>
  </div>
</div>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="assets/js/jquery.min.js"></script>
<!--<![endif]-->
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/app.js"></script>
<script>
  $(function() {
    $('#doc-prompt-toggle').on('click', function() {
      $('#my-prompt').modal({
        relatedTarget: this,
        onConfirm: function(e) {
          //ȷ��
        },
        onCancel: function(e) {
          //ȡ��
        }
      });
    });
  });
</script>
</body>
</html>
