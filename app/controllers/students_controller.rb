class StudentsController < ApplicationController

   def index 
   end

   def login
      student = Student.authenticate params[:no], params[:password]

      if student
         session[:student_name]=student.name
         session[:student_pid]=student.pid
         redirect_to :action=>'login_success'
      else
         flash[:notice]="請輸入正確帳號密碼！"
         render :action=>'login_failed'
      end

   end

   def login_success
      @student_name=session[:student_name]
   end

   def login_failed
   end

   def download
      @file = '/home/taichis/DownloadMyScore/scores/' + session[:student_pid] + ".pdf"
      send_file @file, :type=>"application/pdf", :x_sendfile=>true
   end

   def logout
      session[:student_pid]=nil
      session[:student_name]=nil
      redirect_to root_url
   end

end
