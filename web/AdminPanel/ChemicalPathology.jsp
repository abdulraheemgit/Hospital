<%-- 
    Document   : ChemicalPathology
    Created on : Oct 18, 2015, 3:30:53 PM
    Author     : Anobiya
--%>
<jsp:include page="Header.jsp"></jsp:include>
    <div class="contentbody" style="background-color: #F7F7F7">
    <jsp:include page="UserOption.jsp"></jsp:include>
        <div class="pusher">
            <div class="ui grid">
                <div class="two wide column">                
                </div>
            <div class="twelve wide column">         
                    <div class="row"  style="margin-top: 15px; margin-bottom: 10px;">
                        
                        <div class="col-sm-12 col-md-7" >
                            <h1>Chemical Pathology Test</h1>
                            <h3>Plasma Glucose</h3>
                            <table class="ui celled table">
                                <thead>
                                    <tr><th>Test</th>
                                    <th>Result</th>
                                    <th>Ref Ranges</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr><td>Fasting</td>
                                    <td><input type="text" class="form-control" id="" ></td>
                                    <td>(<5.6)mmol/L</td>
                                    </tr>  
                                    
                                    <tr><td>Random</td>
                                    <td><input type="text" class="form-control" id="" ></td>
                                    <td>(<7.8)mmol/L</td>
                                    </tr> 
                                    
                                    <tr><td>PP/2 hr after Glu</td>
                                    <td><input type="text" class="form-control" id="" ></td>
                                    <td>(<7.8)mmol/L</td>
                                    </tr> 
                                </tbody>
                            </table>

                            <h3>Serum</h3>
                            <table class="ui celled table">
                                <thead>
                                    <tr><th>Test</th>
                                    <th>Result</th>
                                    <th>Ref Ranges</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr><td>Sodium</td>
                                    <td><input type="text" class="form-control" id="" ></td>
                                    <td>(135-148)mmol/L</td>
                                    </tr>  
                                    
                                    <tr><td>Potassium</td>
                                    <td><input type="text" class="form-control" id="" ></td>
                                    <td>(3.5-5.1)mmol/L</td>
                                    </tr> 
                                    
                                    <tr><td>Urea</td>
                                    <td><input type="text" class="form-control" id="" ></td>
                                    <td>(2.9-8.2)mmol/L</td>
                                    </tr>
                                    
                                    <tr><td>Creatinine</td>
                                    <td><input type="text" class="form-control" id="" ></td>
                                    <td>(60-120)µmol/L</td>
                                    </tr>
                                    
                                    <tr><td>Estimated GFR</td>
                                    <td><input type="text" class="form-control" id="" ></td>
                                    <td>ml/min/1.73m2</td>
                                    </tr>
                                    
                                    <tr><td>AST</td>
                                    <td><input type="text" class="form-control" id="" ></td>
                                    <td>(10-35)U/L</td>
                                    </tr>
                                    
                                    <tr><td>ALT</td>
                                    <td><input type="text" class="form-control" id="" ></td>
                                    <td>(10-40)U/L</td>
                                    </tr>
                                    
                                    <tr><td>ALP</td>
                                    <td><input type="text" class="form-control" id="" ></td>
                                    <td>(100-360)U/L</td>
                                    </tr>
                                    
                                    <tr><td>Amylase</td>
                                    <td><input type="text" class="form-control" id="" ></td>
                                    <td>(22-80)U/L</td>
                                    </tr>
                                    
                                    <tr><td>Total Bilirubin</td>
                                    <td><input type="text" class="form-control" id="" ></td>
                                    <td>(5-21)µmol/L</td>
                                    </tr>
                                    
                                    <tr><td>Direct Bilirubin</td>
                                    <td><input type="text" class="form-control" id="" ></td>
                                    <td>(<3.4)µmol/L</td>
                                    </tr>
                                    
                                    <tr><td>Total Protein</td>
                                    <td><input type="text" class="form-control" id="" ></td>
                                    <td>(61-77)g/L</td>
                                    </tr>
                                    
                                    <tr><td>Albumin</td>
                                    <td><input type="text" class="form-control" id="" ></td>
                                    <td>(36-48)g/L</td>
                                    </tr>
                                    
                                    <tr><td>Globulin</td>
                                    <td><input type="text" class="form-control" id="" ></td>
                                    <td>(22-40)g/L</td>
                                    </tr>
                                    
                                    <tr><td>Plasma Fibrinogen</td>
                                    <td><input type="text" class="form-control" id="" ></td>
                                    <td>(1.5-4.5)g/L</td>
                                    </tr>
                                    
                                    <tr><td>Total Cholesterol</td>
                                    <td><input type="text" class="form-control" id="" ></td>
                                    <td>(<5.1)mmol/L</td>
                                    </tr>
                                    
                                    <tr><td>Creatine kinase</td>
                                    <td><input type="text" class="form-control" id="" ></td>
                                    <td>(25-174)U/L</td>
                                    </tr>
                                </tbody>
                            </table>
                            
                            <h3>Special Test</h3>
                            <table class="ui celled table">
                                <thead>
                                    <tr><th>Test</th>
                                        <th>Result</th>
                                        <th>Ref Ranges</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr><td>Uric acid</td>
                                        <td><input type = "text" class="form-control"></td>
                                        <td>(155-400)µmol/L</td>
                                    </tr>
                                    
                                    <tr><td>Phosphorus</td>
                                        <td><input type = "text" class="form-control"></td>
                                        <td>(0.8-1.5)mmol/L</td>
                                    </tr>
                                    
                                    <tr><td>Magnesium</td>
                                        <td><input type = "text" class="form-control"></td>
                                        <td>(0.8-1.1)mmol/L</td>
                                    </tr>
                                    
                                    <tr><td>Lonised Calcium</td>
                                        <td><input type = "text" class="form-control"></td>
                                        <td>(1.0-1.3)mmol/L</td>
                                    </tr>
                                    
                                    <tr><td colspan="3">Total Calcium with Albumin</td></tr>
                                    <tr><td>Albumin</td>
                                        <td><input type = "text" class="form-control"></td>
                                        <td>g/L</td>
                                    </tr>
                                    </tbody>
                                        <tbody>
                                        <tr><td>Total Calcium</td>
                                        <td><input type = "text" class="form-control"></td>
                                        <td>mmol/L</td>
                                        </tr>
                                        </tbody>
                                        
                                        <tbody>
                                        <tr><td>Alb corrected calcium</td>
                                        <td><input type = "text" class="form-control"></td>
                                        <td>(2.10-2.55)mmol/L</td>
                                        </tr>
                                        
                                        <tr><td>Lithium</td>
                                        <td><input type = "text" class="form-control"></td>
                                        <td>(Toxic >1.2,Therapeutic range 0.4-0.8)mmol/L</td>
                                        </tr>
                                        
                                        <tr><td>Iron</td>
                                        <td><input type = "text" class="form-control"></td>
                                        <td>(37-48)µg/dl</td>
                                        </tr>
                                        
                                        <tr><td>TIBC</td>
                                        <td><input type = "text" class="form-control"></td>
                                        <td>(274-385)µg/dl</td>
                                        </tr>
                                        
                                        <tr><td>Iron Saturation</td>
                                        <td><input type = "text" class="form-control"></td>
                                        <td>(15-50)%</td>
                                        </tr>
                                        
                                        <tr><td>Serum Osmolality</td>
                                        <td><input type = "text" class="form-control"></td>
                                        <td>(285-295)mosm/KgH2O</td>
                                        </tr>
                                        
                                        <tr><td>Urine Osmolality</td>
                                        <td><input type = "text" class="form-control"></td>
                                        <td>mosm/KgH2O</td>
                                        </tr>
                                </tbody>
                            </table>
                            
                            <h2>Urine Investigations</h2>
                            <h3>Qualitative Analysis</h3>
                            <table class="ui celled table">
                                <thead>
                                    <tr><th>Test</th>
                                    <th>Result</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr><td>Bile</td>
                                        <td><input type="radio" name="bile" value="positive" id="male">Positive<br>
                                          <input type="radio" name="bile" value="negative" id="female">Negative</td>
                                    </tr>
                                    
                                    <tr><td>Ketone bodies</td>
                                        <td><input type="radio" name="kbodies" value="positive" id="male">Positive<br>
                                          <input type="radio" name="kbodies" value="negative" id="female">Negative</td>
                                    </tr>
                                    
                                    <tr><td>Urobilinogen</td>
                                        <td><input type="radio" name="urob" value="normal" id="male">Normal<br>
                                          <input type="radio" name="urob" value="increased" id="female">Increased</td>
                                    </tr>
                                    
                                    <tr><td>Bence Jones Proteins</td>
                                        <td><input type="radio" name="bence" value="positive" id="male">Positive<br>
                                          <input type="radio" name="bence" value="negative" id="female">Negative</td>
                                    </tr>
                                    
                                    <tr><td>Urine pH</td>
                                        <td><input type = "text" class="form-control"></td>
                                    </tr>
                                </tbody>
                            </table>
                            
                            <h3>Spot Urine Tests</h3>
                            <table class="ui celled table">
                                <thead>
                                    <tr><th>Test</th>
                                    <th>Result</th>
                                    <th>Unit</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr><td>Spot Sodium</td>
                                    <td><input type="text" class="form-control" id="" ></td>
                                    <td>mmol/L</td>
                                    </tr>  
                                    
                                    <tr><td>Spot Potassium</td>
                                    <td><input type="text" class="form-control" id="" ></td>
                                    <td>mmol/L</td>
                                    </tr> 
                                    
                                    <tr><td>Protein/Creatinine Ratio</td>
                                    <td><input type="text" class="form-control" id="" ></td>
                                    <td>mg/mmol</td>
                                    </tr>
                                    
                                    <tr><td>Spot Protein</td>
                                    <td><input type="text" class="form-control" id="" ></td>
                                    <td>mg/dl</td>
                                    </tr>
                                    
                                    <tr><td>Spot Creatinine</td>
                                    <td><input type="text" class="form-control" id="" ></td>
                                    <td>µmol/L</td>
                                    </tr>
                                </tbody>
                            </table>
                            
                            <br>
                            <div class="alert alert-success" role="alert" style="display: none;">
                                <a href="#" class="alert-link">Well done! You have successfully added the result</a>
                            </div>
                            <div class="alert alert-danger" role="alert" style="display: none;">
                                <a href="#" class="alert-link">The result was not Added. Try again</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="two wide column">  
                    <c:if test="${!empty user.username}">
                    <div class="ui togglebar button black right floated">
                        <span class="glyphicon glyphicon-triangle-left" aria-hidden="true"></span>
                        <i class="tasks icon"></i>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</div>
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>