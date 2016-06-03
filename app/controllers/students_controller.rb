class StudentsController < ApplicationController
    
    
    
    helper_method :sort_column, :sort_direction
  def index
    @students = Student.order(sort_column + ' ' + sort_direction)
  end
  
  
  
  def sort_direction
    params[:direction] || "asc"
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
 
        redirect_to students_path
    end
 
    private
    def students_params
      params.require(:student).permit(:name, :height, :weight, :color, :gpa, :email)
    end
 
 private
  def sort_column
    params[:sort] || "name"
  end
 
end
