<%-- 
    Document   : FullBloodCount
    Created on : Oct 18, 2015, 6:59:53 PM
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
                            <h1>Full Blood Count</h1>
                            <table class="ui celled table">
                                <thead>
                                    <tr><th>Test</th>
                                    <th>Result</th>
                                    <th>Unit</th>
                                    <th>Ref Ranges</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr><td>WBC</td>
                                    <td><input type="text" class="form-control"></td>
                                    <td>10^3/uL</td>
                                    <td>4.00-10.00</td>
                                    </tr>  
                                    
                                    <tr><td>Neu#</td>
                                    <td><input type="text" class="form-control"></td>
                                    <td>10^3/uL</td>
                                    <td>2.00-7.00</td>
                                    </tr>
                                    
                                    <tr><td>Lym#</td>
                                    <td><input type="text" class="form-control"></td>
                                    <td>10^3/uL</td>
                                    <td>0.80-4.00</td>
                                    </tr>
                                    
                                    <tr><td>Mon#</td>
                                    <td><input type="text" class="form-control"></td>
                                    <td>10^3/uL</td>
                                    <td>0.12-1.20</td>
                                    </tr>
                                    
                                    <tr><td>Eos#</td>
                                    <td><input type="text" class="form-control"></td>
                                    <td>10^3/uL</td>
                                    <td>0.02-0.50</td>
                                    </tr>
                                    
                                    <tr><td>Bas#</td>
                                    <td><input type="text" class="form-control"></td>
                                    <td>10^3/uL</td>
                                    <td>0.00-0.10</td>
                                    </tr>
                                    
                                    <tr><td>Neu%</td>
                                    <td><input type="text" class="form-control"></td>
                                    <td>%</td>
                                    <td>50-70</td>
                                    </tr>
                                    
                                    <tr><td>Lym%</td>
                                    <td><input type="text" class="form-control"></td>
                                    <td>%</td>
                                    <td>20.0-40.0</td>
                                    </tr>
                                    
                                    <tr><td>Mon%</td>
                                    <td><input type="text" class="form-control"></td>
                                    <td>%</td>
                                    <td>3.0-12.0</td>
                                    </tr>
                                    
                                    <tr><td>Eos%</td>
                                    <td><input type="text" class="form-control"></td>
                                    <td>%</td>
                                    <td>0.5-5.0</td>
                                    </tr>
                                    
                                    <tr><td>Bas%</td>
                                    <td><input type="text" class="form-control"></td>
                                    <td>%</td>
                                    <td>0.0-1.0</td>
                                    </tr>
                                    
                                    <tr><td>RBC</td>
                                    <td><input type="text" class="form-control"></td>
                                    <td>10^6/uL</td>
                                    <td>3.50-5.50</td>
                                    </tr>
                                    
                                    <tr><td>HGB</td>
                                    <td><input type="text" class="form-control"></td>
                                    <td>g/dL</td>
                                    <td>11.0-16.0</td>
                                    </tr>
                                    
                                    <tr><td>HCT</td>
                                    <td><input type="text" class="form-control"></td>
                                    <td>%</td>
                                    <td>37.0-54.0</td>
                                    </tr>
                                    
                                    <tr><td>MCV</td>
                                    <td><input type="text" class="form-control"></td>
                                    <td>fL</td>
                                    <td>80.0-100.0</td>
                                    </tr>
                                    
                                    <tr><td>MCH</td>
                                    <td><input type="text" class="form-control"></td>
                                    <td>pg</td>
                                    <td>27.0-34.0</td>
                                    </tr>
                                    
                                    <tr><td>MCHC</td>
                                    <td><input type="text" class="form-control"></td>
                                    <td>g/dL</td>
                                    <td>32.0-36.0</td>
                                    </tr>
                                    
                                    <tr><td>RDW-CV</td>
                                    <td><input type="text" class="form-control"></td>
                                    <td></td>
                                    <td>0.110-0.160</td>
                                    </tr>
                                    
                                    <tr><td>RDW-SD</td>
                                    <td><input type="text" class="form-control"></td>
                                    <td>fL</td>
                                    <td>35.0-56.0</td>
                                    </tr>
                                    
                                    <tr><td>PLT</td>
                                    <td><input type="text" class="form-control"></td>
                                    <td>10^3/uL</td>
                                    <td>150-400</td>
                                    </tr>
                                    
                                    <tr><td>MPV</td>
                                    <td><input type="text" class="form-control"></td>
                                    <td>fL</td>
                                    <td>6.5-12.0</td>
                                    </tr>
                                    
                                    <tr><td>PDW</td>
                                    <td><input type="text" class="form-control"></td>
                                    <td></td>
                                    <td>15.0-17.0</td>
                                    </tr>
                                    
                                    <tr><td>PCT</td>
                                    <td><input type="text" class="form-control"></td>
                                    <td>mL/L</td>
                                    <td>1.08-2.82</td>
                                    </tr>
                                    
                                    <tr><td>P-LCC</td>
                                    <td><input type="text" class="form-control"></td>
                                    <td>10^9/L</td>
                                    <td>30-90</td>
                                    </tr>
                                    
                                    <tr><td>P-LCR</td>
                                    <td><input type="text" class="form-control"></td>
                                    <td>%</td>
                                    <td>11.0-45.0</td>
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
