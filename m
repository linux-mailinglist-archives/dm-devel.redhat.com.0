Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BACEAFED5
	for <lists+dm-devel@lfdr.de>; Wed, 11 Sep 2019 16:37:45 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 91B393090FDE;
	Wed, 11 Sep 2019 14:37:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 69A0760BEC;
	Wed, 11 Sep 2019 14:37:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CB40124F31;
	Wed, 11 Sep 2019 14:37:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8BEbAdV006540 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 11 Sep 2019 10:37:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 98F9B5C3FA; Wed, 11 Sep 2019 14:37:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B55C5C553
	for <dm-devel@redhat.com>; Wed, 11 Sep 2019 14:37:05 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0D96464467
	for <dm-devel@redhat.com>; Wed, 11 Sep 2019 14:37:00 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id u16so24896278wrr.0
	for <dm-devel@redhat.com>; Wed, 11 Sep 2019 07:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arrikto-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Luwc/I8c6pvj5qiLrkSvFSNNpZbbxXWwlA6QdrSOxyc=;
	b=TmiTGi4IUJtiihccsAc40n+65/TL4IXs34jvyNMKD0w/pn8uzTAKi4trrPaLoA5rfs
	dyBhiFXFK1zY3+B8k4UCTAjUhuPtQEHWoIFRV7ShmDGbvur8Bf7tH+UAZZkGV+5618c6
	uDVNapFVprjLr8Cj8WqRe27Mi+XiLuTNDEmkwwbZ1JDADTpqUUUGGXPavfmPIE9V055+
	fN3i0WOExGVMCmG5lGtQeBui6F5HIMoExwDVc4quuyPtPToln5izW2pyUgcy5gI4zjNq
	KZe2CNMwvLw1ocVaojj8ZfFXMgqLsO+mlbEvpET1yG4+S5G2rAfiwFVSYD/syQtdcghG
	ixnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Luwc/I8c6pvj5qiLrkSvFSNNpZbbxXWwlA6QdrSOxyc=;
	b=aiYnSRkN6l6cmBDkyiFl1CxkRl7rIAFaWKYf1iY/r/lTQK08KTgX6X+wDUlXAOffmy
	AJID72Hjgw0U7jQfgkQ2VOWS1fbD412goXoWlkcHfii9BqEVKRMgAD6t7p6QYTe8t5Fl
	4N7EXSszfL/+/ZAhAjw3O6ndqW+mU75Er0YaE5AuiyffW2EN83eW2UJi/cbFx/J8oCT+
	0upzKEMa+bqHf4Xb5KK/SqrjozBFmNtfkiMQcHqEvYjB9QDtX5gA98W98w4+dbRxc2kr
	SXVhQ0t0PABM9b7wnInn7WcHzzP4yJnAsKL+xTqItXZPscI8bOWRygM7jso5VZD0I5eA
	o/Iw==
X-Gm-Message-State: APjAAAX18xKfiPdBoxW1o0L27XoR7TcmUcJYu8TsEztaWexIPQm2znPU
	GXmhxbMxWUnVmyzw4xC6PG3wDg==
X-Google-Smtp-Source: APXvYqxSGWKqD4UK7PGYTCe6Fhz6eKBrKgeTVEPd8KOFDbGB5ebUZ7cJgJdKQaPHtnRJACPU0qgshA==
X-Received: by 2002:adf:e947:: with SMTP id m7mr4276408wrn.178.1568212617020; 
	Wed, 11 Sep 2019 07:36:57 -0700 (PDT)
Received: from snf-864.vm.snf.arr ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id
	d14sm8626780wrj.27.2019.09.11.07.36.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Sep 2019 07:36:56 -0700 (PDT)
From: Nikos Tsironis <ntsironis@arrikto.com>
To: snitzer@redhat.com, agk@redhat.com, dm-devel@redhat.com
Date: Wed, 11 Sep 2019 17:36:40 +0300
Message-Id: <20190911143640.24991-2-ntsironis@arrikto.com>
In-Reply-To: <20190911143640.24991-1-ntsironis@arrikto.com>
References: <20190911143640.24991-1-ntsironis@arrikto.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 11 Sep 2019 14:37:00 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Wed, 11 Sep 2019 14:37:00 +0000 (UTC) for IP:'209.85.221.65'
	DOMAIN:'mail-wr1-f65.google.com' HELO:'mail-wr1-f65.google.com'
	FROM:'ntsironis@arrikto.com' RCPT:''
X-RedHat-Spam-Score: -0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.65 mail-wr1-f65.google.com 209.85.221.65
	mail-wr1-f65.google.com <ntsironis@arrikto.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: vkoukis@arrikto.com, ntsironis@arrikto.com, iliastsi@arrikto.com
Subject: [dm-devel] [RFC PATCH v3 1/1] dm: add clone target
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Wed, 11 Sep 2019 14:37:43 +0000 (UTC)

Add the dm-clone target, which allows cloning of arbitrary block
devices.

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

When the cloning completes, the dm-clone table can be removed altogether
and be replaced, e.g., by a linear table, mapping directly to the
destination device.

For further information and examples of how to use dm-clone, please read
Documentation/admin-guide/device-mapper/dm-clone.rst

Suggested-by: Vangelis Koukis <vkoukis@arrikto.com>
Co-developed-by: Ilias Tsitsimpis <iliastsi@arrikto.com>
Signed-off-by: Ilias Tsitsimpis <iliastsi@arrikto.com>
Signed-off-by: Nikos Tsironis <ntsironis@arrikto.com>
---
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

diff --git a/Documentation/admin-guide/device-mapper/dm-clone.rst b/Documentation/admin-guide/device-mapper/dm-clone.rst
new file mode 100644
index 000000000000..b43a34c1430a
--- /dev/null
+++ b/Documentation/admin-guide/device-mapper/dm-clone.rst
@@ -0,0 +1,333 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+========
+dm-clone
+========
+
+Introduction
+============
+
+dm-clone is a device mapper target which produces a one-to-one copy of an
+existing, read-only source device into a writable destination device: It
+presents a virtual block device which makes all data appear immediately, and
+redirects reads and writes accordingly.
+
+The main use case of dm-clone is to clone a potentially remote, high-latency,
+read-only, archival-type block device into a writable, fast, primary-type device
+for fast, low-latency I/O. The cloned device is visible/mountable immediately
+and the copy of the source device to the destination device happens in the
+background, in parallel with user I/O.
+
+For example, one could restore an application backup from a read-only copy,
+accessible through a network storage protocol (NBD, Fibre Channel, iSCSI, AoE,
+etc.), into a local SSD or NVMe device, and start using the device immediately,
+without waiting for the restore to complete.
+
+When the cloning completes, the dm-clone table can be removed altogether and be
+replaced, e.g., by a linear table, mapping directly to the destination device.
+
+The dm-clone target reuses the metadata library used by the thin-provisioning
+target.
+
+Glossary
+========
+
+   Hydration
+     The process of filling a region of the destination device with data from
+     the same region of the source device, i.e., copying the region from the
+     source to the destination device.
+
+Once a region gets hydrated we redirect all I/O regarding it to the destination
+device.
+
+Design
+======
+
+Sub-devices
+-----------
+
+The target is constructed by passing three devices to it (along with other
+parameters detailed later):
+
+1. A source device - the read-only device that gets cloned and source of the
+   hydration.
+
+2. A destination device - the destination of the hydration, which will become a
+   clone of the source device.
+
+3. A small metadata device - it records which regions are already valid in the
+   destination device, i.e., which regions have already been hydrated, or have
+   been written to directly, via user I/O.
+
+The size of the destination device must be at least equal to the size of the
+source device.
+
+Regions
+-------
+
+dm-clone divides the source and destination devices in fixed sized regions.
+Regions are the unit of hydration, i.e., the minimum amount of data copied from
+the source to the destination device.
+
+The region size is configurable when you first create the dm-clone device. The
+recommended region size is the same as the file system block size, which usually
+is 4KB. The region size must be between 8 sectors (4KB) and 2097152 sectors
+(1GB) and a power of two.
+
+Reads and writes from/to hydrated regions are serviced from the destination
+device.
+
+A read to a not yet hydrated region is serviced directly from the source device.
+
+A write to a not yet hydrated region will be delayed until the corresponding
+region has been hydrated and the hydration of the region starts immediately.
+
+Note that a write request with size equal to region size will skip copying of
+the corresponding region from the source device and overwrite the region of the
+destination device directly.
+
+Discards
+--------
+
+dm-clone interprets a discard request to a range that hasn't been hydrated yet
+as a hint to skip hydration of the regions covered by the request, i.e., it
+skips copying the region's data from the source to the destination device, and
+only updates its metadata.
+
+If the destination device supports discards, then by default dm-clone will pass
+down discard requests to it.
+
+Background Hydration
+--------------------
+
+dm-clone copies continuously from the source to the destination device, until
+all of the device has been copied.
+
+Copying data from the source to the destination device uses bandwidth. The user
+can set a throttle to prevent more than a certain amount of copying occurring at
+any one time. Moreover, dm-clone takes into account user I/O traffic going to
+the devices and pauses the background hydration when there is I/O in-flight.
+
+A message `hydration_threshold <#regions>` can be used to set the maximum number
+of regions being copied, the default being 1 region.
+
+dm-clone employs dm-kcopyd for copying portions of the source device to the
+destination device. By default, we issue copy requests of size equal to the
+region size. A message `hydration_batch_size <#regions>` can be used to tune the
+size of these copy requests. Increasing the hydration batch size results in
+dm-clone trying to batch together contiguous regions, so we copy the data in
+batches of this many regions.
+
+When the hydration of the destination device finishes, a dm event will be sent
+to user space.
+
+Updating on-disk metadata
+-------------------------
+
+On-disk metadata is committed every time a FLUSH or FUA bio is written. If no
+such requests are made then commits will occur every second. This means the
+dm-clone device behaves like a physical disk that has a volatile write cache. If
+power is lost you may lose some recent writes. The metadata should always be
+consistent in spite of any crash.
+
+Target Interface
+================
+
+Constructor
+-----------
+
+  ::
+
+   clone <metadata dev> <destination dev> <source dev> <region size>
+         [<#feature args> [<feature arg>]* [<#core args> [<core arg>]*]]
+
+ ================ ==============================================================
+ metadata dev     Fast device holding the persistent metadata
+ destination dev  The destination device, where the source will be cloned
+ source dev       Read only device containing the data that gets cloned
+ region size      The size of a region in sectors
+
+ #feature args    Number of feature arguments passed
+ feature args     no_hydration or no_discard_passdown
+
+ #core args       An even number of arguments corresponding to key/value pairs
+                  passed to dm-clone
+ core args        Key/value pairs passed to dm-clone, e.g. `hydration_threshold
+                  256`
+ ================ ==============================================================
+
+Optional feature arguments are:
+
+ ==================== =========================================================
+ no_hydration         Create a dm-clone instance with background hydration
+                      disabled
+ no_discard_passdown  Disable passing down discards to the destination device
+ ==================== =========================================================
+
+Optional core arguments are:
+
+ ================================ ==============================================
+ hydration_threshold <#regions>   Maximum number of regions being copied from
+                                  the source to the destination device at any
+                                  one time, during background hydration.
+ hydration_batch_size <#regions>  During background hydration, try to batch
+                                  together contiguous regions, so we copy data
+                                  from the source to the destination device in
+                                  batches of this many regions.
+ ================================ ==============================================
+
+Status
+------
+
+  ::
+
+   <metadata block size> <#used metadata blocks>/<#total metadata blocks>
+   <region size> <#hydrated regions>/<#total regions> <#hydrating regions>
+   <#feature args> <feature args>* <#core args> <core args>*
+   <clone metadata mode>
+
+ ======================= =======================================================
+ metadata block size     Fixed block size for each metadata block in sectors
+ #used metadata blocks   Number of metadata blocks used
+ #total metadata blocks  Total number of metadata blocks
+ region size             Configurable region size for the device in sectors
+ #hydrated regions       Number of regions that have finished hydrating
+ #total regions          Total number of regions to hydrate
+ #hydrating regions      Number of regions currently hydrating
+ #feature args           Number of feature arguments to follow
+ feature args            Feature arguments, e.g. `no_hydration`
+ #core args              Even number of core arguments to follow
+ core args               Key/value pairs for tuning the core, e.g.
+                         `hydration_threshold 256`
+ clone metadata mode     ro if read-only, rw if read-write
+
+                         In serious cases where even a read-only mode is deemed
+                         unsafe no further I/O will be permitted and the status
+                         will just contain the string 'Fail'. If the metadata
+                         mode changes, a dm event will be sent to user space.
+ ======================= =======================================================
+
+Messages
+--------
+
+  `disable_hydration`
+      Disable the background hydration of the destination device.
+
+  `enable_hydration`
+      Enable the background hydration of the destination device.
+
+  `hydration_threshold <#regions>`
+      Set background hydration threshold.
+
+  `hydration_batch_size <#regions>`
+      Set background hydration batch size.
+
+Examples
+========
+
+Clone a device containing a file system
+---------------------------------------
+
+1. Create the dm-clone device.
+
+   ::
+
+    dmsetup create clone --table "0 1048576000 clone $metadata_dev $dest_dev \
+      $source_dev 8 1 no_hydration"
+
+2. Mount the device and trim the file system. dm-clone interprets the discards
+   sent by the file system and it will not hydrate the unused space.
+
+   ::
+
+    mount /dev/mapper/clone /mnt/cloned-fs
+    fstrim /mnt/cloned-fs
+
+3. Enable background hydration of the destination device.
+
+   ::
+
+    dmsetup message clone 0 enable_hydration
+
+4. When the hydration finishes, we can replace the dm-clone table with a linear
+   table.
+
+   ::
+
+    dmsetup suspend clone
+    dmsetup load clone --table "0 1048576000 linear $dest_dev 0"
+    dmsetup resume clone
+
+   The metadata device is no longer needed and can be safely discarded or reused
+   for other purposes.
+
+Known issues
+============
+
+1. We redirect reads, to not-yet-hydrated regions, to the source device. If
+   reading the source device has high latency and the user repeatedly reads from
+   the same regions, this behaviour could degrade performance. We should use
+   these reads as hints to hydrate the relevant regions sooner. Currently, we
+   rely on the page cache to cache these regions, so we hopefully don't end up
+   reading them multiple times from the source device.
+
+2. Release in-core resources, i.e., the bitmaps tracking which regions are
+   hydrated, after the hydration has finished.
+
+3. During background hydration, if we fail to read the source or write to the
+   destination device, we print an error message, but the hydration process
+   continues indefinitely, until it succeeds. We should stop the background
+   hydration after a number of failures and emit a dm event for user space to
+   notice.
+
+Why not...?
+===========
+
+We explored the following alternatives before implementing dm-clone:
+
+1. Use dm-cache with cache size equal to the source device and implement a new
+   cloning policy:
+
+   * The resulting cache device is not a one-to-one mirror of the source device
+     and thus we cannot remove the cache device once cloning completes.
+
+   * dm-cache writes to the source device, which violates our requirement that
+     the source device must be treated as read-only.
+
+   * Caching is semantically different from cloning.
+
+2. Use dm-snapshot with a COW device equal to the source device:
+
+   * dm-snapshot stores its metadata in the COW device, so the resulting device
+     is not a one-to-one mirror of the source device.
+
+   * No background copying mechanism.
+
+   * dm-snapshot needs to commit its metadata whenever a pending exception
+     completes, to ensure snapshot consistency. In the case of cloning, we don't
+     need to be so strict and can rely on committing metadata every time a FLUSH
+     or FUA bio is written, or periodically, like dm-thin and dm-cache do. This
+     improves the performance significantly.
+
+3. Use dm-mirror: The mirror target has a background copying/mirroring
+   mechanism, but it writes to all mirrors, thus violating our requirement that
+   the source device must be treated as read-only.
+
+4. Use dm-thin's external snapshot functionality. This approach is the most
+   promising among all alternatives, as the thinly-provisioned volume is a
+   one-to-one mirror of the source device and handles reads and writes to
+   un-provisioned/not-yet-cloned areas the same way as dm-clone does.
+
+   Still:
+
+   * There is no background copying mechanism, though one could be implemented.
+
+   * Most importantly, we want to support arbitrary block devices as the
+     destination of the cloning process and not restrict ourselves to
+     thinly-provisioned volumes. Thin-provisioning has an inherent metadata
+     overhead, for maintaining the thin volume mappings, which significantly
+     degrades performance.
+
+   Moreover, cloning a device shouldn't force the use of thin-provisioning. On
+   the other hand, if we wish to use thin provisioning, we can just use a thin
+   LV as dm-clone's destination device.
diff --git a/drivers/md/Kconfig b/drivers/md/Kconfig
index 9b82d74fe2e5..aa98953f4462 100644
--- a/drivers/md/Kconfig
+++ b/drivers/md/Kconfig
@@ -347,6 +347,20 @@ config DM_ERA
          over time.  Useful for maintaining cache coherency when using
          vendor snapshots.
 
+config DM_CLONE
+       tristate "Clone target (EXPERIMENTAL)"
+       depends on BLK_DEV_DM
+       default n
+       select DM_PERSISTENT_DATA
+       ---help---
+         dm-clone produces a one-to-one copy of an existing, read-only source
+         device into a writable destination device. The cloned device is
+         visible/mountable immediately and the copy of the source device to the
+         destination device happens in the background, in parallel with user
+         I/O.
+
+         If unsure, say N.
+
 config DM_MIRROR
        tristate "Mirror target"
        depends on BLK_DEV_DM
diff --git a/drivers/md/Makefile b/drivers/md/Makefile
index 0d922335335c..d91a7edcd2ab 100644
--- a/drivers/md/Makefile
+++ b/drivers/md/Makefile
@@ -18,6 +18,7 @@ dm-cache-y	+= dm-cache-target.o dm-cache-metadata.o dm-cache-policy.o \
 		    dm-cache-background-tracker.o
 dm-cache-smq-y   += dm-cache-policy-smq.o
 dm-era-y	+= dm-era-target.o
+dm-clone-y	+= dm-clone-target.o dm-clone-metadata.o
 dm-verity-y	+= dm-verity-target.o
 md-mod-y	+= md.o md-bitmap.o
 raid456-y	+= raid5.o raid5-cache.o raid5-ppl.o
@@ -65,6 +66,7 @@ obj-$(CONFIG_DM_VERITY)		+= dm-verity.o
 obj-$(CONFIG_DM_CACHE)		+= dm-cache.o
 obj-$(CONFIG_DM_CACHE_SMQ)	+= dm-cache-smq.o
 obj-$(CONFIG_DM_ERA)		+= dm-era.o
+obj-$(CONFIG_DM_CLONE)		+= dm-clone.o
 obj-$(CONFIG_DM_LOG_WRITES)	+= dm-log-writes.o
 obj-$(CONFIG_DM_INTEGRITY)	+= dm-integrity.o
 obj-$(CONFIG_DM_ZONED)		+= dm-zoned.o
diff --git a/drivers/md/dm-clone-metadata.c b/drivers/md/dm-clone-metadata.c
new file mode 100644
index 000000000000..fd76bafa9ff6
--- /dev/null
+++ b/drivers/md/dm-clone-metadata.c
@@ -0,0 +1,963 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2019 Arrikto, Inc. All Rights Reserved.
+ */
+
+#include <linux/err.h>
+#include <linux/slab.h>
+#include <linux/rwsem.h>
+#include <linux/bitops.h>
+#include <linux/bitmap.h>
+#include <linux/device-mapper.h>
+
+#include "persistent-data/dm-bitset.h"
+#include "persistent-data/dm-space-map.h"
+#include "persistent-data/dm-block-manager.h"
+#include "persistent-data/dm-transaction-manager.h"
+
+#include "dm-clone-metadata.h"
+
+#define DM_MSG_PREFIX "clone metadata"
+
+#define SUPERBLOCK_LOCATION 0
+#define SUPERBLOCK_MAGIC 0x8af27f64
+#define SUPERBLOCK_CSUM_XOR 257649492
+
+#define DM_CLONE_MAX_CONCURRENT_LOCKS 5
+
+#define UUID_LEN 16
+
+/* Min and max dm-clone metadata versions supported */
+#define DM_CLONE_MIN_METADATA_VERSION 1
+#define DM_CLONE_MAX_METADATA_VERSION 1
+
+/*
+ * On-disk metadata layout
+ */
+struct superblock_disk {
+	__le32 csum;
+	__le32 flags;
+	__le64 blocknr;
+
+	__u8 uuid[UUID_LEN];
+	__le64 magic;
+	__le32 version;
+
+	__u8 metadata_space_map_root[SPACE_MAP_ROOT_SIZE];
+
+	__le64 region_size;
+	__le64 target_size;
+
+	__le64 bitset_root;
+} __packed;
+
+/*
+ * Region and Dirty bitmaps.
+ *
+ * dm-clone logically splits the source and destination devices in regions of
+ * fixed size. The destination device's regions are gradually hydrated, i.e.,
+ * we copy (clone) the source's regions to the destination device. Eventually,
+ * all regions will get hydrated and all I/O will be served from the
+ * destination device.
+ *
+ * We maintain an on-disk bitmap which tracks the state of each of the
+ * destination device's regions, i.e., whether they are hydrated or not.
+ *
+ * To save constantly doing look ups on disk we keep an in core copy of the
+ * on-disk bitmap, the region_map.
+ *
+ * To further reduce metadata I/O overhead we use a second bitmap, the dmap
+ * (dirty bitmap), which tracks the dirty words, i.e. longs, of the region_map.
+ *
+ * When a region finishes hydrating dm-clone calls
+ * dm_clone_set_region_hydrated(), or for discard requests
+ * dm_clone_cond_set_range(), which sets the corresponding bits in region_map
+ * and dmap.
+ *
+ * During a metadata commit we scan the dmap for dirty region_map words (longs)
+ * and update accordingly the on-disk metadata. Thus, we don't have to flush to
+ * disk the whole region_map. We can just flush the dirty region_map words.
+ *
+ * We use a dirty bitmap, which is smaller than the original region_map, to
+ * reduce the amount of memory accesses during a metadata commit. As dm-bitset
+ * accesses the on-disk bitmap in 64-bit word granularity, there is no
+ * significant benefit in tracking the dirty region_map bits with a smaller
+ * granularity.
+ *
+ * We could update directly the on-disk bitmap, when dm-clone calls either
+ * dm_clone_set_region_hydrated() or dm_clone_cond_set_range(), buts this
+ * inserts significant metadata I/O overhead in dm-clone's I/O path. Also, as
+ * these two functions don't block, we can call them in interrupt context,
+ * e.g., in a hooked overwrite bio's completion routine, and further reduce the
+ * I/O completion latency.
+ *
+ * We maintain two dirty bitmaps. During a metadata commit we atomically swap
+ * the currently used dmap with the unused one. This allows the metadata update
+ * functions to run concurrently with an ongoing commit.
+ */
+struct dirty_map {
+	unsigned long *dirty_words;
+	unsigned int changed;
+};
+
+struct dm_clone_metadata {
+	/* The metadata block device */
+	struct block_device *bdev;
+
+	sector_t target_size;
+	sector_t region_size;
+	unsigned long nr_regions;
+	unsigned long nr_words;
+
+	/* Spinlock protecting the region and dirty bitmaps. */
+	spinlock_t bitmap_lock;
+	struct dirty_map dmap[2];
+	struct dirty_map *current_dmap;
+
+	/*
+	 * In core copy of the on-disk bitmap to save constantly doing look ups
+	 * on disk.
+	 */
+	unsigned long *region_map;
+
+	/* Protected by bitmap_lock */
+	unsigned int read_only;
+
+	struct dm_block_manager *bm;
+	struct dm_space_map *sm;
+	struct dm_transaction_manager *tm;
+
+	struct rw_semaphore lock;
+
+	struct dm_disk_bitset bitset_info;
+	dm_block_t bitset_root;
+
+	/*
+	 * Reading the space map root can fail, so we read it into this
+	 * buffer before the superblock is locked and updated.
+	 */
+	__u8 metadata_space_map_root[SPACE_MAP_ROOT_SIZE];
+
+	bool hydration_done:1;
+	bool fail_io:1;
+};
+
+/*---------------------------------------------------------------------------*/
+
+/*
+ * Superblock validation.
+ */
+static void sb_prepare_for_write(struct dm_block_validator *v,
+				 struct dm_block *b, size_t sb_block_size)
+{
+	struct superblock_disk *sb;
+	u32 csum;
+
+	sb = dm_block_data(b);
+	sb->blocknr = cpu_to_le64(dm_block_location(b));
+
+	csum = dm_bm_checksum(&sb->flags, sb_block_size - sizeof(__le32),
+			      SUPERBLOCK_CSUM_XOR);
+	sb->csum = cpu_to_le32(csum);
+}
+
+static int sb_check(struct dm_block_validator *v, struct dm_block *b,
+		    size_t sb_block_size)
+{
+	struct superblock_disk *sb;
+	u32 csum, metadata_version;
+
+	sb = dm_block_data(b);
+
+	if (dm_block_location(b) != le64_to_cpu(sb->blocknr)) {
+		DMERR("Superblock check failed: blocknr %llu, expected %llu",
+		      le64_to_cpu(sb->blocknr),
+		      (unsigned long long)dm_block_location(b));
+		return -ENOTBLK;
+	}
+
+	if (le64_to_cpu(sb->magic) != SUPERBLOCK_MAGIC) {
+		DMERR("Superblock check failed: magic %llu, expected %llu",
+		      le64_to_cpu(sb->magic),
+		      (unsigned long long)SUPERBLOCK_MAGIC);
+		return -EILSEQ;
+	}
+
+	csum = dm_bm_checksum(&sb->flags, sb_block_size - sizeof(__le32),
+			      SUPERBLOCK_CSUM_XOR);
+	if (sb->csum != cpu_to_le32(csum)) {
+		DMERR("Superblock check failed: checksum %u, expected %u",
+		      csum, le32_to_cpu(sb->csum));
+		return -EILSEQ;
+	}
+
+	/* Check metadata version */
+	metadata_version = le32_to_cpu(sb->version);
+	if (metadata_version < DM_CLONE_MIN_METADATA_VERSION ||
+	    metadata_version > DM_CLONE_MAX_METADATA_VERSION) {
+		DMERR("Clone metadata version %u found, but only versions between %u and %u supported.",
+		      metadata_version, DM_CLONE_MIN_METADATA_VERSION,
+		      DM_CLONE_MAX_METADATA_VERSION);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static struct dm_block_validator sb_validator = {
+	.name = "superblock",
+	.prepare_for_write = sb_prepare_for_write,
+	.check = sb_check
+};
+
+/*
+ * Check if the superblock is formatted or not. We consider the superblock to
+ * be formatted in case we find non-zero bytes in it.
+ */
+static int __superblock_all_zeroes(struct dm_block_manager *bm, bool *formatted)
+{
+	int r;
+	unsigned int i, nr_words;
+	struct dm_block *sblock;
+	__le64 *data_le, zero = cpu_to_le64(0);
+
+	/*
+	 * We don't use a validator here because the superblock could be all
+	 * zeroes.
+	 */
+	r = dm_bm_read_lock(bm, SUPERBLOCK_LOCATION, NULL, &sblock);
+	if (r) {
+		DMERR("Failed to read_lock superblock");
+		return r;
+	}
+
+	data_le = dm_block_data(sblock);
+	*formatted = false;
+
+	/* This assumes that the block size is a multiple of 8 bytes */
+	BUG_ON(dm_bm_block_size(bm) % sizeof(__le64));
+	nr_words = dm_bm_block_size(bm) / sizeof(__le64);
+	for (i = 0; i < nr_words; i++) {
+		if (data_le[i] != zero) {
+			*formatted = true;
+			break;
+		}
+	}
+
+	dm_bm_unlock(sblock);
+
+	return 0;
+}
+
+/*---------------------------------------------------------------------------*/
+
+/*
+ * Low-level metadata handling.
+ */
+static inline int superblock_read_lock(struct dm_clone_metadata *md,
+				       struct dm_block **sblock)
+{
+	return dm_bm_read_lock(md->bm, SUPERBLOCK_LOCATION, &sb_validator, sblock);
+}
+
+static inline int superblock_write_lock(struct dm_clone_metadata *md,
+					struct dm_block **sblock)
+{
+	return dm_bm_write_lock(md->bm, SUPERBLOCK_LOCATION, &sb_validator, sblock);
+}
+
+static inline int superblock_write_lock_zero(struct dm_clone_metadata *md,
+					     struct dm_block **sblock)
+{
+	return dm_bm_write_lock_zero(md->bm, SUPERBLOCK_LOCATION, &sb_validator, sblock);
+}
+
+static int __copy_sm_root(struct dm_clone_metadata *md)
+{
+	int r;
+	size_t root_size;
+
+	r = dm_sm_root_size(md->sm, &root_size);
+	if (r)
+		return r;
+
+	return dm_sm_copy_root(md->sm, &md->metadata_space_map_root, root_size);
+}
+
+/* Save dm-clone metadata in superblock */
+static void __prepare_superblock(struct dm_clone_metadata *md,
+				 struct superblock_disk *sb)
+{
+	sb->flags = cpu_to_le32(0UL);
+
+	/* FIXME: UUID is currently unused */
+	memset(sb->uuid, 0, sizeof(sb->uuid));
+
+	sb->magic = cpu_to_le64(SUPERBLOCK_MAGIC);
+	sb->version = cpu_to_le32(DM_CLONE_MAX_METADATA_VERSION);
+
+	/* Save the metadata space_map root */
+	memcpy(&sb->metadata_space_map_root, &md->metadata_space_map_root,
+	       sizeof(md->metadata_space_map_root));
+
+	sb->region_size = cpu_to_le64(md->region_size);
+	sb->target_size = cpu_to_le64(md->target_size);
+	sb->bitset_root = cpu_to_le64(md->bitset_root);
+}
+
+static int __open_metadata(struct dm_clone_metadata *md)
+{
+	int r;
+	struct dm_block *sblock;
+	struct superblock_disk *sb;
+
+	r = superblock_read_lock(md, &sblock);
+
+	if (r) {
+		DMERR("Failed to read_lock superblock");
+		return r;
+	}
+
+	sb = dm_block_data(sblock);
+
+	/* Verify that target_size and region_size haven't changed. */
+	if (md->region_size != le64_to_cpu(sb->region_size) ||
+	    md->target_size != le64_to_cpu(sb->target_size)) {
+		DMERR("Region and/or target size don't match the ones in metadata");
+		r = -EINVAL;
+		goto out_with_lock;
+	}
+
+	r = dm_tm_open_with_sm(md->bm, SUPERBLOCK_LOCATION,
+			       sb->metadata_space_map_root,
+			       sizeof(sb->metadata_space_map_root),
+			       &md->tm, &md->sm);
+
+	if (r) {
+		DMERR("dm_tm_open_with_sm failed");
+		goto out_with_lock;
+	}
+
+	dm_disk_bitset_init(md->tm, &md->bitset_info);
+	md->bitset_root = le64_to_cpu(sb->bitset_root);
+
+out_with_lock:
+	dm_bm_unlock(sblock);
+
+	return r;
+}
+
+static int __format_metadata(struct dm_clone_metadata *md)
+{
+	int r;
+	struct dm_block *sblock;
+	struct superblock_disk *sb;
+
+	r = dm_tm_create_with_sm(md->bm, SUPERBLOCK_LOCATION, &md->tm, &md->sm);
+	if (r) {
+		DMERR("Failed to create transaction manager");
+		return r;
+	}
+
+	dm_disk_bitset_init(md->tm, &md->bitset_info);
+
+	r = dm_bitset_empty(&md->bitset_info, &md->bitset_root);
+	if (r) {
+		DMERR("Failed to create empty on-disk bitset");
+		goto err_with_tm;
+	}
+
+	r = dm_bitset_resize(&md->bitset_info, md->bitset_root, 0,
+			     md->nr_regions, false, &md->bitset_root);
+	if (r) {
+		DMERR("Failed to resize on-disk bitset to %lu entries", md->nr_regions);
+		goto err_with_tm;
+	}
+
+	/* Flush to disk all blocks, except the superblock */
+	r = dm_tm_pre_commit(md->tm);
+	if (r) {
+		DMERR("dm_tm_pre_commit failed");
+		goto err_with_tm;
+	}
+
+	r = __copy_sm_root(md);
+	if (r) {
+		DMERR("__copy_sm_root failed");
+		goto err_with_tm;
+	}
+
+	r = superblock_write_lock_zero(md, &sblock);
+	if (r) {
+		DMERR("Failed to write_lock superblock");
+		goto err_with_tm;
+	}
+
+	sb = dm_block_data(sblock);
+	__prepare_superblock(md, sb);
+	r = dm_tm_commit(md->tm, sblock);
+	if (r) {
+		DMERR("Failed to commit superblock");
+		goto err_with_tm;
+	}
+
+	return 0;
+
+err_with_tm:
+	dm_sm_destroy(md->sm);
+	dm_tm_destroy(md->tm);
+
+	return r;
+}
+
+static int __open_or_format_metadata(struct dm_clone_metadata *md, bool may_format_device)
+{
+	int r;
+	bool formatted = false;
+
+	r = __superblock_all_zeroes(md->bm, &formatted);
+	if (r)
+		return r;
+
+	if (!formatted)
+		return may_format_device ? __format_metadata(md) : -EPERM;
+
+	return __open_metadata(md);
+}
+
+static int __create_persistent_data_structures(struct dm_clone_metadata *md,
+					       bool may_format_device)
+{
+	int r;
+
+	/* Create block manager */
+	md->bm = dm_block_manager_create(md->bdev,
+					 DM_CLONE_METADATA_BLOCK_SIZE << SECTOR_SHIFT,
+					 DM_CLONE_MAX_CONCURRENT_LOCKS);
+	if (IS_ERR(md->bm)) {
+		DMERR("Failed to create block manager");
+		return PTR_ERR(md->bm);
+	}
+
+	r = __open_or_format_metadata(md, may_format_device);
+	if (r)
+		dm_block_manager_destroy(md->bm);
+
+	return r;
+}
+
+static void __destroy_persistent_data_structures(struct dm_clone_metadata *md)
+{
+	dm_sm_destroy(md->sm);
+	dm_tm_destroy(md->tm);
+	dm_block_manager_destroy(md->bm);
+}
+
+/*---------------------------------------------------------------------------*/
+
+static size_t bitmap_size(unsigned long nr_bits)
+{
+	return BITS_TO_LONGS(nr_bits) * sizeof(long);
+}
+
+static int dirty_map_init(struct dm_clone_metadata *md)
+{
+	md->dmap[0].changed = 0;
+	md->dmap[0].dirty_words = vzalloc(bitmap_size(md->nr_words));
+
+	if (!md->dmap[0].dirty_words) {
+		DMERR("Failed to allocate dirty bitmap");
+		return -ENOMEM;
+	}
+
+	md->dmap[1].changed = 0;
+	md->dmap[1].dirty_words = vzalloc(bitmap_size(md->nr_words));
+
+	if (!md->dmap[1].dirty_words) {
+		DMERR("Failed to allocate dirty bitmap");
+		vfree(md->dmap[0].dirty_words);
+		return -ENOMEM;
+	}
+
+	md->current_dmap = &md->dmap[0];
+
+	return 0;
+}
+
+static void dirty_map_exit(struct dm_clone_metadata *md)
+{
+	vfree(md->dmap[0].dirty_words);
+	vfree(md->dmap[1].dirty_words);
+}
+
+static int __load_bitset_in_core(struct dm_clone_metadata *md)
+{
+	int r;
+	unsigned long i;
+	struct dm_bitset_cursor c;
+
+	/* Flush bitset cache */
+	r = dm_bitset_flush(&md->bitset_info, md->bitset_root, &md->bitset_root);
+	if (r)
+		return r;
+
+	r = dm_bitset_cursor_begin(&md->bitset_info, md->bitset_root, md->nr_regions, &c);
+	if (r)
+		return r;
+
+	for (i = 0; ; i++) {
+		if (dm_bitset_cursor_get_value(&c))
+			__set_bit(i, md->region_map);
+		else
+			__clear_bit(i, md->region_map);
+
+		if (i >= (md->nr_regions - 1))
+			break;
+
+		r = dm_bitset_cursor_next(&c);
+
+		if (r)
+			break;
+	}
+
+	dm_bitset_cursor_end(&c);
+
+	return r;
+}
+
+struct dm_clone_metadata *dm_clone_metadata_open(struct block_device *bdev,
+						 sector_t target_size,
+						 sector_t region_size)
+{
+	int r;
+	struct dm_clone_metadata *md;
+
+	md = kzalloc(sizeof(*md), GFP_KERNEL);
+	if (!md) {
+		DMERR("Failed to allocate memory for dm-clone metadata");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	md->bdev = bdev;
+	md->target_size = target_size;
+	md->region_size = region_size;
+	md->nr_regions = dm_sector_div_up(md->target_size, md->region_size);
+	md->nr_words = BITS_TO_LONGS(md->nr_regions);
+
+	init_rwsem(&md->lock);
+	spin_lock_init(&md->bitmap_lock);
+	md->read_only = 0;
+	md->fail_io = false;
+	md->hydration_done = false;
+
+	md->region_map = vmalloc(bitmap_size(md->nr_regions));
+	if (!md->region_map) {
+		DMERR("Failed to allocate memory for region bitmap");
+		r = -ENOMEM;
+		goto out_with_md;
+	}
+
+	r = __create_persistent_data_structures(md, true);
+	if (r)
+		goto out_with_region_map;
+
+	r = __load_bitset_in_core(md);
+	if (r) {
+		DMERR("Failed to load on-disk region map");
+		goto out_with_pds;
+	}
+
+	r = dirty_map_init(md);
+	if (r)
+		goto out_with_pds;
+
+	if (bitmap_full(md->region_map, md->nr_regions))
+		md->hydration_done = true;
+
+	return md;
+
+out_with_pds:
+	__destroy_persistent_data_structures(md);
+
+out_with_region_map:
+	vfree(md->region_map);
+
+out_with_md:
+	kfree(md);
+
+	return ERR_PTR(r);
+}
+
+void dm_clone_metadata_close(struct dm_clone_metadata *md)
+{
+	if (!md->fail_io)
+		__destroy_persistent_data_structures(md);
+
+	dirty_map_exit(md);
+	vfree(md->region_map);
+	kfree(md);
+}
+
+bool dm_clone_is_hydration_done(struct dm_clone_metadata *md)
+{
+	return md->hydration_done;
+}
+
+bool dm_clone_is_region_hydrated(struct dm_clone_metadata *md, unsigned long region_nr)
+{
+	return dm_clone_is_hydration_done(md) || test_bit(region_nr, md->region_map);
+}
+
+bool dm_clone_is_range_hydrated(struct dm_clone_metadata *md,
+				unsigned long start, unsigned long nr_regions)
+{
+	unsigned long bit;
+
+	if (dm_clone_is_hydration_done(md))
+		return true;
+
+	bit = find_next_zero_bit(md->region_map, md->nr_regions, start);
+
+	return (bit >= (start + nr_regions));
+}
+
+unsigned long dm_clone_nr_of_hydrated_regions(struct dm_clone_metadata *md)
+{
+	return bitmap_weight(md->region_map, md->nr_regions);
+}
+
+unsigned long dm_clone_find_next_unhydrated_region(struct dm_clone_metadata *md,
+						   unsigned long start)
+{
+	return find_next_zero_bit(md->region_map, md->nr_regions, start);
+}
+
+static int __update_metadata_word(struct dm_clone_metadata *md, unsigned long word)
+{
+	int r;
+	unsigned long index = word * BITS_PER_LONG;
+	unsigned long max_index = min(md->nr_regions, (word + 1) * BITS_PER_LONG);
+
+	while (index < max_index) {
+		if (test_bit(index, md->region_map)) {
+			r = dm_bitset_set_bit(&md->bitset_info, md->bitset_root,
+					      index, &md->bitset_root);
+
+			if (r) {
+				DMERR("dm_bitset_set_bit failed");
+				return r;
+			}
+		}
+		index++;
+	}
+
+	return 0;
+}
+
+static int __metadata_commit(struct dm_clone_metadata *md)
+{
+	int r;
+	struct dm_block *sblock;
+	struct superblock_disk *sb;
+
+	/* Flush bitset cache */
+	r = dm_bitset_flush(&md->bitset_info, md->bitset_root, &md->bitset_root);
+	if (r) {
+		DMERR("dm_bitset_flush failed");
+		return r;
+	}
+
+	/* Flush to disk all blocks, except the superblock */
+	r = dm_tm_pre_commit(md->tm);
+	if (r) {
+		DMERR("dm_tm_pre_commit failed");
+		return r;
+	}
+
+	/* Save the space map root in md->metadata_space_map_root */
+	r = __copy_sm_root(md);
+	if (r) {
+		DMERR("__copy_sm_root failed");
+		return r;
+	}
+
+	/* Lock the superblock */
+	r = superblock_write_lock_zero(md, &sblock);
+	if (r) {
+		DMERR("Failed to write_lock superblock");
+		return r;
+	}
+
+	/* Save the metadata in superblock */
+	sb = dm_block_data(sblock);
+	__prepare_superblock(md, sb);
+
+	/* Unlock superblock and commit it to disk */
+	r = dm_tm_commit(md->tm, sblock);
+	if (r) {
+		DMERR("Failed to commit superblock");
+		return r;
+	}
+
+	/*
+	 * FIXME: Find a more efficient way to check if the hydration is done.
+	 */
+	if (bitmap_full(md->region_map, md->nr_regions))
+		md->hydration_done = true;
+
+	return 0;
+}
+
+static int __flush_dmap(struct dm_clone_metadata *md, struct dirty_map *dmap)
+{
+	int r;
+	unsigned long word, flags;
+
+	word = 0;
+	do {
+		word = find_next_bit(dmap->dirty_words, md->nr_words, word);
+
+		if (word == md->nr_words)
+			break;
+
+		r = __update_metadata_word(md, word);
+
+		if (r)
+			return r;
+
+		__clear_bit(word, dmap->dirty_words);
+		word++;
+	} while (word < md->nr_words);
+
+	r = __metadata_commit(md);
+
+	if (r)
+		return r;
+
+	/* Update the changed flag */
+	spin_lock_irqsave(&md->bitmap_lock, flags);
+	dmap->changed = 0;
+	spin_unlock_irqrestore(&md->bitmap_lock, flags);
+
+	return 0;
+}
+
+int dm_clone_metadata_commit(struct dm_clone_metadata *md)
+{
+	int r = -EPERM;
+	unsigned long flags;
+	struct dirty_map *dmap, *next_dmap;
+
+	down_write(&md->lock);
+
+	if (md->fail_io || dm_bm_is_read_only(md->bm))
+		goto out;
+
+	/* Get current dirty bitmap */
+	dmap = md->current_dmap;
+
+	/* Get next dirty bitmap */
+	next_dmap = (dmap == &md->dmap[0]) ? &md->dmap[1] : &md->dmap[0];
+
+	/*
+	 * The last commit failed, so we don't have a clean dirty-bitmap to
+	 * use.
+	 */
+	if (WARN_ON(next_dmap->changed)) {
+		r = -EINVAL;
+		goto out;
+	}
+
+	/* Swap dirty bitmaps */
+	spin_lock_irqsave(&md->bitmap_lock, flags);
+	md->current_dmap = next_dmap;
+	spin_unlock_irqrestore(&md->bitmap_lock, flags);
+
+	/*
+	 * No one is accessing the old dirty bitmap anymore, so we can flush
+	 * it.
+	 */
+	r = __flush_dmap(md, dmap);
+out:
+	up_write(&md->lock);
+
+	return r;
+}
+
+int dm_clone_set_region_hydrated(struct dm_clone_metadata *md, unsigned long region_nr)
+{
+	int r = 0;
+	struct dirty_map *dmap;
+	unsigned long word, flags;
+
+	word = region_nr / BITS_PER_LONG;
+
+	spin_lock_irqsave(&md->bitmap_lock, flags);
+
+	if (md->read_only) {
+		r = -EPERM;
+		goto out;
+	}
+
+	dmap = md->current_dmap;
+
+	__set_bit(word, dmap->dirty_words);
+	__set_bit(region_nr, md->region_map);
+	dmap->changed = 1;
+
+out:
+	spin_unlock_irqrestore(&md->bitmap_lock, flags);
+
+	return r;
+}
+
+int dm_clone_cond_set_range(struct dm_clone_metadata *md, unsigned long start,
+			    unsigned long nr_regions)
+{
+	int r = 0;
+	struct dirty_map *dmap;
+	unsigned long word, region_nr, flags;
+
+	spin_lock_irqsave(&md->bitmap_lock, flags);
+
+	if (md->read_only) {
+		r = -EPERM;
+		goto out;
+	}
+
+	dmap = md->current_dmap;
+	for (region_nr = start; region_nr < (start + nr_regions); region_nr++) {
+		if (!test_bit(region_nr, md->region_map)) {
+			word = region_nr / BITS_PER_LONG;
+			__set_bit(word, dmap->dirty_words);
+			__set_bit(region_nr, md->region_map);
+			dmap->changed = 1;
+		}
+	}
+out:
+	spin_unlock_irqrestore(&md->bitmap_lock, flags);
+
+	return r;
+}
+
+/*
+ * WARNING: This must not be called concurrently with either
+ * dm_clone_set_region_hydrated() or dm_clone_cond_set_range(), as it changes
+ * md->region_map without taking the md->bitmap_lock spinlock. The only
+ * exception is after setting the metadata to read-only mode, using
+ * dm_clone_metadata_set_read_only().
+ *
+ * We don't take the spinlock because __load_bitset_in_core() does I/O, so it
+ * may block.
+ */
+int dm_clone_reload_in_core_bitset(struct dm_clone_metadata *md)
+{
+	int r = -EINVAL;
+
+	down_write(&md->lock);
+
+	if (md->fail_io)
+		goto out;
+
+	r = __load_bitset_in_core(md);
+out:
+	up_write(&md->lock);
+
+	return r;
+}
+
+bool dm_clone_changed_this_transaction(struct dm_clone_metadata *md)
+{
+	bool r;
+	unsigned long flags;
+
+	spin_lock_irqsave(&md->bitmap_lock, flags);
+	r = md->dmap[0].changed || md->dmap[1].changed;
+	spin_unlock_irqrestore(&md->bitmap_lock, flags);
+
+	return r;
+}
+
+int dm_clone_metadata_abort(struct dm_clone_metadata *md)
+{
+	int r = -EPERM;
+
+	down_write(&md->lock);
+
+	if (md->fail_io || dm_bm_is_read_only(md->bm))
+		goto out;
+
+	__destroy_persistent_data_structures(md);
+
+	r = __create_persistent_data_structures(md, false);
+	if (r) {
+		/* If something went wrong we can neither write nor read the metadata */
+		md->fail_io = true;
+	}
+out:
+	up_write(&md->lock);
+
+	return r;
+}
+
+void dm_clone_metadata_set_read_only(struct dm_clone_metadata *md)
+{
+	unsigned long flags;
+
+	down_write(&md->lock);
+
+	spin_lock_irqsave(&md->bitmap_lock, flags);
+	md->read_only = 1;
+	spin_unlock_irqrestore(&md->bitmap_lock, flags);
+
+	if (!md->fail_io)
+		dm_bm_set_read_only(md->bm);
+
+	up_write(&md->lock);
+}
+
+void dm_clone_metadata_set_read_write(struct dm_clone_metadata *md)
+{
+	unsigned long flags;
+
+	down_write(&md->lock);
+
+	spin_lock_irqsave(&md->bitmap_lock, flags);
+	md->read_only = 0;
+	spin_unlock_irqrestore(&md->bitmap_lock, flags);
+
+	if (!md->fail_io)
+		dm_bm_set_read_write(md->bm);
+
+	up_write(&md->lock);
+}
+
+int dm_clone_get_free_metadata_block_count(struct dm_clone_metadata *md,
+					   dm_block_t *result)
+{
+	int r = -EINVAL;
+
+	down_read(&md->lock);
+
+	if (!md->fail_io)
+		r = dm_sm_get_nr_free(md->sm, result);
+
+	up_read(&md->lock);
+
+	return r;
+}
+
+int dm_clone_get_metadata_dev_size(struct dm_clone_metadata *md,
+				   dm_block_t *result)
+{
+	int r = -EINVAL;
+
+	down_read(&md->lock);
+
+	if (!md->fail_io)
+		r = dm_sm_get_nr_blocks(md->sm, result);
+
+	up_read(&md->lock);
+
+	return r;
+}
diff --git a/drivers/md/dm-clone-metadata.h b/drivers/md/dm-clone-metadata.h
new file mode 100644
index 000000000000..7b8063ea70c3
--- /dev/null
+++ b/drivers/md/dm-clone-metadata.h
@@ -0,0 +1,158 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2019 Arrikto, Inc. All Rights Reserved.
+ */
+
+#ifndef DM_CLONE_METADATA_H
+#define DM_CLONE_METADATA_H
+
+#include "persistent-data/dm-block-manager.h"
+#include "persistent-data/dm-space-map-metadata.h"
+
+#define DM_CLONE_METADATA_BLOCK_SIZE DM_SM_METADATA_BLOCK_SIZE
+
+/*
+ * The metadata device is currently limited in size.
+ */
+#define DM_CLONE_METADATA_MAX_SECTORS DM_SM_METADATA_MAX_SECTORS
+
+/*
+ * A metadata device larger than 16GB triggers a warning.
+ */
+#define DM_CLONE_METADATA_MAX_SECTORS_WARNING (16 * (1024 * 1024 * 1024 >> SECTOR_SHIFT))
+
+#define SPACE_MAP_ROOT_SIZE 128
+
+/* dm-clone metadata */
+struct dm_clone_metadata;
+
+/*
+ * Set region status to hydrated.
+ *
+ * @md: The dm-clone metadata
+ * @region_nr: The region number
+ *
+ * This function doesn't block, so it's safe to call it from interrupt context.
+ */
+int dm_clone_set_region_hydrated(struct dm_clone_metadata *md, unsigned long region_nr);
+
+/*
+ * Set status of all regions in the provided range to hydrated, if not already
+ * hydrated.
+ *
+ * @md: The dm-clone metadata
+ * @start: Starting region number
+ * @nr_regions: Number of regions in the range
+ *
+ * This function doesn't block, so it's safe to call it from interrupt context.
+ */
+int dm_clone_cond_set_range(struct dm_clone_metadata *md, unsigned long start,
+			    unsigned long nr_regions);
+
+/*
+ * Read existing or create fresh metadata.
+ *
+ * @bdev: The device storing the metadata
+ * @target_size: The target size
+ * @region_size: The region size
+ *
+ * @returns: The dm-clone metadata
+ *
+ * This function reads the superblock of @bdev and checks if it's all zeroes.
+ * If it is, it formats @bdev and creates fresh metadata. If it isn't, it
+ * validates the metadata stored in @bdev.
+ */
+struct dm_clone_metadata *dm_clone_metadata_open(struct block_device *bdev,
+						 sector_t target_size,
+						 sector_t region_size);
+
+/*
+ * Free the resources related to metadata management.
+ */
+void dm_clone_metadata_close(struct dm_clone_metadata *md);
+
+/*
+ * Commit dm-clone metadata to disk.
+ */
+int dm_clone_metadata_commit(struct dm_clone_metadata *md);
+
+/*
+ * Reload the in core copy of the on-disk bitmap.
+ *
+ * This should be used after aborting a metadata transaction and setting the
+ * metadata to read-only, to invalidate the in-core cache and make it match the
+ * on-disk metadata.
+ *
+ * WARNING: It must not be called concurrently with either
+ * dm_clone_set_region_hydrated() or dm_clone_cond_set_range(), as it updates
+ * the region bitmap without taking the relevant spinlock. We don't take the
+ * spinlock because dm_clone_reload_in_core_bitset() does I/O, so it may block.
+ *
+ * But, it's safe to use it after calling dm_clone_metadata_set_read_only(),
+ * because the latter sets the metadata to read-only mode. Both
+ * dm_clone_set_region_hydrated() and dm_clone_cond_set_range() refuse to touch
+ * the region bitmap, after calling dm_clone_metadata_set_read_only().
+ */
+int dm_clone_reload_in_core_bitset(struct dm_clone_metadata *md);
+
+/*
+ * Check whether dm-clone's metadata changed this transaction.
+ */
+bool dm_clone_changed_this_transaction(struct dm_clone_metadata *md);
+
+/*
+ * Abort current metadata transaction and rollback metadata to the last
+ * committed transaction.
+ */
+int dm_clone_metadata_abort(struct dm_clone_metadata *md);
+
+/*
+ * Switches metadata to a read only mode. Once read-only mode has been entered
+ * the following functions will return -EPERM:
+ *
+ *   dm_clone_metadata_commit()
+ *   dm_clone_set_region_hydrated()
+ *   dm_clone_cond_set_range()
+ *   dm_clone_metadata_abort()
+ */
+void dm_clone_metadata_set_read_only(struct dm_clone_metadata *md);
+void dm_clone_metadata_set_read_write(struct dm_clone_metadata *md);
+
+/*
+ * Returns true if the hydration of the destination device is finished.
+ */
+bool dm_clone_is_hydration_done(struct dm_clone_metadata *md);
+
+/*
+ * Returns true if region @region_nr is hydrated.
+ */
+bool dm_clone_is_region_hydrated(struct dm_clone_metadata *md, unsigned long region_nr);
+
+/*
+ * Returns true if all the regions in the range are hydrated.
+ */
+bool dm_clone_is_range_hydrated(struct dm_clone_metadata *md,
+				unsigned long start, unsigned long nr_regions);
+
+/*
+ * Returns the number of hydrated regions.
+ */
+unsigned long dm_clone_nr_of_hydrated_regions(struct dm_clone_metadata *md);
+
+/*
+ * Returns the first unhydrated region with region_nr >= @start
+ */
+unsigned long dm_clone_find_next_unhydrated_region(struct dm_clone_metadata *md,
+						   unsigned long start);
+
+/*
+ * Get the number of free metadata blocks.
+ */
+int dm_clone_get_free_metadata_block_count(struct dm_clone_metadata *md, dm_block_t *result);
+
+/*
+ * Get the total number of metadata blocks.
+ */
+int dm_clone_get_metadata_dev_size(struct dm_clone_metadata *md, dm_block_t *result);
+
+#endif /* DM_CLONE_METADATA_H */
diff --git a/drivers/md/dm-clone-target.c b/drivers/md/dm-clone-target.c
new file mode 100644
index 000000000000..02f7c87b022e
--- /dev/null
+++ b/drivers/md/dm-clone-target.c
@@ -0,0 +1,2190 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2019 Arrikto, Inc. All Rights Reserved.
+ */
+
+#include <linux/bio.h>
+#include <linux/err.h>
+#include <linux/hash.h>
+#include <linux/list.h>
+#include <linux/log2.h>
+#include <linux/init.h>
+#include <linux/slab.h>
+#include <linux/wait.h>
+#include <linux/dm-io.h>
+#include <linux/mutex.h>
+#include <linux/atomic.h>
+#include <linux/bitops.h>
+#include <linux/blkdev.h>
+#include <linux/kdev_t.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/jiffies.h>
+#include <linux/mempool.h>
+#include <linux/spinlock.h>
+#include <linux/blk_types.h>
+#include <linux/dm-kcopyd.h>
+#include <linux/workqueue.h>
+#include <linux/backing-dev.h>
+#include <linux/device-mapper.h>
+
+#include "dm.h"
+#include "dm-clone-metadata.h"
+
+#define DM_MSG_PREFIX "clone"
+
+/*
+ * Minimum and maximum allowed region sizes
+ */
+#define MIN_REGION_SIZE (1 << 3)  /* 4KB */
+#define MAX_REGION_SIZE (1 << 21) /* 1GB */
+
+#define MIN_HYDRATIONS 256 /* Size of hydration mempool */
+#define DEFAULT_HYDRATION_THRESHOLD 1 /* 1 region */
+#define DEFAULT_HYDRATION_BATCH_SIZE 1 /* Hydrate in batches of 1 region */
+
+#define COMMIT_PERIOD HZ /* 1 sec */
+
+/*
+ * Hydration hash table size: 1 << HASH_TABLE_BITS
+ */
+#define HASH_TABLE_BITS 15
+
+DECLARE_DM_KCOPYD_THROTTLE_WITH_MODULE_PARM(clone_hydration_throttle,
+	"A percentage of time allocated for hydrating regions");
+
+/* Slab cache for struct dm_clone_region_hydration */
+static struct kmem_cache *_hydration_cache;
+
+/* dm-clone metadata modes */
+enum clone_metadata_mode {
+	CM_WRITE,		/* metadata may be changed */
+	CM_READ_ONLY,		/* metadata may not be changed */
+	CM_FAIL,		/* all metadata I/O fails */
+};
+
+struct hash_table_bucket;
+
+struct clone {
+	struct dm_target *ti;
+	struct dm_target_callbacks callbacks;
+
+	struct dm_dev *metadata_dev;
+	struct dm_dev *dest_dev;
+	struct dm_dev *source_dev;
+
+	unsigned long nr_regions;
+	sector_t region_size;
+	unsigned int region_shift;
+
+	/*
+	 * A metadata commit and the actions taken in case it fails should run
+	 * as a single atomic step.
+	 */
+	struct mutex commit_lock;
+
+	struct dm_clone_metadata *md;
+
+	/* Region hydration hash table */
+	struct hash_table_bucket *ht;
+
+	atomic_t ios_in_flight;
+
+	wait_queue_head_t hydration_stopped;
+
+	mempool_t hydration_pool;
+
+	unsigned long last_commit_jiffies;
+
+	/*
+	 * We defer incoming WRITE bios for regions that are not hydrated,
+	 * until after these regions have been hydrated.
+	 *
+	 * Also, we defer REQ_FUA and REQ_PREFLUSH bios, until after the
+	 * metadata have been committed.
+	 */
+	spinlock_t lock;
+	struct bio_list deferred_bios;
+	struct bio_list deferred_discard_bios;
+	struct bio_list deferred_flush_bios;
+	struct bio_list deferred_flush_completions;
+
+	/* Maximum number of regions being copied during background hydration. */
+	unsigned int hydration_threshold;
+
+	/* Number of regions to batch together during background hydration. */
+	unsigned int hydration_batch_size;
+
+	/* Which region to hydrate next */
+	unsigned long hydration_offset;
+
+	atomic_t hydrations_in_flight;
+
+	/*
+	 * Save a copy of the table line rather than reconstructing it for the
+	 * status.
+	 */
+	unsigned int nr_ctr_args;
+	const char **ctr_args;
+
+	struct workqueue_struct *wq;
+	struct work_struct worker;
+	struct delayed_work waker;
+
+	struct dm_kcopyd_client *kcopyd_client;
+
+	enum clone_metadata_mode mode;
+	unsigned long flags;
+};
+
+/*
+ * dm-clone flags
+ */
+#define DM_CLONE_DISCARD_PASSDOWN 0
+#define DM_CLONE_HYDRATION_ENABLED 1
+#define DM_CLONE_HYDRATION_SUSPENDED 2
+
+/*---------------------------------------------------------------------------*/
+
+/*
+ * Metadata failure handling.
+ */
+static enum clone_metadata_mode get_clone_mode(struct clone *clone)
+{
+	return READ_ONCE(clone->mode);
+}
+
+static const char *clone_device_name(struct clone *clone)
+{
+	return dm_table_device_name(clone->ti->table);
+}
+
+static void __set_clone_mode(struct clone *clone, enum clone_metadata_mode new_mode)
+{
+	const char *descs[] = {
+		"read-write",
+		"read-only",
+		"fail"
+	};
+
+	enum clone_metadata_mode old_mode = get_clone_mode(clone);
+
+	/* Never move out of fail mode */
+	if (old_mode == CM_FAIL)
+		new_mode = CM_FAIL;
+
+	switch (new_mode) {
+	case CM_FAIL:
+	case CM_READ_ONLY:
+		dm_clone_metadata_set_read_only(clone->md);
+		break;
+
+	case CM_WRITE:
+		dm_clone_metadata_set_read_write(clone->md);
+		break;
+	}
+
+	WRITE_ONCE(clone->mode, new_mode);
+
+	if (new_mode != old_mode) {
+		dm_table_event(clone->ti->table);
+		DMINFO("%s: Switching to %s mode", clone_device_name(clone),
+		       descs[(int)new_mode]);
+	}
+}
+
+static void __abort_transaction(struct clone *clone)
+{
+	const char *dev_name = clone_device_name(clone);
+
+	if (get_clone_mode(clone) >= CM_READ_ONLY)
+		return;
+
+	DMERR("%s: Aborting current metadata transaction", dev_name);
+	if (dm_clone_metadata_abort(clone->md)) {
+		DMERR("%s: Failed to abort metadata transaction", dev_name);
+		__set_clone_mode(clone, CM_FAIL);
+	}
+}
+
+static void __reload_in_core_bitset(struct clone *clone)
+{
+	const char *dev_name = clone_device_name(clone);
+
+	if (get_clone_mode(clone) == CM_FAIL)
+		return;
+
+	/* Reload the on-disk bitset */
+	DMINFO("%s: Reloading on-disk bitmap", dev_name);
+	if (dm_clone_reload_in_core_bitset(clone->md)) {
+		DMERR("%s: Failed to reload on-disk bitmap", dev_name);
+		__set_clone_mode(clone, CM_FAIL);
+	}
+}
+
+static void __metadata_operation_failed(struct clone *clone, const char *op, int r)
+{
+	DMERR("%s: Metadata operation `%s' failed: error = %d",
+	      clone_device_name(clone), op, r);
+
+	__abort_transaction(clone);
+	__set_clone_mode(clone, CM_READ_ONLY);
+
+	/*
+	 * dm_clone_reload_in_core_bitset() may run concurrently with either
+	 * dm_clone_set_region_hydrated() or dm_clone_cond_set_range(), but
+	 * it's safe as we have already set the metadata to read-only mode.
+	 */
+	__reload_in_core_bitset(clone);
+}
+
+/*---------------------------------------------------------------------------*/
+
+/* Wake up anyone waiting for region hydrations to stop */
+static inline void wakeup_hydration_waiters(struct clone *clone)
+{
+	wake_up_all(&clone->hydration_stopped);
+}
+
+static inline void wake_worker(struct clone *clone)
+{
+	queue_work(clone->wq, &clone->worker);
+}
+
+/*---------------------------------------------------------------------------*/
+
+/*
+ * bio helper functions.
+ */
+static inline void remap_to_source(struct clone *clone, struct bio *bio)
+{
+	bio_set_dev(bio, clone->source_dev->bdev);
+}
+
+static inline void remap_to_dest(struct clone *clone, struct bio *bio)
+{
+	bio_set_dev(bio, clone->dest_dev->bdev);
+}
+
+static bool bio_triggers_commit(struct clone *clone, struct bio *bio)
+{
+	return op_is_flush(bio->bi_opf) &&
+		dm_clone_changed_this_transaction(clone->md);
+}
+
+/* Get the address of the region in sectors */
+static inline sector_t region_to_sector(struct clone *clone, unsigned long region_nr)
+{
+	return (region_nr << clone->region_shift);
+}
+
+/* Get the region number of the bio */
+static inline unsigned long bio_to_region(struct clone *clone, struct bio *bio)
+{
+	return (bio->bi_iter.bi_sector >> clone->region_shift);
+}
+
+/* Get the region range covered by the bio */
+static void bio_region_range(struct clone *clone, struct bio *bio,
+			     unsigned long *rs, unsigned long *re)
+{
+	*rs = dm_sector_div_up(bio->bi_iter.bi_sector, clone->region_size);
+	*re = bio_end_sector(bio) >> clone->region_shift;
+}
+
+/* Check whether a bio overwrites a region */
+static inline bool is_overwrite_bio(struct clone *clone, struct bio *bio)
+{
+	return (bio_data_dir(bio) == WRITE && bio_sectors(bio) == clone->region_size);
+}
+
+static void fail_bios(struct bio_list *bios, blk_status_t status)
+{
+	struct bio *bio;
+
+	while ((bio = bio_list_pop(bios))) {
+		bio->bi_status = status;
+		bio_endio(bio);
+	}
+}
+
+static void submit_bios(struct bio_list *bios)
+{
+	struct bio *bio;
+	struct blk_plug plug;
+
+	blk_start_plug(&plug);
+
+	while ((bio = bio_list_pop(bios)))
+		generic_make_request(bio);
+
+	blk_finish_plug(&plug);
+}
+
+/*
+ * Submit bio to the underlying device.
+ *
+ * If the bio triggers a commit, delay it, until after the metadata have been
+ * committed.
+ *
+ * NOTE: The bio remapping must be performed by the caller.
+ */
+static void issue_bio(struct clone *clone, struct bio *bio)
+{
+	unsigned long flags;
+
+	if (!bio_triggers_commit(clone, bio)) {
+		generic_make_request(bio);
+		return;
+	}
+
+	/*
+	 * If the metadata mode is RO or FAIL we won't be able to commit the
+	 * metadata, so we complete the bio with an error.
+	 */
+	if (unlikely(get_clone_mode(clone) >= CM_READ_ONLY)) {
+		bio_io_error(bio);
+		return;
+	}
+
+	/*
+	 * Batch together any bios that trigger commits and then issue a single
+	 * commit for them in process_deferred_flush_bios().
+	 */
+	spin_lock_irqsave(&clone->lock, flags);
+	bio_list_add(&clone->deferred_flush_bios, bio);
+	spin_unlock_irqrestore(&clone->lock, flags);
+
+	wake_worker(clone);
+}
+
+/*
+ * Remap bio to the destination device and submit it.
+ *
+ * If the bio triggers a commit, delay it, until after the metadata have been
+ * committed.
+ */
+static void remap_and_issue(struct clone *clone, struct bio *bio)
+{
+	remap_to_dest(clone, bio);
+	issue_bio(clone, bio);
+}
+
+/*
+ * Issue bios that have been deferred until after their region has finished
+ * hydrating.
+ *
+ * We delegate the bio submission to the worker thread, so this is safe to call
+ * from interrupt context.
+ */
+static void issue_deferred_bios(struct clone *clone, struct bio_list *bios)
+{
+	struct bio *bio;
+	unsigned long flags;
+	struct bio_list flush_bios = BIO_EMPTY_LIST;
+	struct bio_list normal_bios = BIO_EMPTY_LIST;
+
+	if (bio_list_empty(bios))
+		return;
+
+	while ((bio = bio_list_pop(bios))) {
+		if (bio_triggers_commit(clone, bio))
+			bio_list_add(&flush_bios, bio);
+		else
+			bio_list_add(&normal_bios, bio);
+	}
+
+	spin_lock_irqsave(&clone->lock, flags);
+	bio_list_merge(&clone->deferred_bios, &normal_bios);
+	bio_list_merge(&clone->deferred_flush_bios, &flush_bios);
+	spin_unlock_irqrestore(&clone->lock, flags);
+
+	wake_worker(clone);
+}
+
+static void complete_overwrite_bio(struct clone *clone, struct bio *bio)
+{
+	unsigned long flags;
+
+	/*
+	 * If the bio has the REQ_FUA flag set we must commit the metadata
+	 * before signaling its completion.
+	 *
+	 * complete_overwrite_bio() is only called by hydration_complete(),
+	 * after having successfully updated the metadata. This means we don't
+	 * need to call dm_clone_changed_this_transaction() to check if the
+	 * metadata has changed and thus we can avoid taking the metadata spin
+	 * lock.
+	 */
+	if (!(bio->bi_opf & REQ_FUA)) {
+		bio_endio(bio);
+		return;
+	}
+
+	/*
+	 * If the metadata mode is RO or FAIL we won't be able to commit the
+	 * metadata, so we complete the bio with an error.
+	 */
+	if (unlikely(get_clone_mode(clone) >= CM_READ_ONLY)) {
+		bio_io_error(bio);
+		return;
+	}
+
+	/*
+	 * Batch together any bios that trigger commits and then issue a single
+	 * commit for them in process_deferred_flush_bios().
+	 */
+	spin_lock_irqsave(&clone->lock, flags);
+	bio_list_add(&clone->deferred_flush_completions, bio);
+	spin_unlock_irqrestore(&clone->lock, flags);
+
+	wake_worker(clone);
+}
+
+static void trim_bio(struct bio *bio, sector_t sector, unsigned int len)
+{
+	bio->bi_iter.bi_sector = sector;
+	bio->bi_iter.bi_size = to_bytes(len);
+}
+
+static void complete_discard_bio(struct clone *clone, struct bio *bio, bool success)
+{
+	unsigned long rs, re;
+
+	/*
+	 * If the destination device supports discards, remap and trim the
+	 * discard bio and pass it down. Otherwise complete the bio
+	 * immediately.
+	 */
+	if (test_bit(DM_CLONE_DISCARD_PASSDOWN, &clone->flags) && success) {
+		remap_to_dest(clone, bio);
+		bio_region_range(clone, bio, &rs, &re);
+		trim_bio(bio, rs << clone->region_shift,
+			 (re - rs) << clone->region_shift);
+		generic_make_request(bio);
+	} else
+		bio_endio(bio);
+}
+
+static void process_discard_bio(struct clone *clone, struct bio *bio)
+{
+	unsigned long rs, re, flags;
+
+	bio_region_range(clone, bio, &rs, &re);
+	BUG_ON(re > clone->nr_regions);
+
+	if (unlikely(rs == re)) {
+		bio_endio(bio);
+		return;
+	}
+
+	/*
+	 * The covered regions are already hydrated so we just need to pass
+	 * down the discard.
+	 */
+	if (dm_clone_is_range_hydrated(clone->md, rs, re - rs)) {
+		complete_discard_bio(clone, bio, true);
+		return;
+	}
+
+	/*
+	 * If the metadata mode is RO or FAIL we won't be able to update the
+	 * metadata for the regions covered by the discard so we just ignore
+	 * it.
+	 */
+	if (unlikely(get_clone_mode(clone) >= CM_READ_ONLY)) {
+		bio_endio(bio);
+		return;
+	}
+
+	/*
+	 * Defer discard processing.
+	 */
+	spin_lock_irqsave(&clone->lock, flags);
+	bio_list_add(&clone->deferred_discard_bios, bio);
+	spin_unlock_irqrestore(&clone->lock, flags);
+
+	wake_worker(clone);
+}
+
+/*---------------------------------------------------------------------------*/
+
+/*
+ * dm-clone region hydrations.
+ */
+struct dm_clone_region_hydration {
+	struct clone *clone;
+	unsigned long region_nr;
+
+	struct bio *overwrite_bio;
+	bio_end_io_t *overwrite_bio_end_io;
+
+	struct bio_list deferred_bios;
+
+	blk_status_t status;
+
+	/* Used by hydration batching */
+	struct list_head list;
+
+	/* Used by hydration hash table */
+	struct hlist_node h;
+};
+
+/*
+ * Hydration hash table implementation.
+ *
+ * Ideally we would like to use list_bl, which uses bit spin locks and employs
+ * the least significant bit of the list head to lock the corresponding bucket,
+ * reducing the memory overhead for the locks. But, currently, list_bl and bit
+ * spin locks don't support IRQ safe versions. Since we have to take the lock
+ * in both process and interrupt context, we must fall back to using regular
+ * spin locks; one per hash table bucket.
+ */
+struct hash_table_bucket {
+	struct hlist_head head;
+
+	/* Spinlock protecting the bucket */
+	spinlock_t lock;
+};
+
+#define bucket_lock_irqsave(bucket, flags) \
+	spin_lock_irqsave(&(bucket)->lock, flags)
+
+#define bucket_unlock_irqrestore(bucket, flags) \
+	spin_unlock_irqrestore(&(bucket)->lock, flags)
+
+static int hash_table_init(struct clone *clone)
+{
+	unsigned int i, sz;
+	struct hash_table_bucket *bucket;
+
+	sz = 1 << HASH_TABLE_BITS;
+
+	clone->ht = vmalloc(sz * sizeof(struct hash_table_bucket));
+	if (!clone->ht)
+		return -ENOMEM;
+
+	for (i = 0; i < sz; i++) {
+		bucket = clone->ht + i;
+
+		INIT_HLIST_HEAD(&bucket->head);
+		spin_lock_init(&bucket->lock);
+	}
+
+	return 0;
+}
+
+static void hash_table_exit(struct clone *clone)
+{
+	vfree(clone->ht);
+}
+
+static struct hash_table_bucket *get_hash_table_bucket(struct clone *clone,
+						       unsigned long region_nr)
+{
+	return &clone->ht[hash_long(region_nr, HASH_TABLE_BITS)];
+}
+
+/*
+ * Search hash table for a hydration with hd->region_nr == region_nr
+ *
+ * NOTE: Must be called with the bucket lock held
+ */
+struct dm_clone_region_hydration *__hash_find(struct hash_table_bucket *bucket,
+					      unsigned long region_nr)
+{
+	struct dm_clone_region_hydration *hd;
+
+	hlist_for_each_entry(hd, &bucket->head, h) {
+		if (hd->region_nr == region_nr)
+			return hd;
+	}
+
+	return NULL;
+}
+
+/*
+ * Insert a hydration into the hash table.
+ *
+ * NOTE: Must be called with the bucket lock held.
+ */
+static inline void __insert_region_hydration(struct hash_table_bucket *bucket,
+					     struct dm_clone_region_hydration *hd)
+{
+	hlist_add_head(&hd->h, &bucket->head);
+}
+
+/*
+ * This function inserts a hydration into the hash table, unless someone else
+ * managed to insert a hydration for the same region first. In the latter case
+ * it returns the existing hydration descriptor for this region.
+ *
+ * NOTE: Must be called with the hydration hash table lock held.
+ */
+static struct dm_clone_region_hydration *
+__find_or_insert_region_hydration(struct hash_table_bucket *bucket,
+				  struct dm_clone_region_hydration *hd)
+{
+	struct dm_clone_region_hydration *hd2;
+
+	hd2 = __hash_find(bucket, hd->region_nr);
+	if (hd2)
+		return hd2;
+
+	__insert_region_hydration(bucket, hd);
+
+	return hd;
+}
+
+/*---------------------------------------------------------------------------*/
+
+/* Allocate a hydration */
+static struct dm_clone_region_hydration *alloc_hydration(struct clone *clone)
+{
+	struct dm_clone_region_hydration *hd;
+
+	/*
+	 * Allocate a hydration from the hydration mempool.
+	 * This might block but it can't fail.
+	 */
+	hd = mempool_alloc(&clone->hydration_pool, GFP_NOIO);
+	hd->clone = clone;
+
+	return hd;
+}
+
+static inline void free_hydration(struct dm_clone_region_hydration *hd)
+{
+	mempool_free(hd, &hd->clone->hydration_pool);
+}
+
+/* Initialize a hydration */
+static void hydration_init(struct dm_clone_region_hydration *hd, unsigned long region_nr)
+{
+	hd->region_nr = region_nr;
+	hd->overwrite_bio = NULL;
+	bio_list_init(&hd->deferred_bios);
+	hd->status = 0;
+
+	INIT_LIST_HEAD(&hd->list);
+	INIT_HLIST_NODE(&hd->h);
+}
+
+/*---------------------------------------------------------------------------*/
+
+/*
+ * Update dm-clone's metadata after a region has finished hydrating and remove
+ * hydration from the hash table.
+ */
+static int hydration_update_metadata(struct dm_clone_region_hydration *hd)
+{
+	int r = 0;
+	unsigned long flags;
+	struct hash_table_bucket *bucket;
+	struct clone *clone = hd->clone;
+
+	if (unlikely(get_clone_mode(clone) >= CM_READ_ONLY))
+		r = -EPERM;
+
+	/* Update the metadata */
+	if (likely(!r) && hd->status == BLK_STS_OK)
+		r = dm_clone_set_region_hydrated(clone->md, hd->region_nr);
+
+	bucket = get_hash_table_bucket(clone, hd->region_nr);
+
+	/* Remove hydration from hash table */
+	bucket_lock_irqsave(bucket, flags);
+	hlist_del(&hd->h);
+	bucket_unlock_irqrestore(bucket, flags);
+
+	return r;
+}
+
+/*
+ * Complete a region's hydration:
+ *
+ *	1. Update dm-clone's metadata.
+ *	2. Remove hydration from hash table.
+ *	3. Complete overwrite bio.
+ *	4. Issue deferred bios.
+ *	5. If this was the last hydration, wake up anyone waiting for
+ *	   hydrations to finish.
+ */
+static void hydration_complete(struct dm_clone_region_hydration *hd)
+{
+	int r;
+	blk_status_t status;
+	struct clone *clone = hd->clone;
+
+	r = hydration_update_metadata(hd);
+
+	if (hd->status == BLK_STS_OK && likely(!r)) {
+		if (hd->overwrite_bio)
+			complete_overwrite_bio(clone, hd->overwrite_bio);
+
+		issue_deferred_bios(clone, &hd->deferred_bios);
+	} else {
+		status = r ? BLK_STS_IOERR : hd->status;
+
+		if (hd->overwrite_bio)
+			bio_list_add(&hd->deferred_bios, hd->overwrite_bio);
+
+		fail_bios(&hd->deferred_bios, status);
+	}
+
+	free_hydration(hd);
+
+	if (atomic_dec_and_test(&clone->hydrations_in_flight))
+		wakeup_hydration_waiters(clone);
+}
+
+static void hydration_kcopyd_callback(int read_err, unsigned long write_err, void *context)
+{
+	blk_status_t status;
+
+	struct dm_clone_region_hydration *tmp, *hd = context;
+	struct clone *clone = hd->clone;
+
+	LIST_HEAD(batched_hydrations);
+
+	if (read_err || write_err) {
+		DMERR_LIMIT("%s: hydration failed", clone_device_name(clone));
+		status = BLK_STS_IOERR;
+	} else {
+		status = BLK_STS_OK;
+	}
+	list_splice_tail(&hd->list, &batched_hydrations);
+
+	hd->status = status;
+	hydration_complete(hd);
+
+	/* Complete batched hydrations */
+	list_for_each_entry_safe(hd, tmp, &batched_hydrations, list) {
+		hd->status = status;
+		hydration_complete(hd);
+	}
+
+	/* Continue background hydration, if there is no I/O in-flight */
+	if (test_bit(DM_CLONE_HYDRATION_ENABLED, &clone->flags) &&
+	    !atomic_read(&clone->ios_in_flight))
+		wake_worker(clone);
+}
+
+static void hydration_copy(struct dm_clone_region_hydration *hd, unsigned int nr_regions)
+{
+	unsigned long region_start, region_end;
+	sector_t tail_size, region_size, total_size;
+	struct dm_io_region from, to;
+	struct clone *clone = hd->clone;
+
+	region_size = clone->region_size;
+	region_start = hd->region_nr;
+	region_end = region_start + nr_regions - 1;
+
+	total_size = (nr_regions - 1) << clone->region_shift;
+
+	if (region_end == clone->nr_regions - 1) {
+		/*
+		 * The last region of the target might be smaller than
+		 * region_size.
+		 */
+		tail_size = clone->ti->len & (region_size - 1);
+		if (!tail_size)
+			tail_size = region_size;
+	} else {
+		tail_size = region_size;
+	}
+
+	total_size += tail_size;
+
+	from.bdev = clone->source_dev->bdev;
+	from.sector = region_to_sector(clone, region_start);
+	from.count = total_size;
+
+	to.bdev = clone->dest_dev->bdev;
+	to.sector = from.sector;
+	to.count = from.count;
+
+	/* Issue copy */
+	atomic_add(nr_regions, &clone->hydrations_in_flight);
+	dm_kcopyd_copy(clone->kcopyd_client, &from, 1, &to, 0,
+		       hydration_kcopyd_callback, hd);
+}
+
+static void overwrite_endio(struct bio *bio)
+{
+	struct dm_clone_region_hydration *hd = bio->bi_private;
+
+	bio->bi_end_io = hd->overwrite_bio_end_io;
+	hd->status = bio->bi_status;
+
+	hydration_complete(hd);
+}
+
+static void hydration_overwrite(struct dm_clone_region_hydration *hd, struct bio *bio)
+{
+	/*
+	 * We don't need to save and restore bio->bi_private because device
+	 * mapper core generates a new bio for us to use, with clean
+	 * bi_private.
+	 */
+	hd->overwrite_bio = bio;
+	hd->overwrite_bio_end_io = bio->bi_end_io;
+
+	bio->bi_end_io = overwrite_endio;
+	bio->bi_private = hd;
+
+	atomic_inc(&hd->clone->hydrations_in_flight);
+	generic_make_request(bio);
+}
+
+/*
+ * Hydrate bio's region.
+ *
+ * This function starts the hydration of the bio's region and puts the bio in
+ * the list of deferred bios for this region. In case, by the time this
+ * function is called, the region has finished hydrating it's submitted to the
+ * destination device.
+ *
+ * NOTE: The bio remapping must be performed by the caller.
+ */
+static void hydrate_bio_region(struct clone *clone, struct bio *bio)
+{
+	unsigned long flags;
+	unsigned long region_nr;
+	struct hash_table_bucket *bucket;
+	struct dm_clone_region_hydration *hd, *hd2;
+
+	region_nr = bio_to_region(clone, bio);
+	bucket = get_hash_table_bucket(clone, region_nr);
+
+	bucket_lock_irqsave(bucket, flags);
+
+	hd = __hash_find(bucket, region_nr);
+	if (hd) {
+		/* Someone else is hydrating the region */
+		bio_list_add(&hd->deferred_bios, bio);
+		bucket_unlock_irqrestore(bucket, flags);
+		return;
+	}
+
+	if (dm_clone_is_region_hydrated(clone->md, region_nr)) {
+		/* The region has been hydrated */
+		bucket_unlock_irqrestore(bucket, flags);
+		issue_bio(clone, bio);
+		return;
+	}
+
+	/*
+	 * We must allocate a hydration descriptor and start the hydration of
+	 * the corresponding region.
+	 */
+	bucket_unlock_irqrestore(bucket, flags);
+
+	hd = alloc_hydration(clone);
+	hydration_init(hd, region_nr);
+
+	bucket_lock_irqsave(bucket, flags);
+
+	/* Check if the region has been hydrated in the meantime. */
+	if (dm_clone_is_region_hydrated(clone->md, region_nr)) {
+		bucket_unlock_irqrestore(bucket, flags);
+		free_hydration(hd);
+		issue_bio(clone, bio);
+		return;
+	}
+
+	hd2 = __find_or_insert_region_hydration(bucket, hd);
+	if (hd2 != hd) {
+		/* Someone else started the region's hydration. */
+		bio_list_add(&hd2->deferred_bios, bio);
+		bucket_unlock_irqrestore(bucket, flags);
+		free_hydration(hd);
+		return;
+	}
+
+	/*
+	 * If the metadata mode is RO or FAIL then there is no point starting a
+	 * hydration, since we will not be able to update the metadata when the
+	 * hydration finishes.
+	 */
+	if (unlikely(get_clone_mode(clone) >= CM_READ_ONLY)) {
+		hlist_del(&hd->h);
+		bucket_unlock_irqrestore(bucket, flags);
+		free_hydration(hd);
+		bio_io_error(bio);
+		return;
+	}
+
+	/*
+	 * Start region hydration.
+	 *
+	 * If a bio overwrites a region, i.e., its size is equal to the
+	 * region's size, then we don't need to copy the region from the source
+	 * to the destination device.
+	 */
+	if (is_overwrite_bio(clone, bio)) {
+		bucket_unlock_irqrestore(bucket, flags);
+		hydration_overwrite(hd, bio);
+	} else {
+		bio_list_add(&hd->deferred_bios, bio);
+		bucket_unlock_irqrestore(bucket, flags);
+		hydration_copy(hd, 1);
+	}
+}
+
+/*---------------------------------------------------------------------------*/
+
+/*
+ * Background hydrations.
+ */
+
+/*
+ * Batch region hydrations.
+ *
+ * To better utilize device bandwidth we batch together the hydration of
+ * adjacent regions. This allows us to use small region sizes, e.g., 4KB, which
+ * is good for small, random write performance (because of the overwriting of
+ * un-hydrated regions) and at the same time issue big copy requests to kcopyd
+ * to achieve high hydration bandwidth.
+ */
+struct batch_info {
+	struct dm_clone_region_hydration *head;
+	unsigned int nr_batched_regions;
+};
+
+static void __batch_hydration(struct batch_info *batch,
+			      struct dm_clone_region_hydration *hd)
+{
+	struct clone *clone = hd->clone;
+	unsigned int max_batch_size = READ_ONCE(clone->hydration_batch_size);
+
+	if (batch->head) {
+		/* Try to extend the current batch */
+		if (batch->nr_batched_regions < max_batch_size &&
+		    (batch->head->region_nr + batch->nr_batched_regions) == hd->region_nr) {
+			list_add_tail(&hd->list, &batch->head->list);
+			batch->nr_batched_regions++;
+			hd = NULL;
+		}
+
+		/* Check if we should issue the current batch */
+		if (batch->nr_batched_regions >= max_batch_size || hd) {
+			hydration_copy(batch->head, batch->nr_batched_regions);
+			batch->head = NULL;
+			batch->nr_batched_regions = 0;
+		}
+	}
+
+	if (!hd)
+		return;
+
+	/* We treat max batch sizes of zero and one equivalently */
+	if (max_batch_size <= 1) {
+		hydration_copy(hd, 1);
+		return;
+	}
+
+	/* Start a new batch */
+	BUG_ON(!list_empty(&hd->list));
+	batch->head = hd;
+	batch->nr_batched_regions = 1;
+}
+
+static unsigned long __start_next_hydration(struct clone *clone,
+					    unsigned long offset,
+					    struct batch_info *batch)
+{
+	unsigned long flags;
+	struct hash_table_bucket *bucket;
+	struct dm_clone_region_hydration *hd;
+	unsigned long nr_regions = clone->nr_regions;
+
+	hd = alloc_hydration(clone);
+
+	/* Try to find a region to hydrate. */
+	do {
+		offset = dm_clone_find_next_unhydrated_region(clone->md, offset);
+		if (offset == nr_regions)
+			break;
+
+		bucket = get_hash_table_bucket(clone, offset);
+		bucket_lock_irqsave(bucket, flags);
+
+		if (!dm_clone_is_region_hydrated(clone->md, offset) &&
+		    !__hash_find(bucket, offset)) {
+			hydration_init(hd, offset);
+			__insert_region_hydration(bucket, hd);
+			bucket_unlock_irqrestore(bucket, flags);
+
+			/* Batch hydration */
+			__batch_hydration(batch, hd);
+
+			return (offset + 1);
+		}
+
+		bucket_unlock_irqrestore(bucket, flags);
+
+	} while (++offset < nr_regions);
+
+	if (hd)
+		free_hydration(hd);
+
+	return offset;
+}
+
+/*
+ * This function searches for regions that still reside in the source device
+ * and starts their hydration.
+ */
+static void do_hydration(struct clone *clone)
+{
+	unsigned int current_volume;
+	unsigned long offset, nr_regions = clone->nr_regions;
+
+	struct batch_info batch = {
+		.head = NULL,
+		.nr_batched_regions = 0,
+	};
+
+	if (unlikely(get_clone_mode(clone) >= CM_READ_ONLY))
+		return;
+
+	if (dm_clone_is_hydration_done(clone->md))
+		return;
+
+	/*
+	 * Avoid race with device suspension.
+	 */
+	atomic_inc(&clone->hydrations_in_flight);
+
+	/*
+	 * Make sure atomic_inc() is ordered before test_bit(), otherwise we
+	 * might race with clone_postsuspend() and start a region hydration
+	 * after the target has been suspended.
+	 *
+	 * This is paired with the smp_mb__after_atomic() in
+	 * clone_postsuspend().
+	 */
+	smp_mb__after_atomic();
+
+	offset = clone->hydration_offset;
+	while (likely(!test_bit(DM_CLONE_HYDRATION_SUSPENDED, &clone->flags)) &&
+	       !atomic_read(&clone->ios_in_flight) &&
+	       test_bit(DM_CLONE_HYDRATION_ENABLED, &clone->flags) &&
+	       offset < nr_regions) {
+		current_volume = atomic_read(&clone->hydrations_in_flight);
+		current_volume += batch.nr_batched_regions;
+
+		if (current_volume > READ_ONCE(clone->hydration_threshold))
+			break;
+
+		offset = __start_next_hydration(clone, offset, &batch);
+	}
+
+	if (batch.head)
+		hydration_copy(batch.head, batch.nr_batched_regions);
+
+	if (offset >= nr_regions)
+		offset = 0;
+
+	clone->hydration_offset = offset;
+
+	if (atomic_dec_and_test(&clone->hydrations_in_flight))
+		wakeup_hydration_waiters(clone);
+}
+
+/*---------------------------------------------------------------------------*/
+
+static bool need_commit_due_to_time(struct clone *clone)
+{
+	return !time_in_range(jiffies, clone->last_commit_jiffies,
+			      clone->last_commit_jiffies + COMMIT_PERIOD);
+}
+
+/*
+ * A non-zero return indicates read-only or fail mode.
+ */
+static int commit_metadata(struct clone *clone)
+{
+	int r = 0;
+
+	mutex_lock(&clone->commit_lock);
+
+	if (!dm_clone_changed_this_transaction(clone->md))
+		goto out;
+
+	if (unlikely(get_clone_mode(clone) >= CM_READ_ONLY)) {
+		r = -EPERM;
+		goto out;
+	}
+
+	r = dm_clone_metadata_commit(clone->md);
+
+	if (unlikely(r)) {
+		__metadata_operation_failed(clone, "dm_clone_metadata_commit", r);
+		goto out;
+	}
+
+	if (dm_clone_is_hydration_done(clone->md))
+		dm_table_event(clone->ti->table);
+out:
+	mutex_unlock(&clone->commit_lock);
+
+	return r;
+}
+
+static void process_deferred_discards(struct clone *clone)
+{
+	int r = -EPERM;
+	struct bio *bio;
+	struct blk_plug plug;
+	unsigned long rs, re, flags;
+	struct bio_list discards = BIO_EMPTY_LIST;
+
+	spin_lock_irqsave(&clone->lock, flags);
+	bio_list_merge(&discards, &clone->deferred_discard_bios);
+	bio_list_init(&clone->deferred_discard_bios);
+	spin_unlock_irqrestore(&clone->lock, flags);
+
+	if (bio_list_empty(&discards))
+		return;
+
+	if (unlikely(get_clone_mode(clone) >= CM_READ_ONLY))
+		goto out;
+
+	/* Update the metadata */
+	bio_list_for_each(bio, &discards) {
+		bio_region_range(clone, bio, &rs, &re);
+		/*
+		 * A discard request might cover regions that have been already
+		 * hydrated. There is no need to update the metadata for these
+		 * regions.
+		 */
+		r = dm_clone_cond_set_range(clone->md, rs, re - rs);
+
+		if (unlikely(r))
+			break;
+	}
+out:
+	blk_start_plug(&plug);
+	while ((bio = bio_list_pop(&discards)))
+		complete_discard_bio(clone, bio, r == 0);
+	blk_finish_plug(&plug);
+}
+
+static void process_deferred_bios(struct clone *clone)
+{
+	unsigned long flags;
+	struct bio_list bios = BIO_EMPTY_LIST;
+
+	spin_lock_irqsave(&clone->lock, flags);
+	bio_list_merge(&bios, &clone->deferred_bios);
+	bio_list_init(&clone->deferred_bios);
+	spin_unlock_irqrestore(&clone->lock, flags);
+
+	if (bio_list_empty(&bios))
+		return;
+
+	submit_bios(&bios);
+}
+
+static void process_deferred_flush_bios(struct clone *clone)
+{
+	struct bio *bio;
+	unsigned long flags;
+	struct bio_list bios = BIO_EMPTY_LIST;
+	struct bio_list bio_completions = BIO_EMPTY_LIST;
+
+	/*
+	 * If there are any deferred flush bios, we must commit the metadata
+	 * before issuing them or signaling their completion.
+	 */
+	spin_lock_irqsave(&clone->lock, flags);
+	bio_list_merge(&bios, &clone->deferred_flush_bios);
+	bio_list_init(&clone->deferred_flush_bios);
+
+	bio_list_merge(&bio_completions, &clone->deferred_flush_completions);
+	bio_list_init(&clone->deferred_flush_completions);
+	spin_unlock_irqrestore(&clone->lock, flags);
+
+	if (bio_list_empty(&bios) && bio_list_empty(&bio_completions) &&
+	    !(dm_clone_changed_this_transaction(clone->md) && need_commit_due_to_time(clone)))
+		return;
+
+	if (commit_metadata(clone)) {
+		bio_list_merge(&bios, &bio_completions);
+
+		while ((bio = bio_list_pop(&bios)))
+			bio_io_error(bio);
+
+		return;
+	}
+
+	clone->last_commit_jiffies = jiffies;
+
+	while ((bio = bio_list_pop(&bio_completions)))
+		bio_endio(bio);
+
+	while ((bio = bio_list_pop(&bios)))
+		generic_make_request(bio);
+}
+
+static void do_worker(struct work_struct *work)
+{
+	struct clone *clone = container_of(work, typeof(*clone), worker);
+
+	process_deferred_bios(clone);
+	process_deferred_discards(clone);
+
+	/*
+	 * process_deferred_flush_bios():
+	 *
+	 *   - Commit metadata
+	 *
+	 *   - Process deferred REQ_FUA completions
+	 *
+	 *   - Process deferred REQ_PREFLUSH bios
+	 */
+	process_deferred_flush_bios(clone);
+
+	/* Background hydration */
+	do_hydration(clone);
+}
+
+/*
+ * Commit periodically so that not too much unwritten data builds up.
+ *
+ * Also, restart background hydration, if it has been stopped by in-flight I/O.
+ */
+static void do_waker(struct work_struct *work)
+{
+	struct clone *clone = container_of(to_delayed_work(work), struct clone, waker);
+
+	wake_worker(clone);
+	queue_delayed_work(clone->wq, &clone->waker, COMMIT_PERIOD);
+}
+
+/*---------------------------------------------------------------------------*/
+
+/*
+ * Target methods
+ */
+static int clone_map(struct dm_target *ti, struct bio *bio)
+{
+	struct clone *clone = ti->private;
+	unsigned long region_nr;
+
+	atomic_inc(&clone->ios_in_flight);
+
+	if (unlikely(get_clone_mode(clone) == CM_FAIL))
+		return DM_MAPIO_KILL;
+
+	/*
+	 * REQ_PREFLUSH bios carry no data:
+	 *
+	 * - Commit metadata, if changed
+	 *
+	 * - Pass down to destination device
+	 */
+	if (bio->bi_opf & REQ_PREFLUSH) {
+		remap_and_issue(clone, bio);
+		return DM_MAPIO_SUBMITTED;
+	}
+
+	bio->bi_iter.bi_sector = dm_target_offset(ti, bio->bi_iter.bi_sector);
+
+	/*
+	 * dm-clone interprets discards and performs a fast hydration of the
+	 * discarded regions, i.e., we skip the copy from the source device and
+	 * just mark the regions as hydrated.
+	 */
+	if (bio_op(bio) == REQ_OP_DISCARD) {
+		process_discard_bio(clone, bio);
+		return DM_MAPIO_SUBMITTED;
+	}
+
+	/*
+	 * If the bio's region is hydrated, redirect it to the destination
+	 * device.
+	 *
+	 * If the region is not hydrated and the bio is a READ, redirect it to
+	 * the source device.
+	 *
+	 * Else, defer WRITE bio until after its region has been hydrated and
+	 * start the region's hydration immediately.
+	 */
+	region_nr = bio_to_region(clone, bio);
+	if (dm_clone_is_region_hydrated(clone->md, region_nr)) {
+		remap_and_issue(clone, bio);
+		return DM_MAPIO_SUBMITTED;
+	} else if (bio_data_dir(bio) == READ) {
+		remap_to_source(clone, bio);
+		return DM_MAPIO_REMAPPED;
+	}
+
+	remap_to_dest(clone, bio);
+	hydrate_bio_region(clone, bio);
+
+	return DM_MAPIO_SUBMITTED;
+}
+
+static int clone_endio(struct dm_target *ti, struct bio *bio, blk_status_t *error)
+{
+	struct clone *clone = ti->private;
+
+	atomic_dec(&clone->ios_in_flight);
+
+	return DM_ENDIO_DONE;
+}
+
+static void emit_flags(struct clone *clone, char *result, unsigned int maxlen,
+		       ssize_t *sz_ptr)
+{
+	ssize_t sz = *sz_ptr;
+	unsigned int count;
+
+	count = !test_bit(DM_CLONE_HYDRATION_ENABLED, &clone->flags);
+	count += !test_bit(DM_CLONE_DISCARD_PASSDOWN, &clone->flags);
+
+	DMEMIT("%u ", count);
+
+	if (!test_bit(DM_CLONE_HYDRATION_ENABLED, &clone->flags))
+		DMEMIT("no_hydration ");
+
+	if (!test_bit(DM_CLONE_DISCARD_PASSDOWN, &clone->flags))
+		DMEMIT("no_discard_passdown ");
+
+	*sz_ptr = sz;
+}
+
+static void emit_core_args(struct clone *clone, char *result,
+			   unsigned int maxlen, ssize_t *sz_ptr)
+{
+	ssize_t sz = *sz_ptr;
+	unsigned int count = 4;
+
+	DMEMIT("%u hydration_threshold %u hydration_batch_size %u ", count,
+	       READ_ONCE(clone->hydration_threshold),
+	       READ_ONCE(clone->hydration_batch_size));
+
+	*sz_ptr = sz;
+}
+
+/*
+ * Status format:
+ *
+ * <metadata block size> <#used metadata blocks>/<#total metadata blocks>
+ * <clone region size> <#hydrated regions>/<#total regions> <#hydrating regions>
+ * <#features> <features>* <#core args> <core args>* <clone metadata mode>
+ */
+static void clone_status(struct dm_target *ti, status_type_t type,
+			 unsigned int status_flags, char *result,
+			 unsigned int maxlen)
+{
+	int r;
+	unsigned int i;
+	ssize_t sz = 0;
+	dm_block_t nr_free_metadata_blocks = 0;
+	dm_block_t nr_metadata_blocks = 0;
+	char buf[BDEVNAME_SIZE];
+	struct clone *clone = ti->private;
+
+	switch (type) {
+	case STATUSTYPE_INFO:
+		if (get_clone_mode(clone) == CM_FAIL) {
+			DMEMIT("Fail");
+			break;
+		}
+
+		/* Commit to ensure statistics aren't out-of-date */
+		if (!(status_flags & DM_STATUS_NOFLUSH_FLAG) && !dm_suspended(ti))
+			(void) commit_metadata(clone);
+
+		r = dm_clone_get_free_metadata_block_count(clone->md, &nr_free_metadata_blocks);
+
+		if (r) {
+			DMERR("%s: dm_clone_get_free_metadata_block_count returned %d",
+			      clone_device_name(clone), r);
+			goto error;
+		}
+
+		r = dm_clone_get_metadata_dev_size(clone->md, &nr_metadata_blocks);
+
+		if (r) {
+			DMERR("%s: dm_clone_get_metadata_dev_size returned %d",
+			      clone_device_name(clone), r);
+			goto error;
+		}
+
+		DMEMIT("%u %llu/%llu %llu %lu/%lu %u ",
+		       DM_CLONE_METADATA_BLOCK_SIZE,
+		       (unsigned long long)(nr_metadata_blocks - nr_free_metadata_blocks),
+		       (unsigned long long)nr_metadata_blocks,
+		       (unsigned long long)clone->region_size,
+		       dm_clone_nr_of_hydrated_regions(clone->md),
+		       clone->nr_regions,
+		       atomic_read(&clone->hydrations_in_flight));
+
+		emit_flags(clone, result, maxlen, &sz);
+		emit_core_args(clone, result, maxlen, &sz);
+
+		switch (get_clone_mode(clone)) {
+		case CM_WRITE:
+			DMEMIT("rw");
+			break;
+		case CM_READ_ONLY:
+			DMEMIT("ro");
+			break;
+		case CM_FAIL:
+			DMEMIT("Fail");
+		}
+
+		break;
+
+	case STATUSTYPE_TABLE:
+		format_dev_t(buf, clone->metadata_dev->bdev->bd_dev);
+		DMEMIT("%s ", buf);
+
+		format_dev_t(buf, clone->dest_dev->bdev->bd_dev);
+		DMEMIT("%s ", buf);
+
+		format_dev_t(buf, clone->source_dev->bdev->bd_dev);
+		DMEMIT("%s", buf);
+
+		for (i = 0; i < clone->nr_ctr_args; i++)
+			DMEMIT(" %s", clone->ctr_args[i]);
+	}
+
+	return;
+
+error:
+	DMEMIT("Error");
+}
+
+static int clone_is_congested(struct dm_target_callbacks *cb, int bdi_bits)
+{
+	struct request_queue *dest_q, *source_q;
+	struct clone *clone = container_of(cb, struct clone, callbacks);
+
+	source_q = bdev_get_queue(clone->source_dev->bdev);
+	dest_q = bdev_get_queue(clone->dest_dev->bdev);
+
+	return (bdi_congested(dest_q->backing_dev_info, bdi_bits) |
+		bdi_congested(source_q->backing_dev_info, bdi_bits));
+}
+
+static sector_t get_dev_size(struct dm_dev *dev)
+{
+	return i_size_read(dev->bdev->bd_inode) >> SECTOR_SHIFT;
+}
+
+/*---------------------------------------------------------------------------*/
+
+/*
+ * Construct a clone device mapping:
+ *
+ * clone <metadata dev> <destination dev> <source dev> <region size>
+ *	[<#feature args> [<feature arg>]* [<#core args> [key value]*]]
+ *
+ * metadata dev: Fast device holding the persistent metadata
+ * destination dev: The destination device, which will become a clone of the
+ *                  source device
+ * source dev: The read-only source device that gets cloned
+ * region size: dm-clone unit size in sectors
+ *
+ * #feature args: Number of feature arguments passed
+ * feature args: E.g. no_hydration, no_discard_passdown
+ *
+ * #core arguments: An even number of core arguments
+ * core arguments: Key/value pairs for tuning the core
+ *		   E.g. 'hydration_threshold 256'
+ */
+static int parse_feature_args(struct dm_arg_set *as, struct clone *clone)
+{
+	int r;
+	unsigned int argc;
+	const char *arg_name;
+	struct dm_target *ti = clone->ti;
+
+	const struct dm_arg args = {
+		.min = 0,
+		.max = 2,
+		.error = "Invalid number of feature arguments"
+	};
+
+	/* No feature arguments supplied */
+	if (!as->argc)
+		return 0;
+
+	r = dm_read_arg_group(&args, as, &argc, &ti->error);
+	if (r)
+		return r;
+
+	while (argc) {
+		arg_name = dm_shift_arg(as);
+		argc--;
+
+		if (!strcasecmp(arg_name, "no_hydration")) {
+			__clear_bit(DM_CLONE_HYDRATION_ENABLED, &clone->flags);
+		} else if (!strcasecmp(arg_name, "no_discard_passdown")) {
+			__clear_bit(DM_CLONE_DISCARD_PASSDOWN, &clone->flags);
+		} else {
+			ti->error = "Invalid feature argument";
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static int parse_core_args(struct dm_arg_set *as, struct clone *clone)
+{
+	int r;
+	unsigned int argc;
+	unsigned int value;
+	const char *arg_name;
+	struct dm_target *ti = clone->ti;
+
+	const struct dm_arg args = {
+		.min = 0,
+		.max = 4,
+		.error = "Invalid number of core arguments"
+	};
+
+	/* Initialize core arguments */
+	clone->hydration_batch_size = DEFAULT_HYDRATION_BATCH_SIZE;
+	clone->hydration_threshold = DEFAULT_HYDRATION_THRESHOLD;
+
+	/* No core arguments supplied */
+	if (!as->argc)
+		return 0;
+
+	r = dm_read_arg_group(&args, as, &argc, &ti->error);
+	if (r)
+		return r;
+
+	if (argc & 1) {
+		ti->error = "Number of core arguments must be even";
+		return -EINVAL;
+	}
+
+	while (argc) {
+		arg_name = dm_shift_arg(as);
+		argc -= 2;
+
+		if (!strcasecmp(arg_name, "hydration_threshold")) {
+			if (kstrtouint(dm_shift_arg(as), 10, &value)) {
+				ti->error = "Invalid value for argument `hydration_threshold'";
+				return -EINVAL;
+			}
+			clone->hydration_threshold = value;
+		} else if (!strcasecmp(arg_name, "hydration_batch_size")) {
+			if (kstrtouint(dm_shift_arg(as), 10, &value)) {
+				ti->error = "Invalid value for argument `hydration_batch_size'";
+				return -EINVAL;
+			}
+			clone->hydration_batch_size = value;
+		} else {
+			ti->error = "Invalid core argument";
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static int parse_region_size(struct clone *clone, struct dm_arg_set *as, char **error)
+{
+	int r;
+	unsigned int region_size;
+	struct dm_arg arg;
+
+	arg.min = MIN_REGION_SIZE;
+	arg.max = MAX_REGION_SIZE;
+	arg.error = "Invalid region size";
+
+	r = dm_read_arg(&arg, as, &region_size, error);
+	if (r)
+		return r;
+
+	/* Check region size is a power of 2 */
+	if (!is_power_of_2(region_size)) {
+		*error = "Region size is not a power of 2";
+		return -EINVAL;
+	}
+
+	/* Validate the region size against the device logical block size */
+	if (region_size % (bdev_logical_block_size(clone->source_dev->bdev) >> 9) ||
+	    region_size % (bdev_logical_block_size(clone->dest_dev->bdev) >> 9)) {
+		*error = "Region size is not a multiple of device logical block size";
+		return -EINVAL;
+	}
+
+	clone->region_size = region_size;
+
+	return 0;
+}
+
+static int validate_nr_regions(unsigned long n, char **error)
+{
+	/*
+	 * dm_bitset restricts us to 2^32 regions. test_bit & co. restrict us
+	 * further to 2^31 regions.
+	 */
+	if (n > (1UL << 31)) {
+		*error = "Too many regions. Consider increasing the region size";
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int parse_metadata_dev(struct clone *clone, struct dm_arg_set *as, char **error)
+{
+	int r;
+	sector_t metadata_dev_size;
+	char b[BDEVNAME_SIZE];
+
+	r = dm_get_device(clone->ti, dm_shift_arg(as), FMODE_READ | FMODE_WRITE,
+			  &clone->metadata_dev);
+	if (r) {
+		*error = "Error opening metadata device";
+		return r;
+	}
+
+	metadata_dev_size = get_dev_size(clone->metadata_dev);
+	if (metadata_dev_size > DM_CLONE_METADATA_MAX_SECTORS_WARNING)
+		DMWARN("Metadata device %s is larger than %u sectors: excess space will not be used.",
+		       bdevname(clone->metadata_dev->bdev, b), DM_CLONE_METADATA_MAX_SECTORS);
+
+	return 0;
+}
+
+static int parse_dest_dev(struct clone *clone, struct dm_arg_set *as, char **error)
+{
+	int r;
+	sector_t dest_dev_size;
+
+	r = dm_get_device(clone->ti, dm_shift_arg(as), FMODE_READ | FMODE_WRITE,
+			  &clone->dest_dev);
+	if (r) {
+		*error = "Error opening destination device";
+		return r;
+	}
+
+	dest_dev_size = get_dev_size(clone->dest_dev);
+	if (dest_dev_size < clone->ti->len) {
+		dm_put_device(clone->ti, clone->dest_dev);
+		*error = "Device size larger than destination device";
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int parse_source_dev(struct clone *clone, struct dm_arg_set *as, char **error)
+{
+	int r;
+	sector_t source_dev_size;
+
+	r = dm_get_device(clone->ti, dm_shift_arg(as), FMODE_READ,
+			  &clone->source_dev);
+	if (r) {
+		*error = "Error opening source device";
+		return r;
+	}
+
+	source_dev_size = get_dev_size(clone->source_dev);
+	if (source_dev_size < clone->ti->len) {
+		dm_put_device(clone->ti, clone->source_dev);
+		*error = "Device size larger than source device";
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int copy_ctr_args(struct clone *clone, int argc, const char **argv, char **error)
+{
+	unsigned int i;
+	const char **copy;
+
+	copy = kcalloc(argc, sizeof(*copy), GFP_KERNEL);
+	if (!copy)
+		goto error;
+
+	for (i = 0; i < argc; i++) {
+		copy[i] = kstrdup(argv[i], GFP_KERNEL);
+
+		if (!copy[i]) {
+			while (i--)
+				kfree(copy[i]);
+			kfree(copy);
+			goto error;
+		}
+	}
+
+	clone->nr_ctr_args = argc;
+	clone->ctr_args = copy;
+	return 0;
+
+error:
+	*error = "Failed to allocate memory for table line";
+	return -ENOMEM;
+}
+
+static int clone_ctr(struct dm_target *ti, unsigned int argc, char **argv)
+{
+	int r;
+	struct clone *clone;
+	struct dm_arg_set as;
+
+	if (argc < 4) {
+		ti->error = "Invalid number of arguments";
+		return -EINVAL;
+	}
+
+	as.argc = argc;
+	as.argv = argv;
+
+	clone = kzalloc(sizeof(*clone), GFP_KERNEL);
+	if (!clone) {
+		ti->error = "Failed to allocate clone structure";
+		return -ENOMEM;
+	}
+
+	clone->ti = ti;
+
+	/* Initialize dm-clone flags */
+	__set_bit(DM_CLONE_HYDRATION_ENABLED, &clone->flags);
+	__set_bit(DM_CLONE_HYDRATION_SUSPENDED, &clone->flags);
+	__set_bit(DM_CLONE_DISCARD_PASSDOWN, &clone->flags);
+
+	r = parse_metadata_dev(clone, &as, &ti->error);
+	if (r)
+		goto out_with_clone;
+
+	r = parse_dest_dev(clone, &as, &ti->error);
+	if (r)
+		goto out_with_meta_dev;
+
+	r = parse_source_dev(clone, &as, &ti->error);
+	if (r)
+		goto out_with_dest_dev;
+
+	r = parse_region_size(clone, &as, &ti->error);
+	if (r)
+		goto out_with_source_dev;
+
+	clone->region_shift = __ffs(clone->region_size);
+	clone->nr_regions = dm_sector_div_up(ti->len, clone->region_size);
+
+	r = validate_nr_regions(clone->nr_regions, &ti->error);
+	if (r)
+		goto out_with_source_dev;
+
+	r = dm_set_target_max_io_len(ti, clone->region_size);
+	if (r) {
+		ti->error = "Failed to set max io len";
+		goto out_with_source_dev;
+	}
+
+	r = parse_feature_args(&as, clone);
+	if (r)
+		goto out_with_source_dev;
+
+	r = parse_core_args(&as, clone);
+	if (r)
+		goto out_with_source_dev;
+
+	/* Load metadata */
+	clone->md = dm_clone_metadata_open(clone->metadata_dev->bdev, ti->len,
+					   clone->region_size);
+	if (IS_ERR(clone->md)) {
+		ti->error = "Failed to load metadata";
+		r = PTR_ERR(clone->md);
+		goto out_with_source_dev;
+	}
+
+	__set_clone_mode(clone, CM_WRITE);
+
+	if (get_clone_mode(clone) != CM_WRITE) {
+		ti->error = "Unable to get write access to metadata, please check/repair metadata";
+		r = -EPERM;
+		goto out_with_metadata;
+	}
+
+	clone->last_commit_jiffies = jiffies;
+
+	/* Allocate hydration hash table */
+	r = hash_table_init(clone);
+	if (r) {
+		ti->error = "Failed to allocate hydration hash table";
+		goto out_with_metadata;
+	}
+
+	atomic_set(&clone->ios_in_flight, 0);
+	init_waitqueue_head(&clone->hydration_stopped);
+	spin_lock_init(&clone->lock);
+	bio_list_init(&clone->deferred_bios);
+	bio_list_init(&clone->deferred_discard_bios);
+	bio_list_init(&clone->deferred_flush_bios);
+	bio_list_init(&clone->deferred_flush_completions);
+	clone->hydration_offset = 0;
+	atomic_set(&clone->hydrations_in_flight, 0);
+
+	clone->wq = alloc_workqueue("dm-" DM_MSG_PREFIX, WQ_MEM_RECLAIM, 0);
+	if (!clone->wq) {
+		ti->error = "Failed to allocate workqueue";
+		r = -ENOMEM;
+		goto out_with_ht;
+	}
+
+	INIT_WORK(&clone->worker, do_worker);
+	INIT_DELAYED_WORK(&clone->waker, do_waker);
+
+	clone->kcopyd_client = dm_kcopyd_client_create(&dm_kcopyd_throttle);
+	if (IS_ERR(clone->kcopyd_client)) {
+		r = PTR_ERR(clone->kcopyd_client);
+		goto out_with_wq;
+	}
+
+	r = mempool_init_slab_pool(&clone->hydration_pool, MIN_HYDRATIONS,
+				   _hydration_cache);
+	if (r) {
+		ti->error = "Failed to create dm_clone_region_hydration memory pool";
+		goto out_with_kcopyd;
+	}
+
+	/* Save a copy of the table line */
+	r = copy_ctr_args(clone, argc - 3, (const char **)argv + 3, &ti->error);
+	if (r)
+		goto out_with_mempool;
+
+	mutex_init(&clone->commit_lock);
+	clone->callbacks.congested_fn = clone_is_congested;
+	dm_table_add_target_callbacks(ti->table, &clone->callbacks);
+
+	/* Enable flushes */
+	ti->num_flush_bios = 1;
+	ti->flush_supported = true;
+
+	/* Enable discards */
+	ti->discards_supported = true;
+	ti->num_discard_bios = 1;
+
+	ti->private = clone;
+
+	return 0;
+
+out_with_mempool:
+	mempool_exit(&clone->hydration_pool);
+out_with_kcopyd:
+	dm_kcopyd_client_destroy(clone->kcopyd_client);
+out_with_wq:
+	destroy_workqueue(clone->wq);
+out_with_ht:
+	hash_table_exit(clone);
+out_with_metadata:
+	dm_clone_metadata_close(clone->md);
+out_with_source_dev:
+	dm_put_device(ti, clone->source_dev);
+out_with_dest_dev:
+	dm_put_device(ti, clone->dest_dev);
+out_with_meta_dev:
+	dm_put_device(ti, clone->metadata_dev);
+out_with_clone:
+	kfree(clone);
+
+	return r;
+}
+
+static void clone_dtr(struct dm_target *ti)
+{
+	unsigned int i;
+	struct clone *clone = ti->private;
+
+	mutex_destroy(&clone->commit_lock);
+
+	for (i = 0; i < clone->nr_ctr_args; i++)
+		kfree(clone->ctr_args[i]);
+	kfree(clone->ctr_args);
+
+	mempool_exit(&clone->hydration_pool);
+	dm_kcopyd_client_destroy(clone->kcopyd_client);
+	destroy_workqueue(clone->wq);
+	hash_table_exit(clone);
+	dm_clone_metadata_close(clone->md);
+	dm_put_device(ti, clone->source_dev);
+	dm_put_device(ti, clone->dest_dev);
+	dm_put_device(ti, clone->metadata_dev);
+
+	kfree(clone);
+}
+
+/*---------------------------------------------------------------------------*/
+
+static void clone_postsuspend(struct dm_target *ti)
+{
+	struct clone *clone = ti->private;
+
+	/*
+	 * To successfully suspend the device:
+	 *
+	 *	- We cancel the delayed work for periodic commits and wait for
+	 *	  it to finish.
+	 *
+	 *	- We stop the background hydration, i.e. we prevent new region
+	 *	  hydrations from starting.
+	 *
+	 *	- We wait for any in-flight hydrations to finish.
+	 *
+	 *	- We flush the workqueue.
+	 *
+	 *	- We commit the metadata.
+	 */
+	cancel_delayed_work_sync(&clone->waker);
+
+	set_bit(DM_CLONE_HYDRATION_SUSPENDED, &clone->flags);
+
+	/*
+	 * Make sure set_bit() is ordered before atomic_read(), otherwise we
+	 * might race with do_hydration() and miss some started region
+	 * hydrations.
+	 *
+	 * This is paired with smp_mb__after_atomic() in do_hydration().
+	 */
+	smp_mb__after_atomic();
+
+	wait_event(clone->hydration_stopped, !atomic_read(&clone->hydrations_in_flight));
+	flush_workqueue(clone->wq);
+
+	(void) commit_metadata(clone);
+}
+
+static void clone_resume(struct dm_target *ti)
+{
+	struct clone *clone = ti->private;
+
+	clear_bit(DM_CLONE_HYDRATION_SUSPENDED, &clone->flags);
+	do_waker(&clone->waker.work);
+}
+
+static bool bdev_supports_discards(struct block_device *bdev)
+{
+	struct request_queue *q = bdev_get_queue(bdev);
+
+	return (q && blk_queue_discard(q));
+}
+
+/*
+ * If discard_passdown was enabled verify that the destination device supports
+ * discards. Disable discard_passdown if not.
+ */
+static void disable_passdown_if_not_supported(struct clone *clone)
+{
+	struct block_device *dest_dev = clone->dest_dev->bdev;
+	struct queue_limits *dest_limits = &bdev_get_queue(dest_dev)->limits;
+	const char *reason = NULL;
+	char buf[BDEVNAME_SIZE];
+
+	if (!test_bit(DM_CLONE_DISCARD_PASSDOWN, &clone->flags))
+		return;
+
+	if (!bdev_supports_discards(dest_dev))
+		reason = "discard unsupported";
+	else if (dest_limits->max_discard_sectors < clone->region_size)
+		reason = "max discard sectors smaller than a region";
+
+	if (reason) {
+		DMWARN("Destination device (%s) %s: Disabling discard passdown.",
+		       bdevname(dest_dev, buf), reason);
+		clear_bit(DM_CLONE_DISCARD_PASSDOWN, &clone->flags);
+	}
+}
+
+static void set_discard_limits(struct clone *clone, struct queue_limits *limits)
+{
+	struct block_device *dest_bdev = clone->dest_dev->bdev;
+	struct queue_limits *dest_limits = &bdev_get_queue(dest_bdev)->limits;
+
+	if (!test_bit(DM_CLONE_DISCARD_PASSDOWN, &clone->flags)) {
+		/* No passdown is done so we set our own virtual limits */
+		limits->discard_granularity = clone->region_size << SECTOR_SHIFT;
+		limits->max_discard_sectors = round_down(UINT_MAX >> SECTOR_SHIFT, clone->region_size);
+		return;
+	}
+
+	/*
+	 * clone_iterate_devices() is stacking both the source and destination
+	 * device limits but discards aren't passed to the source device, so
+	 * inherit destination's limits.
+	 */
+	limits->max_discard_sectors = dest_limits->max_discard_sectors;
+	limits->max_hw_discard_sectors = dest_limits->max_hw_discard_sectors;
+	limits->discard_granularity = dest_limits->discard_granularity;
+	limits->discard_alignment = dest_limits->discard_alignment;
+	limits->discard_misaligned = dest_limits->discard_misaligned;
+	limits->max_discard_segments = dest_limits->max_discard_segments;
+}
+
+static void clone_io_hints(struct dm_target *ti, struct queue_limits *limits)
+{
+	struct clone *clone = ti->private;
+	u64 io_opt_sectors = limits->io_opt >> SECTOR_SHIFT;
+
+	/*
+	 * If the system-determined stacked limits are compatible with
+	 * dm-clone's region size (io_opt is a factor) do not override them.
+	 */
+	if (io_opt_sectors < clone->region_size ||
+	    do_div(io_opt_sectors, clone->region_size)) {
+		blk_limits_io_min(limits, clone->region_size << SECTOR_SHIFT);
+		blk_limits_io_opt(limits, clone->region_size << SECTOR_SHIFT);
+	}
+
+	disable_passdown_if_not_supported(clone);
+	set_discard_limits(clone, limits);
+}
+
+static int clone_iterate_devices(struct dm_target *ti,
+				 iterate_devices_callout_fn fn, void *data)
+{
+	int ret;
+	struct clone *clone = ti->private;
+	struct dm_dev *dest_dev = clone->dest_dev;
+	struct dm_dev *source_dev = clone->source_dev;
+
+	ret = fn(ti, source_dev, 0, ti->len, data);
+	if (!ret)
+		ret = fn(ti, dest_dev, 0, ti->len, data);
+	return ret;
+}
+
+/*
+ * dm-clone message functions.
+ */
+static void set_hydration_threshold(struct clone *clone, unsigned int nr_regions)
+{
+	WRITE_ONCE(clone->hydration_threshold, nr_regions);
+
+	/*
+	 * If user space sets hydration_threshold to zero then the hydration
+	 * will stop. If at a later time the hydration_threshold is increased
+	 * we must restart the hydration process by waking up the worker.
+	 */
+	wake_worker(clone);
+}
+
+static void set_hydration_batch_size(struct clone *clone, unsigned int nr_regions)
+{
+	WRITE_ONCE(clone->hydration_batch_size, nr_regions);
+}
+
+static void enable_hydration(struct clone *clone)
+{
+	if (!test_and_set_bit(DM_CLONE_HYDRATION_ENABLED, &clone->flags))
+		wake_worker(clone);
+}
+
+static void disable_hydration(struct clone *clone)
+{
+	clear_bit(DM_CLONE_HYDRATION_ENABLED, &clone->flags);
+}
+
+static int clone_message(struct dm_target *ti, unsigned int argc, char **argv,
+			 char *result, unsigned int maxlen)
+{
+	struct clone *clone = ti->private;
+	unsigned int value;
+
+	if (!argc)
+		return -EINVAL;
+
+	if (!strcasecmp(argv[0], "enable_hydration")) {
+		enable_hydration(clone);
+		return 0;
+	}
+
+	if (!strcasecmp(argv[0], "disable_hydration")) {
+		disable_hydration(clone);
+		return 0;
+	}
+
+	if (argc != 2)
+		return -EINVAL;
+
+	if (!strcasecmp(argv[0], "hydration_threshold")) {
+		if (kstrtouint(argv[1], 10, &value))
+			return -EINVAL;
+
+		set_hydration_threshold(clone, value);
+
+		return 0;
+	}
+
+	if (!strcasecmp(argv[0], "hydration_batch_size")) {
+		if (kstrtouint(argv[1], 10, &value))
+			return -EINVAL;
+
+		set_hydration_batch_size(clone, value);
+
+		return 0;
+	}
+
+	DMERR("%s: Unsupported message `%s'", clone_device_name(clone), argv[0]);
+	return -EINVAL;
+}
+
+static struct target_type clone_target = {
+	.name = "clone",
+	.version = {1, 0, 0},
+	.module = THIS_MODULE,
+	.ctr = clone_ctr,
+	.dtr =  clone_dtr,
+	.map = clone_map,
+	.end_io = clone_endio,
+	.postsuspend = clone_postsuspend,
+	.resume = clone_resume,
+	.status = clone_status,
+	.message = clone_message,
+	.io_hints = clone_io_hints,
+	.iterate_devices = clone_iterate_devices,
+};
+
+/*---------------------------------------------------------------------------*/
+
+/* Module functions */
+static int __init dm_clone_init(void)
+{
+	int r;
+
+	_hydration_cache = KMEM_CACHE(dm_clone_region_hydration, 0);
+	if (!_hydration_cache)
+		return -ENOMEM;
+
+	r = dm_register_target(&clone_target);
+	if (r < 0) {
+		DMERR("Failed to register clone target");
+		return r;
+	}
+
+	return 0;
+}
+
+static void __exit dm_clone_exit(void)
+{
+	dm_unregister_target(&clone_target);
+
+	kmem_cache_destroy(_hydration_cache);
+	_hydration_cache = NULL;
+}
+
+/* Module hooks */
+module_init(dm_clone_init);
+module_exit(dm_clone_exit);
+
+MODULE_DESCRIPTION(DM_NAME " clone target");
+MODULE_AUTHOR("Nikos Tsironis <ntsironis@arrikto.com>");
+MODULE_LICENSE("GPL");
-- 
2.11.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
