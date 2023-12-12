DROP TABLE IF EXISTS user_entry CASCADE;
DROP TABLE IF EXISTS password_entry CASCADE;
DROP TABLE IF EXISTS encrypted_blob CASCADE;

CREATE TABLE user_entry (
	user_id SERIAL PRIMARY KEY,
	username VARCHAR(64),
	password_hash VARCHAR(512),
	password_salt VARCHAR(64)
);

CREATE TABLE encrypted_blob (
	blob_id SERIAL PRIMARY KEY,
	nonce VARCHAR(64),
	encrypted_data VARCHAR(512)
);

CREATE TABLE password_entry (
	password_entry_id SERIAL PRIMARY KEY,
	url VARCHAR(256),
	entry_salt VARCHAR(64),
	user_id INT NOT NULL,
	username_blob INT,
	password_blob INT,
	description_blob INT,
	FOREIGN KEY (user_id) REFERENCES user_entry(user_id),
	FOREIGN KEY (username_blob) REFERENCES encrypted_blob(blob_id),
	FOREIGN KEY (password_blob) REFERENCES encrypted_blob(blob_id),
	FOREIGN KEY (description_blob) REFERENCES encrypted_blob(blob_id)
);