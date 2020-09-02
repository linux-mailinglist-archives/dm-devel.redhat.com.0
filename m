Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id A91FD25A65B
	for <lists+dm-devel@lfdr.de>; Wed,  2 Sep 2020 09:21:52 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-lEHRB0HMMlaJByvdmQXPAg-1; Wed, 02 Sep 2020 03:21:49 -0400
X-MC-Unique: lEHRB0HMMlaJByvdmQXPAg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7F421074644;
	Wed,  2 Sep 2020 07:21:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1091C5C1BB;
	Wed,  2 Sep 2020 07:21:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2F029180B655;
	Wed,  2 Sep 2020 07:21:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0827LZ9O027539 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Sep 2020 03:21:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C8AA5C2241; Wed,  2 Sep 2020 07:21:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C4CDAC223E
	for <dm-devel@redhat.com>; Wed,  2 Sep 2020 07:21:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3664A185A78B
	for <dm-devel@redhat.com>; Wed,  2 Sep 2020 07:21:33 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-334-ykmPmFkeNNGN3Wd3y8peLg-1; Wed, 02 Sep 2020 03:21:30 -0400
X-MC-Unique: ykmPmFkeNNGN3Wd3y8peLg-1
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 3B5796D73804481AF117;
	Wed,  2 Sep 2020 15:21:23 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.62) by DGGEMS412-HUB.china.huawei.com
	(10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Wed, 2 Sep 2020
	15:21:15 +0800
From: lixiaokeng <lixiaokeng@huawei.com>
To: Martin Wilck <mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, 
	Christophe Varoqui <christophe.varoqui@opensvc.com>, dm-devel mailing list
	<dm-devel@redhat.com>
References: <37544d4c-950f-4281-3b66-e4d1884c5167@huawei.com>
Message-ID: <40cf77df-eaa3-fb72-69fd-9f865d12dc34@huawei.com>
Date: Wed, 2 Sep 2020 15:21:15 +0800
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
Subject: [dm-devel] [PATCH 09/14] libmultipath: check whether mp->features
 is NULl in, assemble_map
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

Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
---
 libmultipath/dmparser.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/libmultipath/dmparser.c b/libmultipath/dmparser.c
index 482e9d0e..12182bf5 100644
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
@@ -86,9 +86,12 @@ assemble_map (struct multipath * mp, char * params, int len)
 	    get_linux_version_code() < KERNEL_VERSION(4, 3, 0))
 		add_feature(&mp->features, retain_hwhandler);

-	f = STRDUP(mp->features);
+	if (!mp->features) {
+		condlog(0, "mp->features is still NULL.");
+		goto err;
+	}

-	APPEND(p, end, "%s %s %i %i", f, mp->hwhandler, nr_priority_groups,
+	APPEND(p, end, "%s %s %i %i", mp->features, mp->hwhandler, nr_priority_groups,
 	       initial_pg_nr);

 	vector_foreach_slot (mp->pg, pgp, i) {
@@ -110,12 +113,10 @@ assemble_map (struct multipath * mp, char * params, int len)
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

