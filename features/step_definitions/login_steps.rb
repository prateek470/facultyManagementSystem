When (/^I logout$/) do
  page.find('delete').trigger('click')
end
