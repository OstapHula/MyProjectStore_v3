<%@ include file="/WEB-INF/taglib.jsp" %>
 
 
 <div class="container profile">
    <div class="row">
    
      <%@ include file="/WEB-INF/fragments/_left_nav.jsp" %>
      
      <div class="col-lg-4 profile-img">
        <a href="#" data-toggle="modal" data-target="#photoModal" class="float-lg-right">
          <img src="data:image/png; base64, ${userProfile.imagePath}" alt="image profile"/>
          <i class="fas fa-search-plus fa-2x"></i>
        </a>
      </div>
      <div class="col-lg-5">
        <h2>${userProfile.role.role} profile</h2>
        <hr>
        <ul>
         <li>Name: ${userProfile.firstName} ${userProfile.lastName}</li>
         <li>Age: ${userProfile.birthday.getYear}</li>
	  	 <li>Email: ${userProfile.email}</li>
		 <li>Address: ${userProfile.address}</li>
		 <li>Telephone: ${userProfile.telephone}</li>
		 <li>Birthday: ${userProfile.birthday}</li> 
        </ul>
        
      </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="photoModal" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="photoModalLabel">Photo user_name</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
             <img src="data:image/png; base64, ${userProfile.imagePath}" alt="image profile"/>
          </div>
          <div class="modal-footer justify-content-between">
			 <form:form modelAttribute="uploadImageModel" method="POST" action="/user/profile/image" enctype="multipart/form-data">
          		<form:input path="file" type="file"/> 
          		<input type="submit" value="Upload image" class="btn btn-primary"/>
          	</form:form>  
           <!--  <button type="button" class="btn btn-primary"><i class="fas fa-upload"></i> Upload new photo</button> -->
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>
  </div>
 
 
 
 
 