class OtherController < ApplicationController

	# MODIFICATION TO THIS METHOD
	def name
		@fname = params[:fst_name]
		@lname = params[:lst_name]
		if !@fname.nil? then @entry = Entry.create({:first_name => @fname, :last_name =>  @lname}) end
	end

	# MODIFICATION TO THIS METHOD
	def index
		@person = Entry.find(params[:id])
		@fname = @person.first_name
		@lname = @person.last_name
		@person.update_attributes({:address => params[:st_name], :salary => params[:salary], :loan => params[:loan], :loan_reason => params[:reason]})
		if !@person.address.nil? then render "show" end
	end

	# MODIFICATION TO THIS METHOD
	def show
		@person = Entry.find(params[:id])
	end

	# MODIFICATION TO THIS METHOD
	def change
		@person = Entry.find(params[:id])
		@fname = @person.first_name
		@lname = @person.last_name
	end

	# NEW METHOD -
	def update
		@person = Entry.find(params[:id])
		@person.update({:salary => params[:salary], :loan => params[:loan]})
		redirect_to other_change_path(:id => @person.id)
	end

	# MODIFICATION TO THIS METHOD
	def quote
		@person = Entry.find(params[:id])
		if !@person.salary.nil? then
			if (@person.salary *  3) < @person.loan
			then @message = "You goddam pauper, you asked us for a loan that is: more than three times your salary. \n Please go back and re-enter your correct salary."
			else  @message = "Sure thing baby..."
			end
		else @message = "Seem to have an empty record??"
		end
	end
end