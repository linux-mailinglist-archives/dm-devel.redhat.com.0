Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1FEAA41295B
	for <lists+dm-devel@lfdr.de>; Tue, 21 Sep 2021 01:21:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632180118;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4Oux9j75xZoK+yhw2R6yXcd6RPVB2V7GhSDHBTgIsJM=;
	b=RzQWjiIsNKSoEdovpLnkadk7WZCoE1FF4DoSMv3/GsfJnuDmaRfzmI/P6UbZSszcVrMzo9
	KTnWcO5iYCR/Bc6ydfYbHB+TNWr1g6znbnBswXTSunsTaTAOmypok2TGT1oSlYQlxzVTHg
	12a2+FcAHulllAJZ+9WTlhAFsL8EpnM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364--xe46r1TMjiz8OiW63QW4w-1; Mon, 20 Sep 2021 19:21:56 -0400
X-MC-Unique: -xe46r1TMjiz8OiW63QW4w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3138EEC1A2;
	Mon, 20 Sep 2021 23:21:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D6F6160938;
	Mon, 20 Sep 2021 23:21:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 962A41806D01;
	Mon, 20 Sep 2021 23:21:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18KNLSFh025915 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Sep 2021 19:21:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D1B0160C9F; Mon, 20 Sep 2021 23:21:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 05BDC60C7F;
	Mon, 20 Sep 2021 23:21:20 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 18KNLJaP009340; 
	Mon, 20 Sep 2021 18:21:19 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 18KNLJAN009339;
	Mon, 20 Sep 2021 18:21:19 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 20 Sep 2021 18:21:14 -0500
Message-Id: <1632180076-9294-3-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1632180076-9294-1-git-send-email-bmarzins@redhat.com>
References: <1632180076-9294-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 2/4] multipathd: remove reconfigure from header
	file.
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
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Only multipathd/main.c uses it.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 multipathd/main.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/multipathd/main.h b/multipathd/main.h
index 23ce919e..a1697a74 100644
--- a/multipathd/main.h
+++ b/multipathd/main.h
@@ -39,7 +39,6 @@ enum daemon_status wait_for_state_change_if(enum daemon_status oldstate,
 					    unsigned long ms);
 void schedule_reconfigure(void);
 int need_to_delay_reconfig (struct vectors *);
-int reconfigure (struct vectors *);
 int ev_add_path (struct path *, struct vectors *, int);
 int ev_remove_path (struct path *, struct vectors *, int);
 int ev_add_map (char *, const char *, struct vectors *);
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

