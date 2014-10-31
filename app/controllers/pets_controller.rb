class PetsController < ApplicationController
  def index
  	# instance variables in Rails controllers automatically are passed to the view!
  	@pets = Pet.all
  end

  def new  #this method will serve a view that allows the user to make a new pet
  	@pet = Pet.new
  end

  def create #this is where the form rendered above will be sent!
  	# this is similiar to a php var dump!
  	@pet = Pet.new(pet_params)

  	if @pet.save
  		# if the pet saves correctly, do the good stuff
  		flash[:notice] = "Yay, a new pet!"
  		redirect_to "/pets/index"
  	else
  		# if it fails validations, do the bad stuff
  		@errors = @pet.errors.full_messages
  		render :new
  	end
  end

  private 

	  # Strong parameters 
	  # White list user submitted data 
	  def pet_params
	  	params.require(:pet).permit(:name)
	  	# this returns a hash with all the sanitized parameters, with just the stuff we want
	  end
end
