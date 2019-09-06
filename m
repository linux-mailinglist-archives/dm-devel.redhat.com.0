Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA9FABAD1
	for <lists+dm-devel@lfdr.de>; Fri,  6 Sep 2019 16:28:17 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4267510C6973;
	Fri,  6 Sep 2019 14:28:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5053B5D712;
	Fri,  6 Sep 2019 14:28:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6F7094EE68;
	Fri,  6 Sep 2019 14:28:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x86ERfkL017956 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 6 Sep 2019 10:27:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 392F0600C8; Fri,  6 Sep 2019 14:27:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 339A7600C4
	for <dm-devel@redhat.com>; Fri,  6 Sep 2019 14:27:38 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 69D86308FEC1
	for <dm-devel@redhat.com>; Fri,  6 Sep 2019 14:27:37 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id k2so6727127wmj.4
	for <dm-devel@redhat.com>; Fri, 06 Sep 2019 07:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arrikto-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=uNhD6UWqX5s3wcrJiKKCW2IoG4hJLxgTKOdwMwRN7Bc=;
	b=r5h+tQ/VFTG8OtjU1TmkO9I0AyVNQ55PTd0nSPm/XBt3URJny735Dpq+MOaVFQlFJO
	kLOqCTzLjhZpbj2M2exKumcGvFnT4YVl02Djr8SzLXWWB7qPaweHbzPMxZcSnixxUdZM
	7ZnWotYqBlyAPm3W4ws1daxtJ7IAe3F1O4jRz8/xkBN4cPP+h+nwKv6mjgoLVtA1BTjk
	CroUnmVZ+YnGdOmz3O753JA3H+rP/jMfZ7EahquH6R78xdueYUr0C4fa6PJ/CXUKZtZP
	ZCOfFJbDzuTxXOW3p5eAi/694qAGKielY0dTepsw2x1OslNsd1cxZSQ+Valmqi7opi46
	Hhyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uNhD6UWqX5s3wcrJiKKCW2IoG4hJLxgTKOdwMwRN7Bc=;
	b=ojD2hkrTk92cdYFcX8Nkj0GZNSm3zB7Df0l/sD9x8q+MPlNSD0+KHep6xA6XBAaXRP
	lD0ctxXqjUw8NpOYkEiwZ77FeBimxVNpSl/AaCGTauxhoTx6Gges7DOVvQzZ1BMBriyj
	tKxjDqiVtq/osifyuyKBHYEU4kvAAYrMRpqXgmK18MvwyZL+D9uJxZ8PUH6+ojnXbYcv
	hTrRXrZQvh06m1Ld77eXP+H1J7YnE1iCk4r7kr8hHSugqMmWPbXt70FZijYwscGFNOjY
	zmKmDrXjsSJKlQ3EccagTv1ecFVQ8EI9mB/Q+ID3Wy7Bp+9WJ/zdZg0Kr3rVLEIaBJGM
	TzsQ==
X-Gm-Message-State: APjAAAXO0sF645EEMi48xps9cWjsZyg0LB2xNdGzFvZMSfglppQog//W
	D8x7Zgqv+Z8pjeZFlWXblIMJXg==
X-Google-Smtp-Source: APXvYqwfYKfM3AFjp+OdeGwQzDNxgnXG0CQkcmhhMqgsQLe71oQvBHF52KDFWBHnk2eVEZqx9mlPRA==
X-Received: by 2002:a1c:4384:: with SMTP id q126mr8238818wma.153.1567780056131;
	Fri, 06 Sep 2019 07:27:36 -0700 (PDT)
Received: from snf-864.vm.snf.arr ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id k6sm10432883wrg.0.2019.09.06.07.27.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Sep 2019 07:27:35 -0700 (PDT)
From: Nikos Tsironis <ntsironis@arrikto.com>
To: snitzer@redhat.com, agk@redhat.com, dm-devel@redhat.com
Date: Fri,  6 Sep 2019 17:26:55 +0300
Message-Id: <20190906142656.5338-1-ntsironis@arrikto.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Fri, 06 Sep 2019 14:27:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Fri, 06 Sep 2019 14:27:37 +0000 (UTC) for IP:'209.85.128.42'
	DOMAIN:'mail-wm1-f42.google.com' HELO:'mail-wm1-f42.google.com'
	FROM:'ntsironis@arrikto.com' RCPT:''
X-RedHat-Spam-Score: 0  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.128.42 mail-wm1-f42.google.com 209.85.128.42
	mail-wm1-f42.google.com <ntsironis@arrikto.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: vkoukis@arrikto.com, ntsironis@arrikto.com, iliastsi@arrikto.com
Subject: [dm-devel] [RFC PATCH v2 0/1] dm: add clone target
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.65]); Fri, 06 Sep 2019 14:28:16 +0000 (UTC)

This patch adds the dm-clone target, which allows cloning of arbitrary
block devices.

dm-clone produces a one-to-one copy of an existing, read-only source
device into a writable destination device: It presents a virtual block
device which makes all data appear immediately, and redirects reads and
writes accordingly.

The main use case of dm-clone is to clone a potentially remote,
high-latency, read-only, archival-type block device into a writable,
fast, primary-type device for fast, low-latency I/O. The cloned device
is visible/mountable immediately and the copy of the source device to
the destination device happens in the background, in parallel with user
I/O.

For example, one could restore an application backup from a read-only
copy, accessible through a network storage protocol (NBD, Fibre Channel,
iSCSI, AoE, etc.), into a local SSD or NVMe device, and start using the
device immediately, without waiting for the restore to complete.

When the cloning completes, the dm-clone table can be removed altogether
and be replaced, e.g., by a linear table, mapping directly to the
destination device.

dm-clone is optimized for small, random writes, with size equal to
dm-clone's region size, e.g., 4K.

For more information regarding dm-clone's operation, please read the
attached documentation.

A preliminary test suite for dm-clone can be found at
https://github.com/arrikto/device-mapper-test-suite/tree/feature-dm-clone

Changes in v2:
  - Remove needless empty newlines.
  - Use the term "region" consistently and never call it a block.
  - Rename "origin" device to "source" device and "clone" device to
    "destination" device.
  - Express "hydration_threshold" in multiples of a region.
  - Rename "hydration_block_size" to "hydration_batch_size" and express
    it in multiples of a region.
  - Add missing "static" keyword to __load_bitset_in_core() and
    __metadata_commit().
  - clone_message(): Don't print misleading error message about
    "unsupported message" in case of correct messages with wrong number
    of arguments.
  - Rename module parameter "clone_copy_throttle" to
    "clone_hydration_throttle" to be consistent with its description.

I also updated the test suite to reflect these changes.

v1: https://www.redhat.com/archives/dm-devel/2019-July/msg00088.html

Nikos Tsironis (1):
  dm: add clone target

 Documentation/device-mapper/dm-clone.rst |  333 +++++
 drivers/md/Kconfig                       |   14 +
 drivers/md/Makefile                      |    2 +
 drivers/md/dm-clone-metadata.c           |  963 +++++++++++++
 drivers/md/dm-clone-metadata.h           |  158 +++
 drivers/md/dm-clone-target.c             | 2190 ++++++++++++++++++++++++++++++
 6 files changed, 3660 insertions(+)
 create mode 100644 Documentation/device-mapper/dm-clone.rst
 create mode 100644 drivers/md/dm-clone-metadata.c
 create mode 100644 drivers/md/dm-clone-metadata.h
 create mode 100644 drivers/md/dm-clone-target.c

-- 
2.11.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
