Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 59EBE300FEA
	for <lists+dm-devel@lfdr.de>; Fri, 22 Jan 2021 23:25:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611354326;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6bZcyCka9444o2B0IiF/oeYwmsFrouAn+FMmdm22fWI=;
	b=e0/W1ovl2q23u1rpcu9oewSmpUJfXT6ZtNrdVF8B83MlYZACA0tcNUKKbhndM351im3Jbd
	oNRwks0FJlmZ/qrh6SkpNkEkIZsTgijx5GVZVPgboNFNhrI3ts57oSMC1w1Up8t62WtnLT
	PEVOl6y3nBmePwDGtkGXL36n79SUM1k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-sw_uFnDnPf2sZGyxIhkCBw-1; Fri, 22 Jan 2021 17:25:23 -0500
X-MC-Unique: sw_uFnDnPf2sZGyxIhkCBw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71585107ACE3;
	Fri, 22 Jan 2021 22:25:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF50A60C4D;
	Fri, 22 Jan 2021 22:25:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6ABAE18095FF;
	Fri, 22 Jan 2021 22:25:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10MMOnhD014532 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 22 Jan 2021 17:24:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 529F81992D; Fri, 22 Jan 2021 22:24:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 486A719C71;
	Fri, 22 Jan 2021 22:24:46 +0000 (UTC)
Date: Fri, 22 Jan 2021 17:24:45 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20210122222445.GA14822@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>, Alasdair G Kergon <agk@redhat.com>
Subject: [dm-devel] [git pull] device mapper fixes for 5.11-rc5
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Linus,

The following changes since commit 19c329f6808995b142b3966301f217c831e7cf31:

  Linux 5.11-rc4 (2021-01-17 16:37:05 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.11/dm-fixes-2

for you to fetch changes up to 809b1e4945774c9ec5619a8f4e2189b7b3833c0c:

  dm: avoid filesystem lookup in dm_get_dev_t() (2021-01-21 15:06:45 -0500)

Please pull, thanks.
Mike

----------------------------------------------------------------
- Fix DM integrity crash if "recalculate" used without "internal_hash"

- Fix DM integrity "recalculate" support to prevent recalculating
  checksums if we use internal_hash or journal_hash with a key
  (e.g. HMAC). Use of crypto as a means to prevent malicious
  corruption requires further changes and was never a design goal for
  dm-integrity's primary usecase of detecting accidental corruption.

- Fix a benign dm-crypt copy-and-paste bug introduced as part of a
  fix that was merged for 5.11-rc4.

- Fix DM core's dm_get_device() to avoid filesystem lookup to get
  block device (if possible).

----------------------------------------------------------------
Hannes Reinecke (1):
      dm: avoid filesystem lookup in dm_get_dev_t()

Ignat Korchagin (1):
      dm crypt: fix copy and paste bug in crypt_alloc_req_aead

Mikulas Patocka (2):
      dm integrity: fix a crash if "recalculate" used without "internal_hash"
      dm integrity: conditionally disable "recalculate" feature

 .../admin-guide/device-mapper/dm-integrity.rst     | 12 ++++++--
 drivers/md/dm-crypt.c                              |  6 ++--
 drivers/md/dm-integrity.c                          | 32 ++++++++++++++++++++--
 drivers/md/dm-table.c                              | 15 ++++++++--
 4 files changed, 54 insertions(+), 11 deletions(-)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

