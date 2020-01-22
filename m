Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 0602D14574C
	for <lists+dm-devel@lfdr.de>; Wed, 22 Jan 2020 14:58:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579701515;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RPa6bT33G2b0jgkWczWeg1zRmpiga67Jy5cE8SF6NAg=;
	b=Fr2QQch1iAqtgTltZrdPKSqSvgU4dwa5AwNFyFcHiEtqJCF+xDhAUcblZ3E4uYN5xDfnVB
	ozD/14Oc66whc+gGiOYp2txyI5+xQ+Sy2+lx7rP+b1Wyha9og8i6vO3JsYqZuMuuTzmCOF
	4bfRwJ1gSa+bemmU/viOcEILkthX4W0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-tzXpXi2BMi-_8VgO6LeVOw-1; Wed, 22 Jan 2020 08:58:31 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B8D3100551D;
	Wed, 22 Jan 2020 13:58:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 74DD9845A5;
	Wed, 22 Jan 2020 13:58:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 01FC78198A;
	Wed, 22 Jan 2020 13:58:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00MAwhn1002563 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 22 Jan 2020 05:58:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A20182026D67; Wed, 22 Jan 2020 10:58:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D0EF2093CE0
	for <dm-devel@redhat.com>; Wed, 22 Jan 2020 10:58:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2046101D23B
	for <dm-devel@redhat.com>; Wed, 22 Jan 2020 10:58:41 +0000 (UTC)
Received: from relay.sw.ru (relay.sw.ru [185.231.240.75]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-151--HOf-UbuMeaIBhavaN2ANQ-1;
	Wed, 22 Jan 2020 05:58:38 -0500
Received: from dhcp-172-16-24-104.sw.ru ([172.16.24.104]
	helo=localhost.localdomain) by relay.sw.ru with esmtp (Exim 4.92.3)
	(envelope-from <ktkhai@virtuozzo.com>)
	id 1iuDho-0002gJ-Kd; Wed, 22 Jan 2020 13:57:52 +0300
From: Kirill Tkhai <ktkhai@virtuozzo.com>
To: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	martin.petersen@oracle.com, bob.liu@oracle.com, axboe@kernel.dk,
	agk@redhat.com, snitzer@redhat.com, dm-devel@redhat.com,
	song@kernel.org, tytso@mit.edu, adilger.kernel@dilger.ca,
	Chaitanya.Kulkarni@wdc.com, darrick.wong@oracle.com,
	ming.lei@redhat.com, osandov@fb.com, jthumshirn@suse.de,
	minwoo.im.dev@gmail.com, damien.lemoal@wdc.com,
	andrea.parri@amarulasolutions.com, hare@suse.com, tj@kernel.org,
	ajay.joshi@wdc.com, sagi@grimberg.me, dsterba@suse.com,
	chaitanya.kulkarni@wdc.com, bvanassche@acm.org, dhowells@redhat.com,
	asml.silence@gmail.com, ktkhai@virtuozzo.com
Date: Wed, 22 Jan 2020 13:57:52 +0300
Message-ID: <157968992539.174869.7490844754165043549.stgit@localhost.localdomain>
User-Agent: StGit/0.19
MIME-Version: 1.0
X-MC-Unique: -HOf-UbuMeaIBhavaN2ANQ-1
X-MC-Unique: tzXpXi2BMi-_8VgO6LeVOw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00MAwhn1002563
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 22 Jan 2020 08:58:06 -0500
Subject: [dm-devel] [PATCH v5 0/6] block: Introduce REQ_ALLOCATE flag for
 REQ_OP_WRITE_ZEROES
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

(was "[PATCH block v2 0/3] block: Introduce REQ_NOZERO flag
      for REQ_OP_WRITE_ZEROES operation";
 was "[PATCH RFC 0/3] block,ext4: Introduce REQ_OP_ASSIGN_RANGE
      to reflect extents allocation in block device internals")

v5: Kill dm|md patch, which disables REQ_ALLOCATE for these devices.
    Disable REQ_ALLOCATE for all stacking devices instead of this.

v4: Correct argument for mddev_check_write_zeroes().

v3: Rename REQ_NOZERO to REQ_ALLOCATE.
    Split helpers to separate patches.
    Add a patch, disabling max_allocate_sectors inheritance for dm.

v2: Introduce new flag for REQ_OP_WRITE_ZEROES instead of
    introduction a new operation as suggested by Martin K. Petersen.
    Removed ext4-related patch to focus on block changes
    for now.

Information about continuous extent placement may be useful
for some block devices. Say, distributed network filesystems,
which provide block device interface, may use this information
for better blocks placement over the nodes in their cluster,
and for better performance. Block devices, which map a file
on another filesystem (loop), may request the same length extent
on underlining filesystem for less fragmentation and for batching
allocation requests. Also, hypervisors like QEMU may use this
information for optimization of cluster allocations.

This patchset introduces REQ_ALLOCATE flag for REQ_OP_WRITE_ZEROES,
which makes a block device to allocate blocks instead of actual
blocks zeroing. This may be used for forwarding user's fallocate(0)
requests into block device internals. E.g., in loop driver this
will result in allocation extents in backing-file, so subsequent
write won't fail by the reason of no available space. Distributed
network filesystems will be able to assign specific servers for
specific extents, so subsequent write will be more efficient.

Patches [1-3/6] are preparation on helper functions, patch [4/6]
introduces REQ_ALLOCATE flag and implements all the logic,
patch [5/6] adds one more helper, patch [6/6] adds loop
as the first user of the flag.

Note, that here is only block-related patches, example of usage
for ext4 with a performance numbers may be seen in [1].

[1] https://lore.kernel.org/linux-ext4/157599697369.12112.10138136904533871162.stgit@localhost.localdomain/T/#me5bdd5cc313e14de615d81bea214f355ae975db0
---

Kirill Tkhai (6):
      block: Add @flags argument to bdev_write_zeroes_sectors()
      block: Pass op_flags into blk_queue_get_max_sectors()
      block: Introduce blk_queue_get_max_write_zeroes_sectors()
      block: Add support for REQ_ALLOCATE flag
      block: Add blk_queue_max_allocate_sectors()
      loop: Add support for REQ_ALLOCATE


 block/blk-core.c                    |    6 +++---
 block/blk-lib.c                     |   17 ++++++++++-------
 block/blk-merge.c                   |    9 ++++++---
 block/blk-settings.c                |   17 +++++++++++++++++
 drivers/block/loop.c                |   15 ++++++++++++---
 drivers/md/dm-kcopyd.c              |    2 +-
 drivers/target/target_core_iblock.c |    4 ++--
 fs/block_dev.c                      |    4 ++++
 include/linux/blk_types.h           |    5 ++++-
 include/linux/blkdev.h              |   34 ++++++++++++++++++++++++++--------
 10 files changed, 85 insertions(+), 28 deletions(-)

--
Signed-off-by: Kirill Tkhai <ktkhai@virtuozzo.com>


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

