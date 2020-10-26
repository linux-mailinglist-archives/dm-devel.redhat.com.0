Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id B691F298964
	for <lists+dm-devel@lfdr.de>; Mon, 26 Oct 2020 10:27:59 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-aL_mbL-GPL6BWXNwOz8ztw-1; Mon, 26 Oct 2020 05:27:56 -0400
X-MC-Unique: aL_mbL-GPL6BWXNwOz8ztw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BEC763AD4;
	Mon, 26 Oct 2020 09:27:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F7296EF68;
	Mon, 26 Oct 2020 09:27:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7A54892F25;
	Mon, 26 Oct 2020 09:27:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09Q9P4c3001619 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 26 Oct 2020 05:25:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 07DAB207B171; Mon, 26 Oct 2020 09:25:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0342C207B16F
	for <dm-devel@redhat.com>; Mon, 26 Oct 2020 09:25:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93F28101043C
	for <dm-devel@redhat.com>; Mon, 26 Oct 2020 09:25:01 +0000 (UTC)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com
	[45.249.212.191]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-559-M1qHbTOhNkOALNnAV6j5UQ-1; Mon, 26 Oct 2020 05:24:56 -0400
X-MC-Unique: M1qHbTOhNkOALNnAV6j5UQ-1
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CKTvD26FmzLnwZ;
	Mon, 26 Oct 2020 17:24:56 +0800 (CST)
Received: from [10.174.178.210] (10.174.178.210) by
	DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server
	id 14.3.487.0; Mon, 26 Oct 2020 17:24:41 +0800
From: lixiaokeng <lixiaokeng@huawei.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>, Martin Wilck <mwilck@suse.com>,
	dm-devel mailing list <dm-devel@redhat.com>
References: <2a95503c-da40-391c-ce76-bdde19636b51@huawei.com>
Message-ID: <923958ea-ccd4-8a9c-5615-c72749f1676d@huawei.com>
Date: Mon, 26 Oct 2020 17:24:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2a95503c-da40-391c-ce76-bdde19636b51@huawei.com>
X-Originating-IP: [10.174.178.210]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: [dm-devel] [PATCH 1/6] fix multipathd resize when not all sizes of
 paths are equal
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-GB
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In history, the "multipathd resize" may fail without failed
messages because of there are different sizes paths in mpp.
Here we check every path size in cli_resize, fail and print
messages if there are some different size paths. This patch
was made in 12 Oct 2017.

Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
---
 multipathd/cli_handlers.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/multipathd/cli_handlers.c b/multipathd/cli_handlers.c
index 235e2a2e..18b51875 100644
--- a/multipathd/cli_handlers.c
+++ b/multipathd/cli_handlers.c
@@ -981,9 +981,10 @@ cli_resize(void *v, char **reply, int *len, void *data)
 	char * mapname = get_keyparam(v, MAP);
 	struct multipath *mpp;
 	int minor;
-	unsigned long long size;
+	unsigned long long size, sz;
 	struct pathgroup *pgp;
 	struct path *pp;
+	int i,j;

 	mapname = convert_dev(mapname, 0);
 	condlog(2, "%s: resize map (operator)", mapname);
@@ -1021,6 +1022,22 @@ cli_resize(void *v, char **reply, int *len, void *data)
 			mapname);
 		return 1;
 	}
+
+	vector_foreach_slot (mpp->pg, pgp, i) {
+		vector_foreach_slot (pgp->paths, pp, j) {
+			if (!pp->udev || sysfs_get_size(pp, &sz)) {
+				condlog(0, "%s: couldn't get size for sysfs. cannot resize",
+					mapname);
+				return 1;
+			}
+			if (size != sz) {
+				condlog(0, "%s: not all path sizes are equal, please check. cannot resize",
+					mapname);
+				return 1;
+			}
+		}
+	}
+
 	if (size == mpp->size) {
 		condlog(0, "%s: map is still the same size (%llu)", mapname,
 			mpp->size);
-- 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

