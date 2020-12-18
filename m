Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id EA52C2DEBD5
	for <lists+dm-devel@lfdr.de>; Sat, 19 Dec 2020 00:07:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608332830;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UIfrm6WksNT2vy5WA7esmh2bZTxUNxj3bV7DwF3J2mU=;
	b=LRl162aN1vphriHHUnnZi5fMz+qzNszpmSPnjGiNVcIB3dEJy+nlFYuMXAgODjjEeoaRal
	wBMFBMWfzwizh9GpBXQbbHMhmQDjvP5YT/35Sy4cuxvqVvHlqV3/+/MxvpJ87Pcb60aSVs
	HI1bFvsfWy/1OlOPRGoD8ji9YSpzFm8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-OJKsK1rXMEmbD1Fgl_fIFg-1; Fri, 18 Dec 2020 18:07:08 -0500
X-MC-Unique: OJKsK1rXMEmbD1Fgl_fIFg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F342A8049C5;
	Fri, 18 Dec 2020 23:07:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D18402BFF1;
	Fri, 18 Dec 2020 23:07:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 86D9C5002C;
	Fri, 18 Dec 2020 23:07:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BIN6nOE026971 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 18 Dec 2020 18:06:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B7FF110016FF; Fri, 18 Dec 2020 23:06:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4739110016FA;
	Fri, 18 Dec 2020 23:06:46 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 0BIN6jk4009766; 
	Fri, 18 Dec 2020 17:06:45 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 0BIN6iDI009765;
	Fri, 18 Dec 2020 17:06:44 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Fri, 18 Dec 2020 17:06:38 -0600
Message-Id: <1608332802-9720-3-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1608332802-9720-1-git-send-email-bmarzins@redhat.com>
References: <1608332802-9720-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 2/6] mpathpersist: update prkeys file on changing
	registrations
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When the "reservation_key" option is set to "file" and Register command
is run with both the current Reservation Key and a new Service Action
Reservation Key, mpathpersist will change the registration, but will not
update the prkeys file. This means that future paths that come online
will not be able to register, since multipathd is still using the old
reservation key. Fix this.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmpathpersist/mpath_persist.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/libmpathpersist/mpath_persist.c b/libmpathpersist/mpath_persist.c
index 41789c46..08077936 100644
--- a/libmpathpersist/mpath_persist.c
+++ b/libmpathpersist/mpath_persist.c
@@ -290,9 +290,10 @@ int __mpath_persistent_reserve_out ( int fd, int rq_servact, int rq_scope,
 
 	memcpy(&prkey, paramp->sa_key, 8);
 	if (mpp->prkey_source == PRKEY_SOURCE_FILE && prkey &&
-	    ((!get_be64(mpp->reservation_key) &&
-	      rq_servact == MPATH_PROUT_REG_SA) ||
-	     rq_servact == MPATH_PROUT_REG_IGN_SA)) {
+	    (rq_servact == MPATH_PROUT_REG_IGN_SA ||
+	     (rq_servact == MPATH_PROUT_REG_SA &&
+	      (!get_be64(mpp->reservation_key) ||
+	       memcmp(paramp->key, &mpp->reservation_key, 8) == 0)))) {
 		memcpy(&mpp->reservation_key, paramp->sa_key, 8);
 		if (update_prkey_flags(alias, get_be64(mpp->reservation_key),
 				       paramp->sa_flags)) {
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

