Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8462AE62E8
	for <lists+dm-devel@lfdr.de>; Sun, 27 Oct 2019 15:07:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572185225;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rKjY1el+GrcxxTsJn1fox4PqfLVN//2PhOl/E0ab5yI=;
	b=fQjc6I5uR4WNJq7yI0xck9709grT3lsuEOAk2x7dItDBmxtRWXrj0nIoytCSJ8mUWJH1zi
	gb/k7mQTsN5Q8iseukjSJ1psqoAmzKkYwJXIHJMS30vcMa9rDsf3NodgjAMPOi9Y2FL3Yz
	+fe2RyVbwgO6xCZQrFYi1sDz1f7eNrQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-BG2Jcmm_MueOry21h2AIQg-1; Sun, 27 Oct 2019 10:07:03 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66F1B107AD28;
	Sun, 27 Oct 2019 14:06:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7634A19C68;
	Sun, 27 Oct 2019 14:06:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 337AD4E589;
	Sun, 27 Oct 2019 14:06:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9RE6QrV007588 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 27 Oct 2019 10:06:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 78C4F5C207; Sun, 27 Oct 2019 14:06:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 333125C1D4;
	Sun, 27 Oct 2019 14:06:21 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8B61A308FBFC;
	Sun, 27 Oct 2019 14:06:00 +0000 (UTC)
IronPort-SDR: 7qF4FkKIXpBjyjdKzi1MDXpmVCRRou0GkFJln9Bd2RivwEh21CtBbBao56ZnGAIsctMy7A4m33
	qNua8k9jxxeFb0hLC9Yc9yCddssK3P0iog3N516nFFBHP9mjr7soVbcA9hyCgTBqkOY0rCNwYY
	QyAfPjCGVKLvwDgNUeIyBKc0bRscfydxZLGyjuo6/E8uxczXtddsTfroZLtzX2G5lpFT5ylEcu
	4yyZNu5+XQ3PRZfx9nTgx2iTNW8vXhTHTlKbAsroEFCHSC5zQgyQopD0oFmyWzknDFTiybEzyK
	Jf4=
X-IronPort-AV: E=Sophos;i="5.68,236,1569254400"; d="scan'208";a="122197749"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 27 Oct 2019 22:05:52 +0800
IronPort-SDR: +wRE+NAorOU1GkV0AxPkqvaZbikX/KDx0xUp5ntbWnA19qWMMAIWk+G0bGiiCBfJaaa3nodobY
	Ze2xjZ+/rqul7GHHHOZXQdnkVRbj4E5rxLIsGUIO17sDWHw5r1qIPIZByQqjdPMTmB5ajHSh/6
	wnV0+lITPMNZuZa8Tpn6MVZTGIld4t/dlvOXre9+q5blRNl/lSqfn1ZcOjFY0bwI7FvjNpV4SM
	7jkT9Xb6P8oBXDNXDY92vSXHa3H5zR06eNMYX7JQyL2IHTswLwqL0vBOZhStQs8mVS1hCh6137
	f7LuBanDlQtspXqzlKqVSOdg
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Oct 2019 07:01:20 -0700
IronPort-SDR: +RZzKRYzw04dKAZWap4nRW126plQWlg5ewBORgqIOHsG+JaBctwQxupeWsJuzTXv5gowAeF0eh
	X8WPaAQu3Vur/D8ASXdNogN+xAudZYi6dYSbj4KKAof4dUKREP1ajzZN5vsocLv0BFf/9AgGiH
	7XeurbURQa/MmJ0MRgnKi359C/OqtsdN8FbD7S/uS+pPaE6RWYTKX1mLxV+7ss73+B6Z8A+KQH
	h1ajkIbfurdX22hvijRmEq1rpG/6yTkjZhbjuoNPK2oj8Q/wmf9g95hhlY8ogoQLwchkUqFNA8
	was=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 27 Oct 2019 07:05:50 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Sun, 27 Oct 2019 23:05:41 +0900
Message-Id: <20191027140549.26272-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.43]); Sun, 27 Oct 2019 14:06:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Sun, 27 Oct 2019 14:06:13 +0000 (UTC) for IP:'216.71.153.144'
	DOMAIN:'esa5.hgst.iphmx.com' HELO:'esa5.hgst.iphmx.com'
	FROM:'damien.lemoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.153.144 esa5.hgst.iphmx.com 216.71.153.144
	esa5.hgst.iphmx.com <prvs=196f58c8b=damien.lemoal@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>, Keith Busch <kbusch@kernel.org>,
	Hans Holmberg <Hans.Holmberg@wdc.com>, Ajay Joshi <ajay.joshi@wdc.com>,
	Matias Bjorling <matias.bjorling@wdc.com>
Subject: [dm-devel] [PATCH 0/8] Zone management commands support
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: BG2Jcmm_MueOry21h2AIQg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series implements a few improvements and cleanups to zone block
device zone reset operations with the first three patches.

The remaining of the series patches introduce zone open, close and
finish support, allowing users of zoned block devices to explicitly
control the condition (state) of zones.

While these operations are not stricktly necessary for the correct
operation of zoned block devices, the open and close operations can
improve performance for some device implementations of the ZBC and ZAC
standards under write workloads. The finish zone operation, which
transition a zone to the full state, can also be useful to protect a
zone data by preventing further zone writes.

These operations are implemented by introducing the new
REQ_OP_ZONE_OPEN, REQ_OP_ZONE_CLOSE and REQ_OP_ZONE_FINISH request codes
and the function blkdev_zone_mgmt() to issue these requests. This new
function also replaces the former blkdev_reset_zones() function to reset
zones write pointer.

The new ioctls BLKOPENZONE, BLKCLOSEZONE and BLKFINISHZONE are also
defined to allow applications to issue these new requests without
resorting to a device passthrough interface (e.g. SG_IO).

Support for these operations is added to the SCSI sd driver, to the dm
infrastructure (dm-linear and dm-flakey targets) and to the null_blk
driver.

Ajay Joshi (5):
  block: add zone open, close and finish operations
  block: add zone open, close and finish ioctl support
  scsi: sd_zbc: add zone open, close, and finish support
  dm: add zone open, close and finish support
  null_blk: add zone open, close, and finish support

Damien Le Moal (3):
  block: Remove REQ_OP_ZONE_RESET plugging
  block: Simplify REQ_OP_ZONE_RESET_ALL handling
  scsi: sd_zbc: Fix sd_zbc_complete()

 block/blk-core.c               | 12 +++--
 block/blk-zoned.c              | 99 ++++++++++++++++++----------------
 block/ioctl.c                  |  5 +-
 drivers/block/null_blk_zoned.c | 33 ++++++++++--
 drivers/md/dm-flakey.c         |  7 ++-
 drivers/md/dm-linear.c         |  2 +-
 drivers/md/dm-zoned-metadata.c |  6 +--
 drivers/md/dm.c                |  5 +-
 drivers/scsi/sd.c              | 15 +++++-
 drivers/scsi/sd.h              |  8 +--
 drivers/scsi/sd_zbc.c          | 43 +++++++--------
 fs/f2fs/segment.c              |  3 +-
 include/linux/blk_types.h      | 25 +++++++++
 include/linux/blkdev.h         | 15 +++---
 include/uapi/linux/blkzoned.h  | 17 ++++--
 15 files changed, 192 insertions(+), 103 deletions(-)

-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

