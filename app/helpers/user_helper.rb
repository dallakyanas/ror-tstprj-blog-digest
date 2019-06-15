module UserHelper
  # TODO: костыль, но пока так
  def map_subscription_name(key)
    name_map = {
                'no'     =>'Отключена',
                'daily'  =>'Ежедневная',
                'weekly' =>'Еженедельная',
               }

    return name_map[key]
  end
end
