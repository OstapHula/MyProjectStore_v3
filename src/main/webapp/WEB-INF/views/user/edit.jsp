<%@ include file="/WEB-INF/taglib.jsp" %>

<div class="row">
	<div class="col-md-4 col-md-offset-4">
		<div class="login-wrapper">
			<div class="box">
				<div class="content-wrap">
					<h3>Edit</h3>
					<form:form action="/edit" modelAttribute="userProfile" >
						<div class="form-group">
							<form:errors path="*" cssClass="error"/>
							
							<c:if test="${error != null}">
								<span class="error">${error}</span>
							</c:if>
						</div>
						<div class="form-group">
						
  							<label class="control-label">First name: </label>
							<form:input path="firstName" cssClass="form-control" title="First name" />
							
  							<label class="control-label">lastName: </label>
							<form:input path="lastName" cssClass="form-control" title="last name" />
							
  							<label class="control-label">Address: </label>
							<form:input path="address" cssClass="form-control" title="Address" />
							
  							<label class="control-label">Telephone: </label>
							<form:input path="telephone" cssClass="form-control" title="Telephone" />
							
  							<label class="control-label">Birthday: </label>
							<form:input path="birthday" cssClass="form-control" title="Birthday" />
							
  							<label class="control-label">E-mail address</label>
							<form:input path="email" cssClass="form-control" title="E-mail address" />
											
							<label class="control-label">Who are you?</label>
							<form:select path="role" cssClass="form-control">
								<c:forEach items="${userRole}" var="role">
									<c:if test="${role != 'ROLE_ADMIN'}">
										<form:option value="${role}">${role.role}</form:option>
									</c:if>
								</c:forEach>
							</form:select> 
						</div>
						<div class="form-group">
							<span class="input-group-btn">
								<input type="submit" class="btn btn-primary" value="Save change">
							</span>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>