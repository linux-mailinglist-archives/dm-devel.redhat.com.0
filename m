Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D08A8390B5F
	for <lists+dm-devel@lfdr.de>; Tue, 25 May 2021 23:25:53 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-nhP9ExdUO0aXulQxpT3X4A-1; Tue, 25 May 2021 17:25:49 -0400
X-MC-Unique: nhP9ExdUO0aXulQxpT3X4A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8331E6416A;
	Tue, 25 May 2021 21:25:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6379550DE6;
	Tue, 25 May 2021 21:25:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 154E31801265;
	Tue, 25 May 2021 21:25:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14PLPJ9e003345 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 25 May 2021 17:25:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 023A51025836; Tue, 25 May 2021 21:25:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F083110F8E36
	for <dm-devel@redhat.com>; Tue, 25 May 2021 21:25:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E008833959
	for <dm-devel@redhat.com>; Tue, 25 May 2021 21:25:14 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-215-xFIvo0MMOjuFbUKctCQ6qg-3; Tue, 25 May 2021 17:25:09 -0400
X-MC-Unique: xFIvo0MMOjuFbUKctCQ6qg-3
IronPort-SDR: LJ6fCHe4f4Art6kPPohg2IJRjEDrX6XsHlV1BF+SGnAhAzNcB3Gsa0dEDXZp8eN8p7Ke38gERL
	bDIfuSzoH78b2LXU1I+uxvhfl2EeO3pH3XBgiavqOES4TLff4BXyuU6ALoSmlMlBR33Rt65ERf
	s8aDDU8oO/Bidm3eKJF4J3v6sG1Z0nw7PcpJFUj9zNRw1XzBpQBkisyf7A8aeCLAlPl/YyxtYa
	Spnz6w0gwQuqEi4al0cmT7Bw62jpv0wDZ14b2ESCbX1Alg5Xv/sAIYgf9Zj6fD1CWRhqZeQX7v
	NvY=
X-IronPort-AV: E=Sophos;i="5.82,329,1613404800"; d="scan'208";a="168717520"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 26 May 2021 05:25:09 +0800
IronPort-SDR: k4h4BrUh0a8aQrCEJ5lJGdAGNyjV/KFWFeQ9vCh2QsEXNF/aLrRS5W89wTGv+YFGbEK+9A8Qkp
	v97gxKIIVTNbMcG90NYphYkjrHPfNh1lrfZeL7g5h7lLw6jZIakZanOEND8t6FtPlvcKuP/A/+
	a/pi26e1FsUQbr+XJPTNgw5OCdBY8eGWJj55NMrhXDwnyPPNfBVobb2kVxcA7JTpJLZGxNcarc
	rMlFU9iUFKkROPQHZbk3TT0E3hkkLcl6ZTiPuwWJGas6d4zR/sKfRb4nzxYuEFKRh4F4gWEM9x
	Aaxuf2r4RdnxEudm7V5ivzUw
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	25 May 2021 14:03:19 -0700
IronPort-SDR: 3WNVVCsgoR+ULzKivcrpIeAvbOp+kxOVyC48DtAIJxBDV5vcEXViErn5CAUrjJQMKqfidv6Nmn
	lW4Bg5t3O66RzOS5xKoyVViesIm8tMGdOlCpsqFHGufkP5rGYHsGX7RlmFhbYMsT2IfulamBmL
	mB7wkTHfZUs7VDnI13816sg/w+4Zx8k7tQhufvjmRMMR8poDM1pV7kBtqNnBEUJba7UsoT9Rz3
	1LtKYOjwWvvRvRLBKX62ZoFKG0/THsY8cfbQ9toC+X1FKFXWKX+1V5m47kED3THFGonbQhIKBI
	scs=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 25 May 2021 14:25:08 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>,
	linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Date: Wed, 26 May 2021 06:24:54 +0900
Message-Id: <20210525212501.226888-5-damien.lemoal@wdc.com>
In-Reply-To: <20210525212501.226888-1-damien.lemoal@wdc.com>
References: <20210525212501.226888-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Subject: [dm-devel] [PATCH v5 04/11] dm: Fix dm_accept_partial_bio()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix dm_accept_partial_bio() to actually check that zone management
commands are not passed as explained in the function documentation
comment. Also, since a zone append operation cannot be split, add
REQ_OP_ZONE_APPEND as a forbidden command.

White lines are added around the group of BUG_ON() calls to make the
code more legible.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/md/dm.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index ca2aedd8ee7d..11af20080639 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1237,8 +1237,8 @@ static int dm_dax_zero_page_range(struct dax_device *dax_dev, pgoff_t pgoff,
 
 /*
  * A target may call dm_accept_partial_bio only from the map routine.  It is
- * allowed for all bio types except REQ_PREFLUSH, REQ_OP_ZONE_RESET,
- * REQ_OP_ZONE_OPEN, REQ_OP_ZONE_CLOSE and REQ_OP_ZONE_FINISH.
+ * allowed for all bio types except REQ_PREFLUSH, REQ_OP_ZONE_* zone management
+ * operations and REQ_OP_ZONE_APPEND (zone append writes).
  *
  * dm_accept_partial_bio informs the dm that the target only wants to process
  * additional n_sectors sectors of the bio and the rest of the data should be
@@ -1268,9 +1268,13 @@ void dm_accept_partial_bio(struct bio *bio, unsigned n_sectors)
 {
 	struct dm_target_io *tio = container_of(bio, struct dm_target_io, clone);
 	unsigned bi_size = bio->bi_iter.bi_size >> SECTOR_SHIFT;
+
 	BUG_ON(bio->bi_opf & REQ_PREFLUSH);
+	BUG_ON(op_is_zone_mgmt(bio_op(bio)));
+	BUG_ON(bio_op(bio) == REQ_OP_ZONE_APPEND);
 	BUG_ON(bi_size > *tio->len_ptr);
 	BUG_ON(n_sectors > bi_size);
+
 	*tio->len_ptr -= bi_size - n_sectors;
 	bio->bi_iter.bi_size = n_sectors << SECTOR_SHIFT;
 }
-- 
2.31.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

