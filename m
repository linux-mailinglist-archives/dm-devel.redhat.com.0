Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6EE56307FE6
	for <lists+dm-devel@lfdr.de>; Thu, 28 Jan 2021 21:52:16 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-cUwye95APBKvGFs-MPzNWA-1; Thu, 28 Jan 2021 15:52:11 -0500
X-MC-Unique: cUwye95APBKvGFs-MPzNWA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D87C19251A0;
	Thu, 28 Jan 2021 20:52:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EB035D9F4;
	Thu, 28 Jan 2021 20:52:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 04AED1809C9F;
	Thu, 28 Jan 2021 20:51:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10SKk8oe014729 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 28 Jan 2021 15:46:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 987E72166B30; Thu, 28 Jan 2021 20:46:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 926B02166B2D
	for <dm-devel@redhat.com>; Thu, 28 Jan 2021 20:46:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C56B81F453
	for <dm-devel@redhat.com>; Thu, 28 Jan 2021 20:46:04 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-14-pWfXG_-zPfaXVGGujy0jGQ-1;
	Thu, 28 Jan 2021 15:46:00 -0500
X-MC-Unique: pWfXG_-zPfaXVGGujy0jGQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B34BBAD17;
	Thu, 28 Jan 2021 20:45:58 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu, 28 Jan 2021 21:45:42 +0100
Message-Id: <20210128204544.18563-2-mwilck@suse.com>
In-Reply-To: <20210128204544.18563-1-mwilck@suse.com>
References: <20210128204544.18563-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 10SKk8oe014729
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 1/3] libmultipath: use 3rd digit as transport_id
	for expanders
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

On SAS expanders, node id's have 3 digits. sysfs paths look like this:

/sys/devices/pci0000:80/0000:80:02.0/0000:8b:00.0/0000:8c:09.0/0000:8f:00.0/host9/port-9:0/expander-9:0/port-9:0:13/expander-9:1/port-9:1:12/expander-9:2/port-9:2:4/end_device-9:2:4/target9:0:29/9:0:29:0/block/sdac

In that case, we should use the last digit as transport id.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/discovery.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index e818585..f3ce3f8 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -358,9 +358,16 @@ sysfs_get_tgt_nodename(struct path *pp, char *node)
 	if (value) {
 		tgtdev = udev_device_get_parent(parent);
 		while (tgtdev) {
+			char c;
+
 			tgtname = udev_device_get_sysname(tgtdev);
-			if (tgtname && sscanf(tgtname, "end_device-%d:%d",
-				   &host, &tgtid) == 2)
+			if (!tgtname)
+				continue;
+			if (sscanf(tgtname, "end_device-%d:%d:%d%c",
+				   &host, &channel, &tgtid, &c) == 3)
+				break;
+			if (sscanf(tgtname, "end_device-%d:%d%c",
+				   &host, &tgtid, &c) == 2)
 				break;
 			tgtdev = udev_device_get_parent(tgtdev);
 			tgtid = -1;
-- 
2.29.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

