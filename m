Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B1D61269D83
	for <lists+dm-devel@lfdr.de>; Tue, 15 Sep 2020 06:41:10 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-SdNG9vh8MnyVksJ0ZUulVg-1; Tue, 15 Sep 2020 00:41:07 -0400
X-MC-Unique: SdNG9vh8MnyVksJ0ZUulVg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A45A78030CD;
	Tue, 15 Sep 2020 04:41:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8272B60BE5;
	Tue, 15 Sep 2020 04:41:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3773E1833002;
	Tue, 15 Sep 2020 04:41:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08F4evKK032426 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 15 Sep 2020 00:40:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8C26F110C583; Tue, 15 Sep 2020 04:40:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86CB5110C582
	for <dm-devel@redhat.com>; Tue, 15 Sep 2020 04:40:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1076C101A53F
	for <dm-devel@redhat.com>; Tue, 15 Sep 2020 04:40:55 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-35-ynsqclKTMkSB_FGWfBqgfw-1; Tue, 15 Sep 2020 00:40:49 -0400
X-MC-Unique: ynsqclKTMkSB_FGWfBqgfw-1
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 137048E9A82A9317E766;
	Tue, 15 Sep 2020 12:40:46 +0800 (CST)
Received: from [10.174.178.208] (10.174.178.208) by
	DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server
	id 14.3.487.0; Tue, 15 Sep 2020 12:40:39 +0800
From: lixiaokeng <lixiaokeng@huawei.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Martin Wilck
	<mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, "dm-devel
	mailing list" <dm-devel@redhat.com>
References: <d89bc33d-8e5d-d194-3b26-83ff4d170c5c@huawei.com>
Message-ID: <a47d7089-02c4-320b-9710-bc8cfd2fd14b@huawei.com>
Date: Tue, 15 Sep 2020 12:40:39 +0800
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: [dm-devel] [PATCH 3/6] libmultipath: check udev* return value in
 sysfs_get_tgt_nodename
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

We check the return value of udev_device_get_parent and
udev_device_get_sysname.

Signed-off-by:lixiaokeng<lixiaokeng@huawei.com>
Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Signed-off-by: Linfeilong <linfeilong@huawei.com>
---
 libmultipath/discovery.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index 27cb67f8..c490dddb 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -356,7 +356,7 @@ sysfs_get_tgt_nodename(struct path *pp, char *node)
 		tgtdev = udev_device_get_parent(parent);
 		while (tgtdev) {
 			tgtname = udev_device_get_sysname(tgtdev);
-			if (sscanf(tgtname, "end_device-%d:%d",
+			if (tgtname && sscanf(tgtname, "end_device-%d:%d",
 				   &host, &tgtid) == 2)
 				break;
 			tgtdev = udev_device_get_parent(tgtdev);
@@ -389,7 +389,7 @@ sysfs_get_tgt_nodename(struct path *pp, char *node)
 	/* Check for FibreChannel */
 	tgtdev = udev_device_get_parent(parent);
 	value = udev_device_get_sysname(tgtdev);
-	if (sscanf(value, "rport-%d:%d-%d",
+	if (value && sscanf(value, "rport-%d:%d-%d",
 		   &host, &channel, &tgtid) == 3) {
 		tgtdev = udev_device_new_from_subsystem_sysname(udev,
 				"fc_remote_ports", value);
-- 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

