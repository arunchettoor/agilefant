<%@ include file="../inc/_taglibs.jsp"%>

<aef:productList />
<%--<aef:projectTypeList id="projectTypes"/>--%>

<ww:date name="%{new java.util.Date()}" id="start"
	format="%{getText('struts.shortDateTime.format')}" />
<ww:date name="%{new java.util.Date()}" id="end"
	format="%{getText('struts.shortDateTime.format')}" />

<div class="validateWrapper validateNewProject">
<form action="ajax/storeNewProject.action" method="post">
	<div id="editProjectForm">
			<ww:hidden name="projectId" id="createProject_backlogId" value="0" />
			<table class="formTable">
				<tr>
					<td>Name</td>
					<td>*</td>
					<td colspan="2"><ww:textfield size="60" name="project.name" /></td>
				</tr>
				<tr>
        
					<td>Product</td>
					<td>*</td>
					<td colspan="2"><select name="productId">
						<option class="inactive" value="">(select product)</option>
						<c:forEach items="${productList}" var="product">
							<c:choose>
								<c:when test="${product.id == productId}">
									<option selected="selected" value="${product.id}"
										title="${product.name}" class="productOption">${aef:out(product.name)}</option>
								</c:when>
								<c:otherwise>
									<option value="${product.id}" title="${product.name}"
										class="productOption">${aef:out(product.name)}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select></td>
				</tr>
        <%--
				<tr>
					<td>Project type</td>
					<td></td>
					<td colspan="2">
						<ww:select headerKey="0" headerValue="(undefined)"
							name="project.projectType.id"
							list="#attr.projectTypes" listKey="id" listValue="name"
							value="%{project.projectType.id}" />
					</td>
				</tr>
        --%>
				<tr>
					<td>Status</td>
					<td></td>
					<td colspan="2"><ww:select name="project.status"
						id="statusSelect" value="project.status.name"
						list="@fi.hut.soberit.agilefant.model.Status@values()"
						listKey="name" listValue="getText('project.status.' + name())" />
					</td>
				</tr>
				<tr>
					<td>Baseline load</td>
					<td></td>
					<td colspan="2"><ww:textfield size="10" id="default_overhead"
						name="project.baselineLoad" />/ person / week
						<span class="errorMessage"></span>	
						</td>
				</tr>
				<tr>
					<td>Planned project size</td>
					<td></td>
					<td colspan="2"><ww:textfield size="10" id="project.backlogSize"
						name="project.backlogSize" /> (total man hours)
						</td>
				</tr>
				<tr>
					<td>Start date</td>
					<td>*</td>
					<td colspan="2"><aef:datepicker
						id="start_date_${project.id}" name="project.startDate"
						format="%{getText('struts.shortDateTime.format')}"
						value="${start}" /><label for="start_date">&nbsp;</label></td>
				</tr>
				<tr>
					<td>End date</td>
					<td>*</td>
					<td colspan="2"><aef:datepicker
						id="end_date_${project.id}" name="project.endDate"
						format="%{getText('struts.shortDateTime.format')}"
						value="${end}" /><label for="end_date">&nbsp;</label></td>
	
		        </tr>
				<tr>
					<td>Description</td>
					<td></td>
					<td colspan="2">&nbsp;<ww:textarea cols="70" rows="10"
						cssClass="useWysiwyg" name="project.description" /></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td><ww:submit value="Create" id="createButton" /></td>
					<td class="deleteButton">
					<ww:reset value="Cancel" cssClass="closeDialogButton"/></td>
				</tr>
			</table>
		</div>
</form>
</div>