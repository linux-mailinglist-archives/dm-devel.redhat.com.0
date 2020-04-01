Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9ECDD19B42A
	for <lists+dm-devel@lfdr.de>; Wed,  1 Apr 2020 18:58:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585760306;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QmVLHKeQU7zn6xgyvy4Ro9fc81d++r1Bo8EzT8Oejhw=;
	b=Uv5+JlWp6/Nte6vRXk4Hoo/OituV6sC4OvH5G/FMbr0XtZYEjOTSIVUjuhSaWplB+RWA6e
	MCP1EN0mhu9Jd9/Ky5vUZP/KWU9GYkYJkrhhRXW8ZhHpeaWd4rePQLhVMgqsZROpqLfswN
	z/WCt9Fm3AUM7+q/CoPMG84BxA3Ifc4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-HJRLqKmuMde74BztPjvjGw-1; Wed, 01 Apr 2020 12:58:24 -0400
X-MC-Unique: HJRLqKmuMde74BztPjvjGw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2840719057A5;
	Wed,  1 Apr 2020 16:58:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5652796B93;
	Wed,  1 Apr 2020 16:58:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D4D7C86C1E;
	Wed,  1 Apr 2020 16:58:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 031GvwSt019546 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Apr 2020 12:57:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 89C2C5DA76; Wed,  1 Apr 2020 16:57:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 96A035D9CA;
	Wed,  1 Apr 2020 16:57:55 +0000 (UTC)
Date: Wed, 1 Apr 2020 12:57:54 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20200401165628.GA22107@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Nikos Tsironis <ntsironis@arrikto.com>, Erich Eckner <git@eckner.net>,
	Bob Liu <bob.liu@oracle.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Harshini X Shetty <Harshini.X.Shetty@sony.com>,
	Alasdair G Kergon <agk@redhat.com>
Subject: [dm-devel] [git pull] device mapper changes for 5.7
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
Content-Disposition: inline

Hi Linus,

The following changes since commit fb33c6510d5595144d585aa194d377cf74d31911:

  Linux 5.6-rc6 (2020-03-15 15:01:23 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.7/dm-changes

for you to fetch changes up to 81d5553d1288c2ec0390f02f84d71ca0f0f9f137:

  dm clone metadata: Fix return type of dm_clone_nr_of_hydrated_regions() (2020-03-27 14:42:51 -0400)

Please pull, thanks!
Mike

----------------------------------------------------------------
- Add DM writecache "cleaner" policy feature that allows cache to be
  flushed while userspace monitors for completion to then discommision
  use of caching.

- Optimize DM writecache superblock writing and also yield CPU while
  initializing writecache on large PMEM devices to avoid CPU stalls.

- Various fixes to DM integrity target while preparing for the
  ability to resize a DM integrity device.  In addition to resize
  support, add optional discard support with the "allow_discards"
  feature.

- Fix DM clone target's discard handling and overflow bugs which could
  cause data corruption.

- Fix memory leak in destructor for DM verity FEC support.

- Fix DM zoned target's redundant increment of nr_rnd_zones.

- Small cleanup in DM crypt to use crypt_integrity_aead() helper.

----------------------------------------------------------------
Bob Liu (1):
      dm zoned: remove duplicate nr_rnd_zones increase in dmz_init_zone()

Erich Eckner (1):
      dm integrity: print device name in integrity_metadata() error message

Mikulas Patocka (12):
      dm writecache: do direct write if the cache is full
      dm writecache: implement the "cleaner" policy
      dm writecache: implement gradual cleanup
      dm writecache: optimize superblock write
      dm integrity: fix a crash with unusually large tag size
      dm integrity: remove sector type casts
      dm integrity: don't replay journal data past the end of the device
      dm integrity: factor out get_provided_data_sectors()
      dm integrity: allow resize of the integrity device
      dm integrity: add optional discard support
      dm integrity: improve discard in journal mode
      dm writecache: add cond_resched to avoid CPU hangs

Nikos Tsironis (4):
      dm clone: Fix handling of partial region discards
      dm clone: Add overflow check for number of regions
      dm clone: Add missing casts to prevent overflows and data corruption
      dm clone metadata: Fix return type of dm_clone_nr_of_hydrated_regions()

Shetty, Harshini X (EXT-Sony Mobile) (1):
      dm verity fec: fix memory leak in verity_fec_dtr

Yang Yingliang (1):
      dm crypt: use crypt_integrity_aead() helper

 drivers/md/dm-clone-metadata.c |  15 +-
 drivers/md/dm-clone-metadata.h |   2 +-
 drivers/md/dm-clone-target.c   |  66 ++++++---
 drivers/md/dm-crypt.c          |   6 +-
 drivers/md/dm-integrity.c      | 304 +++++++++++++++++++++++++++++++----------
 drivers/md/dm-verity-fec.c     |   1 +
 drivers/md/dm-writecache.c     | 138 +++++++++++++++++--
 drivers/md/dm-zoned-metadata.c |   1 -
 8 files changed, 431 insertions(+), 102 deletions(-)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

