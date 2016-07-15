module Admin
  module SubCategoryHelper
    def sub_category_tree(category, sub_category)
      return '' if sub_category.children.empty?

      items = sub_category.children.map do |child|
        content_tag(:li,
          (child.name +
          link_to('+', new_admin_category_sub_category_path(category, parent: child), class: 'btn btn-green') +
          link_to('-', [:admin, category, child], method: :delete, data: { confirm: 'Are you sure?' }, class: 'btn btn-red') +
          sub_category_tree(category, child)).html_safe)
      end

      content_tag(:ul, raw(items.join(' ')))
    end

    def breadcrumbs(category, sub_category, seperator = '&nbsp;&raquo;&nbsp;')
      return '' if sub_category.nil?
      crumbs = [content_tag(:li, link_to('Admin', root_path) + seperator.html_safe)]
      crumbs << content_tag(:li, link_to('Categories', admin_categories_path) + seperator.html_safe)
      crumbs << content_tag(:li, link_to(category.name, edit_admin_category_path(category)) + seperator.html_safe)

      sub_category_ancestors = sub_category_ancestors_except_root(category, sub_category)

      unless sub_category_ancestors.empty?
        crumbs << sub_category_ancestors.collect do |ancestor|
          content_tag(:li, (ancestor.name + seperator).html_safe)
        end
      end

      crumb_list = content_tag(:ul, raw(crumbs.flatten.map(&:mb_chars).join), class: 'inline')
      content_tag(:nav, crumb_list, id: 'breadcrumbs')
    end

    private

    def sub_category_ancestors_except_root(category, sub_category)
      ancestors = sub_category.ancestors - [category.root]
      ancestors << sub_category if sub_category != category.root
    end
  end
end
