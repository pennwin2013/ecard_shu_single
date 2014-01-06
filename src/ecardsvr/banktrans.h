#ifndef _BANKTRANS_H_
#define _BANKTRANS_H_

#include "bank.h"

namespace banktrans
{

//////////////////////////////////////////////////////////////////////
int BankQuery(INNER_TRANS_REQUEST* request);
int BankTransfer(INNER_TRANS_REQUEST* request);

}

#endif // _BANKTRANS_H_

