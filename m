Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 635902F8992
	for <lists+dm-devel@lfdr.de>; Sat, 16 Jan 2021 00:44:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610754267;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ESkjsP//OqAc6AUHoMcJodnY4g8CelZIkZYUkqZnISA=;
	b=PVusJR7EFW+/gdgrcyV64WR40df7eqFJAM/6f4/4cXIQ9e9ZMV2ekTyZHco5YAw8Wk1+hv
	OVoEQ87zQR+U4ugtXXv2MgU9R8ZuyVCkvxy0gQP6QXHXzI71gGnkVRwW5Sjsg+uuWPwSw8
	3e0utxBoRWXANsF1obIVkDtd8eo6nWI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-5CdzyY9kN4iEZxGb66DopA-1; Fri, 15 Jan 2021 18:44:24 -0500
X-MC-Unique: 5CdzyY9kN4iEZxGb66DopA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E788E1005314;
	Fri, 15 Jan 2021 23:44:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 413145D751;
	Fri, 15 Jan 2021 23:44:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3F9174BB7B;
	Fri, 15 Jan 2021 23:44:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10FNhp6X012734 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 15 Jan 2021 18:43:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B32F660C6F; Fri, 15 Jan 2021 23:43:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 794DF60BF3;
	Fri, 15 Jan 2021 23:43:48 +0000 (UTC)
Date: Fri, 15 Jan 2021 18:43:47 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20210115234347.GA1931@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Arnd Bergmann <arnd@arndb.de>, Anthony Iliopoulos <ailiop@suse.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>,
	Akilesh Kailash <akailash@google.com>, Alasdair G Kergon <agk@redhat.com>
Subject: [dm-devel] [git pull] device mapper fixes for 5.11-rc4
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Linus,

The following changes since commit e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62:

  Linux 5.11-rc2 (2021-01-03 15:55:30 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.11/dm-fixes-1

for you to fetch changes up to c87a95dc28b1431c7e77e2c0c983cf37698089d2:

  dm crypt: defer decryption to a tasklet if interrupts disabled
  (2021-01-14 09:54:37 -0500)

Please pull, thanks.
Mike

----------------------------------------------------------------
- Fix DM-raid's raid1 discard limits so discards work.

- Select missing Kconfig dependencies for DM integrity and zoned
  targets.

- 4 fixes for DM crypt target's support to optionally bypass
  kcryptd workqueues.

- Fix DM snapshot merge supports missing data flushes before
  committing metadata.

- Fix DM integrity data device flushing when external metadata is
  used.

- Fix DM integrity's maximum number of supported constructor arguments
  that user can request when creating an integrity device.

- Eliminate DM core ioctl logging noise when an ioctl is issued
  without required CAP_SYS_RAWIO permission.

----------------------------------------------------------------
Akilesh Kailash (1):
      dm snapshot: flush merged data before committing metadata

Anthony Iliopoulos (1):
      dm integrity: select CRYPTO_SKCIPHER

Arnd Bergmann (1):
      dm zoned: select CONFIG_CRC32

Ignat Korchagin (4):
      dm crypt: do not wait for backlogged crypto request completion in softirq
      dm crypt: use GFP_ATOMIC when allocating crypto requests from softirq
      dm crypt: do not call bio_endio() from the dm-crypt tasklet
      dm crypt: defer decryption to a tasklet if interrupts disabled

Mike Snitzer (2):
      dm raid: fix discard limits for raid1
      dm: eliminate potential source of excessive kernel log noise

Mikulas Patocka (2):
      dm integrity: fix flush with external metadata device
      dm integrity: fix the maximum number of arguments

 drivers/md/Kconfig        |   2 +
 drivers/md/dm-bufio.c     |   6 ++
 drivers/md/dm-crypt.c     | 170 +++++++++++++++++++++++++++++++++++++++++-----
 drivers/md/dm-integrity.c |  62 +++++++++++++----
 drivers/md/dm-raid.c      |   6 +-
 drivers/md/dm-snap.c      |  24 +++++++
 drivers/md/dm.c           |   2 +-
 include/linux/dm-bufio.h  |   1 +
 8 files changed, 239 insertions(+), 34 deletions(-)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

