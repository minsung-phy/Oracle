-- ������ ���� : ��ü �÷� ������ �Է½�
INSERT INTO EMP VALUES ('1', 'ȫ�浿', '������');

-- ������ ���� : Ư�� �÷� ������ �Է½�
INSERT INTO EMP (NO, NAME) VALUES ('1', 'ȫ�浿');

-- ���� ���� �ѹ��� ����
INSERT INTO EMP
        SELECT NO, NAME, ADDR FROM EMP2 WHERE ADDR = '������';

-- ������ ���� 
UPDATE EMP SET ADDR = '����' WHERE NAME = 'ȫ�浿';

-- ������ �Ϻ� ����
DELETE FROM EMP WHERE NO = '1';

-- ������ ��ü ����. �ѹ鰡��, ���� Ŀ��, ������ ��������� �״�� �������
DELETE FROM EMP;

-- ���� ���̺��� �����͸� �� ���̺� ������
MERGE INTO Ÿ�����̺�
        USING �ҽ����̺�
        ON (Ÿ�����̺�.�÷�1 = �ҽ����̺�.�÷�1)
        WHEN MATCHED THEN
                ... -- ON�� ������ �����Ѵٸ� �ش� ���� ����
        WHEN NOT MATCHED THEN
                ... -- ON�� ������ �������� �ʴ´ٸ� �ش� ���� ����
