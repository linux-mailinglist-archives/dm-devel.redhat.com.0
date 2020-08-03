Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 0663F239D8A
	for <lists+dm-devel@lfdr.de>; Mon,  3 Aug 2020 04:44:27 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-xqSoLVH7MyeAE6FjIp5k8w-1; Sun, 02 Aug 2020 22:44:24 -0400
X-MC-Unique: xqSoLVH7MyeAE6FjIp5k8w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48E3310059B0;
	Mon,  3 Aug 2020 02:44:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2735887E33;
	Mon,  3 Aug 2020 02:44:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 56F5A1809554;
	Mon,  3 Aug 2020 02:44:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0732iDVK012180 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 2 Aug 2020 22:44:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C364F110C9E3; Mon,  3 Aug 2020 02:44:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE357110C9E2
	for <dm-devel@redhat.com>; Mon,  3 Aug 2020 02:44:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C08FB87E8D1
	for <dm-devel@redhat.com>; Mon,  3 Aug 2020 02:44:11 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-23-rKtw_n8DNtqSeQ0kS_h5Og-1; Sun, 02 Aug 2020 22:44:08 -0400
X-MC-Unique: rKtw_n8DNtqSeQ0kS_h5Og-1
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 243E610528566E2763AF;
	Mon,  3 Aug 2020 10:44:03 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.249) by DGGEMS407-HUB.china.huawei.com
	(10.3.19.207) with Microsoft SMTP Server id 14.3.487.0;
	Mon, 3 Aug 2020 10:43:55 +0800
To: Benjamin Marzinski <bmarzins@redhat.com>, Martin Wilck <mwilck@suse.com>, 
	<christophe.varoqui@opensvc.com>, Zdenek Kabelac <zkabelac@redhat.com>
From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <0c482278-37d5-9875-c22c-b14fd02f30d9@huawei.com>
Date: Mon, 3 Aug 2020 10:43:54 +0800
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>, lixiaokeng <lixiaokeng@huawei.com>,
	dm-devel@redhat.com, Yanxiaodan <yanxiaodan@huawei.com>
Subject: [dm-devel] [dm- devel][PATCH] tests/hwtable: fix a memory free in
 replicate_config
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


In replicate_config func, hwtable is allocated by calling get_used_hwes
func, however it is not freed.

Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
---
 tests/hwtable.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/hwtable.c b/tests/hwtable.c
index 473028b7..84d2b35f 100644
--- a/tests/hwtable.c
+++ b/tests/hwtable.c
@@ -468,6 +468,7 @@ static void replicate_config(const struct hwt_state *hwt, bool local)
 		/* "local" configuration */
 		hwtable = get_used_hwes(hwt->vecs->pathvec);
 		cfg1 = snprint_config(conf, NULL, hwtable, hwt->vecs->mpvec);
+		vector_free(hwtable);
 	}

 	assert_non_null(cfg1);
-- 
2.24.0.windows.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

