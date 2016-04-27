class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy, :set_messages, :join, :leave]
  before_action :set_messages, only: [:show]

  def index
    @groups = Group.all.order(:name)
  end

  def show
  end

  def new
    @group = Group.new
  end

  def edit
  end

  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to group_path(@group.slug), notice: 'Grupo creado exitosamente' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Grupo editado exitosamente' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Grupo destruido' }
    end
  end

  def join
    @group.join_group( current_user.id )
    redirect_to group_path( @group.slug )
  end

  def leave
    puts @group.inspect
    @group.leave_group( current_user.id )
    redirect_to group_path( @group.slug )
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.friendly.find(params[:id])
    end

    def set_messages
      @messages = @group.messages.order(created_at: :desc)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name, :user_id)
    end
end
