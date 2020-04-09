Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id D450A1A2F7A
	for <lists+dm-devel@lfdr.de>; Thu,  9 Apr 2020 08:47:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586414823;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aDCcZDnndzRitZNQ3x/f2VqKmKRvzWXJOtiViMOBm5A=;
	b=LCE5YwYgbCLFZmbRJL6TMRjeAmMXfz2eGa+MeMRA0S6KdvWwXK55LVkc1gXMXRUND1KI3i
	1p8QNxavkOKRZy7U97wRsGvdI6hvLclN8dnhRlA5rkiXgF55mBPlXbRbSoaCyDgEVR4ejj
	QTQc/X8ztlcIpWSOSRFwWgqWBa8MNLI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-c0Wr_OOgMumUHWDLQZhzJA-1; Thu, 09 Apr 2020 02:46:12 -0400
X-MC-Unique: c0Wr_OOgMumUHWDLQZhzJA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24D9A10753FA;
	Thu,  9 Apr 2020 06:46:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2D571036B4B;
	Thu,  9 Apr 2020 06:46:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3F01218089D0;
	Thu,  9 Apr 2020 06:46:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0396jdWn004754 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Apr 2020 02:45:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DBDE511514C; Thu,  9 Apr 2020 06:45:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D886F11514A
	for <dm-devel@redhat.com>; Thu,  9 Apr 2020 06:45:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CB248F7A05
	for <dm-devel@redhat.com>; Thu,  9 Apr 2020 06:45:37 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-395-Z1LRJw1sM7KTtdqGTgZonA-1;
	Thu, 09 Apr 2020 02:45:34 -0400
X-MC-Unique: Z1LRJw1sM7KTtdqGTgZonA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id BA0E6AE19;
	Thu,  9 Apr 2020 06:45:30 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Thu,  9 Apr 2020 08:45:26 +0200
Message-Id: <20200409064527.82992-11-hare@suse.de>
In-Reply-To: <20200409064527.82992-1-hare@suse.de>
References: <20200409064527.82992-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0396jdWn004754
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, Bob Liu <bob.liu@oracle.com>,
	dm-devel@redhat.com
Subject: [dm-devel] [PATCH 10/11] dm-zoned: ignore metadata zone in
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When looking up zones in dmz_alloc_zone() we need to ignore
metadata zones so as not to accidentally overwrite metadata.

Signed-off-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/md/dm-zoned-metadata.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 211dee442a01..554ff32abada 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -1902,7 +1902,13 @@ struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags)
 		zone = NULL;
 		goto again;
 	}
+	if (dmz_is_meta(zone)) {
+		struct dmz_dev *dev = dmz_zone_to_dev(zmd, zone);
 
+		dmz_dev_warn(dev, "Zone %u has metadata", dmz_id(zmd, zone));
+		zone = NULL;
+		goto again;
+	}
 	return zone;
 }
 
-- 
2.25.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

