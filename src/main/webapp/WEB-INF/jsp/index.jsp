<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="ui" tagdir="/WEB-INF/tags" %>

<ui:templete>
    <jsp:attribute name="head_area"/>
    <jsp:attribute name="body_area">

<!-- Basic Card Example -->
                            <div class="card shadow mb-4">
                            <c:choose>
                                  <c:when test='${empty(user)}'>
                                <div class="card-header py-3">                                 
                                    <h6 class="m-0 font-weight-bold text-primary">Driveup Url Uploader</h6>
                                </div>
                                <div class="card-body">
                                   <p style="font-size: 18px; color: white">Welcome to Driveup GDrive Url Uploader</p>
				<p style="font-size: 15px; color: white">This site has no registration service or user limits.</p> 
				<p style="font-size: 15px; color: white">Once you login your Google Drive account you can upload any file from it's URL to your Google Drive Account.</p>
				<p style="font-size: 15px; color: white">Please Note: This site only supports direct links.</p>
				<p style="font-size: 15px; color: white">We do not save any of your data and once server restarts auth codes are cleared from our database too.</p><br>
                                </div>
                                 </c:when>
                        	<c:otherwise>	
                            <div class="card-header py-3">                                 
                                    <h6 class="m-0 font-weight-bold text-primary">Driveup Url Uploader</h6>
                                </div>
                                <div class="card-body">
                                    Congratulations! You are successfully authenticated using your Google account: <c:out value="${user.email}"/>.
                                    <button id="auth-btn" class="btn btn-link btn-responsive" style="font-size: larger;" onclick="location.href = '${pageContext.request.contextPath}/new_upload'">
                                     Click Here to Upload Files to your Drive.
                                 </button><br>
                                </div>
                            </div>
                            </c:otherwise>
	                    </c:choose>                                                    
                        </div>
                        </jsp:attribute>
</ui:templete>
