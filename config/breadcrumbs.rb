crumb :root do
  link "FURIMA", root_path
end

crumb :devise_regstrations do
  link "新規登録", user_registration_path
  parent :root
end

crumb :devise_sessions do
  link "ログイン", user_session_path
  parent :root
end

crumb :items_new do
  link "商品出品", new_item_path
  parent :root
end

crumb :items_show do |item|
  link "商品詳細", item_path(item)
  parent :root
end

crumb :item_edit do |item|
  link "商品編集", edit_item_path
  parent :items_show,item
end

crumb :orders_index do |item|
  link "商品購入", item_orders_path
  parent :items_show,item
end

crumb :item_search do
  link "検索結果", search_items_path
  parent :root
end