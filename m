Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E8D7530BB3D
	for <lists+dm-devel@lfdr.de>; Tue,  2 Feb 2021 10:43:51 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-MVFNU_prM1ueL_2lHDstQw-1; Tue, 02 Feb 2021 04:43:48 -0500
X-MC-Unique: MVFNU_prM1ueL_2lHDstQw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A272802B44;
	Tue,  2 Feb 2021 09:43:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 620975D9DC;
	Tue,  2 Feb 2021 09:43:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E86B750038;
	Tue,  2 Feb 2021 09:43:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1129hRm7030342 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 2 Feb 2021 04:43:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 860A32166B2F; Tue,  2 Feb 2021 09:43:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 807EA2166B2D
	for <dm-devel@redhat.com>; Tue,  2 Feb 2021 09:43:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DD84800B3A
	for <dm-devel@redhat.com>; Tue,  2 Feb 2021 09:43:25 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-264-i4h9_BnQMqmefCexDyGStA-1;
	Tue, 02 Feb 2021 04:43:22 -0500
X-MC-Unique: i4h9_BnQMqmefCexDyGStA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B8FEAB176;
	Tue,  2 Feb 2021 09:43:20 +0000 (UTC)
From: mwilck@suse.com
To: Benjamin Marzinski <bmarzins@redhat.com>,
	Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Tue,  2 Feb 2021 10:43:12 +0100
Message-Id: <20210202094312.12948-1-mwilck@suse.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1129hRm7030342
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 1/3] libmultipath: use 3rd digit as
	transport_id for expanders
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
 libmultipath/discovery.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index e818585..6d74cc0 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -358,10 +358,17 @@ sysfs_get_tgt_nodename(struct path *pp, char *node)
 	if (value) {
 		tgtdev = udev_device_get_parent(parent);
 		while (tgtdev) {
+			char c;
+
 			tgtname = udev_device_get_sysname(tgtdev);
-			if (tgtname && sscanf(tgtname, "end_device-%d:%d",
-				   &host, &tgtid) == 2)
-				break;
+			if (tgtname) {
+				if (sscanf(tgtname, "end_device-%d:%d:%d%c",
+					   &host, &channel, &tgtid, &c) == 3)
+					break;
+				if (sscanf(tgtname, "end_device-%d:%d%c",
+					   &host, &tgtid, &c) == 2)
+					break;
+			}
 			tgtdev = udev_device_get_parent(tgtdev);
 			tgtid = -1;
 		}
-- 
2.29.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

