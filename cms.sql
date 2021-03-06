PGDMP                          z            postgres    14.1    14.1 '    '           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            (           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            )           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            *           1262    13754    postgres    DATABASE     d   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_India.1252';
    DROP DATABASE postgres;
                postgres    false            +           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3370                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            ,           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            ?            1259    16416    audit    TABLE     ?   CREATE TABLE public.audit (
    created_at time with time zone,
    created_by text,
    updated_at time with time zone,
    updated_by text
);
    DROP TABLE public.audit;
       public         heap    postgres    false            ?            1259    16402    blog    TABLE     ?   CREATE TABLE public.blog (
    blog_id uuid NOT NULL,
    user_id uuid NOT NULL,
    blog_title text,
    status boolean,
    created_at time with time zone,
    updated_at time with time zone,
    created_by text,
    updated_by text
);
    DROP TABLE public.blog;
       public         heap    postgres    false            ?            1259    16433 
   categories    TABLE     ?   CREATE TABLE public.categories (
    category_id uuid NOT NULL,
    category_name text NOT NULL,
    created_at time with time zone,
    updated_at time with time zone,
    created_by text,
    updated_by text
);
    DROP TABLE public.categories;
       public         heap    postgres    false            ?            1259    16440    comment    TABLE        CREATE TABLE public.comment (
    comment_id uuid NOT NULL,
    user_id uuid NOT NULL,
    post_id uuid NOT NULL,
    comment_content text,
    created_at time with time zone,
    updated_at time with time zone,
    created_by text,
    updated_by text
);
    DROP TABLE public.comment;
       public         heap    postgres    false            ?            1259    16447    post    TABLE     ?  CREATE TABLE public.post (
    post_id uuid NOT NULL,
    user_id uuid NOT NULL,
    post_type_id uuid NOT NULL,
    blog_id uuid NOT NULL,
    tag_id uuid NOT NULL,
    post_title text,
    categories text,
    status text,
    post_content text,
    path text,
    created_at time with time zone,
    updated_at time with time zone,
    created_by text,
    updated_by text,
    slug text,
    comment_id uuid
);
    DROP TABLE public.post;
       public         heap    postgres    false            ?            1259    16428    post_tag    TABLE     ?   CREATE TABLE public.post_tag (
    tag_id uuid NOT NULL,
    post_id uuid NOT NULL,
    created_at time with time zone,
    updated_at time with time zone,
    created_by text,
    updated_by text
);
    DROP TABLE public.post_tag;
       public         heap    postgres    false            ?            1259    16409 	   post_type    TABLE     ?   CREATE TABLE public.post_type (
    post_type_id uuid NOT NULL,
    post_type text NOT NULL,
    created_at time with time zone,
    updated_at time with time zone,
    created_by text,
    updated_by text
);
    DROP TABLE public.post_type;
       public         heap    postgres    false            ?            1259    16421    tag    TABLE     ?   CREATE TABLE public.tag (
    tag_id uuid NOT NULL,
    tag_name text NOT NULL,
    created_at time with time zone,
    updated_at time with time zone,
    created_by text,
    updated_by text
);
    DROP TABLE public.tag;
       public         heap    postgres    false            ?            1259    16395    user    TABLE       CREATE TABLE public."user" (
    user_id uuid NOT NULL,
    user_image bytea NOT NULL,
    created_at time with time zone,
    updated_at time with time zone,
    user_email text NOT NULL,
    password text NOT NULL,
    user_role text,
    created_by text,
    updated_by text
);
    DROP TABLE public."user";
       public         heap    postgres    false                      0    16416    audit 
   TABLE DATA           O   COPY public.audit (created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    213   ?,                 0    16402    blog 
   TABLE DATA           t   COPY public.blog (blog_id, user_id, blog_title, status, created_at, updated_at, created_by, updated_by) FROM stdin;
    public          postgres    false    211   ?,       "          0    16433 
   categories 
   TABLE DATA           p   COPY public.categories (category_id, category_name, created_at, updated_at, created_by, updated_by) FROM stdin;
    public          postgres    false    216   ?,       #          0    16440    comment 
   TABLE DATA           ?   COPY public.comment (comment_id, user_id, post_id, comment_content, created_at, updated_at, created_by, updated_by) FROM stdin;
    public          postgres    false    217   -       $          0    16447    post 
   TABLE DATA           ?   COPY public.post (post_id, user_id, post_type_id, blog_id, tag_id, post_title, categories, status, post_content, path, created_at, updated_at, created_by, updated_by, slug, comment_id) FROM stdin;
    public          postgres    false    218   -       !          0    16428    post_tag 
   TABLE DATA           c   COPY public.post_tag (tag_id, post_id, created_at, updated_at, created_by, updated_by) FROM stdin;
    public          postgres    false    215   <-                 0    16409 	   post_type 
   TABLE DATA           l   COPY public.post_type (post_type_id, post_type, created_at, updated_at, created_by, updated_by) FROM stdin;
    public          postgres    false    212   Y-                  0    16421    tag 
   TABLE DATA           _   COPY public.tag (tag_id, tag_name, created_at, updated_at, created_by, updated_by) FROM stdin;
    public          postgres    false    214   v-                 0    16395    user 
   TABLE DATA           ?   COPY public."user" (user_id, user_image, created_at, updated_at, user_email, password, user_role, created_by, updated_by) FROM stdin;
    public          postgres    false    210   ?-                  2606    16408    blog blog_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.blog
    ADD CONSTRAINT blog_pkey PRIMARY KEY (blog_id);
 8   ALTER TABLE ONLY public.blog DROP CONSTRAINT blog_pkey;
       public            postgres    false    211            ?           2606    16439    categories categories_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public            postgres    false    216            ?           2606    16446    comment comment_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (comment_id);
 >   ALTER TABLE ONLY public.comment DROP CONSTRAINT comment_pkey;
       public            postgres    false    217            ?           2606    16453    post post_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (post_id);
 8   ALTER TABLE ONLY public.post DROP CONSTRAINT post_pkey;
       public            postgres    false    218            ?           2606    16415    post_type post_type_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.post_type
    ADD CONSTRAINT post_type_pkey PRIMARY KEY (post_type_id);
 B   ALTER TABLE ONLY public.post_type DROP CONSTRAINT post_type_pkey;
       public            postgres    false    212            ?           2606    16427    tag tag_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (tag_id);
 6   ALTER TABLE ONLY public.tag DROP CONSTRAINT tag_pkey;
       public            postgres    false    214            }           2606    16401    user user_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            postgres    false    210            ?           1259    16465    fki_post    INDEX     @   CREATE INDEX fki_post ON public.post_tag USING btree (post_id);
    DROP INDEX public.fki_post;
       public            postgres    false    215            ?           1259    16459    fki_tag    INDEX     >   CREATE INDEX fki_tag ON public.post_tag USING btree (tag_id);
    DROP INDEX public.fki_tag;
       public            postgres    false    215            ?           1259    16471    fki_user    INDEX     <   CREATE INDEX fki_user ON public.blog USING btree (user_id);
    DROP INDEX public.fki_user;
       public            postgres    false    211            ?           2606    16460    post_tag post    FK CONSTRAINT     p   ALTER TABLE ONLY public.post_tag
    ADD CONSTRAINT post FOREIGN KEY (post_id) REFERENCES public.post(post_id);
 7   ALTER TABLE ONLY public.post_tag DROP CONSTRAINT post;
       public          postgres    false    218    3212    215            ?           2606    16454    post_tag tag    FK CONSTRAINT     l   ALTER TABLE ONLY public.post_tag
    ADD CONSTRAINT tag FOREIGN KEY (tag_id) REFERENCES public.tag(tag_id);
 6   ALTER TABLE ONLY public.post_tag DROP CONSTRAINT tag;
       public          postgres    false    3204    214    215            ?           2606    16466 	   blog user    FK CONSTRAINT     z   ALTER TABLE ONLY public.blog
    ADD CONSTRAINT "user" FOREIGN KEY (user_id) REFERENCES public."user"(user_id) NOT VALID;
 5   ALTER TABLE ONLY public.blog DROP CONSTRAINT "user";
       public          postgres    false    211    3197    210            ?           2606    16472 	   post user    FK CONSTRAINT     p   ALTER TABLE ONLY public.post
    ADD CONSTRAINT "user" FOREIGN KEY (post_id) REFERENCES public."user"(user_id);
 5   ALTER TABLE ONLY public.post DROP CONSTRAINT "user";
       public          postgres    false    3197    210    218                  x?????? ? ?            x?????? ? ?      "      x?????? ? ?      #      x?????? ? ?      $      x?????? ? ?      !      x?????? ? ?            x?????? ? ?             x?????? ? ?            x?????? ? ?     