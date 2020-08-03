Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4992A23A3B1
	for <lists+dm-devel@lfdr.de>; Mon,  3 Aug 2020 13:57:56 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-cH5fE3-jOXiRyeGQiwU6Ww-1; Mon, 03 Aug 2020 07:57:53 -0400
X-MC-Unique: cH5fE3-jOXiRyeGQiwU6Ww-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF66D57;
	Mon,  3 Aug 2020 11:57:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82B55177F9;
	Mon,  3 Aug 2020 11:57:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E73479A117;
	Mon,  3 Aug 2020 11:57:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 073BvQHb030343 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 3 Aug 2020 07:57:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 28479217B436; Mon,  3 Aug 2020 11:57:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 243DB217B435
	for <dm-devel@redhat.com>; Mon,  3 Aug 2020 11:57:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 521258007D3
	for <dm-devel@redhat.com>; Mon,  3 Aug 2020 11:57:23 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-469-_VjefNm0OCSTnSlJWynKvg-1; Mon, 03 Aug 2020 07:57:14 -0400
X-MC-Unique: _VjefNm0OCSTnSlJWynKvg-1
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id D8D9ADC32822F7803670;
	Mon,  3 Aug 2020 19:57:10 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.62) by DGGEMS410-HUB.china.huawei.com
	(10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Mon, 3 Aug 2020
	19:57:01 +0800
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Martin Wilck
	<mwilck@suse.com>,
	Benjamin Marzinski <bmarzins@redhat.com>, <dm-devel@redhat.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <9f10e135-348d-d11a-85cb-797522ba5210@huawei.com>
Date: Mon, 3 Aug 2020 19:57:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
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
Cc: linfeilong@huawei.com, liuzhiqiang26@huawei.com, lutianxiong@huawei.com
Subject: [dm-devel]  [PATCH] libmultipath: fix null dereference in add
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
X-Mimecast-Spam-Score: 0
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
#0  0x00007f3805e4df58 in add (ctx=0x55d1569e4a00, ud=0x55d1569bafd0) at nvme.c:801
801              if (strcmp("disk", udev_device_get_devtype(ud)))
(gdb) bt
#0  0x00007f3805e4df58 in add (ctx=0x55d1569e4a00, ud=0x55d1569bafd0) at nvme.c:801
#1  0x00007f3806687a44 in add_foreign (udev=0x55d1569bafd0) at foreign.c:299
#2  0x00007f3806665abf in is_claimed_by_foreign (ud=<optimized out>) at foreign.h:316
#3  pathinfo (pp=0x55d1569e9f50, conf=0x55d1569b92d0, mask=69) at discovery.c:2064
#4  0x000055d154c91cbb in check_usable_paths (conf=0x55d1569b92d0, devpath=0x55d1569e3200 "dm-6", dev_type=<optimized out>) at main.c:368
#5  0x000055d154c910a5 in main (argc=3, argv=<optimized out>) at main.c:1057
In add() at libmultipath/foreign/nvme.c, udev_device_get_devtype(ud) return a NULL pointer then dereferenced.
Here, NULL check is needed.
Check if udev_device_get_devtype return NULL before dereferencing it.

Signed-off-by: lutianxiong <lutianxiong huawei com>
Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
---
 libmultipath/foreign/nvme.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/libmultipath/foreign/nvme.c b/libmultipath/foreign/nvme.c
index 280b6bd..6061999 100644
--- a/libmultipath/foreign/nvme.c
+++ b/libmultipath/foreign/nvme.c
@@ -600,12 +600,14 @@ int add(struct context *ctx, struct udev_device *ud)
 {
 	struct udev_device *subsys;
 	int rc;
+	const char *devtype;

 	condlog(5, "%s called for \"%s\"", __func__, THIS);

 	if (ud == NULL)
 		return FOREIGN_ERR;
-	if (strcmp("disk", udev_device_get_devtype(ud)))
+	if ((devtype = udev_device_get_devtype(ud)) == NULL ||
+						strcmp("disk", devtype))
 		return FOREIGN_IGNORED;

 	subsys = udev_device_get_parent_with_subsystem_devtype(ud,
-- 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

