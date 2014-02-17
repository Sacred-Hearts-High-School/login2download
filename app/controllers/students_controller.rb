class StudentsController < ApplicationController

   def index 
   end

   def login
      @student = Student.find_by_no(params[:no])

      if @student
         if @student.pid = params[:password]
            session[:student_pid]=@student.pid
            redirect_to :action=>'login_success'
         end
      else
         render :action=>'login_failed'
      end

   end

   def login_success
   end

   def login_failed
   end

   def download
      @file = '/home/taichis/DownloadMyScore/scores/' + session[:student_pid] + ".doc"
      send_file @file, :type=>"application/doc", :x_sendfile=>true
   end

   def logout
      session[:student_pid]=nil
      redirect_to root_url
   end

end
