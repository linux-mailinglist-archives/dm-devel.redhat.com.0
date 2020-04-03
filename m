Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 8C6D819DC61
	for <lists+dm-devel@lfdr.de>; Fri,  3 Apr 2020 19:08:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585933692;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tyXeUp8nPb7Q/SOA3GSyLfIGkSXSPlv3f4f28cVbXBI=;
	b=dTzPd6+tKFFsjCZbkGyykkqbE0JVSJYdkOx0GMaUu8eP1bRJ6O1ILbwCeCQr0khuCv48db
	d6Kw62jPvv6e401yqmulAoKekgIb0/9xRhbI33oSiZDYW7z4Qnp2Z3wps0toGUqJJOzjDJ
	P+r1SoUKOzv9ON6jZX/sJCZwerNl1Rc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-KyfVoVUaPgeYJJ3YT3NYtQ-1; Fri, 03 Apr 2020 13:07:34 -0400
X-MC-Unique: KyfVoVUaPgeYJJ3YT3NYtQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FC22DB62;
	Fri,  3 Apr 2020 17:07:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4678C5DA7C;
	Fri,  3 Apr 2020 17:07:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 50F4F4E45D;
	Fri,  3 Apr 2020 17:07:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 033H5smF002273 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 3 Apr 2020 13:05:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1887AA63A6; Fri,  3 Apr 2020 17:05:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 558BCB19A2;
	Fri,  3 Apr 2020 17:05:51 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 033H5obY011622; Fri, 3 Apr 2020 13:05:50 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 033H5oS3011618; Fri, 3 Apr 2020 13:05:50 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Fri, 3 Apr 2020 13:05:50 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>, Milan Broz <mbroz@redhat.com>,
	David Teigland <teigland@redhat.com>
Message-ID: <alpine.LRH.2.02.2004031304240.5307@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH] dm-integrity: fix logic bug in integrity tag
	testing
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If all the bytes are equal to DISCARD_FILLER, we want to accept the
buffer. If any of the bytes is different, we must do thorough tag-by-tag
checking.

The condition was inverted.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Fixes: 84597a44a9d8 ("dm integrity: add optional discard support")

--
 drivers/md/dm-integrity.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux-2.6/drivers/md/dm-integrity.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-integrity.c	2020-04-03 18:48:39.000000000 +0200
+++ linux-2.6/drivers/md/dm-integrity.c	2020-04-03 18:51:38.000000000 +0200
@@ -1333,7 +1333,7 @@ static int dm_integrity_rw_tag(struct dm
 			if (likely(is_power_of_2(ic->tag_size))) {
 				if (unlikely(memcmp(dp, tag, to_copy)))
 					if (unlikely(!ic->discard) ||
-					    unlikely(!memchr_inv(dp, DISCARD_FILLER, to_copy))) {
+					    unlikely(memchr_inv(dp, DISCARD_FILLER, to_copy) != NULL)) {
 						goto thorough_test;
 				}
 			} else {

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

