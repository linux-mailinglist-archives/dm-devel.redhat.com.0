Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id F3A2E2DEBD6
	for <lists+dm-devel@lfdr.de>; Sat, 19 Dec 2020 00:07:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608332831;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Xtt+msuIRvFst6r+I4ESpie4w0dPlxILvTIjbyLH+9Q=;
	b=Wd4eBjUkEXsvZvyUoL+ILNyYYg+caV7y+79luyk83ONugk7RxZFuJQBBRJxJtzdzre8AU8
	a27Ea9k0Hbe/8OT/FLHxfCePCvNH/yNmbzBzHhHwcpys7MEHp74CiQU1HWTlE2F0C7v8XS
	YOjZZ22MRz7mQQWPujKaOQ0mMyj5dok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-t5sB5SO7MSGg_DhhyIGM_w-1; Fri, 18 Dec 2020 18:07:08 -0500
X-MC-Unique: t5sB5SO7MSGg_DhhyIGM_w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3403190D348;
	Fri, 18 Dec 2020 23:07:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD00361F38;
	Fri, 18 Dec 2020 23:07:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 71F334BB7B;
	Fri, 18 Dec 2020 23:07:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BIN6pOI026985 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 18 Dec 2020 18:06:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7F507614FF; Fri, 18 Dec 2020 23:06:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DFF060CE7;
	Fri, 18 Dec 2020 23:06:48 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 0BIN6kU2009774; 
	Fri, 18 Dec 2020 17:06:46 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 0BIN6kT9009773;
	Fri, 18 Dec 2020 17:06:46 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Fri, 18 Dec 2020 17:06:40 -0600
Message-Id: <1608332802-9720-5-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1608332802-9720-1-git-send-email-bmarzins@redhat.com>
References: <1608332802-9720-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 4/6] libmultipath: ignore multipaths sections
	without wwid option
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

"multipathd show config local" was crashing in find_mp_by_wwid() if
the multipath configuration included a multipaths section that did
not set a wwid option. There is no reason to keep a mpentry that
didn't set its wwid. Remove it in merge_mptable().

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/config.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/libmultipath/config.c b/libmultipath/config.c
index 9f3cb38d..a643703e 100644
--- a/libmultipath/config.c
+++ b/libmultipath/config.c
@@ -509,6 +509,13 @@ void merge_mptable(vector mptable)
 	int i, j;
 
 	vector_foreach_slot(mptable, mp1, i) {
+		/* drop invalid multipath configs */
+		if (!mp1->wwid) {
+			condlog(0, "multipaths config section missing wwid");
+			vector_del_slot(mptable, i--);
+			free_mpe(mp1);
+			continue;
+		}
 		j = i + 1;
 		vector_foreach_slot_after(mptable, mp2, j) {
 			if (strcmp(mp1->wwid, mp2->wwid))
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

