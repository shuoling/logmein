# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def show_flash
        [:notice, :error].collect do |key|
            content_tag(:div,
                             content_tag(:div, flash[key], :id=>"flash_text"),
                        :class => "flash_#{key} rounded {10px}",
                        :id=>"flash_div",
                        :title =>"Click to close")  unless flash[key].blank?
        end.join
    end

end
