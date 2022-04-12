Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9EB4FD31B
	for <lists+dm-devel@lfdr.de>; Tue, 12 Apr 2022 10:56:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649753803;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JZVq20thgTOfL9X+JWaRUcZv6p7AfvE1d8BkoJ8OXlU=;
	b=iICETPzzROtFQyrajjvnB4I+kPujBZltaL9qh/WX6GDv8KhEyBnr4cRa9nODaxe38cjbLl
	Vzx8MmLDyTnB8Ttpzx77qXttmy3UYaMb+m6VezTog2C5r7OtaKahpN/6qg8ZEZ1S/gsnWr
	QspVwERuK0LUSHSe24uPTA9CmBZ0kqk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-442-Z4V2zTEGPqe03WRH3Ja6iw-1; Tue, 12 Apr 2022 04:56:41 -0400
X-MC-Unique: Z4V2zTEGPqe03WRH3Ja6iw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 462843C1485C;
	Tue, 12 Apr 2022 08:56:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 996641454537;
	Tue, 12 Apr 2022 08:56:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8E5AC1940373;
	Tue, 12 Apr 2022 08:56:35 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4C56D1947BBF
 for <dm-devel@listman.corp.redhat.com>; Tue, 12 Apr 2022 08:56:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3DB2C1400AFB; Tue, 12 Apr 2022 08:56:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (ovpn-8-19.pek2.redhat.com [10.72.8.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 68A58145BA42;
 Tue, 12 Apr 2022 08:56:33 +0000 (UTC)
From: Ming Lei <ming.lei@redhat.com>
To: Jens Axboe <axboe@kernel.dk>,
	Mike Snitzer <snitzer@redhat.com>
Date: Tue, 12 Apr 2022 16:56:08 +0800
Message-Id: <20220412085616.1409626-1-ming.lei@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: [dm-devel] [PATCH 0/8] dm: io accounting & polling improvement
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Ming Lei <ming.lei@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Guys,

The 1st patch adds bdev based io accounting interface.

The 2nd ~ 5th patches improves dm's io accounting & split, meantime
fixes kernel panic on dm-zone.

The other patches improves io polling & dm io reference handling.


Ming Lei (8):
  block: replace disk based account with bdev's
  dm: don't pass bio to __dm_start_io_acct and dm_end_io_acct
  dm: pass 'dm_io' instance to dm_io_acct directly
  dm: switch to bdev based io accounting interface
  dm: always setup ->orig_bio in alloc_io
  dm: don't grab target io reference in dm_zone_map_bio
  dm: improve target io referencing
  dm: put all polled io into one single list

 block/blk-core.c              |  15 +--
 drivers/block/zram/zram_drv.c |   5 +-
 drivers/md/dm-core.h          |  17 ++-
 drivers/md/dm-zone.c          |  10 --
 drivers/md/dm.c               | 190 +++++++++++++++++++---------------
 include/linux/blkdev.h        |   7 +-
 6 files changed, 131 insertions(+), 113 deletions(-)

-- 
2.31.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

