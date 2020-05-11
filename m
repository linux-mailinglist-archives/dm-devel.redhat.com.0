Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4F6CE1CD3BC
	for <lists+dm-devel@lfdr.de>; Mon, 11 May 2020 10:25:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589185518;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3+QJu4c9EGFsfJCcAdRsBkTbKHwQrnQdH7eSFx6SVzc=;
	b=atcFBWo0Ngh0+jlq0PZhQuvGO1H8mMNtGG+x8cJZdW21GurVQrQO5/CAncpMfgerunwu9X
	NlUtyXXtF2GKlYyTj9gLw9v0KTyUFBAEmvXdJN5ZQ0OF2uFrznYEyRM+JZsGt+AxtWHnZ+
	P05DhRs/kHL/pe5jWyXle81NKH+TcHo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-m6m-9Gz7PHaIwfMnmU27wQ-1; Mon, 11 May 2020 04:25:16 -0400
X-MC-Unique: m6m-9Gz7PHaIwfMnmU27wQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81A6A18FE863;
	Mon, 11 May 2020 08:25:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F994704C2;
	Mon, 11 May 2020 08:25:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BF1804E564;
	Mon, 11 May 2020 08:25:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04B8OrOF031899 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 11 May 2020 04:24:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 604C12156A49; Mon, 11 May 2020 08:24:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BFCB2157F23
	for <dm-devel@redhat.com>; Mon, 11 May 2020 08:24:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D70E21859171
	for <dm-devel@redhat.com>; Mon, 11 May 2020 08:24:50 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-362-BJjXXlVfNduXkGdAANJAlA-1;
	Mon, 11 May 2020 04:24:48 -0400
X-MC-Unique: BJjXXlVfNduXkGdAANJAlA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 62B49AEC3;
	Mon, 11 May 2020 08:24:47 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Mon, 11 May 2020 10:24:29 +0200
Message-Id: <20200511082430.39455-15-hare@suse.de>
In-Reply-To: <20200511082430.39455-1-hare@suse.de>
References: <20200511082430.39455-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, Bob Liu <bob.liu@oracle.com>,
	dm-devel@redhat.com
Subject: [dm-devel] [PATCH 14/15] dm-zoned: ignore metadata zone in
	dmz_alloc_zone()
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When looking up zones in dmz_alloc_zone() we need to ignore
metadata zones so as not to accidentally overwrite metadata.

Signed-off-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Bob Liu <bob.liu@oracle.com>
---
 drivers/md/dm-zoned-metadata.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 80c0fe4c3546..067ce010f457 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -1907,7 +1907,13 @@ struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags)
 		zone = NULL;
 		goto again;
 	}
+	if (dmz_is_meta(zone)) {
+		struct dmz_dev *dev = dmz_zone_to_dev(zmd, zone);
 
+		dmz_dev_warn(dev, "Zone %u has metadata", zone->id);
+		zone = NULL;
+		goto again;
+	}
 	return zone;
 }
 
-- 
2.16.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

