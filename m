Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 74A4C2485A6
	for <lists+dm-devel@lfdr.de>; Tue, 18 Aug 2020 15:07:59 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-707bosoUM7WXSSqh2KUWGg-1; Tue, 18 Aug 2020 09:07:55 -0400
X-MC-Unique: 707bosoUM7WXSSqh2KUWGg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86E1381F01F;
	Tue, 18 Aug 2020 13:07:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C9A510021AA;
	Tue, 18 Aug 2020 13:07:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7533960367;
	Tue, 18 Aug 2020 13:07:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07ID6vfu023957 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 18 Aug 2020 09:06:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 494582166BCC; Tue, 18 Aug 2020 13:06:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 451052166BB3
	for <dm-devel@redhat.com>; Tue, 18 Aug 2020 13:06:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2800918AE956
	for <dm-devel@redhat.com>; Tue, 18 Aug 2020 13:06:55 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-216-m1xoGFqAP8Gx66WqQNQc9w-1; Tue, 18 Aug 2020 09:06:50 -0400
X-MC-Unique: m1xoGFqAP8Gx66WqQNQc9w-1
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 2E4DBCB8B2AE6BEFDC8C;
	Tue, 18 Aug 2020 21:06:44 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.62) by DGGEMS410-HUB.china.huawei.com
	(10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Tue, 18 Aug 2020
	21:06:37 +0800
From: lixiaokeng <lixiaokeng@huawei.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, Martin Wilck <mwilck@suse.com>, 
	Christophe Varoqui <christophe.varoqui@opensvc.com>, <dm-devel@redhat.com>
References: <5ef5f58e-3a27-8959-3abb-4b4c401cc309@huawei.com>
Message-ID: <285a42f1-69c2-ce2e-e30c-d12fb6edc859@huawei.com>
Date: Tue, 18 Aug 2020 21:06:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5ef5f58e-3a27-8959-3abb-4b4c401cc309@huawei.com>
Content-Language: en-GB
X-Originating-IP: [10.174.179.62]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linfeilong@huawei.com, liuzhiqiang26@huawei.com
Subject: [dm-devel] [PATCH 2/5] libmultipath fix NULL dereference in
	select_action
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I got a multipath segfault while running iscsi login/logout and following scripts in parallel:

#!/bin/bash
interval=1
while true
do
              multipath -F &> /dev/null
              multipath -r &> /dev/null
              multipath -v2 &> /dev/null
              multipath -ll &> /dev/null
              sleep $interval
done

This is the debuginfo:
Core was generated by `multipath -v2'.
Program terminated with signal SIGSEGV, Segmentation fault.
#0  0x00007fc5c5c8dedf in select_action (mpp=0x55a94f1f8980, curmp=<optimized out>,
    force_reload=<optimized out>) at configure.c:709
709		if (!cmpp->pg || VECTOR_SIZE(cmpp->pg) != VECTOR_SIZE(mpp->pg)) { {

(gdb) bt
#0  0x00007fc5c5c8dedf in select_action (mpp=0x55a94f1f8980, curmp=<optimized out>,
    force_reload=<optimized out>) at configure.c:709
#1  0x00007fc5c5c8fd0f in coalesce_paths (vecs=0x7ffff1c1c220, newmp=0x0, refwwid=0x0,
    force_reload=0, cmd=CMD_CREATE) at configure.c:1090
#2  0x000055a94e9f524d in configure (devpath=<optimized out>, dev_type=DEV_NONE,
    cmd=CMD_CREATE, conf=0x55a94f1b92d0) at main.c:757
#3  main (argc=<optimized out>, argv=<optimized out>) at main.c:1100
(gdb) p *cmpp
$1 = {
  wwid = "3600140566411a6d4873434fba988066f\000\070\060\066\066f", '\000' <repeats 88 times>,
  ...
  paths = 0x0, pg = 0x0, dmi = 0x55a94f22c3f0, alias = 0x55a94f205fb0 "mpathc",
  alias_prefix = 0x0, selector = 0x0, features = 0x0, hwhandler = 0x0, mpe = 0x0,
  hwe = 0x0, waiter = 0, stat_switchgroup = 0, stat_path_failures = 0, stat_map_loads = 0,
  ...
  generic_mp = {ops = 0x7fc5c5cada40 <dm_gen_multipath_ops>}}

There are many NULL pointers in cmpp such as selector, features, hwhandler and so on.
Here these on mpp is not NULL  but we can not be sure that won't be in mpp, so we
add checking pointers of both mpp and cmpp before using them.

The changes like "mpp->features != cmpp->features" make sure that mpp->action is not
set to ACT_RELOAD when they both equal NULL. Other changes check pointers don't equal
NULL. When only one is NULL, we think there is some difference between mpp and cmpp,
so mpp->action should be set to ACT_RELOAD.

Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
---
 libmultipath/configure.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index 96c79610..e02e7ef4 100644
--- a/libmultipath/configure.c
+++ b/libmultipath/configure.c
@@ -726,16 +726,20 @@ select_action (struct multipath * mpp, vector curmp, int force_reload)
 	}

 	if (mpp->no_path_retry != NO_PATH_RETRY_UNDEF &&
+	    mpp->features != cmpp->features &&
+	    (!mpp->features || !cmpp->features ||
 	    !!strstr(mpp->features, "queue_if_no_path") !=
-	    !!strstr(cmpp->features, "queue_if_no_path")) {
+	    !!strstr(cmpp->features, "queue_if_no_path"))) {
 		mpp->action =  ACT_RELOAD;
 		condlog(3, "%s: set ACT_RELOAD (no_path_retry change)",
 			mpp->alias);
 		return;
 	}
-	if ((mpp->retain_hwhandler != RETAIN_HWHANDLER_ON ||
+	if ((mpp->retain_hwhandler != RETAIN_HWHANDLER_ON || !cmpp->hwhandler ||
 	     strcmp(cmpp->hwhandler, "0") == 0) &&
-	    (strlen(cmpp->hwhandler) != strlen(mpp->hwhandler) ||
+	     mpp->hwhandler != cmpp->hwhandler &&
+	     (!mpp->hwhandler || !cmpp->hwhandler||
+	     strlen(cmpp->hwhandler) != strlen(mpp->hwhandler) ||
 	     strncmp(cmpp->hwhandler, mpp->hwhandler,
 		    strlen(mpp->hwhandler)))) {
 		mpp->action = ACT_RELOAD;
@@ -745,8 +749,10 @@ select_action (struct multipath * mpp, vector curmp, int force_reload)
 	}

 	if (mpp->retain_hwhandler != RETAIN_HWHANDLER_UNDEF &&
+	    mpp->features != cmpp->features &&
+	    (!mpp->features || !cmpp->features ||
 	    !!strstr(mpp->features, "retain_attached_hw_handler") !=
-	    !!strstr(cmpp->features, "retain_attached_hw_handler") &&
+	    !!strstr(cmpp->features, "retain_attached_hw_handler")) &&
 	    get_linux_version_code() < KERNEL_VERSION(4, 3, 0)) {
 		mpp->action = ACT_RELOAD;
 		condlog(3, "%s: set ACT_RELOAD (retain_hwhandler change)",
@@ -754,8 +760,16 @@ select_action (struct multipath * mpp, vector curmp, int force_reload)
 		return;
 	}

-	cmpp_feat = STRDUP(cmpp->features);
-	mpp_feat = STRDUP(mpp->features);
+	if (!cmpp->features ) {
+		cmpp_feat = NULL;
+	} else {
+		cmpp_feat = STRDUP(cmpp->features);
+	}
+	if (!mpp->features ) {
+		mpp_feat = NULL;
+	} else {
+		mpp_feat = STRDUP(mpp->features);
+	}
 	if (cmpp_feat && mpp_feat) {
 		remove_feature(&mpp_feat, "queue_if_no_path");
 		remove_feature(&mpp_feat, "retain_attached_hw_handler");
@@ -770,8 +784,8 @@ select_action (struct multipath * mpp, vector curmp, int force_reload)
 	FREE(cmpp_feat);
 	FREE(mpp_feat);

-	if (!cmpp->selector || strncmp(cmpp->selector, mpp->selector,
-		    strlen(mpp->selector))) {
+	if (mpp->selector != cmpp->selector && (!cmpp->selector || !mpp->selector ||
+		    strncmp(cmpp->selector, mpp->selector,strlen(mpp->selector)))) {
 		mpp->action = ACT_RELOAD;
 		condlog(3, "%s: set ACT_RELOAD (selector change)",
 			mpp->alias);
-- 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

