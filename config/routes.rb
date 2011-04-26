ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.
  
  map.home '/', :controller => 'home', :action => 'index'
  map.resume '/resume', :controller => 'home', :action => 'resume'
  map.contact '/contact', :controller => 'home', :action => 'contact'
  map.save_selected_category '/save_selected_category', :controller => 'home', :action => 'save_selected_category'
  
  map.resources :categories
  map.resources :projects
  
  map.logout '/admin/logout', :controller => 'admin/sessions', :action => 'destroy'
  map.login '/admin/login', :controller => 'admin/sessions', :action => 'new'
  map.register '/admin/register', :controller => 'admin/users', :action => 'create'
  map.signup '/admin/signup', :controller => 'admin/users', :action => 'new'
  
  map.admin_home '/admin', :controller => 'admin/users', :action => 'index'
  
  map.namespace :admin do |admin|
    admin.resources :categories, :collection => { :sort => :post, :toggle_published => :post }
    admin.resources :courses, :collection => { :sort => :post }
    admin.resources :projects, :collection => { :sort => :post, 
                                                :toggle_published => :post, 
                                                :delete_photo => :delete }
    admin.resources :photos, :collection => { :sort => :post }
    admin.resources :pages
    admin.resources :users
    admin.resource  :session
  end
  
  map.mdp_home '/mdp', :controller => 'mdp/courses', :action => 'index'
  
  map.thesis 'thesis', :controller => 'thesis', :action => 'index'
  
  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
