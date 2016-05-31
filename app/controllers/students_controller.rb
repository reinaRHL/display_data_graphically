class StudentsController < ApplicationController
    
    def index
        @students = Student.all
    end
 
    def show
        @students = Student.find(params[:id])
    end
 
    def new
        @students = Student.new
    end
 
    def edit
        @students = Student.find(params[:id])
    end
 
    def create
        @students = Student.new(students_params)
 
        if @students.save
            redirect_to @students
        else
            render 'new'
        end
    end
 
    def update
        @students = Student.find(params[:id])
 
        if @students.update(students_params)
            redirect_to @students
        else
            render 'edit'
        end
    end
 
    def destroy
        @students = Student.find(params[:id])
        @students.destroy
 
        redirect_to studentss_path
    end
 
    private
    def students_params
      params.require(:students).permit(:name, :height, :weight, :color, :gpa, :email)
    end
 
 
end
