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

ac_post_comments_create = Action.create(controller_name: 'post_comments', action_name: 'create');
ac_post_comments_edit = Action.create(controller_name: 'post_comments', action_name: 'edit');
ac_post_comments_update = Action.create(controller_name: 'post_comments', action_name: 'update');
ac_post_comments_destroy = Action.create(controller_name: 'post_comments', action_name: 'destroy');

RoleRight.create(role_id: rl_viewer.id, action_id: ac_post_comments_create.id);
RoleRight.create(role_id: rl_viewer.id, action_id: ac_post_comments_edit.id);
RoleRight.create(role_id: rl_viewer.id, action_id: ac_post_comments_update.id);
RoleRight.create(role_id: rl_viewer.id, action_id: ac_post_comments_destroy.id);

# скопируем все права RL_VIEWER для RL_AUTHOR
RoleRight.where(role_id: rl_viewer.id).each do |rr|
  RoleRight.create(role_id: rl_author.id, action_id: rr.action_id);
end

ac_blog_posts_new = Action.create(controller_name: 'blog_posts', action_name: 'new');
ac_blog_posts_edit = Action.create(controller_name: 'blog_posts', action_name: 'edit');
ac_blog_posts_create = Action.create(controller_name: 'blog_posts', action_name: 'create');
ac_blog_posts_update = Action.create(controller_name: 'blog_posts', action_name: 'update');
ac_blog_posts_destroy = Action.create(controller_name: 'blog_posts', action_name: 'destroy');

ac_users_index = Action.create(controller_name: 'users', action_name: 'index');
ac_users_show_grants = Action.create(controller_name: 'users', action_name: 'show_grants');
ac_users_set_grants = Action.create(controller_name: 'users', action_name: 'set_grants');
ac_users_destroy = Action.create(controller_name: 'users', action_name: 'destroy');

RoleRight.create(role_id: rl_author.id, action_id: ac_blog_posts_new.id);
RoleRight.create(role_id: rl_author.id, action_id: ac_blog_posts_edit.id);
RoleRight.create(role_id: rl_author.id, action_id: ac_blog_posts_create.id);
RoleRight.create(role_id: rl_author.id, action_id: ac_blog_posts_update.id);
RoleRight.create(role_id: rl_author.id, action_id: ac_blog_posts_destroy.id);

# скопируем все права RL_AUTHOR для RL_ADMIN
RoleRight.where(role_id: rl_author.id).each do |rr|
  RoleRight.create(role_id: rl_admin.id, action_id: rr.action_id);
end

RoleRight.create(role_id: rl_admin.id, action_id: ac_users_index.id);
RoleRight.create(role_id: rl_admin.id, action_id: ac_users_show_grants.id);
RoleRight.create(role_id: rl_admin.id, action_id: ac_users_set_grants.id);
RoleRight.create(role_id: rl_admin.id, action_id: ac_users_destroy.id);

User.create(email: 'super@test.com', name: 'Администратор А. А.', role_id: rl_admin.id, password: '123456', password_confirmation: '123456')
# User.create(email: 'auth1@test.com', name: 'Автор-Авторитетный А. А.', role_id: rl_author.id, password: '123456', password_confirmation: '123456')
# User.create(email: 'auth2@test.com', name: 'Второй А. А.', role_id: rl_author.id, password: '123456', password_confirmation: '123456')
# User.create(email: 'view@test.com', name: 'Читатель Н. М.', role_id: rl_viewer.id, password: '123456', password_confirmation: '123456')

