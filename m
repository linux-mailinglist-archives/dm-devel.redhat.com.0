Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 59AF821077B
	for <lists+dm-devel@lfdr.de>; Wed,  1 Jul 2020 11:07:00 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-1xqJTSb1NEW0XVQgdvSIMQ-1; Wed, 01 Jul 2020 05:06:57 -0400
X-MC-Unique: 1xqJTSb1NEW0XVQgdvSIMQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26772100CCC0;
	Wed,  1 Jul 2020 09:06:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 00D8F7CAD7;
	Wed,  1 Jul 2020 09:06:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B0DED180530C;
	Wed,  1 Jul 2020 09:06:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06196W0c018112 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Jul 2020 05:06:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6DB8E11796F1; Wed,  1 Jul 2020 09:06:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CB87105CDBB
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 09:06:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 20A0C857CFC
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 09:06:30 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-76-UYqtJtlhPhOGNUu9mA4bdw-1; Wed, 01 Jul 2020 05:06:27 -0400
X-MC-Unique: UYqtJtlhPhOGNUu9mA4bdw-1
Received: from [2001:4bb8:184:76e3:ea38:596b:3e9e:422a] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqYhF-0000hb-3M; Wed, 01 Jul 2020 09:06:25 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  1 Jul 2020 11:06:19 +0200
Message-Id: <20200701090622.3354860-2-hch@lst.de>
In-Reply-To: <20200701090622.3354860-1-hch@lst.de>
References: <20200701090622.3354860-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linux-raid@vger.kernel.org, linux-mm@kvack.org,
	linux-bcache@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, drbd-dev@tron.linbit.com,
	dm-devel@redhat.com, Tejun Heo <tj@kernel.org>,
	cgroups@vger.kernel.org, linux-btrfs@vger.kernel.org
Subject: [dm-devel] [PATCH 1/4] drbd: remove a bogus bdi_rw_congested call
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

bdi_rw_congested returns congestion state, so calling it without
looking at the return value doesn't make much sense.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/drbd/drbd_proc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/block/drbd/drbd_proc.c b/drivers/block/drbd/drbd_proc.c
index 1c41cd9982a257..3c0193de249830 100644
--- a/drivers/block/drbd/drbd_proc.c
+++ b/drivers/block/drbd/drbd_proc.c
@@ -265,7 +265,6 @@ int drbd_seq_show(struct seq_file *seq, void *v)
 			seq_printf(seq, "%2d: cs:Unconfigured\n", i);
 		} else {
 			/* reset device->congestion_reason */
-			bdi_rw_congested(device->rq_queue->backing_dev_info);
 
 			nc = rcu_dereference(first_peer_device(device)->connection->net_conf);
 			wp = nc ? nc->wire_protocol - DRBD_PROT_A + 'A' : ' ';
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

