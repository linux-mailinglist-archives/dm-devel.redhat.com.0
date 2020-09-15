Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 20AC8269D85
	for <lists+dm-devel@lfdr.de>; Tue, 15 Sep 2020 06:41:45 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-et3-g4vbOV2Rq2yOD6Tpqg-1; Tue, 15 Sep 2020 00:41:40 -0400
X-MC-Unique: et3-g4vbOV2Rq2yOD6Tpqg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B29F7802B63;
	Tue, 15 Sep 2020 04:41:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9107A60BE2;
	Tue, 15 Sep 2020 04:41:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 19FA944A51;
	Tue, 15 Sep 2020 04:41:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08F4fVuL032510 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 15 Sep 2020 00:41:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2E5F72024508; Tue, 15 Sep 2020 04:41:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 29DA92028E91
	for <dm-devel@redhat.com>; Tue, 15 Sep 2020 04:41:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3F23802FF4
	for <dm-devel@redhat.com>; Tue, 15 Sep 2020 04:41:27 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-595-CQ9kS9_IOSGUMtfR1YJ0Vg-1; Tue, 15 Sep 2020 00:41:23 -0400
X-MC-Unique: CQ9kS9_IOSGUMtfR1YJ0Vg-1
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 178E35105FC766B1C1A1;
	Tue, 15 Sep 2020 12:41:20 +0800 (CST)
Received: from [10.174.178.208] (10.174.178.208) by
	DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server
	id 14.3.487.0; Tue, 15 Sep 2020 12:41:11 +0800
From: lixiaokeng <lixiaokeng@huawei.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Martin Wilck
	<mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, "dm-devel
	mailing list" <dm-devel@redhat.com>
References: <d89bc33d-8e5d-d194-3b26-83ff4d170c5c@huawei.com>
Message-ID: <94e6143b-9aac-affa-9c48-7e48f1910732@huawei.com>
Date: Tue, 15 Sep 2020 12:41:11 +0800
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: [dm-devel] [PATCH 4/6] libmultipath: check udev* return value in
 trigger_partitions_udev_change
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB

We check the return value  of udev_device_get_devtype before
dereference it.

Signed-off-by:Lixiaokeng<Lixiaokeng@huawei.com>
Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Signed-off-by: Linfeilong <linfeilong@huawei.com>
---
 libmultipath/configure.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index 972cf5fe..7263707c 100644
--- a/libmultipath/configure.c
+++ b/libmultipath/configure.c
@@ -515,6 +515,7 @@ static void trigger_partitions_udev_change(struct udev_device *dev,
 {
 	struct udev_enumerate *part_enum;
 	struct udev_list_entry *item;
+	const char *devtype;

 	part_enum = udev_enumerate_new(udev);
 	if (!part_enum)
@@ -535,7 +536,8 @@ static void trigger_partitions_udev_change(struct udev_device *dev,
 		if (!part)
 			continue;

-		if (!strcmp("partition", udev_device_get_devtype(part))) {
+		devtype = udev_device_get_devtype(part);
+		if (devtype && !strcmp("partition", devtype)) {
 			condlog(4, "%s: triggering %s event for %s", __func__,
 				action, syspath);
 			sysfs_attr_set_value(part, "uevent", action, len);
-- 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

