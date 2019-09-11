Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id BB414AFED4
	for <lists+dm-devel@lfdr.de>; Wed, 11 Sep 2019 16:37:44 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8714F558A1;
	Wed, 11 Sep 2019 14:37:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A5F54106;
	Wed, 11 Sep 2019 14:37:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7F92718089C8;
	Wed, 11 Sep 2019 14:37:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8BEb7ea006529 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 11 Sep 2019 10:37:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 274D16031D; Wed, 11 Sep 2019 14:37:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 20F736013A
	for <dm-devel@redhat.com>; Wed, 11 Sep 2019 14:36:58 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CB71030BCB81
	for <dm-devel@redhat.com>; Wed, 11 Sep 2019 14:36:56 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 7so3796485wme.1
	for <dm-devel@redhat.com>; Wed, 11 Sep 2019 07:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arrikto-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Y2ga03pX/k2wuNdfmgiOhyn4pJ02h1t1+dfrKMKzVcU=;
	b=SinjLiA6c+eiaUz7Qn9IlGl4pVt9uYOhwfhedJ8Q3rSe6W7sxu4pPi+GHo4Z/D9j2i
	gbomJoTADJHEc7J+z8+qsWEutPkWte7foVhXnmYgcBWivBOiwdjCzh17xUWeQMh4UT/U
	nDiJv2hujivgEPUazs0d2yvmLPUQWaRwmqn0jEMi4wV3mwhKrtWNI1RIEv/2lsXceF/Z
	dC4LVX7aY44yGXSSGwFzXw9AdBPIuKt9aF+sB206wgZwdgMn5zJ3VQRH2/YzUDZ6G13A
	Rqrgb+dIqqu/3ZdGYlAhlabUMjBhKs/MAdiYMR06xORMTU4ETNmCzD/EORpZBf1U/ym2
	HSeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Y2ga03pX/k2wuNdfmgiOhyn4pJ02h1t1+dfrKMKzVcU=;
	b=ta2u2fkKeegoUVpZtAUPy712uCnHGPkCITf7Q5sjHT30cHByXlNsejbkiE2v3jCLYI
	ddySvcGvnm5Y/KVsbCfkTKk0McwLCkrGsoWSRTbEW3hR/fD9kif2X4asmnsEekmqNzF5
	D49ft90ksej8thadaerDkbHlgB77zIWCvRtR6f8YaL/Q3plVl70m/OMS9RhimyVqN6Cc
	TZPhLtM2q53EhlHtVu0EfZuC1uqafLWgWod64ZQiCPjmeI8NhNkw3xWDfVVpochDzoNV
	No8QF6qVF8pSPhMA8JPqeQTMWpJKOYrt7uSvbzVfyeVzUzfV0awbwYaVKS4WrcgapW0z
	RbFQ==
X-Gm-Message-State: APjAAAXYywYFEk00topgOOj061EpCrBKzm+RdkHZI8FcHkO1XDeH2Bvk
	h8WcQGYCy4OvTjxMgn3lvJ4AMal3DD4=
X-Google-Smtp-Source: APXvYqzcBYxKAeB2jW6OBBtUDeyZiGZDiIYBFE4bZpVfba9QA+QhRRrHjxmdS7LqApcIOgXGXB+Ntg==
X-Received: by 2002:a1c:a54a:: with SMTP id o71mr4483712wme.51.1568212615386; 
	Wed, 11 Sep 2019 07:36:55 -0700 (PDT)
Received: from snf-864.vm.snf.arr ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id
	d14sm8626780wrj.27.2019.09.11.07.36.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Sep 2019 07:36:54 -0700 (PDT)
From: Nikos Tsironis <ntsironis@arrikto.com>
To: snitzer@redhat.com, agk@redhat.com, dm-devel@redhat.com
Date: Wed, 11 Sep 2019 17:36:39 +0300
Message-Id: <20190911143640.24991-1-ntsironis@arrikto.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Wed, 11 Sep 2019 14:36:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Wed, 11 Sep 2019 14:36:57 +0000 (UTC) for IP:'209.85.128.66'
	DOMAIN:'mail-wm1-f66.google.com' HELO:'mail-wm1-f66.google.com'
	FROM:'ntsironis@arrikto.com' RCPT:''
X-RedHat-Spam-Score: -0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.66 mail-wm1-f66.google.com 209.85.128.66
	mail-wm1-f66.google.com <ntsironis@arrikto.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: vkoukis@arrikto.com, ntsironis@arrikto.com, iliastsi@arrikto.com
Subject: [dm-devel] [RFC PATCH v3 0/1] dm: add clone target
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Wed, 11 Sep 2019 14:37:43 +0000 (UTC)

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

Changes in v3:
  - Move Documentation/device-mapper/dm-clone.rst to
    Documentation/admin-guide/device-mapper/dm-clone.rst

v2: https://www.redhat.com/archives/dm-devel/2019-September/msg00061.html
v1: https://www.redhat.com/archives/dm-devel/2019-July/msg00088.html

Nikos Tsironis (1):
  dm: add clone target

 .../admin-guide/device-mapper/dm-clone.rst         |  333 +++
 drivers/md/Kconfig                                 |   14 +
 drivers/md/Makefile                                |    2 +
 drivers/md/dm-clone-metadata.c                     |  963 +++++++++
 drivers/md/dm-clone-metadata.h                     |  158 ++
 drivers/md/dm-clone-target.c                       | 2190 ++++++++++++++++++++
 6 files changed, 3660 insertions(+)
 create mode 100644 Documentation/admin-guide/device-mapper/dm-clone.rst
 create mode 100644 drivers/md/dm-clone-metadata.c
 create mode 100644 drivers/md/dm-clone-metadata.h
 create mode 100644 drivers/md/dm-clone-target.c

-- 
2.11.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
