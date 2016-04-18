class InvitesController < ApplicationController


def show
end

def create
  @match=Match.find(params[:match_id])
  @match.invites.create!(invite_params)
end

def update
  invite=Invite.find(params[:id])
  match=Match.find(params[:match_id])
  if match and invite
    match.add_member(invite.member_id)
    invite.delete
  end
    redirect_to :back
end

def delete
end

private
def invite_params
  params.require(:invite).permit(:member_id,:match_id)
end
end
