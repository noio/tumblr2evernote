FasdUAS 1.101.10   ��   ��    k             l    	 ����  r     	  	  l     
���� 
 I    ���� 
�� .sysostflalis    ��� null��    �� ��
�� 
prmp  m       �   0 S e l e c t   a   f o l d e r   t o   r e a d :��  ��  ��   	 o      ���� 0 targetfolder targetFolder��  ��        l     ��  ��    M G set targetFolder to POSIX file "/Users/Tom/art/tumblr2evernote/posts/"     �   �   s e t   t a r g e t F o l d e r   t o   P O S I X   f i l e   " / U s e r s / T o m / a r t / t u m b l r 2 e v e r n o t e / p o s t s / "      l     ��������  ��  ��        l  
  ����  I   
 �� ���� 0 add_from_folder     ��  o    ���� 0 targetfolder targetFolder��  ��  ��  ��        l     ��������  ��  ��        l     ��   ��      Split function      � ! !    S p l i t   f u n c t i o n   " # " i      $ % $ I      �� &���� 	0 split   &  ' ( ' o      ���� 0 sometext someText (  )�� ) o      ���� 0 	delimiter  ��  ��   % k      * *  + , + r      - . - o     ���� 0 	delimiter   . n      / 0 / 1    ��
�� 
txdl 0 1    ��
�� 
ascr ,  1 2 1 r     3 4 3 n   	 5 6 5 2   	��
�� 
citm 6 o    ���� 0 sometext someText 4 o      ���� 0 sometext someText 2  7 8 7 l    9 : ; 9 r     < = < J     > >  ?�� ? m     @ @ � A A  ��   = n      B C B 1    ��
�� 
txdl C 1    ��
�� 
ascr : + %> restore delimiters to default value    ; � D D J >   r e s t o r e   d e l i m i t e r s   t o   d e f a u l t   v a l u e 8  E�� E L     F F o    ���� 0 sometext someText��   #  G H G l     ��������  ��  ��   H  I J I i     K L K I      �� M���� 0 add_from_folder   M  N�� N o      ���� 0 
foldername 
folderName��  ��   L k     � O O  P Q P l     �� R S��   R %  Define some sed regex commands    S � T T >   D e f i n e   s o m e   s e d   r e g e x   c o m m a n d s Q  U V U r      W X W m      Y Y � Z Z > s e d   - n   " s / t i t l e :   \ ( . * \ ) $ / \ 1 / p "   X o      ���� 0 title_regex TITLE_REGEX V  [ \ [ r     ] ^ ] m     _ _ � ` ` < s e d   - n   " s / t a g s :   \ ( . * \ ) $ / \ 1 / p "   ^ o      ���� 0 
tags_regex 
TAGS_REGEX \  a b a r     c d c m    	 e e � f f < s e d   - n   " s / d a t e :   \ ( . * \ ) $ / \ 1 / p "   d o      ���� 0 
date_regex 
DATE_REGEX b  g h g r     i j i m     k k � l l N |   t a i l   + 2   |   s e d   - n   ' / - - - / , $ p '   |   t a i l   + 2 j o      ���� 0 content_regex CONTENT_REGEX h  m n m l   ��������  ��  ��   n  o�� o O    � p q p k    � r r  s t s r     u v u n     w x w 2    ��
�� 
file x 4    �� y
�� 
cfol y o    ���� 0 
foldername 
folderName v o      ���� 0 theitems theItems t  z�� z X    � {�� | { k   - � } }  ~  ~ r   - 4 � � � n   - 2 � � � 1   0 2��
�� 
psxp � l  - 0 ����� � c   - 0 � � � o   - .���� 0 thefile theFile � m   . /��
�� 
ctxt��  ��   � o      ���� 0 afile aFile   � � � r   5 > � � � l  5 < ����� � I  5 <�� � �
�� .rdwrread****        **** � o   5 6���� 0 afile aFile � �� ���
�� 
as   � m   7 8��
�� 
utf8��  ��  ��   � o      ���� 0 filecontents fileContents �  � � � l  ? ?��������  ��  ��   �  � � � r   ? J � � � b   ? H � � � b   ? F � � � b   ? B � � � m   ? @ � � � � � 
 c a t   " � o   @ A���� 0 afile aFile � m   B E � � � � �  " � o   F G���� 0 content_regex CONTENT_REGEX � o      ���� 0 cmd   �  � � � r   K R � � � I  K P�� ���
�� .sysoexecTEXT���     TEXT � o   K L���� 0 cmd  ��   � o      ���� 0 filecontents fileContents �  � � � l  S S��������  ��  ��   �  � � � l  S S�� � ���   �    Extract title, tags, date    � � � � 4   E x t r a c t   t i t l e ,   t a g s ,   d a t e �  � � � r   S ` � � � b   S ^ � � � b   S Z � � � b   S X � � � o   S T���� 0 title_regex TITLE_REGEX � m   T W � � � � �  " � o   X Y���� 0 afile aFile � m   Z ] � � � � �  " � o      ���� 0 cmd   �  � � � r   a h � � � I  a f�� ���
�� .sysoexecTEXT���     TEXT � o   a b���� 0 cmd  ��   � o      ���� 0 thetitle theTitle �  � � � l  i i��������  ��  ��   �  � � � r   i v � � � b   i t � � � b   i p � � � b   i n � � � o   i j���� 0 
tags_regex 
TAGS_REGEX � m   j m � � � � �  " � o   n o���� 0 afile aFile � m   p s � � � � �  " � o      ���� 0 cmd   �  � � � r   w ~ � � � I  w |�� ���
�� .sysoexecTEXT���     TEXT � o   w x���� 0 cmd  ��   � o      ���� 0 thetags theTags �  � � � r    � � � � n   � � � � I   � ��� ����� 	0 split   �  � � � o   � ����� 0 thetags theTags �  ��� � 1   � ���
�� 
spac��  ��   �  f    � � o      ���� 0 thetags theTags �  � � � l  � ���������  ��  ��   �  � � � r   � � � � � b   � � � � � b   � � � � � b   � � � � � o   � ����� 0 
date_regex 
DATE_REGEX � m   � � � � � � �  " � o   � ����� 0 afile aFile � m   � � � � � � �  " � o      ���� 0 cmd   �  � � � r   � � � � � l  � � ����� � I  � ��� ���
�� .sysoexecTEXT���     TEXT � o   � ����� 0 cmd  ��  ��  ��   � o      ���� 0 thedate theDate �  � � � r   � � � � � n  � � � � � 4   � ��� �
�� 
ldt  � o   � ����� 0 thedate theDate �  f   � � � o      ���� 0 thedate theDate �  � � � I  � �� ��~
� .ascrcmnt****      � **** � o   � ��}�} 0 thedate theDate�~   �  ��| � O   � � � � � k   � �    r   � � l  � ��{�z I  � ��y�x
�y .EVRNcrntnull��� ��� null�x   �w
�w 
Enhl o   � ��v�v 0 filecontents fileContents �u	

�u 
Entt	 o   � ��t�t 0 thetitle theTitle
 �s�r
�s 
Engg o   � ��q�q 0 thetags theTags�r  �{  �z   o      �p�p 0 thenote theNote �o r   � � o   � ��n�n 0 thedate theDate n       1   � ��m
�m 
EVdd o   � ��l�l 0 thenote theNote�o   � m   � ��                                                                                  EVRN  alis    V  Macintosh HD               ˔�'H+     �Evernote.app                                                   �W�z�        ����  	                Applications    ˔�      �z�       �  'Macintosh HD:Applications: Evernote.app     E v e r n o t e . a p p    M a c i n t o s h   H D  Applications/Evernote.app   / ��  �|  �� 0 thefile theFile | o     !�k�k 0 theitems theItems��   q m    �                                                                                  MACS  alis    t  Macintosh HD               ˔�'H+     ~
Finder.app                                                       ��,
z        ����  	                CoreServices    ˔�      �+�j       ~   q   p  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  ��   J �j l     �i�h�g�i  �h  �g  �j       �f�f   �e�d�c�e 	0 split  �d 0 add_from_folder  
�c .aevtoappnull  �   � **** �b %�a�`�_�b 	0 split  �a �^�^   �]�\�] 0 sometext someText�\ 0 	delimiter  �`   �[�Z�[ 0 sometext someText�Z 0 	delimiter   �Y�X�W @
�Y 
ascr
�X 
txdl
�W 
citm�_ ���,FO��-E�O�kv��,FO� �V L�U�T�S�V 0 add_from_folder  �U �R�R   �Q�Q 0 
foldername 
folderName�T   �P�O�N�M�L�K�J�I�H�G�F�E�D�C�P 0 
foldername 
folderName�O 0 title_regex TITLE_REGEX�N 0 
tags_regex 
TAGS_REGEX�M 0 
date_regex 
DATE_REGEX�L 0 content_regex CONTENT_REGEX�K 0 theitems theItems�J 0 thefile theFile�I 0 afile aFile�H 0 filecontents fileContents�G 0 cmd  �F 0 thetitle theTitle�E 0 thetags theTags�D 0 thedate theDate�C 0 thenote theNote # Y _ e k�B�A�@�?�>�=�<�;�:�9 � ��8 � � � ��7�6 � ��5�4�3�2�1�0�/�.
�B 
cfol
�A 
file
�@ 
kocl
�? 
cobj
�> .corecnte****       ****
�= 
ctxt
�< 
psxp
�; 
as  
�: 
utf8
�9 .rdwrread****        ****
�8 .sysoexecTEXT���     TEXT
�7 
spac�6 	0 split  
�5 
ldt 
�4 .ascrcmnt****      � ****
�3 
Enhl
�2 
Entt
�1 
Engg�0 
�/ .EVRNcrntnull��� ��� null
�. 
EVdd�S ��E�O�E�O�E�O�E�O� �*�/�-E�O ��[��l 	kh ��&�,E�O���l E�O�%a %�%E�O�j E�O�a %�%a %E�O�j E�O�a %�%a %E�O�j E�O)�_ l+ E�O�a %�%a %E�O�j E�O)a �/E�O�j Oa  *a �a �a �a   !E�O��a ",FU[OY�SU �-�,�+ �*
�- .aevtoappnull  �   � **** k     !!  ""  �)�)  �,  �+      �( �'�&�%
�( 
prmp
�' .sysostflalis    ��� null�& 0 targetfolder targetFolder�% 0 add_from_folder  �* *��l E�O*�k+  ascr  ��ޭ