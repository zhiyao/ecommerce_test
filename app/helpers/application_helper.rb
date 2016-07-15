module ApplicationHelper
  def active_link?(controller_names)
    'active' if controller_names.include?(controller.controller_name)
  end

  def category_tree_filter(categories, sub_category_ids = [])
    sub_category_ids ||= []

    items = categories.each.map do |category|
      content_tag(:li,
        (check_box_tag("sub_category_ids[]", category.root.id, sub_category_ids.include?("#{category.root.id}"))) +
        category.name +
        sub_category_tree_filter(category, category.root, sub_category_ids)
      )
    end

    content_tag(:ul, raw(items.join(' ')))
  end

  def sub_category_tree_filter(category, sub_category, sub_category_ids=[])
    return '' if sub_category.children.empty?
    sub_category_ids ||= []

    items = sub_category.children.map do |child|
      if child.products?
        content_tag(:li,
          (check_box_tag('sub_category_ids[]', child.id, sub_category_ids.include?("#{child.id}")) +
          child.name +
          sub_category_tree_filter(category, child, sub_category_ids)).html_safe)
      end
    end

    content_tag(:ul, raw(items.join(' ')))
  end

  def product_breadcrumbs(sub_category)
    seperator = '&nbsp;&raquo;&nbsp;'
    return '' if sub_category.nil?

    crumbs = [content_tag(:li, link_to('Home', root_path) + seperator.html_safe)]
    if sub_category
      crumbs << sub_category.self_and_ancestors.collect do |ancestor|
        content_tag(:li,
                    link_to(ancestor.name,
                            products_path(sub_category_ids: [ancestor])) +
                    seperator.html_safe)
      end
    end

    crumb_list = content_tag(:ul, raw(crumbs.flatten.map{|li| li.mb_chars}.join), class: 'inline')
    content_tag(:nav, crumb_list, id: 'breadcrumbs')
  end
end
