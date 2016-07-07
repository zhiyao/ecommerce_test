module ApplicationHelper
  def active_link?(controller_names)
    'active' if controller_names.include?(controller.controller_name)
  end
end
