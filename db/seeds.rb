# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

rl_admin = Role.create(name: 'Админ', code: 'RL_ADMIN');
rl_author = Role.create(name: 'Автор', code: 'RL_AUTHOR');
rl_viewer = Role.create(name: 'Читатель', code: 'RL_VIEWER');

# Action.create(controller_name: 'blog_posts', action_name: 'index');
# Action.create(controller_name: 'blog_posts', action_name: 'show');
ac_blog_posts_new = Action.create(controller_name: 'blog_posts', action_name: 'new');
ac_blog_posts_edit = Action.create(controller_name: 'blog_posts', action_name: 'edit');
ac_blog_posts_create = Action.create(controller_name: 'blog_posts', action_name: 'create');
ac_blog_posts_update = Action.create(controller_name: 'blog_posts', action_name: 'update');
ac_blog_posts_destroy = Action.create(controller_name: 'blog_posts', action_name: 'destroy');

# Action.create(controller_name: 'users/registrations', action_name: 'new');
# Action.create(controller_name: 'users/registrations', action_name: 'edit');
# Action.create(controller_name: 'users/registrations', action_name: 'create');
# Action.create(controller_name: 'users/registrations', action_name: 'update');
# Action.create(controller_name: 'users/registrations', action_name: 'destroy');

# Action.create(controller_name: 'devise/sessions', action_name: 'new');
# Action.create(controller_name: 'devise/sessions', action_name: 'create');
# Action.create(controller_name: 'devise/sessions', action_name: 'destroy');


# скопируем все права RL_VIEWER для RL_AUTHOR
# RoleRight.where(role_id: rl_viewer.id).each do |rr|
#   RoleRight.create(role_id: rl_author.id, action_id: rr.action_id);
# end

RoleRight.create(role_id: rl_author.id, action_id: ac_blog_posts_new.id);
RoleRight.create(role_id: rl_author.id, action_id: ac_blog_posts_edit.id);
RoleRight.create(role_id: rl_author.id, action_id: ac_blog_posts_create.id);
RoleRight.create(role_id: rl_author.id, action_id: ac_blog_posts_update.id);
RoleRight.create(role_id: rl_author.id, action_id: ac_blog_posts_destroy.id);

# скопируем все права RL_AUTHOR для RL_ADMIN
RoleRight.where(role_id: rl_author.id).each do |rr|
  RoleRight.create(role_id: rl_admin.id, action_id: rr.action_id);
end