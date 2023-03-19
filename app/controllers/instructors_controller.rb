class InstructorsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_message

  def index
    instructors = Instructor.all
    render json: instructors, status: :ok
  end

  def show
    student = find_instructor
    render json: instructor, status: :ok
  end

  def create
    instructor = Instructor.create!(instructor_params)
    render json: instructor, status: :created
  end

  def update
    instructor = find_instructor
    instructor.update!(instructor_params)
    render json: instructor, status: :accepted
  end

  def destroy
    instructor = find_instructor
    instructor.destroy

    head :no_content
  end

  private

  def find_instructor
    Instructor.find(params[:id])
  end

  def instructor_params
    params.permit(:name)
  end

  def render_unprocessable_entity(invalid)
    render json: {
             errors: invalid.record.errors,
           },
           status: :unprocessable_entity
  end

  def not_found_message
    render json: { errors: 'No such instructor' }, status: :not_found
  end
end
