class Ability
  include CanCan::Ability

  def initialize(user)
    if user && user.persisted? # Logged-in user
        #User can  destroy his/her own post
        can :destroy, Post, user_id: user.id 

    else
        #Non-logged in users cannot destroy Posts.
        #Typically, can is used a lot more than cannot.
        #cannot :destroy, Post, !user_id: user_id
    end
  end
end
