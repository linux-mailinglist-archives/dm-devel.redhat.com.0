Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5F0EC406B7D
	for <lists+dm-devel@lfdr.de>; Fri, 10 Sep 2021 14:32:16 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-JAIA3XsqNCanX_fSAsNfdA-1; Fri, 10 Sep 2021 08:32:14 -0400
X-MC-Unique: JAIA3XsqNCanX_fSAsNfdA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28D9180196C;
	Fri, 10 Sep 2021 12:32:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CADBB10074EF;
	Fri, 10 Sep 2021 12:32:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EF56D4E58F;
	Fri, 10 Sep 2021 12:31:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18ACVn2f017236 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 10 Sep 2021 08:31:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0FD30206292F; Fri, 10 Sep 2021 12:31:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06BFC20807F6
	for <dm-devel@redhat.com>; Fri, 10 Sep 2021 12:31:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CFDE1066559
	for <dm-devel@redhat.com>; Fri, 10 Sep 2021 12:31:46 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com
	[45.249.212.187]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-563-oUT2WN-cNtupFBLP7b2jjA-1; Fri, 10 Sep 2021 08:31:42 -0400
X-MC-Unique: oUT2WN-cNtupFBLP7b2jjA-1
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4H5ZwM52ljzVfkF;
	Fri, 10 Sep 2021 20:30:43 +0800 (CST)
Received: from dggema759-chm.china.huawei.com (10.1.198.201) by
	dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
	15.1.2308.8; Fri, 10 Sep 2021 20:31:38 +0800
Received: from [10.174.178.189] (10.174.178.189) by
	dggema759-chm.china.huawei.com (10.1.198.201) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.2308.8; Fri, 10 Sep 2021 20:31:37 +0800
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>, Martin Wilck <mwilck@suse.com>,
	dm-devel mailing list <dm-devel@redhat.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <298ae89f-6d47-546d-a87e-42e6563a17f2@huawei.com>
Date: Fri, 10 Sep 2021 20:31:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
X-Originating-IP: [10.174.178.189]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
	dggema759-chm.china.huawei.com (10.1.198.201)
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
Subject: [dm-devel] [PATCH] multipathd: fix missing persistent reseravtion
 for active path
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-GB
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There are two paths(sucu as sda and adb) for one LUN. The two
paths log in, but before the two uevents have been processed
(for example there are many uevent), users use multipathd add
path /dev/sda to cause mpatha and use mpathpersist -o -I to
register prkey for mpatha. The add map uevent is after add path
uevent, the the uevent(add sdb) will delay and missing persistent
reseravtion check.

Here, we add persistent reseravtion check in ev_add_map if
mpp->wait_for_udev > 1.

Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
---
 multipathd/main.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/multipathd/main.c b/multipathd/main.c
index 3aff241d..ef456c34 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -706,6 +706,8 @@ ev_add_map (char * dev, const char * alias, struct vectors * vecs)
 	struct multipath * mpp;
 	int delayed_reconfig, reassign_maps;
 	struct config *conf;
+	struct path *pp;
+	int i;

 	if (dm_is_mpath(alias) != 1) {
 		condlog(4, "%s: not a multipath map", alias);
@@ -721,6 +723,13 @@ ev_add_map (char * dev, const char * alias, struct vectors * vecs)
 			if (update_map(mpp, vecs, 0))
 				/* setup multipathd removed the map */
 				return 1;
+
+			vector_foreach_slot(mpp->paths, pp, i) {
+				if ((pp->state == PATH_UP)  || (pp->state == PATH_GHOST)) {
+					/* persistent reseravtion check*/
+					mpath_pr_event_handle(pp);
+				}
+			}
 		}
 		conf = get_multipath_config();
 		delayed_reconfig = conf->delayed_reconfig;
-- 

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

