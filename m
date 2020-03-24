Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 006D6191B9F
	for <lists+dm-devel@lfdr.de>; Tue, 24 Mar 2020 22:04:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585083872;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qxahXcs9+EK2ohlLoGhuF84BMLR+1m0iaJVD3X/8Juk=;
	b=LiGGWMReZ8yTlamUPN9CsnG11p186bRedEMMsJ5RiuzvTNp254RAKp0YW75BtJUc3wE9mN
	jZyIMNNK+2n0O0xuTpwPyEVKOcJS1TjJE7g9YJjPXB6lnSNqa1MyNxSDR/tmwy6NWpxTXl
	5PYGtIOb46rkPxpjSfUcL3roG9bDJfI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-dyaqeuQgMnqfYNwRVdA1xw-1; Tue, 24 Mar 2020 17:04:29 -0400
X-MC-Unique: dyaqeuQgMnqfYNwRVdA1xw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 281271005F6C;
	Tue, 24 Mar 2020 21:04:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C0521001B3F;
	Tue, 24 Mar 2020 21:04:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D0003944B5;
	Tue, 24 Mar 2020 21:04:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02OL3vHW006551 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 24 Mar 2020 17:03:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D9B59CD47E; Tue, 24 Mar 2020 21:03:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C3A61CD47D;
	Tue, 24 Mar 2020 21:03:57 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 02OL3uD3014279; 
	Tue, 24 Mar 2020 16:03:56 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 02OL3uhQ014278;
	Tue, 24 Mar 2020 16:03:56 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Tue, 24 Mar 2020 16:03:53 -0500
Message-Id: <1585083834-14237-2-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1585083834-14237-1-git-send-email-bmarzins@redhat.com>
References: <1585083834-14237-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 2/3] libmutipath: don't close fd on dm_lib_release
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If dm_hold_control_open() isn't set, when dm_lib_release() is called, it
will close the control fd. The control fd will get re-opened on the next
dm_task_run() call, but if there is a dm_task_run() call already
in progress in another thread, it can fail. Since many of the
device-mapper callouts happen with the vecs lock held, this wasn't too
noticeable, but there is code that calls dm_task_run() without the
vecs lock held, notably the dmevent waiter code.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/devmapper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
index bed8ddc6..d96472fe 100644
--- a/libmultipath/devmapper.c
+++ b/libmultipath/devmapper.c
@@ -254,6 +254,7 @@ void libmp_dm_init(void)
 	memcpy(conf->version, version, sizeof(version));
 	put_multipath_config(conf);
 	dm_init(verbosity);
+	dm_hold_control_dev(1);
 	dm_udev_set_sync_support(libmp_dm_udev_sync);
 }
 
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

