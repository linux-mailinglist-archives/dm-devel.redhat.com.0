Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9011F2721D4
	for <lists+dm-devel@lfdr.de>; Mon, 21 Sep 2020 13:08:34 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-Qy1BuaX_OvyGXLO5jwshhw-1; Mon, 21 Sep 2020 07:08:31 -0400
X-MC-Unique: Qy1BuaX_OvyGXLO5jwshhw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C248656ADE;
	Mon, 21 Sep 2020 11:08:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ADF8978824;
	Mon, 21 Sep 2020 11:08:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 566D08C7AC;
	Mon, 21 Sep 2020 11:08:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08LB52An006035 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 21 Sep 2020 07:05:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D896D8A4D5; Mon, 21 Sep 2020 11:05:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D43748A4CF
	for <dm-devel@redhat.com>; Mon, 21 Sep 2020 11:04:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C618B101A53F
	for <dm-devel@redhat.com>; Mon, 21 Sep 2020 11:04:58 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-102-_8TTQ0OdMoGt_UFbXU9MHg-1; Mon, 21 Sep 2020 07:04:56 -0400
X-MC-Unique: _8TTQ0OdMoGt_UFbXU9MHg-1
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 7C9A44E82BC7919ECE36;
	Mon, 21 Sep 2020 19:04:52 +0800 (CST)
Received: from [10.174.178.208] (10.174.178.208) by
	DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server
	id 14.3.487.0; Mon, 21 Sep 2020 19:04:42 +0800
To: Martin Wilck <mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, 
	Christophe Varoqui <christophe.varoqui@opensvc.com>, dm-devel mailing list
	<dm-devel@redhat.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <339cc79b-a7f1-62f0-5bb6-f07f436e9725@huawei.com>
Date: Mon, 21 Sep 2020 19:04:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
X-Originating-IP: [10.174.178.208]
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
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>, lutianxiong@huawei.com
Subject: [dm-devel] [PATCH] libmultipath: set mpp->hwe NULL when free_path
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB

Here the segfault causes in select_pgfailback again. As show:

Core was generated by `/sbin/multipathd -d -s'.
Program terminated with signal SIGSEGV, Segmentation fault.
#0 0x0000ffffa2eb4a20 in select_pgfailback (conf=conf@entry=0xaaaaf89d0dd0, mp=mp@entry=0xffff88006be0) at propsel.c:199
199 mp_set_hwe(pgfailback);

0 0x0000ffffa2eb4a20 in select_pgfailback (conf=conf@entry=0xaaaaf89d0dd0, mp=mp@entry=0xffff88006be0) at propsel.c:199
1 0x0000ffffa2ec97bc in setup_map (mpp=0xaaaae4ff5000, params=0x1 <error: Cannot access memory at address 0x1>, params_size=65535, vecs=0xaaaae4fdc0a8) at configure.c:294
2 0x0000aaaae4fd0830 in ev_add_path (pp=0xffff880190b0, vecs=0xaaaaf89d0630, need_do_map=1) at main.c:1017
3 0x0000aaaae4fd0d04 in uev_add_path (uev=0xffffa24adf40, vecs=0xffffa24ad000, need_do_map=-278187383) at main.c:916
4 0x0000aaaae4fd1790 in uev_trigger (uev=0xffffa24adf40, trigger_data=0xffffa24ad410) at main.c:1490
5 0x0000ffffa2ec00cc in service_uevq (tmpq=tmpq@entry=0xffffa24ad618) at uevent.c:390
6 0x0000ffffa2ec01d4 in uevent_dispatch (uev_trigger=<optimized out>, trigger_data=<optimized out>) at uevent.c:446
7 0x0000aaaae4fce56c in uevqloop (ap=0xffffe42a5d50) at main.c:1523
8 0x0000ffffa2d9e7ac in start_thread (arg=0xffffa2595380) at pthread_create.c:486
9 0x0000ffffa2b577dc in thread_start () at ../sysdeps/unix/sysv/linux/aarch64/clone.S:78

(gdb) bt
(gdb) p *mp->hwe
$2 = {allocated = 1937339183, slot = 0x616c702f73656369}

Here we set mpp->hwe NULL in free_path if mpp->hwe == pp->hwe.

Reported-by: Tianxiong Lu <lutianxiong@huawei.com>
Signed-off-by:lixiaokeng <lixiaokeng@huawei.com>
---
 libmultipath/structs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/libmultipath/structs.c b/libmultipath/structs.c
index 464596fc..35dbaac1 100644
--- a/libmultipath/structs.c
+++ b/libmultipath/structs.c
@@ -150,6 +150,11 @@ free_path (struct path * pp)
 	if (pp->vpd_data)
 		free(pp->vpd_data);

+	if (pp->mpp && (pp->hwe == pp->mpp->hwe)) {
+		condlog(0, "BUG: free path %s that holds hwe of %s",
+		        pp->dev, pp->mpp->alias);
+		pp->mpp->hwe = NULL;
+	}
 	vector_free(pp->hwe);

 	FREE(pp);
--

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

