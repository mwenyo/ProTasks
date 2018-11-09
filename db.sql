PGDMP     -            	    
    v            protasks    10.5    10.5 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    16393    protasks    DATABASE     �   CREATE DATABASE protasks WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';
    DROP DATABASE protasks;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16394    atividades_atividade    TABLE     �  CREATE TABLE public.atividades_atividade (
    id integer NOT NULL,
    disciplina character varying(200) NOT NULL,
    atividade character varying(200) NOT NULL,
    data_cadastro timestamp with time zone NOT NULL,
    data_modificacao timestamp with time zone NOT NULL,
    data_entrega timestamp with time zone NOT NULL,
    valor numeric(4,2) NOT NULL,
    observacoes text,
    aluno_id integer NOT NULL,
    turma_id integer NOT NULL,
    encerrada boolean NOT NULL
);
 (   DROP TABLE public.atividades_atividade;
       public         postgres    false    3            �            1259    16400    atividades_atividade_id_seq    SEQUENCE     �   CREATE SEQUENCE public.atividades_atividade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.atividades_atividade_id_seq;
       public       postgres    false    3    196            �           0    0    atividades_atividade_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.atividades_atividade_id_seq OWNED BY public.atividades_atividade.id;
            public       postgres    false    197            �            1259    16402    atividades_comentario    TABLE       CREATE TABLE public.atividades_comentario (
    id integer NOT NULL,
    comentario text NOT NULL,
    data_comentario timestamp with time zone NOT NULL,
    data_modificacao timestamp with time zone NOT NULL,
    aluno_id integer NOT NULL,
    atividade_id integer NOT NULL
);
 )   DROP TABLE public.atividades_comentario;
       public         postgres    false    3            �            1259    16408    atividades_comentario_id_seq    SEQUENCE     �   CREATE SEQUENCE public.atividades_comentario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.atividades_comentario_id_seq;
       public       postgres    false    3    198            �           0    0    atividades_comentario_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.atividades_comentario_id_seq OWNED BY public.atividades_comentario.id;
            public       postgres    false    199            �            1259    16410    atividades_notificacao    TABLE     �   CREATE TABLE public.atividades_notificacao (
    id integer NOT NULL,
    texto character varying(200) NOT NULL,
    visualizada boolean NOT NULL,
    prioridade_id integer NOT NULL
);
 *   DROP TABLE public.atividades_notificacao;
       public         postgres    false    3            �            1259    16413    atividades_notificacao_id_seq    SEQUENCE     �   CREATE SEQUENCE public.atividades_notificacao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.atividades_notificacao_id_seq;
       public       postgres    false    3    200            �           0    0    atividades_notificacao_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.atividades_notificacao_id_seq OWNED BY public.atividades_notificacao.id;
            public       postgres    false    201            �            1259    16415    atividades_prioridade    TABLE     �   CREATE TABLE public.atividades_prioridade (
    id integer NOT NULL,
    aluno_id integer NOT NULL,
    atividade_id integer NOT NULL
);
 )   DROP TABLE public.atividades_prioridade;
       public         postgres    false    3            �            1259    16418    atividades_prioridade_id_seq    SEQUENCE     �   CREATE SEQUENCE public.atividades_prioridade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.atividades_prioridade_id_seq;
       public       postgres    false    3    202            �           0    0    atividades_prioridade_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.atividades_prioridade_id_seq OWNED BY public.atividades_prioridade.id;
            public       postgres    false    203            �            1259    16420 
   auth_group    TABLE     e   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);
    DROP TABLE public.auth_group;
       public         postgres    false    3            �            1259    16423    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public       postgres    false    204    3            �           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
            public       postgres    false    205            �            1259    16425    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         postgres    false    3            �            1259    16428    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public       postgres    false    3    206            �           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
            public       postgres    false    207            �            1259    16430    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         postgres    false    3            �            1259    16433    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public       postgres    false    3    208            �           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
            public       postgres    false    209            �            1259    16435 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         postgres    false    3            �            1259    16441    auth_user_groups    TABLE        CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         postgres    false    3            �            1259    16444    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public       postgres    false    3    211            �           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
            public       postgres    false    212            �            1259    16446    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public       postgres    false    210    3            �           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
            public       postgres    false    213            �            1259    16448    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         postgres    false    3            �            1259    16451 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public       postgres    false    214    3            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
            public       postgres    false    215            �            1259    16453    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         postgres    false    3            �            1259    16460    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public       postgres    false    216    3            �           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
            public       postgres    false    217            �            1259    16462    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         postgres    false    3            �            1259    16465    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public       postgres    false    3    218            �           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
            public       postgres    false    219            �            1259    16467    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         postgres    false    3            �            1259    16473    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public       postgres    false    220    3            �           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
            public       postgres    false    221            �            1259    16475    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         postgres    false    3            �            1259    16481    turmas_alunoemturma    TABLE     �   CREATE TABLE public.turmas_alunoemturma (
    id integer NOT NULL,
    data_cadastro timestamp with time zone NOT NULL,
    aluno_id integer NOT NULL,
    turma_id integer NOT NULL
);
 '   DROP TABLE public.turmas_alunoemturma;
       public         postgres    false    3            �            1259    16484    turmas_alunoemturma_id_seq    SEQUENCE     �   CREATE SEQUENCE public.turmas_alunoemturma_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.turmas_alunoemturma_id_seq;
       public       postgres    false    223    3            �           0    0    turmas_alunoemturma_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.turmas_alunoemturma_id_seq OWNED BY public.turmas_alunoemturma.id;
            public       postgres    false    224            �            1259    16486    turmas_turma    TABLE     �  CREATE TABLE public.turmas_turma (
    id integer NOT NULL,
    nome character varying(200) NOT NULL,
    codigo character varying(200),
    curso character varying(200) NOT NULL,
    ano integer NOT NULL,
    turno character varying(200) NOT NULL,
    aluno_id integer NOT NULL,
    data_cadastro timestamp with time zone NOT NULL,
    CONSTRAINT turmas_turma_ano_check CHECK ((ano >= 0))
);
     DROP TABLE public.turmas_turma;
       public         postgres    false    3            �            1259    16493    turmas_turma_id_seq    SEQUENCE     �   CREATE SEQUENCE public.turmas_turma_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.turmas_turma_id_seq;
       public       postgres    false    225    3            �           0    0    turmas_turma_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.turmas_turma_id_seq OWNED BY public.turmas_turma.id;
            public       postgres    false    226            �
           2604    16495    atividades_atividade id    DEFAULT     �   ALTER TABLE ONLY public.atividades_atividade ALTER COLUMN id SET DEFAULT nextval('public.atividades_atividade_id_seq'::regclass);
 F   ALTER TABLE public.atividades_atividade ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196            �
           2604    16496    atividades_comentario id    DEFAULT     �   ALTER TABLE ONLY public.atividades_comentario ALTER COLUMN id SET DEFAULT nextval('public.atividades_comentario_id_seq'::regclass);
 G   ALTER TABLE public.atividades_comentario ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    199    198            �
           2604    16497    atividades_notificacao id    DEFAULT     �   ALTER TABLE ONLY public.atividades_notificacao ALTER COLUMN id SET DEFAULT nextval('public.atividades_notificacao_id_seq'::regclass);
 H   ALTER TABLE public.atividades_notificacao ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    201    200            �
           2604    16498    atividades_prioridade id    DEFAULT     �   ALTER TABLE ONLY public.atividades_prioridade ALTER COLUMN id SET DEFAULT nextval('public.atividades_prioridade_id_seq'::regclass);
 G   ALTER TABLE public.atividades_prioridade ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    203    202            �
           2604    16499    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    205    204            �
           2604    16500    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    207    206            �
           2604    16501    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    209    208            �
           2604    16502    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    213    210            �
           2604    16503    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    212    211            �
           2604    16504    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    215    214            �
           2604    16505    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    217    216            �
           2604    16506    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    219    218            �
           2604    16507    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    221    220            �
           2604    16508    turmas_alunoemturma id    DEFAULT     �   ALTER TABLE ONLY public.turmas_alunoemturma ALTER COLUMN id SET DEFAULT nextval('public.turmas_alunoemturma_id_seq'::regclass);
 E   ALTER TABLE public.turmas_alunoemturma ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    224    223            �
           2604    16509    turmas_turma id    DEFAULT     r   ALTER TABLE ONLY public.turmas_turma ALTER COLUMN id SET DEFAULT nextval('public.turmas_turma_id_seq'::regclass);
 >   ALTER TABLE public.turmas_turma ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    226    225            �          0    16394    atividades_atividade 
   TABLE DATA               �   COPY public.atividades_atividade (id, disciplina, atividade, data_cadastro, data_modificacao, data_entrega, valor, observacoes, aluno_id, turma_id, encerrada) FROM stdin;
    public       postgres    false    196   h�       �          0    16402    atividades_comentario 
   TABLE DATA               z   COPY public.atividades_comentario (id, comentario, data_comentario, data_modificacao, aluno_id, atividade_id) FROM stdin;
    public       postgres    false    198   ��       �          0    16410    atividades_notificacao 
   TABLE DATA               W   COPY public.atividades_notificacao (id, texto, visualizada, prioridade_id) FROM stdin;
    public       postgres    false    200   P�       �          0    16415    atividades_prioridade 
   TABLE DATA               K   COPY public.atividades_prioridade (id, aluno_id, atividade_id) FROM stdin;
    public       postgres    false    202   m�       �          0    16420 
   auth_group 
   TABLE DATA               .   COPY public.auth_group (id, name) FROM stdin;
    public       postgres    false    204   ��       �          0    16425    auth_group_permissions 
   TABLE DATA               M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public       postgres    false    206   ��       �          0    16430    auth_permission 
   TABLE DATA               N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public       postgres    false    208   ��       �          0    16435 	   auth_user 
   TABLE DATA               �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public       postgres    false    210   N�       �          0    16441    auth_user_groups 
   TABLE DATA               A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public       postgres    false    211   }�       �          0    16448    auth_user_user_permissions 
   TABLE DATA               P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public       postgres    false    214   ��       �          0    16453    django_admin_log 
   TABLE DATA               �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public       postgres    false    216   ��       �          0    16462    django_content_type 
   TABLE DATA               C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public       postgres    false    218   ��       �          0    16467    django_migrations 
   TABLE DATA               C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public       postgres    false    220   ��       �          0    16475    django_session 
   TABLE DATA               P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public       postgres    false    222   A�       �          0    16481    turmas_alunoemturma 
   TABLE DATA               T   COPY public.turmas_alunoemturma (id, data_cadastro, aluno_id, turma_id) FROM stdin;
    public       postgres    false    223   ��       �          0    16486    turmas_turma 
   TABLE DATA               d   COPY public.turmas_turma (id, nome, codigo, curso, ano, turno, aluno_id, data_cadastro) FROM stdin;
    public       postgres    false    225   �       �           0    0    atividades_atividade_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.atividades_atividade_id_seq', 3, true);
            public       postgres    false    197            �           0    0    atividades_comentario_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.atividades_comentario_id_seq', 13, true);
            public       postgres    false    199            �           0    0    atividades_notificacao_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.atividades_notificacao_id_seq', 1, false);
            public       postgres    false    201            �           0    0    atividades_prioridade_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.atividades_prioridade_id_seq', 3, true);
            public       postgres    false    203            �           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
            public       postgres    false    205            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
            public       postgres    false    207            �           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 64, true);
            public       postgres    false    209            �           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
            public       postgres    false    212            �           0    0    auth_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.auth_user_id_seq', 2, true);
            public       postgres    false    213            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
            public       postgres    false    215            �           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 34, true);
            public       postgres    false    217            �           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 16, true);
            public       postgres    false    219            �           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 30, true);
            public       postgres    false    221            �           0    0    turmas_alunoemturma_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.turmas_alunoemturma_id_seq', 5, true);
            public       postgres    false    224            �           0    0    turmas_turma_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.turmas_turma_id_seq', 3, true);
            public       postgres    false    226            �
           2606    16511 .   atividades_atividade atividades_atividade_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.atividades_atividade
    ADD CONSTRAINT atividades_atividade_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.atividades_atividade DROP CONSTRAINT atividades_atividade_pkey;
       public         postgres    false    196            �
           2606    16513 0   atividades_comentario atividades_comentario_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.atividades_comentario
    ADD CONSTRAINT atividades_comentario_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.atividades_comentario DROP CONSTRAINT atividades_comentario_pkey;
       public         postgres    false    198            �
           2606    16515 2   atividades_notificacao atividades_notificacao_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.atividades_notificacao
    ADD CONSTRAINT atividades_notificacao_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.atividades_notificacao DROP CONSTRAINT atividades_notificacao_pkey;
       public         postgres    false    200            �
           2606    16517 O   atividades_prioridade atividades_prioridade_aluno_id_atividade_id_643b11b3_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.atividades_prioridade
    ADD CONSTRAINT atividades_prioridade_aluno_id_atividade_id_643b11b3_uniq UNIQUE (aluno_id, atividade_id);
 y   ALTER TABLE ONLY public.atividades_prioridade DROP CONSTRAINT atividades_prioridade_aluno_id_atividade_id_643b11b3_uniq;
       public         postgres    false    202    202            �
           2606    16519 0   atividades_prioridade atividades_prioridade_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.atividades_prioridade
    ADD CONSTRAINT atividades_prioridade_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.atividades_prioridade DROP CONSTRAINT atividades_prioridade_pkey;
       public         postgres    false    202            �
           2606    16521    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public         postgres    false    204            �
           2606    16523 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public         postgres    false    206    206            �
           2606    16525 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public         postgres    false    206            �
           2606    16527    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public         postgres    false    204            �
           2606    16529 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public         postgres    false    208    208            �
           2606    16531 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public         postgres    false    208                       2606    16533 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public         postgres    false    211            	           2606    16535 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public         postgres    false    211    211                        2606    16537    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public         postgres    false    210                       2606    16539 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public         postgres    false    214                       2606    16541 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public         postgres    false    214    214                       2606    16543     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public         postgres    false    210                       2606    16545 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public         postgres    false    216                       2606    16547 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public         postgres    false    218    218                       2606    16549 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public         postgres    false    218                       2606    16551 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public         postgres    false    220                       2606    16553 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public         postgres    false    222                        2606    16555 G   turmas_alunoemturma turmas_alunoemturma_aluno_id_turma_id_94d3fbfb_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.turmas_alunoemturma
    ADD CONSTRAINT turmas_alunoemturma_aluno_id_turma_id_94d3fbfb_uniq UNIQUE (aluno_id, turma_id);
 q   ALTER TABLE ONLY public.turmas_alunoemturma DROP CONSTRAINT turmas_alunoemturma_aluno_id_turma_id_94d3fbfb_uniq;
       public         postgres    false    223    223            "           2606    16557 ,   turmas_alunoemturma turmas_alunoemturma_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.turmas_alunoemturma
    ADD CONSTRAINT turmas_alunoemturma_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.turmas_alunoemturma DROP CONSTRAINT turmas_alunoemturma_pkey;
       public         postgres    false    223            &           2606    16559    turmas_turma turmas_turma_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.turmas_turma
    ADD CONSTRAINT turmas_turma_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.turmas_turma DROP CONSTRAINT turmas_turma_pkey;
       public         postgres    false    225            �
           1259    16560 &   atividades_atividade_aluno_id_9c627470    INDEX     k   CREATE INDEX atividades_atividade_aluno_id_9c627470 ON public.atividades_atividade USING btree (aluno_id);
 :   DROP INDEX public.atividades_atividade_aluno_id_9c627470;
       public         postgres    false    196            �
           1259    16561 &   atividades_atividade_turma_id_d28ea0ed    INDEX     k   CREATE INDEX atividades_atividade_turma_id_d28ea0ed ON public.atividades_atividade USING btree (turma_id);
 :   DROP INDEX public.atividades_atividade_turma_id_d28ea0ed;
       public         postgres    false    196            �
           1259    16562 '   atividades_comentario_aluno_id_54f0cca5    INDEX     m   CREATE INDEX atividades_comentario_aluno_id_54f0cca5 ON public.atividades_comentario USING btree (aluno_id);
 ;   DROP INDEX public.atividades_comentario_aluno_id_54f0cca5;
       public         postgres    false    198            �
           1259    16563 +   atividades_comentario_atividade_id_60a9b50d    INDEX     u   CREATE INDEX atividades_comentario_atividade_id_60a9b50d ON public.atividades_comentario USING btree (atividade_id);
 ?   DROP INDEX public.atividades_comentario_atividade_id_60a9b50d;
       public         postgres    false    198            �
           1259    16564 -   atividades_notificacao_prioridade_id_06a9b891    INDEX     y   CREATE INDEX atividades_notificacao_prioridade_id_06a9b891 ON public.atividades_notificacao USING btree (prioridade_id);
 A   DROP INDEX public.atividades_notificacao_prioridade_id_06a9b891;
       public         postgres    false    200            �
           1259    16565 '   atividades_prioridade_aluno_id_fb85b363    INDEX     m   CREATE INDEX atividades_prioridade_aluno_id_fb85b363 ON public.atividades_prioridade USING btree (aluno_id);
 ;   DROP INDEX public.atividades_prioridade_aluno_id_fb85b363;
       public         postgres    false    202            �
           1259    16566 +   atividades_prioridade_atividade_id_0867d99d    INDEX     u   CREATE INDEX atividades_prioridade_atividade_id_0867d99d ON public.atividades_prioridade USING btree (atividade_id);
 ?   DROP INDEX public.atividades_prioridade_atividade_id_0867d99d;
       public         postgres    false    202            �
           1259    16567    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public         postgres    false    204            �
           1259    16568 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public         postgres    false    206            �
           1259    16569 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public         postgres    false    206            �
           1259    16570 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public         postgres    false    208                       1259    16571 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public         postgres    false    211                       1259    16572 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public         postgres    false    211            
           1259    16573 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public         postgres    false    214                       1259    16574 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public         postgres    false    214                       1259    16575     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public         postgres    false    210                       1259    16576 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public         postgres    false    216                       1259    16577 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public         postgres    false    216                       1259    16578 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public         postgres    false    222                       1259    16579 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public         postgres    false    222                       1259    16580 %   turmas_alunoemturma_aluno_id_cfe74d6c    INDEX     i   CREATE INDEX turmas_alunoemturma_aluno_id_cfe74d6c ON public.turmas_alunoemturma USING btree (aluno_id);
 9   DROP INDEX public.turmas_alunoemturma_aluno_id_cfe74d6c;
       public         postgres    false    223            #           1259    16581 %   turmas_alunoemturma_turma_id_d6b2de24    INDEX     i   CREATE INDEX turmas_alunoemturma_turma_id_d6b2de24 ON public.turmas_alunoemturma USING btree (turma_id);
 9   DROP INDEX public.turmas_alunoemturma_turma_id_d6b2de24;
       public         postgres    false    223            $           1259    16582    turmas_turma_adm_id_0ecc3c5b    INDEX     Y   CREATE INDEX turmas_turma_adm_id_0ecc3c5b ON public.turmas_turma USING btree (aluno_id);
 0   DROP INDEX public.turmas_turma_adm_id_0ecc3c5b;
       public         postgres    false    225            '           2606    16583 K   atividades_atividade atividades_atividade_aluno_id_9c627470_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.atividades_atividade
    ADD CONSTRAINT atividades_atividade_aluno_id_9c627470_fk_auth_user_id FOREIGN KEY (aluno_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.atividades_atividade DROP CONSTRAINT atividades_atividade_aluno_id_9c627470_fk_auth_user_id;
       public       postgres    false    210    196    2816            (           2606    16588 N   atividades_atividade atividades_atividade_turma_id_d28ea0ed_fk_turmas_turma_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.atividades_atividade
    ADD CONSTRAINT atividades_atividade_turma_id_d28ea0ed_fk_turmas_turma_id FOREIGN KEY (turma_id) REFERENCES public.turmas_turma(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.atividades_atividade DROP CONSTRAINT atividades_atividade_turma_id_d28ea0ed_fk_turmas_turma_id;
       public       postgres    false    225    196    2854            )           2606    16593 M   atividades_comentario atividades_comentari_atividade_id_60a9b50d_fk_atividade    FK CONSTRAINT     �   ALTER TABLE ONLY public.atividades_comentario
    ADD CONSTRAINT atividades_comentari_atividade_id_60a9b50d_fk_atividade FOREIGN KEY (atividade_id) REFERENCES public.atividades_atividade(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.atividades_comentario DROP CONSTRAINT atividades_comentari_atividade_id_60a9b50d_fk_atividade;
       public       postgres    false    2784    196    198            *           2606    16598 M   atividades_comentario atividades_comentario_aluno_id_54f0cca5_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.atividades_comentario
    ADD CONSTRAINT atividades_comentario_aluno_id_54f0cca5_fk_auth_user_id FOREIGN KEY (aluno_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.atividades_comentario DROP CONSTRAINT atividades_comentario_aluno_id_54f0cca5_fk_auth_user_id;
       public       postgres    false    198    2816    210            +           2606    16603 O   atividades_notificacao atividades_notificac_prioridade_id_06a9b891_fk_atividade    FK CONSTRAINT     �   ALTER TABLE ONLY public.atividades_notificacao
    ADD CONSTRAINT atividades_notificac_prioridade_id_06a9b891_fk_atividade FOREIGN KEY (prioridade_id) REFERENCES public.atividades_prioridade(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.atividades_notificacao DROP CONSTRAINT atividades_notificac_prioridade_id_06a9b891_fk_atividade;
       public       postgres    false    2798    202    200            ,           2606    16608 M   atividades_prioridade atividades_prioridad_atividade_id_0867d99d_fk_atividade    FK CONSTRAINT     �   ALTER TABLE ONLY public.atividades_prioridade
    ADD CONSTRAINT atividades_prioridad_atividade_id_0867d99d_fk_atividade FOREIGN KEY (atividade_id) REFERENCES public.atividades_atividade(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.atividades_prioridade DROP CONSTRAINT atividades_prioridad_atividade_id_0867d99d_fk_atividade;
       public       postgres    false    202    2784    196            -           2606    16613 M   atividades_prioridade atividades_prioridade_aluno_id_fb85b363_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.atividades_prioridade
    ADD CONSTRAINT atividades_prioridade_aluno_id_fb85b363_fk_auth_user_id FOREIGN KEY (aluno_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.atividades_prioridade DROP CONSTRAINT atividades_prioridade_aluno_id_fb85b363_fk_auth_user_id;
       public       postgres    false    2816    210    202            .           2606    16618 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public       postgres    false    206    2814    208            /           2606    16623 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public       postgres    false    2803    206    204            0           2606    16628 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public       postgres    false    2839    218    208            1           2606    16633 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public       postgres    false    204    211    2803            2           2606    16638 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public       postgres    false    2816    210    211            3           2606    16643 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public       postgres    false    214    2814    208            4           2606    16648 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public       postgres    false    2816    210    214            5           2606    16653 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public       postgres    false    216    218    2839            6           2606    16658 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public       postgres    false    210    216    2816            7           2606    16663 I   turmas_alunoemturma turmas_alunoemturma_aluno_id_cfe74d6c_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.turmas_alunoemturma
    ADD CONSTRAINT turmas_alunoemturma_aluno_id_cfe74d6c_fk_auth_user_id FOREIGN KEY (aluno_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.turmas_alunoemturma DROP CONSTRAINT turmas_alunoemturma_aluno_id_cfe74d6c_fk_auth_user_id;
       public       postgres    false    223    210    2816            8           2606    16668 L   turmas_alunoemturma turmas_alunoemturma_turma_id_d6b2de24_fk_turmas_turma_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.turmas_alunoemturma
    ADD CONSTRAINT turmas_alunoemturma_turma_id_d6b2de24_fk_turmas_turma_id FOREIGN KEY (turma_id) REFERENCES public.turmas_turma(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.turmas_alunoemturma DROP CONSTRAINT turmas_alunoemturma_turma_id_d6b2de24_fk_turmas_turma_id;
       public       postgres    false    223    2854    225            9           2606    16673 ;   turmas_turma turmas_turma_aluno_id_1083548f_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.turmas_turma
    ADD CONSTRAINT turmas_turma_aluno_id_1083548f_fk_auth_user_id FOREIGN KEY (aluno_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 e   ALTER TABLE ONLY public.turmas_turma DROP CONSTRAINT turmas_turma_aluno_id_1083548f_fk_auth_user_id;
       public       postgres    false    2816    225    210            �     x�}PKN�0\;�x ��'��]���a�Ƥ����Q��>�b�r1l@	�Y�<͌��n}]�܆��θ@���[���+�ZK�EMW
��EU�J�J3Ey!��K��h��ll����v��f	�w�ė��[��!��&Lz4Л`~[��[i���(�U�j\袎Ht�Z݇��Yf�6��2F��M[�ٓ���y�q�`����������s�r�9WTJ�T}��d�FN+���V�ǽx��O�pt{n>W���e���k~      �   �  x��T�n�6}��b�Eؒ��m�b`�<li�˶Oy����]�Tx���M��?֡g{��Ԑ-�3sf��1��;�����$M�j��"YB�����VQ��|�H����	�f���[�'h��Cus��U¢4]&��<��I:e����;���:=��j'��p@9.ŃG�6����w�!�M�#�U�J�' �ת�<9�~@�	���
w��A8��~����N����EI��XT�e���}��(�'T+:�\�n��h���wq�=eG�=� h1JX�[���7"QlQu�P� ��!Q�;/��A�ӆʚC����ݩ�N&$�F=Im�NE�O%�PD�8�1��D9���#G�*~�s;._\U`�H�ٻp̍������	��;�zn�e ѥ��U�*Y�����_�-�2���$�|�V:��_�[�Њ���:Z�R��7��;ߑ8*(�I���ͫ���u�LVY��g������l�l)3M�����Wp��S7h[#'���N|Bx��;p��H��p�?�k�Α�G�叚�|�P#�	�����4��&ЁVcҎ`��X ƾ�U���$Z�K��wvi���;������Jo4i��,,\I��,Yf��V]N�f��:��f�*��Ҽb�(͓$����jd�޳M�7$��O�M��3���U�&+Ҽ|-�/Z�$���)I�=J��5���3ګn�Z*0��V�sH�ŷof�z����~=��+qە�⠏�Q�h_��o�88o%��w`M{=�;7�*���cd��p�V�Qc��@y�?�\��ygc�"��e�~��sC�_�ba�k�"+�r�,_��2��:_g��a7;55굂<I�?B���z���[{={ڌ��F�v���=��з�t{z���6/�ϖ!�ń����-�l�7ޟR}f����:J)��ƹ5�>�N��  �      �      x������ � �      �      x�3�4�4�2��\1z\\\ !      �      x������ � �      �      x������ � �      �   p  x�}�A�� ��p
��
Ɛd=�9A��Jhj)�#Ǚj�Suу�bux���_��;J��C՞��u�Tn��O��2���a(k@N������<���9�� �ѹ�{M$�D�����~��AԠ�&��rD;��cQ�����Hp$�1Z^��q�Y���腈�NAD� ��ew7�^�R5�|\��=`������l\����>�|�yyk��ysN�f�:P�F!��Wƣ��]��h�e���w�ߪaɚ�=1�1����^�H�VII�Sߊ=����Y��:� �r�@��9 ���)���}t����,�Xj�fʡAY�)�V%� �L���˻l�nGLZ����A#d�Y�O�c�li��K`jE{}c�z���s 7��u��y͚QnW���v�{��=iH��_6�SKn˯��kQ��!�Ȇ����Lh�N�O0�Iu8�?Lz��gwj���G���ŀ��v�+T��4���U�@q��ԭ�A��k�S:��٨��e��F��.hV�t�@��i�y@5y�`Ɩ-4��^�Аfp�D��J�)Ra_�¬���H�YK��m�����y�f�J�f�J�Fm���ߤ��rS��      �     x�u�Mo�@E�ï��F�g�I�T!��u!��&�ȇ�cA@�}Q��}���r�r��>N�g���qԏ�2�����"x2����ϡ_'a;[�tխ�i����m����s7��� �0 "W�� ��w 
N �sy���b	�*o$���a[H�[�.����1��>"j࿁��t7mp��^�q�NY{�
�]FΓ���������F*kզ�v��~�`l�,�{���M�sYF���5:.նN*8�eٟ���TjP\���0����ыɇe�7��mZ      �      x������ � �      �      x������ � �      �   )  x���Ko�@��ɧ�r��v���B8�
�L��$�� !�wg�h�8���Q�����ga�������@d�<mͅ�	L���<��|+���	<���~��ŢX�b�����7�)A>�Ud�5��pr���i,�"��$p�cIp:"E�C�K�r_~/��8_����괈#��'���E�.6�|[V��Xp�G^v�}[e�,����)RPޑ��vZjV��0�����(����8��#9偙�\��Ϳ曛8[��j��ǫ��>b��^��Gc"e�7�S�Ql~Vg��r��_o�u1{��V��K#Ө�P�F�3��S©zx�=�G<�E��o��y&�3�<��"x�Q���a�o�����x�J&�x<���6�K���U�P�w�|��{>��î��zm���1�J�,:�s���ؑ����؈!(d�lk�K��x�{��g�E�Q{��!��9׹E�ϯ%�mq�w�Mu��H�GQ�2vd5r+�N�����ٚ<�1qu��g�s��P����y�O�����|^��	�����1�3���aS�\����d�xJd��НO'�ism�tJ4�2Yߺk���׆�}���́�{n��f�
C:gN�����zZ��v�h�@W�dclW��GO��|��Au�P� �Fa��po�r�����r�gb1�lsXg��.�W��8vW�	tP�N;~��.n/�4��t��4�	�\����m^ݮ�<�G�M�CA����((�s�2����a�I뉄I������CP�h�)B�x@�� ��IM��?�"�<      �   �   x�U��!���a���.^�&%L��%O�|��h��#�vެO�AaNOlt$B�a�d��LUd�feاbKG��X�؏[��rt(u��IL��W���������g��U�����_zN� �K��������r�QK��' x�qr�      �   �  x����n�0�������g|�YV���M�8t�D۷_۴� m�&�B�������v?��� �_��X����+�����BY�ڑ�W��x����X`e���T�sD�dBw}�]b����˦��>���p>�:H*�u�]��p�����p񧷮:� vU
�!��&-�*��OO|�rW�(�sf�}�ǲ��e�TÐJJ�o�__��%�kWEĜC��J}��C�(�P�O-�0�dq�����������x��� rV�RQ�aL�Wqc�z��$k��-:���Z�s�9v�2�FB_��t��Rn���a��!7�����M9��M�u� ��N�:�Γ������&���T*�rÀC����u�Z�&O��x��D���@r�������%b�<��5���Y-y�]�j���B�@4�R�݂��܊W� %$��~��7<�'.0��@!���^�,��)?V���&�q�����]��֤.�
c��څjA��ʀ+� �!S>�H�mxt+]��`�����i�>��)��L�-�`�k�89�P�:�.F7%_�cu�G����4�$�N�.F���>� �?�s<m}w��
��'A�L+��ʏs�=H��#6�B���|�(�r<ξ����s��y#V���%���?4��      �   N  x����n�6�s��1�jzHƉ!cH#�[B/Z,��(��Χ�3�E���'�.?���]���Pg���>�b�������=�0�����[�s��p!�Ϛ�0/�|�>q�U3�N�lL���丯��S�m��N��+FqDo0��ir�e\��Z�h��Z�&�T2�P|�����?~��;�k^<S�}�nsue��ŏ���6�͆1���(�c�-{nEpp��r���W`�~���5�>0���tA9��`�ƥ��ȭ�@�	�'h��!��x	��~�(K �.���rF¢���K"�H�v_v�C�����B�j�a3��1=bIQ1!�ĝH�3��:��]��,�+�W���M��^{��;��!,k:w�/8�����
 bbx��4�t6	�S��m���ɼdӥi��z��]����c�5�r�~��+�n�B�c,��Ld ]��������,�[���l�r�z���E�^Yk���KJ��o��v�:��`!50�W�K_%b =�J\��H����K1��w���>X�D�,`��v%UM��4i4�D�� �Q�ई�v�� q(u��"��-w�Ԝ!]�EF�0��F�R�V8�9<�K�6o�W��G>X���ۖ2�R�=c����
�+F�ޫ���v�a�AH��~&��[���~El��+��m_%ן�o�q�q�?쨃��
� ����r�p@��ju|.���Bum6�sw�C߀� t�+�E�~���ʱhiU�HI3������-Z8�s�eg;�p��2 �~����[CƵ]ұ��ܜ��1�e�=w����.ѣ+
��ݟ���ǟ�s�      �   c   x�e��1���"���Z��u����ᠡ&0���c�/��4���6�ϯ��n�ԛ�q>&�l��'���P�G�4\�]���qy����� �      �   �   x�m�?
�0����@K��f+�8����Ӏ��4=�����	����>x���v薷�@����	$�8? �I]Rb�p��P�U�K�W%f����E�/@Ra��ac��2�����F��G֊'�ʆ�L�4�&�<�_��t��GF;���j�(��/�~f�M*�D�2�ת(�\i=�     