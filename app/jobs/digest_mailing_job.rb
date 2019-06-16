class DailyDigestMailingJob < ApplicationJob
  queue_as :default

  def perform
    users_daily_digest = User.where(subscription_type: 'daily')

    if !users.empty?
      # отберем посты для расылки
      till_date = Time.parse("07:00") - 1  # сегодня
      from_date = till_date - 1.day + 1

      post_daily_digest = BlogPost.where(publish_date: from_date..till_date).order(publish_date: :desc)

      if !post_daily_digest.empty?
        users_daily_digest.each do |u|
          UserMailer.with(user: u, blog_posts: post_daily_digest).daily_digest_email.deliver_later
        end
      end
    end  #/!users.empty?

  end #/perform
end


class WeeklyDigestMailingJob < ApplicationJob
  queue_as :default

  def perform
    users_weekly_digest = User.where(subscription_type: 'weekly')
    if !users.empty?
      # отберем посты для расылки
      till_date = Time.parse("07:00") - 1  # сегодня
      from_date = till_date - 1.week + 1

      post_weekly_digest = BlogPost.where(publish_date: from_date..till_date).order(publish_date: :desc)

      if !post_weekly_digest.empty?
        users_weekly_digest.each do |u|
          UserMailer.with(user: u, blog_posts: post_weekly_digest).weekly_digest_email.deliver_later
        end
      end
    end  #/!users.empty?
  end #/perform
end
