<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="section" required="true" type="java.lang.String" %>
<%@ attribute name="name" required="true" type="java.lang.String" %>
<%@ attribute name="id" required="true" type="java.lang.String" %>
<%@ attribute name="baseOption" required="true" type="java.lang.String" %>
<%@ attribute name="value" required="false" type="java.lang.Integer" %>

<c:if test="${baseOption % 2 == 0}">
    <tr>
        <td>${section}</td>
        <td>${name} - View</td>
        <td><input type="checkbox" value="${id}-2" name="feature_list" class="cb-action" <c:if test="${value != null && value % 2 == 0}">checked</c:if> /></td>
    </tr>
</c:if>
<c:if test="${baseOption % 3 == 0}">
    <tr>
        <td>${section}</td>
        <td>${name} - Create</td>
        <td><input type="checkbox" value="${id}-3" name="feature_list" class="cb-action" <c:if test="${value != null && value % 3 == 0}">checked</c:if> /></td>
    </tr>
</c:if>
<c:if test="${baseOption % 5 == 0}">
    <tr>
        <td>${section}</td>
        <td>${name} - Edit</td>
        <td><input type="checkbox" value="${id}-5" name="feature_list" class="cb-action" <c:if test="${value != null && value % 5 == 0}">checked</c:if> /></td>
    </tr>
</c:if>
<c:if test="${baseOption % 7 == 0}">
    <tr>
        <td>${section}</td>
        <td>${name} - Delete</td>
        <td><input type="checkbox" value="${id}-7" name="feature_list" class="cb-action" <c:if test="${value != null && value % 7 == 0}">checked</c:if> /></td>
    </tr>
</c:if>
<c:if test="${baseOption % 11 == 0}">
    <tr>
        <td>${section}</td>
        <td>${name} - Export</td>
        <td><input type="checkbox" value="${id}-11" name="feature_list" class="cb-action" <c:if test="${value != null && value % 11 == 0}">checked</c:if> /></td>
    </tr>
</c:if>