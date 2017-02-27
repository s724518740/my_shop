

DROP TABLE IF EXISTS `member`;
CREATE TABLE IF NOT EXISTS `member` (
  `id` int AUTO_INCREMENT PRIMARY KEY,
  `username` varchar(255) NOT NULL DEFAULT '' COMMENT '�û���',
  `password_hash` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '����',
  `created_at` int unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `updated_at` int unsigned NOT NULL DEFAULT '0' COMMENT '�޸�ʱ��',
  KEY `ind_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��Ա';



DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int AUTO_INCREMENT PRIMARY KEY,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '����',
  `created_at` int unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `updated_at` int unsigned NOT NULL DEFAULT '0' COMMENT '�޸�ʱ��'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��Ʒ��';

DROP TABLE IF EXISTS `goods`;
CREATE TABLE IF NOT EXISTS `goods` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `category_id` INT NOT NULL DEFAULT '0' COMMENT '����ID',
  `name` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '����',
  `price` DEC(10,2) NOT NULL DEFAULT '0' COMMENT '����',
  `qty` INT NOT NULL DEFAULT '0' COMMENT '����',
  `pic` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '��ͼ',
  `created_at` INT UNSIGNED NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `updated_at` INT UNSIGNED NOT NULL DEFAULT '0' COMMENT '�޸�ʱ��'
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='��Ʒ��';

DROP TABLE IF EXISTS image;
CREATE TABLE IF NOT EXISTS `image` (
  `id` int AUTO_INCREMENT PRIMARY KEY,
  `goods_id` INT NOT NULL DEFAULT '0' COMMENT '��ƷID',
  `is_face` INT NOT NULL DEFAULT '0' COMMENT '�Ƿ���ͼ',
  `file` varchar(255) NOT NULL DEFAULT '' COMMENT '�ļ�����',
  `created_at` int unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `updated_at` int unsigned NOT NULL DEFAULT '0' COMMENT '�޸�ʱ��'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��Ʒ��';



INSERT INTO `category` (`id`, `name`, `created_at`, `updated_at`)
VALUES
	(1, '�·�', 0, 0),
	(2, 'ʳƷ', 0, 0);

	
INSERT INTO `goods` (`id`, `category_id`, `name`, `price`, `qty`, `pic`, `created_at`, `updated_at`)
VALUES
	(1, 1, '��װ1', 100.00, 0, 'ͼƬ1', 0, 0),
	(2, 1, '��װ2', 99.00, 0, 'ͼƬ2', 0, 0),
	(3, 2, '�Ե�1', 10.00, 0, 'ͼƬ3', 0, 0),
	(4, 2, '�Ե�2', 20.00, 0, 'ͼƬ4', 0, 0);

INSERT INTO `image` (`id`, `goods_id`, `is_face`, `file`, `created_at`, `updated_at`)
VALUES
	(1, 1, 1, '��Ʒ1��ͼ', 0, 0),
	(2, 1, 0, '��Ʒ1��ϸͼ1', 0, 0),
	(3, 1, 0, '��Ʒ1��ϸͼ2', 0, 0),
	(4, 2, 1, '��Ʒ2��ͼ', 0, 0),
	(5, 2, 0, '��Ʒ2��ϸͼ1', 0, 0),
	(6, 2, 0, '��Ʒ2��ϸͼ2', 0, 0);

	
	


/* ���� */
DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order`(
  id INT AUTO_INCREMENT PRIMARY KEY,

  out_trade_no VARCHAR(32) DEFAULT '' COMMENT '������',/*������ʾʹ�õĶ����� Ψһ */
  name VARCHAR(100) NOT NULL DEFAULT '' COMMENT '��������',
  member_id INT NOT NULL DEFAULT 0 COMMENT '��Աid',

  pay_type TINYINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '֧����ʽ',/*1����֧�� 2�������� */
  delivery_type TINYINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '������ʽ',/*1��� 2����*/

  total_fee DEC(10,2) NOT NULL DEFAULT 0 COMMENT '�����ܶ�',

  status TINYINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '����״̬',		/*����״̬: �¶��� ���׳ɹ� ��Ч���� */
  delivery_status  TINYINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '����״̬',	/* ����״̬  δ���� �ѷ��� ���ջ� �˻��� ���˻� */
  payment_status TINYINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '֧��״̬',/*֧��״̬ δ���� �Ѹ��� ���˿�*/

  created_at INT NOT NULL DEFAULT 0 COMMENT '����ʱ��',
  updated_at INT NOT NULL DEFAULT 0 COMMENT '����ʱ��',
  KEY ind_out_trade_no(out_trade_no)
)ENGINE=InnoDB DEFAULT CHARSET=UTF8;


/*������Ʒ��ϸ*/
DROP TABLE IF EXISTS order_item;
CREATE TABLE IF NOT EXISTS order_item(
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT NOT NULL DEFAULT 0 COMMENT '����ID',
  goods_id INT NOT NULL DEFAULT 0 COMMENT '��ƷID',
  quantity INT NOT NULL DEFAULT 0 COMMENT '����',
  price DEC(10,2) NOT NULL DEFAULT 0 COMMENT '����',
  created_at INT NOT NULL DEFAULT 0 COMMENT '����ʱ��',
  updated_at INT NOT NULL DEFAULT 0 COMMENT '����ʱ��',
  KEY ind_order_id(order_id)
)ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=1001;

	