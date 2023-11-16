BEGIN;

drop table users_schema."subscription";
drop table users_schema."user";


drop schema users_schema;

CREATE SCHEMA IF NOT EXISTS users_schema;

CREATE TABLE IF NOT EXISTS users_schema."user"
(
    id            bigserial,
    "first_name"  character varying NOT NULL,
    "second_name" character varying,
    "middle_name" character varying,
    "email"       character varying NOT NULL UNIQUE,
    phone         character varying,
    about         character varying,
    photo         character varying,
    CONSTRAINT user_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS users_schema.subscription
(
    user_id       bigint NOT NULL,
    subscriber_id bigint NOT NULL,
    CONSTRAINT subscription_subscriber_id_fkey FOREIGN KEY (subscriber_id)
        REFERENCES users_schema."user" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT subscription_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES users_schema."user" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT subscription_pk PRIMARY KEY (user_id, subscriber_id)

);

END;