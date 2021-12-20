PGDMP     9    1                y            fafij    13.3    13.3 =               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    25475    fafij    DATABASE     b   CREATE DATABASE fafij WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';
    DROP DATABASE fafij;
                postgres    false            �            1259    25476    category    TABLE     �   CREATE TABLE public.category (
    id integer NOT NULL,
    name text DEFAULT ''::text NOT NULL,
    id_jrnl bigint NOT NULL
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    25483    category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.category_id_seq;
       public          postgres    false    200                       0    0    category_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;
          public          postgres    false    201            �            1259    25485    invitations    TABLE     �   CREATE TABLE public.invitations (
    id integer NOT NULL,
    id_user bigint NOT NULL,
    id_jrnl bigint NOT NULL,
    id_role bigint NOT NULL,
    accepted boolean DEFAULT false NOT NULL,
    declined boolean DEFAULT false NOT NULL
);
    DROP TABLE public.invitations;
       public         heap    postgres    false            �            1259    25489    invitations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.invitations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.invitations_id_seq;
       public          postgres    false    202                       0    0    invitations_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.invitations_id_seq OWNED BY public.invitations.id;
          public          postgres    false    203            �            1259    25491    journal    TABLE     i   CREATE TABLE public.journal (
    id integer NOT NULL,
    name text DEFAULT 'journal'::text NOT NULL
);
    DROP TABLE public.journal;
       public         heap    postgres    false            �            1259    25498    journal_id_seq    SEQUENCE     �   CREATE SEQUENCE public.journal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.journal_id_seq;
       public          postgres    false    204            	           0    0    journal_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.journal_id_seq OWNED BY public.journal.id;
          public          postgres    false    205            �            1259    25500    note    TABLE     �   CREATE TABLE public.note (
    id integer NOT NULL,
    ctgr bigint NOT NULL,
    comment text NOT NULL,
    id_jrnl bigint NOT NULL,
    sum bigint DEFAULT 0 NOT NULL,
    date timestamp without time zone NOT NULL
);
    DROP TABLE public.note;
       public         heap    postgres    false            �            1259    25507    note_id_seq    SEQUENCE     �   CREATE SEQUENCE public.note_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.note_id_seq;
       public          postgres    false    206            
           0    0    note_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.note_id_seq OWNED BY public.note.id;
          public          postgres    false    207            �            1259    25509    roles    TABLE     e   CREATE TABLE public.roles (
    id integer NOT NULL,
    role_name character varying(30) NOT NULL
);
    DROP TABLE public.roles;
       public         heap    postgres    false            �            1259    25512    roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public          postgres    false    208                       0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
          public          postgres    false    209            �            1259    25514 
   user_roles    TABLE     z   CREATE TABLE public.user_roles (
    id_user bigint NOT NULL,
    id_jrnl bigint NOT NULL,
    id_role bigint NOT NULL
);
    DROP TABLE public.user_roles;
       public         heap    postgres    false            �            1259    25517    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    password text NOT NULL,
    login text DEFAULT 'user'::text NOT NULL,
    CONSTRAINT user_password_check CHECK ((length(password) >= 6))
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    25525    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    211                       0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    212            I           2604    25527    category id    DEFAULT     j   ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);
 :   ALTER TABLE public.category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    201    200            K           2604    25528    invitations id    DEFAULT     p   ALTER TABLE ONLY public.invitations ALTER COLUMN id SET DEFAULT nextval('public.invitations_id_seq'::regclass);
 =   ALTER TABLE public.invitations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202            N           2604    25529 
   journal id    DEFAULT     h   ALTER TABLE ONLY public.journal ALTER COLUMN id SET DEFAULT nextval('public.journal_id_seq'::regclass);
 9   ALTER TABLE public.journal ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204            O           2604    25530    note id    DEFAULT     b   ALTER TABLE ONLY public.note ALTER COLUMN id SET DEFAULT nextval('public.note_id_seq'::regclass);
 6   ALTER TABLE public.note ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206            Q           2604    25531    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208            S           2604    25532    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    211            �          0    25476    category 
   TABLE DATA           5   COPY public.category (id, name, id_jrnl) FROM stdin;
    public          postgres    false    200   �C       �          0    25485    invitations 
   TABLE DATA           X   COPY public.invitations (id, id_user, id_jrnl, id_role, accepted, declined) FROM stdin;
    public          postgres    false    202   �D       �          0    25491    journal 
   TABLE DATA           +   COPY public.journal (id, name) FROM stdin;
    public          postgres    false    204   �D       �          0    25500    note 
   TABLE DATA           E   COPY public.note (id, ctgr, comment, id_jrnl, sum, date) FROM stdin;
    public          postgres    false    206   IE       �          0    25509    roles 
   TABLE DATA           .   COPY public.roles (id, role_name) FROM stdin;
    public          postgres    false    208   �G       �          0    25514 
   user_roles 
   TABLE DATA           ?   COPY public.user_roles (id_user, id_jrnl, id_role) FROM stdin;
    public          postgres    false    210   �G       �          0    25517    users 
   TABLE DATA           4   COPY public.users (id, password, login) FROM stdin;
    public          postgres    false    211   H                  0    0    category_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.category_id_seq', 33, true);
          public          postgres    false    201                       0    0    invitations_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.invitations_id_seq', 8, true);
          public          postgres    false    203                       0    0    journal_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.journal_id_seq', 80, true);
          public          postgres    false    205                       0    0    note_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.note_id_seq', 43, true);
          public          postgres    false    207                       0    0    roles_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.roles_id_seq', 3, true);
          public          postgres    false    209                       0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 16, true);
          public          postgres    false    212            V           2606    25534    category category_pk 
   CONSTRAINT     R   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pk PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pk;
       public            postgres    false    200            X           2606    25536    invitations invitations_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.invitations
    ADD CONSTRAINT invitations_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.invitations DROP CONSTRAINT invitations_pkey;
       public            postgres    false    202            Z           2606    25538    journal journal_name_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.journal
    ADD CONSTRAINT journal_name_key UNIQUE (name);
 B   ALTER TABLE ONLY public.journal DROP CONSTRAINT journal_name_key;
       public            postgres    false    204            \           2606    25540    journal journal_pk 
   CONSTRAINT     P   ALTER TABLE ONLY public.journal
    ADD CONSTRAINT journal_pk PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.journal DROP CONSTRAINT journal_pk;
       public            postgres    false    204            ^           2606    25542    note note_pk 
   CONSTRAINT     J   ALTER TABLE ONLY public.note
    ADD CONSTRAINT note_pk PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.note DROP CONSTRAINT note_pk;
       public            postgres    false    206            `           2606    25544    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    208            b           2606    25546    roles roles_role_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_role_name_key UNIQUE (role_name);
 C   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_role_name_key;
       public            postgres    false    208            f           2606    25548    users user_login_key 
   CONSTRAINT     P   ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_login_key UNIQUE (login);
 >   ALTER TABLE ONLY public.users DROP CONSTRAINT user_login_key;
       public            postgres    false    211            h           2606    25550    users user_pk 
   CONSTRAINT     K   ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_pk PRIMARY KEY (id);
 7   ALTER TABLE ONLY public.users DROP CONSTRAINT user_pk;
       public            postgres    false    211            d           2606    25552    user_roles user_roles_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (id_user, id_jrnl, id_role);
 D   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT user_roles_pkey;
       public            postgres    false    210    210    210            i           2606    25553    category category_id_jrnl_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_id_jrnl_fkey FOREIGN KEY (id_jrnl) REFERENCES public.journal(id);
 H   ALTER TABLE ONLY public.category DROP CONSTRAINT category_id_jrnl_fkey;
       public          postgres    false    2908    200    204            j           2606    25558 $   invitations invitations_id_jrnl_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.invitations
    ADD CONSTRAINT invitations_id_jrnl_fkey FOREIGN KEY (id_jrnl) REFERENCES public.journal(id);
 N   ALTER TABLE ONLY public.invitations DROP CONSTRAINT invitations_id_jrnl_fkey;
       public          postgres    false    202    204    2908            k           2606    25563 $   invitations invitations_id_role_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.invitations
    ADD CONSTRAINT invitations_id_role_fkey FOREIGN KEY (id_role) REFERENCES public.roles(id);
 N   ALTER TABLE ONLY public.invitations DROP CONSTRAINT invitations_id_role_fkey;
       public          postgres    false    202    2912    208            l           2606    25568 $   invitations invitations_id_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.invitations
    ADD CONSTRAINT invitations_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.users(id);
 N   ALTER TABLE ONLY public.invitations DROP CONSTRAINT invitations_id_user_fkey;
       public          postgres    false    2920    202    211            m           2606    25573    note note_ctgr_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.note
    ADD CONSTRAINT note_ctgr_fkey FOREIGN KEY (ctgr) REFERENCES public.category(id) ON UPDATE CASCADE ON DELETE CASCADE;
 =   ALTER TABLE ONLY public.note DROP CONSTRAINT note_ctgr_fkey;
       public          postgres    false    2902    200    206            n           2606    25578    note note_id_jrnl_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.note
    ADD CONSTRAINT note_id_jrnl_fkey FOREIGN KEY (id_jrnl) REFERENCES public.journal(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 @   ALTER TABLE ONLY public.note DROP CONSTRAINT note_id_jrnl_fkey;
       public          postgres    false    206    2908    204            o           2606    25583 "   user_roles user_roles_id_jrnl_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_id_jrnl_fkey FOREIGN KEY (id_jrnl) REFERENCES public.journal(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 L   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT user_roles_id_jrnl_fkey;
       public          postgres    false    210    204    2908            p           2606    25588 "   user_roles user_roles_id_role_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_id_role_fkey FOREIGN KEY (id_role) REFERENCES public.roles(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 L   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT user_roles_id_role_fkey;
       public          postgres    false    2912    208    210            q           2606    25593 "   user_roles user_roles_id_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 L   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT user_roles_id_user_fkey;
       public          postgres    false    210    211    2920            �   �   x�M���0�����cW�x�$G/,a�F�o�`�}_��84�� 3djr�r��H���%lR����+��O��u4�ٺ�:���D�~��p��KG��)y�m�-y-�M�n:8����r�����tO|2�`��E���0hȇ�����
�8z>N��@�C�      �   1   x�3�44�47�4�,�L�2�q��sNC3NsK���g������ %I	�      �   _   x�37�tK��̩�27�H-*��K��27�����/-s�8�Ks2��"�p�gpbZbQ~B�%�gYb�WQ^���_inRj�^*W� �#      �   =  x��T[��@��9�/��y�/?\���f�� 8�6%�p��Q3�;��DVd�������H�)˻����T�C>�s���w�!��;<��c���@~�#�(�bY�n���&�JFb���r��C� ��qp(k�m���%�0��Z�c��E>1��ضI�c�v(�y�Ǻ���	�.��<���P1�^���40/�S�	5Ny_������Vb��6�F����C?�������6��ڵN��������.�`W|)���9L��n>y�����(�KI �PvM��r�O�~�k���$V���)o�M�����bf4t��t=�j����26�V�	�5�7�R�|j!�/��#2��c.� rQ>�!1�9�KcTZB�SM�� Y��P|��O�)m�ZT���m�7�L�ښp�.K��2^�,$	!w��
�_�a(�I�����q��u� �Ǻ�?N��Z����N�LY�4B�(���{����i��ݶ��H��ԯ�OU^i��!��0!�/�n�߽m=fރ�(#�d�����K��Y��1��V�2+��(����o�i�      �   !   x�3�tt����2ҡ>!\Ɯޞ.\1z\\\ N^3      �   D   x�-���0Cѳ=JR��]��$��ӗeA��GC0��̮A����T
Z���Ĳ���T��E���W      �     x�%��nA 뽏	H�[:p��n�|��w�E�����LO��,�b��Y��`�M�s�#�V�Hȱߗ��id�ܡ��W����^�T���c����l����� �>+���*���$��6���Ӌ�\>�c��`N5���&���`�q�{oJT�����f~���\�m���)+7C`B+9d@�YQ�t��r�?�jo$�1� dC�����]����N��	^��N�n$m �ԙGMg����ǩ�_˲|�fb     