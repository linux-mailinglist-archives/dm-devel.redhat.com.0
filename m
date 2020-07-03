Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E866621305D
	for <lists+dm-devel@lfdr.de>; Fri,  3 Jul 2020 02:07:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593734873;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+mMLgFIY8ZUqOY3qfLw6CniLql75onr9kd/1XhUDf+4=;
	b=bub7oWeKGi/OTeTspcmJuQMyhnHEhC90hBlH1h/WOE83D+LCkeKs5FTaMQNLX3TDC+43cH
	ixikjUqOfp80CjFJ1v0AFNDF1PQPdEqe0bky9Ri4E7qXEXJ8lsSQHn7v1O8kVd/RlTgexY
	jc2P65UxT4MlrgH0Kyc3fhGp/329HvY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-Hltvz4eXOua9v_W-7DWlRQ-1; Thu, 02 Jul 2020 20:07:50 -0400
X-MC-Unique: Hltvz4eXOua9v_W-7DWlRQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49A1918A0763;
	Fri,  3 Jul 2020 00:07:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27ACC17D8F;
	Fri,  3 Jul 2020 00:07:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DA5EB1806B0A;
	Fri,  3 Jul 2020 00:07:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06307EX0014372 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Jul 2020 20:07:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0181C1A92D; Fri,  3 Jul 2020 00:07:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3039F1A925;
	Fri,  3 Jul 2020 00:07:11 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 063079K7014109; 
	Thu, 2 Jul 2020 19:07:10 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 063079bD014108;
	Thu, 2 Jul 2020 19:07:09 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu,  2 Jul 2020 19:07:02 -0500
Message-Id: <1593734826-14059-4-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1593734826-14059-1-git-send-email-bmarzins@redhat.com>
References: <1593734826-14059-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v3 3/7] libmultipath: make dm_flush_maps only
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
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
index 24cc616a..4c86b6d4 100644
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

