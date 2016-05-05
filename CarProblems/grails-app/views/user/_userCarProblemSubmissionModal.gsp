<%@ page import="cscie56.fp.Car" %>
<!-- Modal -->
<div class="modal fade" id="userCarProblemSubmissionModal" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Submit a car problem</h4>
            </div>

            <div class="modal-body">

                <form class="form-horizontal" action="userCarProblemSubmission" method="post" >
                    <fieldset>

                        <!-- Select Basic -->
                        <div class="form-group required">
                            <label class="col-md-4 control-label" for="user">Submission by</label>
                            <div class="col-md-8">
                                <select id="user" name="user" class="form-control">
                                    <option value="1">${userInstance}</option>
                                </select>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group required">
                            <label class="col-md-4 control-label" for="car">Car</label>
                            <div class="col-md-8">
                                <g:select id="car" name="car" from="${userInstance.cars}"
                                          optionKey="id" required="" value="${cscie56.fp.Car}" />
                                </select>
                            </div>
                        </div>

                        <!-- Textarea -->
                        <div class="form-group required">
                            <label class="col-md-4 control-label" for="mileage">Car mileage</label>
                            <div class="col-md-8">
                                <input id="mileage" name="mileage" type="text" placeholder="Car mileage" class="form-control input-md">
                            </div>
                        </div>

                        <!-- Textarea -->
                        <div class="form-group required">
                            <label class="col-md-4 control-label" for="description">Description</label>
                            <div class="col-md-8">
                                <textarea class="form-control" id="description" name="text">Describe your problem</textarea>
                            </div>
                        </div>



                        <!-- Button  -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="save">Save or Save and Publish</label>
                            <div class="col-md-8">
                                <g:actionSubmit id="save" class="save btn btn-primary" value="Save" action="save"/>
                            </div>
                        </div>

                    </fieldset>
                </form>

            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>

        </div>
    </div>
</div>