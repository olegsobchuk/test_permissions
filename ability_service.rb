class AbilityService
  def initialize(user_id, ability, ability_type)
    @user = User.find(user_id) # find User by his *id*
    @ability_type = ability_type
    @ability = ability_type.constantize.find(ability) # converet string to Class
  end

  # grant permissions directly or through role to user
  def access
    Ability.create(user_id: @user.id, ability_type: ability_type, ability_id: @ability.id)
  end

  # deny (remove) permissions directly or through role to user
  def deny
    Ability.where(user_id: @user.id, ability_type: ability_type, ability_id: @ability.id).delete
  end
end
