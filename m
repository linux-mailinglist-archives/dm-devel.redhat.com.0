Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 005A53013E5
	for <lists+dm-devel@lfdr.de>; Sat, 23 Jan 2021 09:20:35 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-ft8VfY5DP5-3qAv4zprJKQ-1; Sat, 23 Jan 2021 03:20:30 -0500
X-MC-Unique: ft8VfY5DP5-3qAv4zprJKQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63049800D55;
	Sat, 23 Jan 2021 08:20:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9341B62463;
	Sat, 23 Jan 2021 08:20:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B71D9180954D;
	Sat, 23 Jan 2021 08:20:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10N8Jm22013161 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 23 Jan 2021 03:19:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B57E11019258; Sat, 23 Jan 2021 08:19:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B1E771019256
	for <dm-devel@redhat.com>; Sat, 23 Jan 2021 08:19:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 409A61875049
	for <dm-devel@redhat.com>; Sat, 23 Jan 2021 08:19:46 +0000 (UTC)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-537-ePb0WH66P0aV3ftABVEpcA-1; Sat, 23 Jan 2021 03:19:41 -0500
X-MC-Unique: ePb0WH66P0aV3ftABVEpcA-1
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DN8Cg6RMxzj5sh;
	Sat, 23 Jan 2021 16:18:39 +0800 (CST)
Received: from [10.174.178.113] (10.174.178.113) by
	DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server
	id 14.3.498.0; Sat, 23 Jan 2021 16:19:28 +0800
To: Martin Wilck <mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, 
	Christophe Varoqui <christophe.varoqui@opensvc.com>, dm-devel mailing list
	<dm-devel@redhat.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <a2693d7a-55f1-234e-74a1-f234c152a490@huawei.com>
Date: Sat, 23 Jan 2021 16:19:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
X-Originating-IP: [10.174.178.113]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: [dm-devel] [PATCH] libmultipath: fix NULL dereference in
	find_path_by_dev
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-GB
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When I test the 0.8.5 code with iscsi login/out, multipathd command
and multipath command concurrently, there is a multipathd coredump.
The stack is shown:

uxlsnrloop
  ->cli_list_devices
    ->show_devices
      ->snprint_devices
        ->find_path_by_dev

The reason is that devname is NULL in snprint_devices, then it will
be dereference. Here we check dev in find_path_by_dev.
---
 libmultipath/structs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libmultipath/structs.c b/libmultipath/structs.c
index 464596f..a3f27fd 100644
--- a/libmultipath/structs.c
+++ b/libmultipath/structs.c
@@ -453,12 +453,12 @@ find_mp_by_str (const struct _vector *mpvec, const char * str)
 }

 struct path *
-find_path_by_dev (const struct _vector *pathvec, const char * dev)
+find_path_by_dev (const struct _vector *pathvec, const char *dev)
 {
    int i;
    struct path * pp;

-   if (!pathvec)
+   if (!pathvec || !dev)
        return NULL;

    vector_foreach_slot (pathvec, pp, i)
-- 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

