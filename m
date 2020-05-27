Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF791E390C
	for <lists+dm-devel@lfdr.de>; Wed, 27 May 2020 08:24:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590560642;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ubZymI8FVx7gEcqj2xwzdrUsUmdNDDRaZ7UHnOnCzVM=;
	b=ayduKnmCU6cssaoGUOd/9YtAUygiDSNMZeubxL+BlyiGjGAXO6ZQeDT4zpBZqWFylZTtWe
	3TMOUuw33afRNmzLfKrEQC1fCisVMLySLDWSb3AwnQ7EPfEAYev1doTlsckifktObIwJud
	3MdYqO8OBNzHj5sQgc1fBVNCXIunsjc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-hkaa514AMiiUegBOwgzhHQ-1; Wed, 27 May 2020 02:23:07 -0400
X-MC-Unique: hkaa514AMiiUegBOwgzhHQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CB8A81E22C;
	Wed, 27 May 2020 06:23:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B8A479C57;
	Wed, 27 May 2020 06:23:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 226761809561;
	Wed, 27 May 2020 06:23:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04R6Mlw2015702 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 27 May 2020 02:22:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B26D9AF9A0; Wed, 27 May 2020 06:22:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ADE2E951C1
	for <dm-devel@redhat.com>; Wed, 27 May 2020 06:22:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBFF218A6661
	for <dm-devel@redhat.com>; Wed, 27 May 2020 06:22:44 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-474-dHcKj61IP1u_1JAvKVp7vg-1;
	Wed, 27 May 2020 02:22:42 -0400
X-MC-Unique: dHcKj61IP1u_1JAvKVp7vg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 42C60B2A5;
	Wed, 27 May 2020 06:22:43 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Wed, 27 May 2020 08:22:10 +0200
Message-Id: <20200527062225.72849-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
Subject: [dm-devel] [PATCHv2 00/15] dm-zoned: multi-device support
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

Hi all,

here's the second version of my patchset to support multiple zoned
drives with dm-zoned.
This patchset:
- Converts the zone array to using xarray for better scalability
- Separates out shared structures into per-device structure
- Enforce drive-locality for allocating and reclaiming zones
- Lifts the restriction of 2 devices to handle an arbitrary number
  of drives.

This gives me a near-perfect scalability by increasing the write
speed from 150MB/s (for a cache and one zoned drive) to 300MB/s
(for a cache and two zoned drives).

Changes to v1:
- Include reviews from Damien
- Reshuffle patches

Hannes Reinecke (15):
  dm-zoned: add debugging message for reading superblocks
  dm-zoned: secondary superblock must reside on the same devices than
    primary superblock
  dm-zoned: improve logging messages for reclaim
  dm-zoned: add a 'reserved' zone flag
  dm-zoned: convert to xarray
  dm-zoned: temporary superblock for tertiary devices
  dm-zoned: add device pointer to struct dm_zone
  dm-zoned: add metadata pointer to struct dmz_dev
  dm-zoned: allocate dm devices dynamically
  dm-zoned: per-device reclaim
  dm-zoned: move random and sequential zones into struct dmz_dev
  dm-zoned: support arbitrary number of devices
  dm-zoned: allocate zone by device index
  dm-zoned: select reclaim zone based on device index
  dm-zoned: prefer full zones for reclaim

 drivers/md/dm-zoned-metadata.c | 448 ++++++++++++++++++++++++-----------------
 drivers/md/dm-zoned-reclaim.c  |  95 +++++----
 drivers/md/dm-zoned-target.c   | 169 ++++++++++------
 drivers/md/dm-zoned.h          |  77 ++++---
 4 files changed, 481 insertions(+), 308 deletions(-)

-- 
2.16.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

