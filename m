Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id F0E85239D89
	for <lists+dm-devel@lfdr.de>; Mon,  3 Aug 2020 04:42:24 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-5Spr00h0Ne-ZhQw09xfQ_w-1; Sun, 02 Aug 2020 22:42:21 -0400
X-MC-Unique: 5Spr00h0Ne-ZhQw09xfQ_w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C2148064AC;
	Mon,  3 Aug 2020 02:42:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 02F0F5D9D5;
	Mon,  3 Aug 2020 02:42:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D167B1809554;
	Mon,  3 Aug 2020 02:42:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0732g9Q6012031 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 2 Aug 2020 22:42:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E305A82898; Mon,  3 Aug 2020 02:42:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6C918289E
	for <dm-devel@redhat.com>; Mon,  3 Aug 2020 02:42:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B902A882640
	for <dm-devel@redhat.com>; Mon,  3 Aug 2020 02:42:05 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-454-PEMc0PGbOACawVGm-y6siA-1; Sun, 02 Aug 2020 22:42:01 -0400
X-MC-Unique: PEMc0PGbOACawVGm-y6siA-1
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id C25499C208418D04DA4C;
	Mon,  3 Aug 2020 10:41:55 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.249) by DGGEMS414-HUB.china.huawei.com
	(10.3.19.214) with Microsoft SMTP Server id 14.3.487.0;
	Mon, 3 Aug 2020 10:41:49 +0800
To: Benjamin Marzinski <bmarzins@redhat.com>, Martin Wilck <mwilck@suse.com>, 
	<christophe.varoqui@opensvc.com>, Zdenek Kabelac <zkabelac@redhat.com>
From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <db186a10-8244-c9cd-4da0-b03976ce48b9@huawei.com>
Date: Mon, 3 Aug 2020 10:41:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>, Yanxiaodan <yanxiaodan@huawei.com>,
	dm-devel@redhat.com, lixiaokeng <lixiaokeng@huawei.com>
Subject: [dm-devel] [dm- devel][PATCH] vector: add lower bound check of E in
	VECTOR_SLOT
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


In VECTOR_SLOT(V, E), we add the lower bound check of E.
E cannot be less than zero.

Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
---
 libmultipath/vector.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libmultipath/vector.h b/libmultipath/vector.h
index e16ec461..cdb94b24 100644
--- a/libmultipath/vector.h
+++ b/libmultipath/vector.h
@@ -32,7 +32,7 @@ typedef struct _vector *vector;

 #define VECTOR_DEFAULT_SIZE 1
 #define VECTOR_SIZE(V)   ((V) ? ((V)->allocated) / VECTOR_DEFAULT_SIZE : 0)
-#define VECTOR_SLOT(V,E) (((V) && (E) < VECTOR_SIZE(V)) ? (V)->slot[(E)] : NULL)
+#define VECTOR_SLOT(V,E) (((V) && (E) < VECTOR_SIZE(V) && (E) >= 0) ? (V)->slot[(E)] : NULL)
 #define VECTOR_LAST_SLOT(V)   (((V) && VECTOR_SIZE(V) > 0) ? (V)->slot[(VECTOR_SIZE(V) - 1)] : NULL)

 #define vector_foreach_slot(v,p,i) \
-- 
2.24.0.windows.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

