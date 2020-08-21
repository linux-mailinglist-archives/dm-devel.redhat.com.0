Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 4278424D36C
	for <lists+dm-devel@lfdr.de>; Fri, 21 Aug 2020 13:01:30 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-bMqhC0hLM1eV6rL95XWPuQ-1; Fri, 21 Aug 2020 07:01:27 -0400
X-MC-Unique: bMqhC0hLM1eV6rL95XWPuQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E0BD801AAB;
	Fri, 21 Aug 2020 11:01:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CADB7AEC9;
	Fri, 21 Aug 2020 11:01:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E119A181A06B;
	Fri, 21 Aug 2020 11:01:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07LB1IO5012959 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 07:01:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4D2071009BA3; Fri, 21 Aug 2020 11:01:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 46C3410D18F4
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 11:01:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04954811E7A
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 11:01:16 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-435-9dFEgE86Pf2a3SZP96uN6w-1; Fri, 21 Aug 2020 07:01:09 -0400
X-MC-Unique: 9dFEgE86Pf2a3SZP96uN6w-1
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 84DA386647DBF2266835;
	Fri, 21 Aug 2020 19:00:58 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.249) by DGGEMS401-HUB.china.huawei.com
	(10.3.19.201) with Microsoft SMTP Server id 14.3.487.0;
	Fri, 21 Aug 2020 19:00:49 +0800
To: <mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, "Christophe
	Varoqui" <christophe.varoqui@opensvc.com>, Zdenek Kabelac
	<zkabelac@redhat.com>
References: <52b3b834-6da6-99c1-a2d1-95c2387c47e3@huawei.com>
From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <8e1d9d4d-a1c2-f75a-ec84-6d7968a9e0d7@huawei.com>
Date: Fri, 21 Aug 2020 19:00:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <52b3b834-6da6-99c1-a2d1-95c2387c47e3@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.174.179.249]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>, Yanxiaodan <yanxiaodan@huawei.com>,
	dm-devel@redhat.com, liuzhiqiang26@huawei.com
Subject: [dm-devel] [PATCH V2 4/5] vector: add lower boundary check in
 vector_foreach_slot_after
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


In vector_foreach_slot_after macro, i is the input var, which
may have a illegal value (i < 0). So we should add lower boundary
check in vector_foreach_slot_after macro.

V1->V2:
- check whether i is illegal before loop (As suggested by Martin)

Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
---
 libmultipath/vector.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/libmultipath/vector.h b/libmultipath/vector.h
index 2862dc28..ab80d06e 100644
--- a/libmultipath/vector.h
+++ b/libmultipath/vector.h
@@ -38,11 +38,12 @@ typedef struct _vector *vector;
 #define VECTOR_LAST_SLOT(V)   (((V) && VECTOR_SIZE(V) > 0) ? (V)->slot[(VECTOR_SIZE(V) - 1)] : NULL)

 #define vector_foreach_slot(v,p,i) \
-	for (i = 0; (v) && (int)i < VECTOR_SIZE(v) && ((p) = (v)->slot[i]); i++)
+	for ((i) = 0; (v) && (int)(i) < VECTOR_SIZE(v) && ((p) = (v)->slot[i]); (i)++)
 #define vector_foreach_slot_after(v,p,i) \
-	for (; (v) && (int)i < VECTOR_SIZE(v) && ((p) = (v)->slot[i]); i++)
+	if ((v) && (int)(i) >= 0) \
+		for (; (int)(i) < VECTOR_SIZE(v) && ((p) = (v)->slot[i]); (i)++)
 #define vector_foreach_slot_backwards(v,p,i) \
-	for (i = VECTOR_SIZE(v) - 1; (int)i >= 0 && ((p) = (v)->slot[i]); i--)
+	for ((i) = VECTOR_SIZE(v) - 1; (int)(i) >= 0 && ((p) = (v)->slot[i]); (i)--)

 #define identity(x) (x)
 /*
-- 
2.24.0.windows.2



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

