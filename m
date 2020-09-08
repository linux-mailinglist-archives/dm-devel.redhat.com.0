Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7299A260E0C
	for <lists+dm-devel@lfdr.de>; Tue,  8 Sep 2020 10:51:40 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-aHtuBJPfMoO8E-e2v8J0CA-1; Tue, 08 Sep 2020 04:51:37 -0400
X-MC-Unique: aHtuBJPfMoO8E-e2v8J0CA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA9C8427F8;
	Tue,  8 Sep 2020 08:51:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F02F86584;
	Tue,  8 Sep 2020 08:51:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 03702181A050;
	Tue,  8 Sep 2020 08:51:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0888pP00016567 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 8 Sep 2020 04:51:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A3D472156726; Tue,  8 Sep 2020 08:51:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E419215671E
	for <dm-devel@redhat.com>; Tue,  8 Sep 2020 08:51:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3DE72101A540
	for <dm-devel@redhat.com>; Tue,  8 Sep 2020 08:51:23 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-461-JHIWgZ7CO7WNddL-hVl4mQ-1; Tue, 08 Sep 2020 04:51:18 -0400
X-MC-Unique: JHIWgZ7CO7WNddL-hVl4mQ-1
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 28CF5436F18EC5FC1CA2;
	Tue,  8 Sep 2020 16:51:14 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.232) by DGGEMS404-HUB.china.huawei.com
	(10.3.19.204) with Microsoft SMTP Server id 14.3.487.0;
	Tue, 8 Sep 2020 16:51:07 +0800
From: lixiaokeng <lixiaokeng@huawei.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Martin Wilck
	<mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, "dm-devel
	mailing list" <dm-devel@redhat.com>
References: <2fb59aa1-eafa-49b6-08aa-a279565ec234@huawei.com>
Message-ID: <13d81368-18be-3961-df65-34fed5bf1bce@huawei.com>
Date: Tue, 8 Sep 2020 16:51:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2fb59aa1-eafa-49b6-08aa-a279565ec234@huawei.com>
X-Originating-IP: [10.174.179.232]
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
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: [dm-devel] [PATCH V3 09/14] libmultipath: check whether
 mp->features is NUll in assemble_map
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB

In assemble_map func, if add_feature fails and mp->features is
default value (NULL), STRDUP(mp->features) will cause a seg-fault.
In addition, f = STRDUP(mp->features) is just used for APPEND().
We can directly pass mp->features to APPEND().

Here, we firstly check whether mp->features is null.

V1->V2: use ?: instead of checking mp->features

Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
---
 libmultipath/dmparser.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/libmultipath/dmparser.c b/libmultipath/dmparser.c
index 482e9d0e..3c5e016a 100644
--- a/libmultipath/dmparser.c
+++ b/libmultipath/dmparser.c
@@ -65,7 +65,7 @@ assemble_map (struct multipath * mp, char * params, int len)
 	int i, j;
 	int minio;
 	int nr_priority_groups, initial_pg_nr;
-	char * p, * f;
+	char * p;
 	const char *const end = params + len;
 	char no_path_retry[] = "queue_if_no_path";
 	char retain_hwhandler[] = "retain_attached_hw_handler";
@@ -86,10 +86,8 @@ assemble_map (struct multipath * mp, char * params, int len)
 	    get_linux_version_code() < KERNEL_VERSION(4, 3, 0))
 		add_feature(&mp->features, retain_hwhandler);

-	f = STRDUP(mp->features);
-
-	APPEND(p, end, "%s %s %i %i", f, mp->hwhandler, nr_priority_groups,
-	       initial_pg_nr);
+	APPEND(p, end, "%s %s %i %i", mp->features ? mp->features : 0, mp->hwhandler,
+		nr_priority_groups, initial_pg_nr);

 	vector_foreach_slot (mp->pg, pgp, i) {
 		pgp = VECTOR_SLOT(mp->pg, i);
@@ -110,12 +108,10 @@ assemble_map (struct multipath * mp, char * params, int len)
 		}
 	}

-	FREE(f);
 	condlog(4, "%s: assembled map [%s]", mp->alias, params);
 	return 0;

 err:
-	FREE(f);
 	return 1;
 }

-- 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

