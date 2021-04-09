Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 01CD2359627
	for <lists+dm-devel@lfdr.de>; Fri,  9 Apr 2021 09:16:20 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-TkOhJRltPFK0szcl2FwmFg-1; Fri, 09 Apr 2021 03:16:17 -0400
X-MC-Unique: TkOhJRltPFK0szcl2FwmFg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BAFB9593B1;
	Fri,  9 Apr 2021 07:16:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5148670F5B;
	Fri,  9 Apr 2021 07:16:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2D46D44A5A;
	Fri,  9 Apr 2021 07:15:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1397FS1k004853 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 9 Apr 2021 03:15:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1D86B216028B; Fri,  9 Apr 2021 07:15:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 16DB32160287
	for <dm-devel@redhat.com>; Fri,  9 Apr 2021 07:15:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25A2D811E9C
	for <dm-devel@redhat.com>; Fri,  9 Apr 2021 07:15:25 +0000 (UTC)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com
	[45.249.212.190]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-325-2MeALTD8OAepuKQCInR1Eg-1; Fri, 09 Apr 2021 03:15:20 -0400
X-MC-Unique: 2MeALTD8OAepuKQCInR1Eg-1
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FGq8t5Hr1z1BFWH;
	Fri,  9 Apr 2021 15:13:02 +0800 (CST)
Received: from [10.174.178.179] (10.174.178.179) by
	DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server
	id 14.3.498.0; Fri, 9 Apr 2021 15:15:06 +0800
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>, Martin Wilck <mwilck@suse.com>,
	dm-devel mailing list <dm-devel@redhat.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <bdc30cf9-dcc6-dedb-dead-2aa3db6e25b4@huawei.com>
Date: Fri, 9 Apr 2021 15:15:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
X-Originating-IP: [10.174.178.179]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: [dm-devel] [PATCH] libmultipath: fix memory leak in
	checker_cleanup_thread
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
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

If checker_cleanup_thread is called after cleanup_checkers,
the checker_class will not be freed.

Here, we use free_checker_class instead of checker_class_unref
in checker_cleanup_thread.

Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
---
 libmultipath/checkers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libmultipath/checkers.c b/libmultipath/checkers.c
index 2dd9915d..7cc80f0b 100644
--- a/libmultipath/checkers.c
+++ b/libmultipath/checkers.c
@@ -368,7 +368,7 @@ static void checker_cleanup_thread(void *arg)
 {
 	struct checker_class *cls = arg;

-	(void)checker_class_unref(cls);
+	(void)free_checker_class(cls);
 	rcu_unregister_thread();
 }

-- 

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

