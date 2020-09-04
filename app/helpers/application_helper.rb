module ApplicationHelper

  def user_avatar(user)
    if user.avatar.attached?
      image_tag user.avatar.variant(combine_options: { resize: '40x40^', extent: '40x40' }),  size: '40x40'
    else
      image_pack_tag 'default-avatar.jpg', size: '40x40'
    end
  end
end
