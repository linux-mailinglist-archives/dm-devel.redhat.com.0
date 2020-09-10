Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 743462644A5
	for <lists+dm-devel@lfdr.de>; Thu, 10 Sep 2020 12:52:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-clyA1fEGMsefrIduEMQk2g-1; Thu, 10 Sep 2020 06:52:03 -0400
X-MC-Unique: clyA1fEGMsefrIduEMQk2g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 026B41074654;
	Thu, 10 Sep 2020 10:51:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B7397E731;
	Thu, 10 Sep 2020 10:51:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4D7E1181A270;
	Thu, 10 Sep 2020 10:51:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08AApmiE023555 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 10 Sep 2020 06:51:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 81257115D377; Thu, 10 Sep 2020 10:51:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 78FBF115D36D
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 10:51:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 867E3811E78
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 10:51:41 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-208-qB1wXb-zPsqMddiBC6_zQA-1; Thu, 10 Sep 2020 06:51:39 -0400
X-MC-Unique: qB1wXb-zPsqMddiBC6_zQA-1
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id DB9F350AC870502957F0;
	Thu, 10 Sep 2020 18:51:35 +0800 (CST)
Received: from [127.0.0.1] (10.174.178.208) by DGGEMS412-HUB.china.huawei.com
	(10.3.19.212) with Microsoft SMTP Server id 14.3.487.0;
	Thu, 10 Sep 2020 18:51:29 +0800
From: lixiaokeng <lixiaokeng@huawei.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Martin Wilck
	<mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, "dm-devel
	mailing list" <dm-devel@redhat.com>
References: <f8c2133b-6c02-4cc4-59cd-162828154689@huawei.com>
Message-ID: <22e82157-f180-b95b-c72c-b7b13acf1c8a@huawei.com>
Date: Thu, 10 Sep 2020 18:51:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f8c2133b-6c02-4cc4-59cd-162828154689@huawei.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: [dm-devel] [PATCH V4 09/14] libmultipath: check whether
 mpp->features is NUll in setup_map
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

In assemble_map func, f = STRDUP(mp->features) is just used
for APPEND(). We can directly pass mp->features to APPEND().
The mpp->features, hwhandler and selector got form strdup
should be check after select* function.

Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
---
 libmultipath/configure.c |  5 +++++
 libmultipath/dmparser.c  | 11 ++++-------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index 5bc65fd3..5d5d9415 100644
--- a/libmultipath/configure.c
+++ b/libmultipath/configure.c
@@ -355,6 +355,11 @@ int setup_map(struct multipath *mpp, char *params, int params_size,
 	select_ghost_delay(conf, mpp);
 	select_flush_on_last_del(conf, mpp);

+	if (!mpp->features || !mpp->hwhandler || !mpp->selector) {
+		condlog(0, "%s: map select failed", mpp->alias);
+		return 1;
+	}
+
 	sysfs_set_scsi_tmo(mpp, conf->checkint);
 	marginal_pathgroups = conf->marginal_pathgroups;
 	pthread_cleanup_pop(1);
diff --git a/libmultipath/dmparser.c b/libmultipath/dmparser.c
index 482e9d0e..685918da 100644
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
@@ -86,10 +86,9 @@ assemble_map (struct multipath * mp, char * params, int len)
 	    get_linux_version_code() < KERNEL_VERSION(4, 3, 0))
 		add_feature(&mp->features, retain_hwhandler);

-	f = STRDUP(mp->features);
-
-	APPEND(p, end, "%s %s %i %i", f, mp->hwhandler, nr_priority_groups,
-	       initial_pg_nr);
+	/* mp->features must not be NULL */
+	APPEND(p, end, "%s %s %i %i", mp->features, mp->hwhandler,
+		nr_priority_groups, initial_pg_nr);

 	vector_foreach_slot (mp->pg, pgp, i) {
 		pgp = VECTOR_SLOT(mp->pg, i);
@@ -110,12 +109,10 @@ assemble_map (struct multipath * mp, char * params, int len)
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

