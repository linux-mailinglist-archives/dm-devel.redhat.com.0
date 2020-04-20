Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 60B631B0643
	for <lists+dm-devel@lfdr.de>; Mon, 20 Apr 2020 12:09:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587377363;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=T0NWazBUQWinZ9T+7FDhzsAp2t3V62V1s3LyT7Uc08I=;
	b=DQ+Gt8f/EP+tr3PkN83nNerWlRqmhz9cuNWVpGLK9yLxDsrJzgU8t35z735/FVCRczzi3d
	4KWp4ng9NwDOt/iO1Rd3Ho/lrA9S5wzdB+PV/fGZ1kp/sxJJlApt6fX58zP8FyfB4F3z56
	C2wPUL84GmVj8+zhOqZ+PnF/60pEFOY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-AYcwUW2mNEGL6QZA_9i9aw-1; Mon, 20 Apr 2020 06:09:21 -0400
X-MC-Unique: AYcwUW2mNEGL6QZA_9i9aw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81AF28017F6;
	Mon, 20 Apr 2020 10:09:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 56B781265A0;
	Mon, 20 Apr 2020 10:09:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 972D618089CE;
	Mon, 20 Apr 2020 10:09:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03KA8mQs008173 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Apr 2020 06:08:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CF2202166B28; Mon, 20 Apr 2020 10:08:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C72DF2166B2E
	for <dm-devel@redhat.com>; Mon, 20 Apr 2020 10:08:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 993A98EE313
	for <dm-devel@redhat.com>; Mon, 20 Apr 2020 10:08:46 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-514-WwrAjA5zM9aX41_IqD4E1A-1;
	Mon, 20 Apr 2020 06:08:44 -0400
X-MC-Unique: WwrAjA5zM9aX41_IqD4E1A-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id BFD8EAC52;
	Mon, 20 Apr 2020 10:08:41 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Mon, 20 Apr 2020 12:08:11 +0200
Message-Id: <20200420100824.124618-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03KA8mQs008173
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, Bob Liu <bob.liu@oracle.com>,
	dm-devel@redhat.com
Subject: [dm-devel] [PATCHv4 00/13] dm-zoned: metadata version 2
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

this patchset adds a new metadata version 2 for dm-zoned, which brings the
following improvements:
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

Changes to v3:
- Reorder devices such that the regular device is always at position 0,
  and the zoned device is always at position 1.
- Split off dmz_dev_is_dying() into a separate patch
- Include reviews from Damien

Changes to v2:
- Kill dmz_id()
- Include reviews from Damien
- Sanitize uuid handling as suggested by John Dorminy


Hannes Reinecke (13):
  dm-zoned: add 'status' and 'message' callbacks
  dm-zoned: store zone id within the zone structure and kill dmz_id()
  dm-zoned: use array for superblock zones
  dm-zoned: store device in struct dmz_sb
  dm-zoned: move fields from struct dmz_dev to dmz_metadata
  dm-zoned: introduce dmz_metadata_label() to format device name
  dm-zoned: Introduce dmz_dev_is_dying() and dmz_check_dev()
  dm-zoned: remove 'dev' argument from reclaim
  dm-zoned: replace 'target' pointer in the bio context
  dm-zoned: use dmz_zone_to_dev() when handling metadata I/O
  dm-zoned: add metadata logging functions
  dm-zoned: ignore metadata zone in dmz_alloc_zone()
  dm-zoned: metadata version 2

 drivers/md/dm-zoned-metadata.c | 658 +++++++++++++++++++++++++++++++----------
 drivers/md/dm-zoned-reclaim.c  |  88 +++---
 drivers/md/dm-zoned-target.c   | 331 +++++++++++++--------
 drivers/md/dm-zoned.h          |  33 ++-
 4 files changed, 780 insertions(+), 330 deletions(-)

-- 
2.16.4


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

