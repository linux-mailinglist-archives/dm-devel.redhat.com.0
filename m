Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id B6BE5245530
	for <lists+dm-devel@lfdr.de>; Sun, 16 Aug 2020 03:42:46 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-wQuV0TkzM_K6TGKjnUIsRw-1; Sat, 15 Aug 2020 21:42:43 -0400
X-MC-Unique: wQuV0TkzM_K6TGKjnUIsRw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03E401DDE3;
	Sun, 16 Aug 2020 01:42:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D68B7757E1;
	Sun, 16 Aug 2020 01:42:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C9A7C18408A1;
	Sun, 16 Aug 2020 01:42:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07G1gWc8023996 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 15 Aug 2020 21:42:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 445E22166BB3; Sun, 16 Aug 2020 01:42:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FBF52166BA4
	for <dm-devel@redhat.com>; Sun, 16 Aug 2020 01:42:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D9C71185A78B
	for <dm-devel@redhat.com>; Sun, 16 Aug 2020 01:42:29 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-487-K9sB96MjMZOicf5znwI1qw-1; Sat, 15 Aug 2020 21:42:22 -0400
X-MC-Unique: K9sB96MjMZOicf5znwI1qw-1
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 92C0480B46C61329F744;
	Sun, 16 Aug 2020 09:42:15 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.249) by DGGEMS404-HUB.china.huawei.com
	(10.3.19.204) with Microsoft SMTP Server id 14.3.487.0;
	Sun, 16 Aug 2020 09:42:07 +0800
To: <bmarzins@redhat.com>, Martin Wilck <mwilck@suse.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>, Zdenek Kabelac <zkabelac@redhat.com>
References: <351fa23b-b730-ce22-7e89-24f26a693a6a@huawei.com>
From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <2d9db95b-bb88-0d22-1c2d-df459415ee3d@huawei.com>
Date: Sun, 16 Aug 2020 09:42:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <351fa23b-b730-ce22-7e89-24f26a693a6a@huawei.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>, Yanxiaodan <yanxiaodan@huawei.com>,
	dm-devel@redhat.com, lixiaokeng <lixiaokeng@huawei.com>
Subject: [dm-devel] [PATCH 1/6] checker: remove useless name check in
	checker_get func
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


In checker_get func, input name will be checked before
calling checker_class_lookup func, in which name will
also be checked.

Here, we just remove useless input name check in checker_get func.

Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
---
 libmultipath/checkers.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/libmultipath/checkers.c b/libmultipath/checkers.c
index f7ddd53..ac41d64 100644
--- a/libmultipath/checkers.c
+++ b/libmultipath/checkers.c
@@ -361,11 +361,10 @@ void checker_get(const char *multipath_dir, struct checker *dst,
 	if (!dst)
 		return;

-	if (name && strlen(name)) {
-		src = checker_class_lookup(name);
-		if (!src)
-			src = add_checker_class(multipath_dir, name);
-	}
+	src = checker_class_lookup(name);
+	if (!src)
+		src = add_checker_class(multipath_dir, name);
+
 	dst->cls = src;
 	if (!src)
 		return;
-- 
1.8.3.1



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

