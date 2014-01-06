#ifndef CLSCARD_H_
#define CLSCARD_H_
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <vector>
#include "errdef.h"
#include "pubdb.h"
#include "pubdef.h"
#include "pubfunc.h"
#include "dbfunc.h"
using namespace std;
enum CardCheckType
{
    CT_NORMAL = 1,
    CT_CLOSED = 2,
    CT_RENEW = 4,
    CT_INSTEAD = 5,
    CT_CLOSING = 6,
    CT_UNLOST = 7,
    CT_LOST = 8,
    CT_UNFROZEN = 9,
    CT_FROZEN = 10,
    CT_UNBAD = 11,
    CT_BAD = 12,
    CT_UNLOCKED = 13,
    CT_LOCKED = 14,
    CT_UNEXPIRED = 15,
    CT_EXPIRED = 16,
    CT_CARDPHYID = 21
};
namespace ekingstar
{
    class CCard
    {
    private:
        T_t_card _card;
        bool _bLock;
        bool _bLoad;
        vector<int> _checkArray;
    public:
        CCard();
        ~CCard();
        void attach(T_t_card& card);
        int loadCard(int cardno);
        T_t_card& getCard();
        void setTransCheck();
        void delCheck(int item);
        void clearCheck();
        void addCheck(int item);
        int checkStatus(int item);
        int check(bool bTransCheck = true);
    };
}
#endif
