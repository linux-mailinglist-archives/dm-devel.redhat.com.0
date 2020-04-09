Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 070D01A2F6F
	for <lists+dm-devel@lfdr.de>; Thu,  9 Apr 2020 08:46:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586414767;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zoxMZoSaVMgOBBz46xSw+AXGB8WBhgCmE+SqWtaWlpw=;
	b=SHrccOaWRJwzOGdaHIch01kLbfj+Lk0SXMsplvfs4lXrJe1Yd7eaxlnPC3ikRl402hwuur
	BRek7Am2XO+9i3K5WabXoNFlxCJ89TSjStc0kXE5Omb7e0QMHvQuV/4AS415A3PR9cN0Ft
	+MafclKqcMLask2U4nzZbBavZUILJVo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-B0hJiXqdN3SeKlBT5WoLug-1; Thu, 09 Apr 2020 02:46:03 -0400
X-MC-Unique: B0hJiXqdN3SeKlBT5WoLug-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4122818AB2C5;
	Thu,  9 Apr 2020 06:45:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 988BBC0DA7;
	Thu,  9 Apr 2020 06:45:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8EEAA18089CD;
	Thu,  9 Apr 2020 06:45:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0396jcs0004720 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Apr 2020 02:45:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1FF2C2166B34; Thu,  9 Apr 2020 06:45:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C8B42166B36
	for <dm-devel@redhat.com>; Thu,  9 Apr 2020 06:45:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE85E8007AC
	for <dm-devel@redhat.com>; Thu,  9 Apr 2020 06:45:35 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-242-V2qTN0ZAOXixZKnuBCCCuw-1;
	Thu, 09 Apr 2020 02:45:32 -0400
X-MC-Unique: V2qTN0ZAOXixZKnuBCCCuw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 71E1AAD93;
	Thu,  9 Apr 2020 06:45:30 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Thu,  9 Apr 2020 08:45:16 +0200
Message-Id: <20200409064527.82992-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0396jcs0004720
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, Bob Liu <bob.liu@oracle.com>,
	dm-devel@redhat.com
Subject: [dm-devel] [PATCHv3 00/11] dm-zoned: metadata version 2
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,

this patchset adds a new metadata version 2, which brings the following
improvements:
- UUIDs and labels: Adding three more fields to the metadata containing
  the dm-zoned device UUID and label, and the device UUID. This allows
  for an unique identification of the devices, so that several dm-zoned
  sets can coexist and have a persistent identification.
- Extend random zones by an additional regular disk device: A regular
  block device can be added together with the zoned block device, providing
  additional (emulated) random write zones. With this it's possible to
  handle sequential zones only devices; also there will be a speed-up if
  the regular block device resides on a fast medium. The regular block device
  is placed logically in front of the zoned block device, so that metadata
  and mapping tables reside on the regular block device, not the zoned device.
- Tertiary superblock support: In addition to the two existing sets of metadata
  another, tertiary, superblock is written to the first block of the zoned
  block device. This superblock is for identification only; the generation
  number is set to '0' and the block itself it never updated. The additional
  metadate like bitmap tables etc are not copied.

To handle this, some changes to the original handling are introduced:
- Zones are now equidistant. Originally, runt zones were ignored, and
  not counted when sizing the mapping tables. With the dual device setup
  runt zones might occur at the end of the regular block device, making
  direct translation between zone number and sector/block number complex.
  For metadata version 2 all zones are considered to be of the same size,
  and runt zones are simply marked as 'offline' to have them ignored when
  allocating a new zone.
- The block number in the superblock is now the global number, and refers to
  the location of the superblock relative to the resulting device-mapper
  device. Which means that the tertiary superblock contains absolute block
  addresses, which needs to be translated to the relative device addresses
  to find the referenced block.

There is an accompanying patchset for dm-zoned-tools for writing and checking
this new metadata.

As usual, comments and reviews are welcome.

Changes to v2:
- Kill dmz_id()
- Include reviews from Damien
- Sanitize uuid handling as suggested by John Dorminy

Hannes Reinecke (11):
  dm-zoned: store zone id within the zone structure and kill dmz_id()
  dm-zoned: use array for superblock zones
  dm-zoned: store device in struct dmz_sb
  dm-zoned: move fields from struct dmz_dev to dmz_metadata
  dm-zoned: introduce dmz_metadata_label() to format device name
  dm-zoned: remove 'dev' argument from reclaim
  dm-zoned: replace 'target' pointer in the bio context
  dm-zoned: use dmz_zone_to_dev() when handling metadata I/O
  dm-zoned: add metadata logging functions
  dm-zoned: ignore metadata zone in dmz_alloc_zone()
  dm-zoned: metadata version 2

 drivers/md/dm-zoned-metadata.c | 601 ++++++++++++++++++++++++---------
 drivers/md/dm-zoned-reclaim.c  |  89 ++---
 drivers/md/dm-zoned-target.c   | 273 ++++++++-------
 drivers/md/dm-zoned.h          |  29 +-
 4 files changed, 659 insertions(+), 333 deletions(-)

-- 
2.25.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

