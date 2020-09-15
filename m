Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 79FE8269D8F
	for <lists+dm-devel@lfdr.de>; Tue, 15 Sep 2020 06:42:48 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-aldQD_IXPnWPqc6sf74Q0w-1; Tue, 15 Sep 2020 00:42:45 -0400
X-MC-Unique: aldQD_IXPnWPqc6sf74Q0w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 875A81074647;
	Tue, 15 Sep 2020 04:42:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F36D7839F;
	Tue, 15 Sep 2020 04:42:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6463C44A51;
	Tue, 15 Sep 2020 04:42:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08F4gYgn000421 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 15 Sep 2020 00:42:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 71AB32166B44; Tue, 15 Sep 2020 04:42:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C4892166B28
	for <dm-devel@redhat.com>; Tue, 15 Sep 2020 04:42:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3BF45101A53F
	for <dm-devel@redhat.com>; Tue, 15 Sep 2020 04:42:32 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-520-SJLNoea6N6ep7-SCOjo0ig-1; Tue, 15 Sep 2020 00:42:27 -0400
X-MC-Unique: SJLNoea6N6ep7-SCOjo0ig-1
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 904DC873B4ED72DB4AB2;
	Tue, 15 Sep 2020 12:42:23 +0800 (CST)
Received: from [10.174.178.208] (10.174.178.208) by
	DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server
	id 14.3.487.0; Tue, 15 Sep 2020 12:42:15 +0800
From: lixiaokeng <lixiaokeng@huawei.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Martin Wilck
	<mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, "dm-devel
	mailing list" <dm-devel@redhat.com>
References: <d89bc33d-8e5d-d194-3b26-83ff4d170c5c@huawei.com>
Message-ID: <40f72a77-5dcc-89e4-e164-d19e0da10699@huawei.com>
Date: Tue, 15 Sep 2020 12:42:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d89bc33d-8e5d-d194-3b26-83ff4d170c5c@huawei.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: [dm-devel] [PATCH 6/6] libmultipath: check udev* return value in
 _find_path_by_syspath
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
Content-Language: en-GB

We check udev_device_get_syspath return value before
dereference it.

Signed-off-by: Lixiaokeng<lixiaokeng@huawei.com>
Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Signed-off-by: Linfeilong <linfeilong@huawei.com>
---
 libmultipath/foreign/nvme.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/libmultipath/foreign/nvme.c b/libmultipath/foreign/nvme.c
index a0668713..28e0d192 100644
--- a/libmultipath/foreign/nvme.c
+++ b/libmultipath/foreign/nvme.c
@@ -482,6 +482,7 @@ _find_path_by_syspath(struct nvme_map *map, const char *syspath)
 	struct nvme_pathgroup *pg;
 	char real[PATH_MAX];
 	const char *ppath;
+	const char *psyspath;
 	int i;

 	ppath = realpath(syspath, real);
@@ -493,8 +494,8 @@ _find_path_by_syspath(struct nvme_map *map, const char *syspath)
 	vector_foreach_slot(&map->pgvec, pg, i) {
 		struct nvme_path *path = nvme_pg_to_path(pg);

-		if (!strcmp(ppath,
-			    udev_device_get_syspath(path->udev)))
+		psyspath = udev_device_get_syspath(path->udev);
+		if (!psyspath && !strcmp(ppath, psyspath))
 			return path;
 	}
 	condlog(4, "%s: %s: %s not found", __func__, THIS, ppath);
-- 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

