Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8F03720A6F6
	for <lists+dm-devel@lfdr.de>; Thu, 25 Jun 2020 22:44:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593117851;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eLq8/WPUfA3UcdAuOaSQy9ddq7B+RxE4JJzwyhWdx/8=;
	b=BU1xySjeA+G4BJhOMYJyvJO9ozNUrQc8RTJbBKm790RvHEZkxDER93SD0OEe5uzpqAjCnZ
	kq9j8fCUO2O5pRR1n7+LwQ/4Psfcc5po2qH9xr9rZfBzVIXgDUonmCeBOYy2PN3GGsT9UJ
	s1jKtaiPfnZOAKTRHrakB3CRycU7EKs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-uLEMFjy7M-Cek7nJvZRMKA-1; Thu, 25 Jun 2020 16:42:47 -0400
X-MC-Unique: uLEMFjy7M-Cek7nJvZRMKA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DFF680402A;
	Thu, 25 Jun 2020 20:42:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AD806109F;
	Thu, 25 Jun 2020 20:42:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ADB1B875A6;
	Thu, 25 Jun 2020 20:42:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05PKgU5Y014034 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 25 Jun 2020 16:42:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 05F937FEB6; Thu, 25 Jun 2020 20:42:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0AAA17FEA5;
	Thu, 25 Jun 2020 20:42:26 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 05PKgPiX028800; 
	Thu, 25 Jun 2020 15:42:25 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 05PKgPZO028799;
	Thu, 25 Jun 2020 15:42:25 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu, 25 Jun 2020 15:42:17 -0500
Message-Id: <1593117741-28750-4-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1593117741-28750-1-git-send-email-bmarzins@redhat.com>
References: <1593117741-28750-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 3/7] libmultipath: make dm_flush_maps only
	return 0 on success
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
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

dm_flush_maps() returned both 0 and 1 on error, depending on which part
of the function it was in, but the caller was always treating 0 as a
success. Make dm_flush_maps() always return 1 on error and 0 on success.

Reviewed-by: Martin Wilck <mwilck@suse.com>
Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/devmapper.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
index f5cfe296..b799634a 100644
--- a/libmultipath/devmapper.c
+++ b/libmultipath/devmapper.c
@@ -1007,13 +1007,13 @@ dm_flush_map_nopaths(const char * mapname, int deferred_remove)
 
 int dm_flush_maps (int retries)
 {
-	int r = 0;
+	int r = 1;
 	struct dm_task *dmt;
 	struct dm_names *names;
 	unsigned next = 0;
 
 	if (!(dmt = libmp_dm_task_create (DM_DEVICE_LIST)))
-		return 0;
+		return r;
 
 	dm_task_no_open_count(dmt);
 
@@ -1026,6 +1026,7 @@ int dm_flush_maps (int retries)
 	if (!names->dev)
 		goto out;
 
+	r = 0;
 	do {
 		r |= dm_suspend_and_flush_map(names->name, retries);
 		next = names->next;
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

