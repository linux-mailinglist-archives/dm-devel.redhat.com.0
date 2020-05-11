Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 92A9C1CE845
	for <lists+dm-devel@lfdr.de>; Tue, 12 May 2020 00:40:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589236835;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=d72BhX5Rj3wGrOFMobOp+9zD9M1m1OP4zya/A9lBnJ8=;
	b=W0bvglz0TG8kiBO6Y1+SSi3UpruuGKJ6lYr5wAyeaNOoMdOa2emMt+w6Nx0gyVMAFCSIke
	ZOL7pt6FIm3gLE0Fp5JnxL0VAh/YWpi4DuA4PNBBiewAADfrEDcmSJFGOWzKw7K/1U+w4f
	HxqMRUHvM02mAMAzSMhHBVFKXahc+0s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-9e7NTURgPUij2YmiZsGSfQ-1; Mon, 11 May 2020 18:40:32 -0400
X-MC-Unique: 9e7NTURgPUij2YmiZsGSfQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42126805725;
	Mon, 11 May 2020 22:40:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CB007049C;
	Mon, 11 May 2020 22:40:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CCA174E585;
	Mon, 11 May 2020 22:40:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04BMe1aM016105 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 11 May 2020 18:40:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4D3ED1055070; Mon, 11 May 2020 22:40:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 48D2D1055257
	for <dm-devel@redhat.com>; Mon, 11 May 2020 22:39:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE9D98008A3
	for <dm-devel@redhat.com>; Mon, 11 May 2020 22:39:59 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-471-PKLhtVyyOIORuJdOm4qJYg-1;
	Mon, 11 May 2020 18:39:56 -0400
X-MC-Unique: PKLhtVyyOIORuJdOm4qJYg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 5BDF9AE83;
	Mon, 11 May 2020 22:39:57 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Tue, 12 May 2020 00:39:30 +0200
Message-Id: <20200511223931.18261-11-mwilck@suse.com>
In-Reply-To: <20200511223931.18261-1-mwilck@suse.com>
References: <20200511223931.18261-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04BMe1aM016105
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 10/11] multipath-tools tests/test-lib.c: drop
	__wrap_is_claimed_by_foreign
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

is_claimed_by_foreign() is an inline function and can't be wrapped.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 tests/test-lib.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tests/test-lib.c b/tests/test-lib.c
index 59275163..00bae58e 100644
--- a/tests/test-lib.c
+++ b/tests/test-lib.c
@@ -56,12 +56,6 @@ int __wrap_execute_program(char *path, char *value, int len)
 	return 0;
 }
 
-bool __wrap_is_claimed_by_foreign(struct udev_device *ud)
-{
-	condlog(5, "%s: %p", __func__, ud);
-	return false;
-}
-
 struct udev_list_entry
 *__wrap_udev_device_get_properties_list_entry(struct udev_device *ud)
 {
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

