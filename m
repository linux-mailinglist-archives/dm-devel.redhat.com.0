Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1C31434CDC3
	for <lists+dm-devel@lfdr.de>; Mon, 29 Mar 2021 12:14:00 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-AAyTFEPTNvKZH7e99HrS5Q-1; Mon, 29 Mar 2021 06:13:56 -0400
X-MC-Unique: AAyTFEPTNvKZH7e99HrS5Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CE418710FD;
	Mon, 29 Mar 2021 10:13:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F0FA5F9B8;
	Mon, 29 Mar 2021 10:13:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4C8611809C83;
	Mon, 29 Mar 2021 10:13:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12TADZnp018114 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Mar 2021 06:13:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E35672026D65; Mon, 29 Mar 2021 10:13:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE7372026D07
	for <dm-devel@redhat.com>; Mon, 29 Mar 2021 10:13:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4498A80B921
	for <dm-devel@redhat.com>; Mon, 29 Mar 2021 10:13:28 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-540-vbnKT5ebNGGvggfUqlg2SA-1;
	Mon, 29 Mar 2021 06:13:25 -0400
X-MC-Unique: vbnKT5ebNGGvggfUqlg2SA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 67A06B453;
	Mon, 29 Mar 2021 10:13:24 +0000 (UTC)
From: mwilck@suse.com
To: Benjamin Marzinski <bmarzins@redhat.com>,
	Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 29 Mar 2021 12:12:55 +0200
Message-Id: <20210329101255.21373-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 12TADZnp018114
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH] multipathd: reduce log levels in cli_add_map()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Normally "add map" will be used to add a map which doesn't exist
yet. Thus not finding this map in the first place is not a problem
indicator and should be logged at level 3 only.

Signed-off-by: Martin Wilck <mwilck@suse.com>
----
Note: 

I've applied this patch to my "queue" branch by mistake already.
I thought I'd posted it before. Sorry.

---
 multipathd/cli_handlers.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/multipathd/cli_handlers.c b/multipathd/cli_handlers.c
index 7f3e61f..1de6ad8 100644
--- a/multipathd/cli_handlers.c
+++ b/multipathd/cli_handlers.c
@@ -852,14 +852,15 @@ cli_add_map (void * v, char ** reply, int * len, void * data)
 	}
 	do {
 		if (dm_get_major_minor(param, &major, &minor) < 0)
-			condlog(2, "%s: not a device mapper table", param);
+			condlog(count ? 2 : 3,
+				"%s: not a device mapper table", param);
 		else {
 			sprintf(dev_path, "dm-%d", minor);
 			alias = dm_mapname(major, minor);
 		}
 		/*if there is no mapname found, we first create the device*/
 		if (!alias && !count) {
-			condlog(2, "%s: mapname not found for %d:%d",
+			condlog(3, "%s: mapname not found for %d:%d",
 				param, major, minor);
 			get_refwwid(CMD_NONE, param, DEV_DEVMAP,
 				    vecs->pathvec, &refwwid);
-- 
2.30.1


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

