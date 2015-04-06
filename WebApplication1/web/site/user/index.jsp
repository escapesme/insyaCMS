<script>
    $(function() {
        $( "#dialog" ).dialog();
    });
</script>
<%@taglib uri="/WEB-INF/tlds/tagslib" prefix="l"%>
<l:userlgoin />
<l:user getData="username" />

<%
    xact.users.users us = new xact.users.users();
    if (us.userReturn(request, "username").equals("")) {
%>    
<div id="dialog" title="login">
    <l:forms type="form" name="login" action="" method="post" />
    <l:forms type="text" title="username" name="username"/>
    <l:forms type="password" title="password" name="password"/>
    <l:forms type="submit" value="gg" title="password" name="password"/>
    <l:forms type="end form" name="" />
</div>
<%}%>

















