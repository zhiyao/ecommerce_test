module Admin
  module SubCategoryHelper
    def sub_category_preview(category, sub_category)
      return '' if sub_category.children.empty?

      items = sub_category.children.map do |child|
          content_tag(:li,
            (child.name +
            link_to('+', new_admin_category_sub_category_path(category, parent: child)) +
            sub_category_preview(category, child)).html_safe)
      end

      content_tag(:ul, raw(items.join(' ')))
    end

    def breadcrumbs(category, sub_category, seperator="&nbsp;&raquo;&nbsp;")
      return "" if sub_category.nil?
      crumbs = [content_tag(:li, link_to('Admin', root_path) + seperator.html_safe)]
      if sub_category
        crumbs << content_tag(:li, link_to('Categories', admin_categories_path) + seperator.html_safe)
        crumbs << content_tag(:li, link_to(category.name, edit_admin_category_path(category))  + seperator.html_safe)
        crumbs << sub_category.ancestors.collect do |ancestor|
          unless sub_category.ancestors.empty?
            unless ancestor.root?
              content_tag(:li, (ancestor.name + seperator).html_safe )
            else
              ''
            end
          end
        end
        crumbs << content_tag(:li, (sub_category.name + seperator).html_safe)
      else
        crumbs << content_tag(:li, content_tag(:span, 'Categories'))
      end
      crumb_list = content_tag(:ul, raw(crumbs.flatten.map{|li| li.mb_chars}.join), class: 'inline')
      content_tag(:nav, crumb_list, id: 'breadcrumbs', class: 'sixteen columns')
    end
  end
end
