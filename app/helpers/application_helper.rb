module ApplicationHelper
  def sign_in_with provider
    link_to "Sign In With your #{provider.titleize} account", "/auth/#{provider}", :class => "btn btn-success"
  end

  def sign_in_buttons
    content_tag :div do
      %w{facebook twitter openid}.map {|provider| concat content_tag :p ,sign_in_with(provider) }
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
end
