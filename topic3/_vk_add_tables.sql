DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries` (
	id SERIAL,
	`name` VARCHAR(50)
);

DROP TABLE IF EXISTS `cities`;
CREATE TABLE `cities` (
	id SERIAL,
    country_id BIGINT UNSIGNED NOT NULL,
	`name` VARCHAR(50),

	FOREIGN KEY (country_id) REFERENCES countries(id)
);

ALTER TABLE profiles ADD column `country_id` BIGINT UNSIGNED NULL;
ALTER TABLE profiles ADD column `city_id` BIGINT UNSIGNED NULL;

ALTER TABLE vk.profiles 
ADD CONSTRAINT profiles_fk_country_id
FOREIGN KEY (country_id) REFERENCES countries(id);

ALTER TABLE vk.profiles 
ADD CONSTRAINT profiles_fk_city_id
FOREIGN KEY (city_id) REFERENCES cities(id);

DROP TABLE IF EXISTS `classifieds`;
CREATE TABLE `classifieds` (
	id SERIAL,
	user_id BIGINT UNSIGNED NOT NULL,
    country_id BIGINT UNSIGNED NOT NULL,
    city_id BIGINT UNSIGNED NOT NULL,
	title VARCHAR(200) NOT NULL,
	body TEXT NOT NULL,
	price NUMERIC,

	FOREIGN KEY (country_id) REFERENCES countries(id),
	FOREIGN KEY (city_id) REFERENCES cities(id),
	FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS `classified_photos`;
CREATE TABLE `classified_photos` (
	classified_id BIGINT UNSIGNED NOT NULL,
    media_id BIGINT UNSIGNED NOT NULL,

	FOREIGN KEY (classified_id) REFERENCES classifieds(id),
	FOREIGN KEY (media_id) REFERENCES media(id)
);
