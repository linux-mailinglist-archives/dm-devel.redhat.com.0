Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id F0EA336B665
	for <lists+dm-devel@lfdr.de>; Mon, 26 Apr 2021 18:02:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619452974;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XqNA7AGj8LgCifBQRaI7yLOqQzT1uXwrfRifB3ePIMc=;
	b=V4v7OK+wSEuDlExOIUcTSji6IvBtVvch9naEkzTMX0kiGRrfaeBD0Go7PFE4UlFgi2x3to
	lZqm1SWPjz4ZQQKiPSNo5o0KYmE5D/5c2Z8y1J5o5Qk2121yR4wvHsi6A5+2OP+Qmo+Gco
	YaK0bc+35c6MDrOrtFHE1vBZVPORfKw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-376LG4J5NWyKajRJB887LA-1; Mon, 26 Apr 2021 12:02:51 -0400
X-MC-Unique: 376LG4J5NWyKajRJB887LA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3687107ACF7;
	Mon, 26 Apr 2021 16:02:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B16331971A;
	Mon, 26 Apr 2021 16:02:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 47BFC1806D1A;
	Mon, 26 Apr 2021 16:02:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13QG2GvP031204 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 26 Apr 2021 12:02:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C4F82687D8; Mon, 26 Apr 2021 16:02:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 63B9C60CC5;
	Mon, 26 Apr 2021 16:02:13 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 13QG2Cm7028066; Mon, 26 Apr 2021 12:02:12 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 13QG2CFD028062; Mon, 26 Apr 2021 12:02:12 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Mon, 26 Apr 2021 12:02:12 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Melvin Vermeeren <vermeeren@vermwa.re>
In-Reply-To: <alpine.LRH.2.02.2104261124360.24039@file01.intranet.prod.int.rdu2.redhat.com>
Message-ID: <alpine.LRH.2.02.2104261200140.27678@file01.intranet.prod.int.rdu2.redhat.com>
References: <4219669.2KqOsUsilv@verm-r4e>
	<alpine.LRH.2.02.2104261124360.24039@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Milan Broz <mbroz@redhat.com>
Subject: Re: [dm-devel] Integrity discard/trim extremely slow on NVMe SSD
 storage (~10GiB/minute)
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Mon, 26 Apr 2021, Mikulas Patocka wrote:

> > Further tests on the same machine show that SATA SSD is not affected by this 
> > issue and discards at high performance. Appears to be NVMe-specific bug:
> > Ref: https://gitlab.com/cryptsetup/cryptsetup/-/issues/639#note_555208783
> 
> I tried it on my nvme device (Samsung SSD 960 EVO 500GB) and I could 
> discard 32GB in 5 seconds.
> 
> I assume that it is specific to the nvme device you are using. The device 
> is perhaps slow due to a mix of dicard+read+write requests that 
> dm-integrity generates.
> 
> > If there is anything I can do to help feel free to let me know.
> > Note that I am not subscribed to dm-level, please CC me directly.
> > 
> > Thanks,
> 
> Could you try it on other nvme disks?

Try this patch - it will avoid writing discard filler to metadata if it is 
already there. It won't help on the first discard, but it may help when 
discarding already discarded blocks.

Mikulas



dm-integrity: don't write metadata if we overwrite it with the same content

If we discard already discarded blocks, we do not need to write discard
filler to the metadata, because it is already there.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

Index: linux-2.6/drivers/md/dm-integrity.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-integrity.c
+++ linux-2.6/drivers/md/dm-integrity.c
@@ -1429,8 +1429,10 @@ static int dm_integrity_rw_tag(struct dm
 		if (op == TAG_READ) {
 			memcpy(tag, dp, to_copy);
 		} else if (op == TAG_WRITE) {
-			memcpy(dp, tag, to_copy);
-			dm_bufio_mark_partial_buffer_dirty(b, *metadata_offset, *metadata_offset + to_copy);
+			if (memcmp(dp, tag, to_copy)) {
+				memcpy(dp, tag, to_copy);
+				dm_bufio_mark_partial_buffer_dirty(b, *metadata_offset, *metadata_offset + to_copy);
+			}
 		} else {
 			/* e.g.: op == TAG_CMP */
 

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

