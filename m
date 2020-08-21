Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 0AFFD24D369
	for <lists+dm-devel@lfdr.de>; Fri, 21 Aug 2020 13:00:44 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-Binh1ojIPF2-xQaROClbDw-1; Fri, 21 Aug 2020 07:00:41 -0400
X-MC-Unique: Binh1ojIPF2-xQaROClbDw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 975481074657;
	Fri, 21 Aug 2020 11:00:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FCFB5C1D7;
	Fri, 21 Aug 2020 11:00:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F04B6662B1;
	Fri, 21 Aug 2020 11:00:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07LB0SP5012874 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 07:00:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C3868F559B; Fri, 21 Aug 2020 11:00:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BDE14F5695
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 11:00:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5DFC2101A571
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 11:00:26 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-245-WePZTxaFP1mjDsa2GQKr2w-1; Fri, 21 Aug 2020 07:00:22 -0400
X-MC-Unique: WePZTxaFP1mjDsa2GQKr2w-1
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 9AB44574682AAA9AAD3D;
	Fri, 21 Aug 2020 19:00:15 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.249) by DGGEMS411-HUB.china.huawei.com
	(10.3.19.211) with Microsoft SMTP Server id 14.3.487.0;
	Fri, 21 Aug 2020 19:00:09 +0800
To: <mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, "Christophe
	Varoqui" <christophe.varoqui@opensvc.com>, Zdenek Kabelac
	<zkabelac@redhat.com>
References: <52b3b834-6da6-99c1-a2d1-95c2387c47e3@huawei.com>
From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <9fbd5246-ff4f-0486-d33a-c77ccd334a4d@huawei.com>
Date: Fri, 21 Aug 2020 19:00:08 +0800
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>, Yanxiaodan <yanxiaodan@huawei.com>,
	dm-devel@redhat.com, lixiaokeng <lixiaokeng@huawei.com>,
	liuzhiqiang26@huawei.com
Subject: [dm-devel] [PATCH V2 3/5] libmultipath: check blist before calling
 MALLOC in alloc_ble_device func
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


In alloc_ble_device func, ble is firstly allocated by calling MALLOC,
and then input blist is checked whether it is valid. If blist is not
valid, ble will be freed without using.

Here, we should check blist firstly.

Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/blacklist.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/libmultipath/blacklist.c b/libmultipath/blacklist.c
index db58ccca..bedcc7e4 100644
--- a/libmultipath/blacklist.c
+++ b/libmultipath/blacklist.c
@@ -66,12 +66,16 @@ out:

 int alloc_ble_device(vector blist)
 {
-	struct blentry_device * ble = MALLOC(sizeof(struct blentry_device));
+	struct blentry_device *ble;

+	if (!blist)
+		return 1;
+
+	ble = MALLOC(sizeof(struct blentry_device));
 	if (!ble)
 		return 1;

-	if (!blist || !vector_alloc_slot(blist)) {
+	if (!vector_alloc_slot(blist)) {
 		FREE(ble);
 		return 1;
 	}
-- 
2.24.0.windows.2



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

