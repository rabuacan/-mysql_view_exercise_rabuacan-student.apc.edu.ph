PGDMP         4            
    w            guru99    12.0    12.0                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    24576    guru99    DATABASE     �   CREATE DATABASE guru99 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE guru99;
                postgres    false            �            1259    32784    goods    TABLE     �   CREATE TABLE public.goods (
    id integer NOT NULL,
    goods_quantity integer NOT NULL,
    goods_type text NOT NULL,
    goods_date date NOT NULL
);
    DROP TABLE public.goods;
       public         heap    postgres    false            �            1259    32792 	   inventory    TABLE     �   CREATE TABLE public.inventory (
    id integer NOT NULL,
    inventory_utensils text NOT NULL,
    inventory_type text NOT NULL,
    inventory_stock integer NOT NULL,
    inventory_sold integer NOT NULL
);
    DROP TABLE public.inventory;
       public         heap    postgres    false            �            1259    32800    goods_has_inventory    VIEW     P  CREATE VIEW public.goods_has_inventory AS
 SELECT goods.id,
    goods.goods_quantity,
    inventory.inventory_utensils,
    goods.goods_type,
    inventory.inventory_type,
    inventory.inventory_stock,
    inventory.inventory_sold,
    goods.goods_date
   FROM (public.goods
     JOIN public.inventory ON ((goods.id = inventory.id)));
 &   DROP VIEW public.goods_has_inventory;
       public          postgres    false    203    203    203    202    202    202    202    203    203            
          0    32784    goods 
   TABLE DATA           K   COPY public.goods (id, goods_quantity, goods_type, goods_date) FROM stdin;
    public          postgres    false    202   g                 0    32792 	   inventory 
   TABLE DATA           l   COPY public.inventory (id, inventory_utensils, inventory_type, inventory_stock, inventory_sold) FROM stdin;
    public          postgres    false    203   �       �
           2606    32791    goods goods_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.goods
    ADD CONSTRAINT goods_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.goods DROP CONSTRAINT goods_pkey;
       public            postgres    false    202            �
           2606    32799    inventory inventory_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.inventory DROP CONSTRAINT inventory_pkey;
       public            postgres    false    203            
   1   x�3�4��t��L�N�S���O�IU�/-���420��54 "�=... �         $   x�3�-I�+��)����f�Ff�\1z\\\ ���     