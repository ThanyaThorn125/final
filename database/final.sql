PGDMP                   	    |            final    17.0    17.0 $               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false                       1262    16403    final    DATABASE     w   CREATE DATABASE final WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Thai_Thailand.874';
    DROP DATABASE final;
                     postgres    false            �            1259    16404 
   curriculom    TABLE     �   CREATE TABLE public.curriculom (
    curr_id integer NOT NULL,
    curr_name_th character varying(100),
    curr_name_en character varying(100),
    short_name_th character varying(100),
    short_name_en character varying(100)
);
    DROP TABLE public.curriculom;
       public         heap r       postgres    false            �            1259    16416    prefix    TABLE     ^   CREATE TABLE public.prefix (
    pre_id integer NOT NULL,
    prefix character varying(50)
);
    DROP TABLE public.prefix;
       public         heap r       postgres    false            �            1259    16410    section    TABLE     `   CREATE TABLE public.section (
    sec_id integer NOT NULL,
    section character varying(20)
);
    DROP TABLE public.section;
       public         heap r       postgres    false            �            1259    16409    section_sec_id_seq    SEQUENCE     �   CREATE SEQUENCE public.section_sec_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.section_sec_id_seq;
       public               postgres    false    219                       0    0    section_sec_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.section_sec_id_seq OWNED BY public.section.sec_id;
          public               postgres    false    218            �            1259    16422    student    TABLE     �  CREATE TABLE public.student (
    std_id integer NOT NULL,
    pre_id integer,
    first_name character varying(100),
    last_name character varying(100),
    date_of_birth character varying(20),
    sex character varying(20),
    curri_id integer,
    previod_school character varying(100),
    address character varying(100),
    telephone character varying(20),
    email character varying(100),
    line_id character varying(100),
    status character varying(200),
    sec_id integer
);
    DROP TABLE public.student;
       public         heap r       postgres    false            �            1259    24798    student_list    TABLE     �   CREATE TABLE public.student_list (
    id integer NOT NULL,
    std_id character varying(50),
    active_date date,
    status character varying(20)
);
     DROP TABLE public.student_list;
       public         heap r       postgres    false            �            1259    24786    student_list_id_seq    SEQUENCE     |   CREATE SEQUENCE public.student_list_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.student_list_id_seq;
       public               postgres    false            �            1259    24797    student_list_id_seq1    SEQUENCE     �   CREATE SEQUENCE public.student_list_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.student_list_id_seq1;
       public               postgres    false    225                       0    0    student_list_id_seq1    SEQUENCE OWNED BY     L   ALTER SEQUENCE public.student_list_id_seq1 OWNED BY public.student_list.id;
          public               postgres    false    224            �            1259    16421    student_std_id_seq    SEQUENCE     �   CREATE SEQUENCE public.student_std_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.student_std_id_seq;
       public               postgres    false    222                       0    0    student_std_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.student_std_id_seq OWNED BY public.student.std_id;
          public               postgres    false    221            j           2604    16413    section sec_id    DEFAULT     p   ALTER TABLE ONLY public.section ALTER COLUMN sec_id SET DEFAULT nextval('public.section_sec_id_seq'::regclass);
 =   ALTER TABLE public.section ALTER COLUMN sec_id DROP DEFAULT;
       public               postgres    false    218    219    219            k           2604    16425    student std_id    DEFAULT     p   ALTER TABLE ONLY public.student ALTER COLUMN std_id SET DEFAULT nextval('public.student_std_id_seq'::regclass);
 =   ALTER TABLE public.student ALTER COLUMN std_id DROP DEFAULT;
       public               postgres    false    221    222    222            l           2604    24801    student_list id    DEFAULT     s   ALTER TABLE ONLY public.student_list ALTER COLUMN id SET DEFAULT nextval('public.student_list_id_seq1'::regclass);
 >   ALTER TABLE public.student_list ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    224    225    225                      0    16404 
   curriculom 
   TABLE DATA           g   COPY public.curriculom (curr_id, curr_name_th, curr_name_en, short_name_th, short_name_en) FROM stdin;
    public               postgres    false    217   1)                 0    16416    prefix 
   TABLE DATA           0   COPY public.prefix (pre_id, prefix) FROM stdin;
    public               postgres    false    220   *                 0    16410    section 
   TABLE DATA           2   COPY public.section (sec_id, section) FROM stdin;
    public               postgres    false    219   T*                 0    16422    student 
   TABLE DATA           �   COPY public.student (std_id, pre_id, first_name, last_name, date_of_birth, sex, curri_id, previod_school, address, telephone, email, line_id, status, sec_id) FROM stdin;
    public               postgres    false    222   y*                 0    24798    student_list 
   TABLE DATA           G   COPY public.student_list (id, std_id, active_date, status) FROM stdin;
    public               postgres    false    225   0                  0    0    section_sec_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.section_sec_id_seq', 1, false);
          public               postgres    false    218                       0    0    student_list_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.student_list_id_seq', 136, true);
          public               postgres    false    223                       0    0    student_list_id_seq1    SEQUENCE SET     D   SELECT pg_catalog.setval('public.student_list_id_seq1', 181, true);
          public               postgres    false    224                        0    0    student_std_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.student_std_id_seq', 2, true);
          public               postgres    false    221            n           2606    16408    curriculom curriculom_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.curriculom
    ADD CONSTRAINT curriculom_pkey PRIMARY KEY (curr_id);
 D   ALTER TABLE ONLY public.curriculom DROP CONSTRAINT curriculom_pkey;
       public                 postgres    false    217            r           2606    16420    prefix prefix_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.prefix
    ADD CONSTRAINT prefix_pkey PRIMARY KEY (pre_id);
 <   ALTER TABLE ONLY public.prefix DROP CONSTRAINT prefix_pkey;
       public                 postgres    false    220            p           2606    16415    section section_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.section
    ADD CONSTRAINT section_pkey PRIMARY KEY (sec_id);
 >   ALTER TABLE ONLY public.section DROP CONSTRAINT section_pkey;
       public                 postgres    false    219            v           2606    24803    student_list student_list_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.student_list
    ADD CONSTRAINT student_list_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.student_list DROP CONSTRAINT student_list_pkey;
       public                 postgres    false    225            t           2606    16429    student student_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (std_id);
 >   ALTER TABLE ONLY public.student DROP CONSTRAINT student_pkey;
       public                 postgres    false    222            w           2606    24777    student fk_sec_id    FK CONSTRAINT     u   ALTER TABLE ONLY public.student
    ADD CONSTRAINT fk_sec_id FOREIGN KEY (sec_id) REFERENCES public.section(sec_id);
 ;   ALTER TABLE ONLY public.student DROP CONSTRAINT fk_sec_id;
       public               postgres    false    4720    219    222            x           2606    16435    student student_curri_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_curri_id_fkey FOREIGN KEY (curri_id) REFERENCES public.curriculom(curr_id);
 G   ALTER TABLE ONLY public.student DROP CONSTRAINT student_curri_id_fkey;
       public               postgres    false    217    4718    222            y           2606    16430    student student_pre_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pre_id_fkey FOREIGN KEY (pre_id) REFERENCES public.prefix(pre_id);
 E   ALTER TABLE ONLY public.student DROP CONSTRAINT student_pre_id_fkey;
       public               postgres    false    220    4722    222               �   x����A��ۧ�򮹄G�RSj䲸�]�P��F�".B$
B2�6��8#+!44�ݙo��g�h�����s<�bPZ�N�h�X,���{L�9F�}�,t�X�%�NAM�2�4uYB�%C-K�n�v�-+�M�4�{s?���0�s
~9��gqO��\��yh]�AG��b`ǎbN&H'ߎP4�N��"�{Y��a�q��D�B� :69Q         )   x�3�|�c���X�eg�?ر
�X�e������  	,            x�3�4�2�4����� ��         �  x����N"I��˫�0]��g{!{�� *`@v�Vc��8�;�(Ά`����(�;�������Յ�kw �lBHWu�=�~-�I�9��I����������I|��ma{E+*ږ��� �<;��v2�4e��]4���>։����/I�w%�W,E�ŀ>&R�z&��[��@���If�j���@��gKKT���Z����٨�)mǥF��6�g8�e2;r�{W�{�A]�@{H⏘񀞡pd�
^^��}	|{�o0�SO1���L��f���z�VG�AX��Ƕ�+�K{5��9������s����a�Tu��b��Fi����r����q�`B�H�@:�cG��Wj�LE�����0X�n�=B`l�70#��NH�����Oq�:��A�p�#<���x���毕�1n��8-��H������m�R�~��>`�BW�Mqя����υ��Oؼ���`EU�]���z��t�c�ep��]�BB�I[i���hn����rs��ʄ�̍�סz't����	�q˟"��`���)�g��`w,��ay�%j�V��s�^-L���h�3�B��Q�8U��y��Xz�;*J��jGh���5�~��{�#t:�U�1���ۅ�B�+m����Ճ��vɴ����a���!W�~O�X�3�k���Miy�h��ʚ���C��t���nP�rť��V��)~�O���?�Ɯք43�&;z��.�%��X��m��WŃcV�w�|G�V��d��l�K�l:�3�<��ב���B;�\�>����
��9i�]� Y�����ۖ�l�yS.G�A��֣(Ӄ�� lc�K%�m�R�Rb]�
�����=0��2�c|������q��Ea@�ȱE�^!�4�2�	�����V�$4Q|����#}�������c�8I��߂J�}�ƈӽ��`�(6J[e3�>wҰl��p�!$�̋^��PM���H�ͷ���%���ւ�@0�op�1GT�%@�#K��r�Y�ɔ.�ɓ��%�<�/���������*ל��"J��h?�,2A�_m��Wv���K��T�;�'Z��2�t���������#l���J�`�����$�<���c�}k�)�kA�����T��,m��h5j��-��fJ���5�ەЅ��6S��qfI�3D�c}S�e�l��9沁+#�$�2)�����B�@;�ՅK�:Z��@\�����%)�GR.�d�).�/�1�����]xt�E	���^m�j�>����\>���Qxk����ݔ�&�幖-�Hc���RȉAR�í����\�B���:�h�B�E{�:�:�|�Q_�L��~�aS�;��(��,f��'O&*��*�=��{��w�W3���q8cG�z��r\��0�խꁙ��'ҏ�kkk� x��         F  x���Mj�0F�㻤h�kߥ�)�e�M�-�@���FG��@�G}�3�1O����❏'u'�]^Z}m�s�߷��VZ�h�}S��Ɏշ�d���W'��$Ѯ˒��"y�ۥ�u��6]pr�tAE���իQD��E�ݘD�јE��XD�ݸ����g��D�1^��f������;�>��������&�����c�P(<���4��<p�z�\�������JQ�4�Ei����3Gi���\!04�`h�������X�ͱ����9hnu��ͱ�������\���l�����9Fcs����cs������Ӷm�#���     