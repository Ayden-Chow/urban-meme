//
//  Prectice.c
//  
//
//  Created by Ayden Chow on 2019-10-17.
//

#include "Prectice.h"

void correctprice(struct videoCard* stock){
  for (int i=0;i<100;i++){
    if(strstr((stock+i)->modelno,"Ti")!=NULL){
      (stock+i)->price *=1.1;
    }
    if(strcmp((stock+i)->modelno,"R5 230")!=NULL){
      (stock+i)->price =59.99;
    }
  }
}

void initializeMaxList(MaxList* list){
  MaxListNode* newnode= (MaxListNode*)malloc(sizeof MaxListNode);
  newnode->next=NULL;
  newnode->maxprev=newnode;
  newnode->data=0;
  list->head=newnode;
  list->length=0;
}

void insertAT(MaxList* list, int k, int data){
  MaxListNode* head=MaxList->head;
  MaxListNode* newnode=(MaxListNode*)malloc(sizeof MaxListNode);
  newnode->next=(head+k-1)
  (head+k-2)->next=newnode;
  
}
