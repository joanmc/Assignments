Rails.application.routes.draw do
  root 'mysite#home'
  get 'mysite/home' => 'mysite#home'

  get 'mysite/post_new' => 'mysite#post_new'
  post 'mysite/post_new' => 'mysite#post_new'

  get 'mysite/post_detail' => 'mysite#post_detail'

  get 'mysite/post_edit' => 'mysite#post_edit'
  patch 'mysite/post_update' => 'mysite#post_update'
  get 'mysite/post_delete' => 'mysite#post_delete'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
