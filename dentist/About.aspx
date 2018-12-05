<%@ Page Title="سیستم نوبت دهی مطب دکتر جمیلیان" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="dentist.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container-fluid font-yekan">
             

         <div class="row" >
            
            <div class="col-12">
                <div id="example-basic">
                    <h3>تاریخ</h3>
                    <section>
                        <div class="row">
                            <div class="col-md-5">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text cursor-pointer" id="date1"></span>
                                    </div>
                                    <div>
                                        <input type="text" id="inputDate1" class="form-control" placeholder="تاریخ را انتخاب کنید" aria-label="date1" disabled="disabled"
                                            aria-describedby="date1">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 direction">
                                <ul >
                                    <li>در مرحله اول تاریخ مراجعه مورد نظر خود را وارد کنید</li>
                                    <li>در مرحله دوم ساعت مورد نظر را وارد کنید </li>
                                    <li>در مرحله سوم اطلاعات شخصی ویا اطلاعات پرونده را وارد کرده ثبت نمایید</li>
                                </ul>
                                <hr />
                                <ul>
                                    <li>زمان و تاریخ را با دقت انتخاب کنید</li>
                                    <li>در صورت گرفتن خطا از اطلاعات ورودی اطمینان حاصل نمایید</li>
                                    <li>در هنگام بروز مشکل با مطب تماس بگیرید</li>
                                </ul>
                                
                            </div>
                        </div>
                    </section>
                    <h3>زمان</h3>
                    <section>
                        <div class="row">
                            <div id="table-wrapper">
                                <div id="table-scroll">
                                    <table id="ttable" border="1"></table>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="padding-top:30px;height:100px;">
                            <div class="col-md-3"><p id="ite"></p></div>
                            <div class="col-md-3"><p id="iteDate"></p></div>
                            <div class="col-md-5"><p id="iteUnit"></p></div>
                        </div>

                    </section>
                    <h3>اطلاعات</h3>
                    <section>
                        <div class="row">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-4">
                                <h4 class="text-right">پرونده دارم(بیمار فعلی)</h4>
                                <form action="/action_page.php" id="form1">
                                    <div class="form-group">
                                        <input type="code" class="form-control" id="code" placeholder="ورود شماره پرونده" name="code">
                                    </div>

                                    <div class="form-group">
                                        <input type="name" class="form-control" id="name" placeholder="ورود نام" name="name">
                                    </div>

                                    <div class="form-group">
                                        <input type="family" class="form-control" id="family" placeholder="ورود نام خانوادگی" name="family">
                                    </div>

                                    <div class="form-group">
                                        <input type="tell" class="form-control" id="tell" placeholder="ورود تلفن همراه" name="tell">
                                    </div>
                                    <button type="submit" class="btn"><i class="fa fa-search"></i>جستجو</button>
                                </form>
                            </div>


                            <div class="col-sm-4">
                                <h4 class="text-right">پرونده ندارم(بیمارجدید)</h4>
                                <form action="/action_page.php">

                                    <div class="form-group">
                                        <input type="name" class="form-control" id="name" placeholder="نام" name="email">
                                    </div>

                                    <div class="form-group">
                                        <input type="family" class="form-control" id="family" placeholder="نام خانوادگی" name="family">
                                    </div>

                                    <div class="form-group">
                                        <input type="tell" class="form-control" id="tell" placeholder="تلفن همراه" name="tell">
                                    </div>

                                    <div class="form-group">
                                        <input type="reason" class="form-control" id="reason" placeholder="علت مراجعه" name="reason">
                                    </div>



                                    <div class="btn-group">
                                        <button type="button" class="btn btn-primary" disabled><i class="fa fa-plus"></i>ثبت</button>

                                    </div>


                                </form>
                            </div>
                            <div class="col-sm-2"></div>

                        </div>
                    </section>
                </div>
            </div>
            
        </div>
        

     </div>
    <script src="Scripts/MdBootstrapPersianDateTimePicker/jquery.md.bootstrap.datetimepicker.js"></script>
    <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js" type="text/javascript" language="javascript"></script>
    <script src="Scripts/jq.schedule.js"></script>
    <script src="Scripts/jquery.steps.js"></script>
    <script type="text/javascript">
        $("#example-basic").steps({
    headerTag: "h3",
    bodyTag: "section",
    transitionEffect: "slideLeft",
    autoFocus: true,
/* Labels */
    labels: {
        cancel: "لغو کردن",
        current: "مرحله فعلی:",
        pagination: "Pagination",
        finish: "ثبت شود",
        next: "مرحله بعد",
        previous: "مرحله قبل",
        loading: "بارگذاری ..."
    }  
    
});
    </script>


    
   
    <script src="Scripts/site.js"></script>
    
   
  
    </asp:Content>
