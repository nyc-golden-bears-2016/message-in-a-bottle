class EntriesController < ApplicationController

  def create
    @entry = Entry.new(permit_params)
    @entry.user_id = current_user.id
    if request.xhr?
      # set the viewer for a new entry
      # @entry.message_in_a_bottle
      if @entry.save
        render json: @entry
      else
        flash[:error] = "Your entry was not succussfully created"
      end
    else
      flash[:error] = "Your entry was not succussfully created"
      redirect_to '/static/index'
    end
  end

  def show
    @entries = current_user.entries
    render json: @entries
  end

  def destroy
    entry = Entry.find(params[:id])
    entry.destroy
    render json: entry.to_json
  end

  private

  def permit_params
    params.require(:entry).permit(:body)
  end

  # is message in a bottle?
  def message_in_a_bottle
    if !self.is_private?
      self.find_random_user
    end
  end

  # public or private?
  def is_private?
    self.is_private
  end

  # find a random user to receiver message
  def find_random_user
    total_users = User.last.id
    begin
      bottle_receiver = User.find(rand(1..total_users))
    end until !user.nil?
    self.viewer = bottle_receiver.id
    self.save
  end

end
