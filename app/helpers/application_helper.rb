module ApplicationHelper
  def active_link?(controller_names)
    'active' if controller_names.include?(controller.controller_name)
  end

  def product_sub_category(category, sub_category)
    return '' if sub_category.children.empty?

    items = sub_category.children.map do |child|
      if child.has_products?
        content_tag(:li,
          (check_box_tag("sub_category_ids[]", child.id) +
          child.name +
          product_sub_category(category, child)).html_safe)
      end
    end

    content_tag(:ul, raw(items.join(' ')))
  end


  def product_breadcrumbs(sub_category)
    seperator="&nbsp;&raquo;&nbsp;"
    return "" if sub_category.nil?
    crumbs = [content_tag(:li, link_to('Home', root_path) + seperator.html_safe)]
    crumbs << content_tag(:li, link_to(sub_category.root.name, sub_category_path(sub_category.root)) + seperator.html_safe)
    if sub_category
      crumbs << sub_category.ancestors.collect do |ancestor|
        unless sub_category.ancestors.empty?
          unless ancestor.root?
            content_tag(:li, link_to(ancestor.name, sub_category_path(ancestor)) + seperator.html_safe )
          else
            ''
          end
        end
      end
      unless sub_category == sub_category.root
        crumbs << content_tag(:li, link_to(sub_category.name, sub_category_path(sub_category) + seperator).html_safe)
      end
    end
    crumb_list = content_tag(:ul, raw(crumbs.flatten.map{|li| li.mb_chars}.join), class: 'inline')
    content_tag(:nav, crumb_list, id: 'breadcrumbs')
  end
end
