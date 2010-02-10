CREATE TABLE jobeet_affiliate (id BIGINT AUTO_INCREMENT, url VARCHAR(255) NOT NULL, email VARCHAR(255) NOT NULL UNIQUE, token VARCHAR(255) NOT NULL, is_active TINYINT(1) DEFAULT '0' NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE jobeet_category_translation (id BIGINT, name VARCHAR(255) NOT NULL, lang CHAR(2), slug VARCHAR(255), UNIQUE INDEX sluggable_idx (slug, lang, name), PRIMARY KEY(id, lang)) ENGINE = INNODB;
CREATE TABLE jobeet_category (id BIGINT AUTO_INCREMENT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE jobeet_category_affiliate (category_id BIGINT, affiliate_id BIGINT, PRIMARY KEY(category_id, affiliate_id)) ENGINE = INNODB;
CREATE TABLE jobeet_job (id BIGINT AUTO_INCREMENT, category_id BIGINT NOT NULL, type VARCHAR(255), company VARCHAR(255) NOT NULL, logo VARCHAR(255), url VARCHAR(255), position VARCHAR(255) NOT NULL, location VARCHAR(255) NOT NULL, description TEXT NOT NULL, how_to_apply TEXT NOT NULL, token VARCHAR(255) NOT NULL UNIQUE, is_public TINYINT(1) DEFAULT '1' NOT NULL, is_activated TINYINT(1) DEFAULT '0' NOT NULL, email VARCHAR(255) NOT NULL, expires_at DATETIME NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX category_id_idx (category_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE jobeet_job (id BIGINT AUTO_INCREMENT, category_id BIGINT NOT NULL, type VARCHAR(255), company VARCHAR(255) NOT NULL, logo VARCHAR(255), url VARCHAR(255), position VARCHAR(255) NOT NULL, location VARCHAR(255) NOT NULL, description TEXT NOT NULL, how_to_apply TEXT NOT NULL, token VARCHAR(255) NOT NULL, is_public TINYINT DEFAULT '1' NOT NULL, is_activated TINYINT DEFAULT '0' NOT NULL, email VARCHAR(255) NOT NULL, expires_at DATETIME NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX category_id_idx (category_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_group (id INT AUTO_INCREMENT, name VARCHAR(255) UNIQUE, description TEXT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_group_permission (group_id INT, permission_id INT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(group_id, permission_id)) ENGINE = INNODB;
CREATE TABLE sf_guard_permission (id INT AUTO_INCREMENT, name VARCHAR(255) UNIQUE, description TEXT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_remember_key (id INT AUTO_INCREMENT, user_id INT, remember_key VARCHAR(32), ip_address VARCHAR(50), created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX user_id_idx (user_id), PRIMARY KEY(id, ip_address)) ENGINE = INNODB;
CREATE TABLE sf_guard_user (id INT AUTO_INCREMENT, username VARCHAR(128) NOT NULL UNIQUE, algorithm VARCHAR(128) DEFAULT 'sha1' NOT NULL, salt VARCHAR(128), password VARCHAR(128), is_active TINYINT(1) DEFAULT '1', is_super_admin TINYINT(1) DEFAULT '0', last_login DATETIME, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX is_active_idx_idx (is_active), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_user_group (user_id INT, group_id INT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(user_id, group_id)) ENGINE = INNODB;
CREATE TABLE sf_guard_user_permission (user_id INT, permission_id INT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(user_id, permission_id)) ENGINE = INNODB;
ALTER TABLE jobeet_category_translation ADD CONSTRAINT jobeet_category_translation_id_jobeet_category_id FOREIGN KEY (id) REFERENCES jobeet_category(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE jobeet_category_affiliate ADD CONSTRAINT jobeet_category_affiliate_category_id_jobeet_category_id FOREIGN KEY (category_id) REFERENCES jobeet_category(id) ON DELETE CASCADE;
ALTER TABLE jobeet_category_affiliate ADD CONSTRAINT jobeet_category_affiliate_affiliate_id_jobeet_affiliate_id FOREIGN KEY (affiliate_id) REFERENCES jobeet_affiliate(id) ON DELETE CASCADE;
ALTER TABLE jobeet_job ADD CONSTRAINT jobeet_job_category_id_jobeet_category_id FOREIGN KEY (category_id) REFERENCES jobeet_category(id) ON DELETE CASCADE;
ALTER TABLE jobeet_job ADD CONSTRAINT jobeet_job_category_id_jobeet_category_id_1 FOREIGN KEY (category_id) REFERENCES jobeet_category(id);
ALTER TABLE sf_guard_group_permission ADD CONSTRAINT sf_guard_group_permission_permission_id_sf_guard_permission_id FOREIGN KEY (permission_id) REFERENCES sf_guard_permission(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_group_permission ADD CONSTRAINT sf_guard_group_permission_group_id_sf_guard_group_id FOREIGN KEY (group_id) REFERENCES sf_guard_group(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_remember_key ADD CONSTRAINT sf_guard_remember_key_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_user_group ADD CONSTRAINT sf_guard_user_group_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_user_group ADD CONSTRAINT sf_guard_user_group_group_id_sf_guard_group_id FOREIGN KEY (group_id) REFERENCES sf_guard_group(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_user_permission ADD CONSTRAINT sf_guard_user_permission_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_user_permission ADD CONSTRAINT sf_guard_user_permission_permission_id_sf_guard_permission_id FOREIGN KEY (permission_id) REFERENCES sf_guard_permission(id) ON DELETE CASCADE;
