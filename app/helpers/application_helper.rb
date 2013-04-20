#encoding: utf-8
module ApplicationHelper
  def sign_in_with provider
    link_to "<i class='icon-#{provider}'></i> Connecter vous à votre compte #{provider.titleize}".html_safe, "/auth/#{provider}", :class => "btn"
  end

  def sign_in_buttons
    content_tag :div do
      %w{facebook twitter}.map {|provider| concat content_tag :p ,sign_in_with(provider) }
    end
  end

  def flash_message
    if flash[:notice]
      flash_message_html :notice
    elsif flash[:error]
      flash_message_html :error
    end
  end

  def flash_message_html type
    content_tag :div, :class=>"alert #{type == :notice ? "alert-info" : "alert-error"}" do
      button_to "&times", "", :class=>"close", :data=>{:dismiss=>"alert"}
      flash[type]
    end
  end

  def login
    if current_user.real_user?
      link_to "Profile", "/users/#{current_user.id}"
    else
      link_to "Connection", "#login_modal", data:{toggle:'modal'}
    end
  end

  def logout
    if current_user.real_user?
      link_to "Deconnexion", "/signout"
    else

    end
  end

end
