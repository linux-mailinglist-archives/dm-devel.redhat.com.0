Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9267525A656
	for <lists+dm-devel@lfdr.de>; Wed,  2 Sep 2020 09:20:58 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-sUkkaf8vPcOpHMUUhyL1hg-1; Wed, 02 Sep 2020 03:20:55 -0400
X-MC-Unique: sUkkaf8vPcOpHMUUhyL1hg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BEA7580EF8B;
	Wed,  2 Sep 2020 07:20:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CD7181183;
	Wed,  2 Sep 2020 07:20:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5064B180B655;
	Wed,  2 Sep 2020 07:20:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0827KksV027455 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Sep 2020 03:20:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C72FFB5537; Wed,  2 Sep 2020 07:20:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C280FB5534
	for <dm-devel@redhat.com>; Wed,  2 Sep 2020 07:20:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C2A387EF93
	for <dm-devel@redhat.com>; Wed,  2 Sep 2020 07:20:44 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-526-_CIC58qiPsCFGgMOnoxVlQ-1; Wed, 02 Sep 2020 03:20:41 -0400
X-MC-Unique: _CIC58qiPsCFGgMOnoxVlQ-1
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 42D5280D0CE12B8A5395;
	Wed,  2 Sep 2020 15:20:37 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.62) by DGGEMS411-HUB.china.huawei.com
	(10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Wed, 2 Sep 2020
	15:20:29 +0800
From: lixiaokeng <lixiaokeng@huawei.com>
To: Martin Wilck <mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, 
	Christophe Varoqui <christophe.varoqui@opensvc.com>, dm-devel mailing list
	<dm-devel@redhat.com>
References: <37544d4c-950f-4281-3b66-e4d1884c5167@huawei.com>
Message-ID: <f8ec7113-a9da-46a0-16c8-1e245f9592f0@huawei.com>
Date: Wed, 2 Sep 2020 15:20:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <37544d4c-950f-4281-3b66-e4d1884c5167@huawei.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: [dm-devel] [PATCH 08/14] libmultipath: donot free *dst if REALLOC
 fails in, merge_words
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
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB

In merge_words func, if REALLOC() fails, the input *dst will
be freed. If so, mpp->hwhandler| mpp->features|mpp->selector
may be set to NULL after calling merge_words func in
disassemble_map func. This may cause accessing freed memory
problem.

Here, we donot free *dst if REALLOC() fails in merge_words func.

Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
---
 libmultipath/dmparser.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/libmultipath/dmparser.c b/libmultipath/dmparser.c
index c1031616..482e9d0e 100644
--- a/libmultipath/dmparser.c
+++ b/libmultipath/dmparser.c
@@ -26,13 +26,12 @@ merge_words(char **dst, const char *word)

 	dstlen = strlen(*dst);
 	len = dstlen + strlen(word) + 2;
-	*dst = REALLOC(*dst, len);
+	p = REALLOC(*dst, len);

-	if (!*dst) {
-		free(p);
+	if (!p)
 		return 1;
-	}

+	*dst = p;
 	p = *dst + dstlen;
 	*p = ' ';
 	++p;
-- 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

