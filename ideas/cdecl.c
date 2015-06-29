#include<stdio.h>
#include<string.h>
#include<ctype.h>
#include<stdlib.h>
#define MAXTOKENS 100
#define MAXTOKENLEN 64

enum type_tag {IDENTIFIER,QUALIFIER,TYPE};
/*IDENTIFIER	��ʶ��
QUALIFIER		�޶���
TYPE			����
*/
struct token
{
	char type;
	char string[MAXTOKENLEN];
};
int top=-1;
struct token stack[MAXTOKENS];
struct token thi;

#define pop stack[top--]
#define push(s) stack[++top]=s

enum type_tag classify_string(void)//�ƶϱ�ʶ������
{
	char *s=thi.string;
	if(!strcmp(s,"const"))
	{
		strcpy(s,"read-only");
		return QUALIFIER;
	}
	if(!strcmp(s,"volatile"))	return QUALIFIER;
	if(!strcmp(s,"void"))	return TYPE;
	if(!strcmp(s,"char"))	return TYPE;
	if(!strcmp(s,"signed"))	return TYPE;
	if(!strcmp(s,"unsigned"))	return TYPE;
	if(!strcmp(s,"short"))	return TYPE;
	if(!strcmp(s,"int"))	return TYPE;
	if(!strcmp(s,"long"))	return TYPE;
	if(!strcmp(s,"float"))	return TYPE;
	if(!strcmp(s,"double"))	return TYPE;
	if(!strcmp(s,"struct"))	return TYPE;
	if(!strcmp(s,"union"))	return TYPE;
	if(!strcmp(s,"enum"))	return TYPE;
	return IDENTIFIER;
}

void gettoken(void)//��ȡ��һ����ǵ���this��,ȡ���
{
	char *p=thi.string;
	while((*p=getchar())==' ');//�Թ��ո�
	if(isalnum(*p))
	{
		while(isalnum(*++p=getchar()));
		ungetc(*p,stdin);
		*p='\0';
		thi.type=classify_string();
		return;
	}
	if(*p=='*')
	{
		strcpy(thi.string,"pointer to");
		thi.type='*';
		return;
	}
	thi.string[1]='\0';
	thi.type=*p;
	return;
}

read_to_first_identifer()//������һ����ʶ��
{
	gettoken();
	while(thi.type!=IDENTIFIER)
	{
		push(thi);
		gettoken();
	}
	printf("%s is ",thi.string);
	gettoken();
}
deal_with_arrays()//����������
{
	while(thi.type=='[')
	{
		printf("array ");
		gettoken();//���ֻ�']'
		if(isdigit(thi.string[0]))
		{
			printf("0..%d ",atoi(thi.string)-1);
			gettoken();
		}
		gettoken();
		printf("of ");
	}
}
deal_with_function_args()//����������
{
	while(thi.type!=')')
		gettoken();
	gettoken();
	printf("function returning ");
}
deal_with_pointers()//�����κ�ָ��
{
	while(stack[top].type=='*')
		printf("%s ",pop.string);
}
deal_with_declarator()//����������
{
	switch(thi.type)
	{
	case '[': deal_with_arrays();break;
	case '(': deal_with_function_args();
	}
	deal_with_pointers();
	while(top>=0)
	{
		if(stack[top].type=='(')
		{
			pop;
			gettoken();
			deal_with_declarator();
		}
		else
		{
			printf("%s ",pop.string);
		}
	}
}

int main()
{
	read_to_first_identifer();
	deal_with_declarator();
	printf("\n");
	return 0;
}
