# Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение”
# 1
update users set created_at = NOW(), updated_at = NOW();

# 2
update users set created_at = str_to_date(created_at, '%d.%m.%Y %H:%i');
alter table users modify created_at datetime default CURRENT_TIMESTAMP;
update users set updated_at = str_to_date(updated_at, '%d.%m.%Y %H:%i');
alter table users modify updated_at datetime default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

# 3
select * from storehouses_products order by value = 0, value;

# 4
select * from users where monthname(birthday_at) in ('may', 'august');

# 5
select * from catalogs where id in (5, 1, 2) order by field(id, 5, 1, 2);

# Практическое задание теме “Агрегация данных”
# 1
select round(avg(datediff(current_date , birthday_at)/365)) from users;

# 2
select dayname(date_add(date_format(now(), '%Y-01-01'), interval dayofyear(birthday_at) day)), count(*) from users group by dayname(date_add(date_format(now(), '%Y-01-01'), interval dayofyear(birthday_at) day));

# 3
select exp(sum(log(value))) from storehouses_products where value != 0;