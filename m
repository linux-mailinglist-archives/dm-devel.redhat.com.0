Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B6942E2E
	for <lists+dm-devel@lfdr.de>; Wed, 12 Jun 2019 19:59:24 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 175AD7FDFD;
	Wed, 12 Jun 2019 17:58:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB82A60F8D;
	Wed, 12 Jun 2019 17:58:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5A549206D1;
	Wed, 12 Jun 2019 17:57:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5CHrjNT009591 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Jun 2019 13:53:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BAB315DF5F; Wed, 12 Jun 2019 17:53:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24B285D9CA;
	Wed, 12 Jun 2019 17:53:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 485F030BBE94;
	Wed, 12 Jun 2019 17:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wQr0FWQH8bToDjE3eByMnl7t1LSNFZOOLFhvUg5tMzU=;
	b=oRR43XIZj6KTFvqtaKjjAMtG/B
	g8n6ssvdjyh6VjSwah13sHfU7ea+kZ1h5tS/EqA+LMkmVsYm7RqgM2iArFDHp2JwrHEGBCgOaO9LO
	Q5bPkxIgze2AsGiAJsu8D+Q4EySZ1h0SCNjPTfDc3qY481+90HrOexNNkOG85E5nvFjwvXtiZHKVg
	udJbPqMyDsYW3rPlUYFXTFvcqfn34dAuUWmxGdkBCqhijNX5kcmVkjqBifz0xdVrTrlyG+EbOYCXC
	4Yyc3CAWy1T/rVEIAOEIwZgqQHdIQjQyZEHXY9RGlsuQy7sIEMus/Ro2d35gXFZYN353qmzK3a9Tt
	gz8WesYQ==;
Received: from 201.86.169.251.dynamic.adsl.gvt.net.br ([201.86.169.251]
	helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1hb7Qt-0002DX-5r; Wed, 12 Jun 2019 17:53:13 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
	(envelope-from <mchehab@bombadil.infradead.org>)
	id 1hb7Qq-0001g5-4y; Wed, 12 Jun 2019 14:53:08 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Date: Wed, 12 Jun 2019 14:52:43 -0300
Message-Id: <dfb3cf4d5be90b0e1f12af85698ce9e8a712eb71.1560361364.git.mchehab+samsung@kernel.org>
In-Reply-To: <cover.1560361364.git.mchehab+samsung@kernel.org>
References: <cover.1560361364.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.49]); Wed, 12 Jun 2019 17:53:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Wed, 12 Jun 2019 17:53:24 +0000 (UTC) for IP:'198.137.202.133'
	DOMAIN:'bombadil.infradead.org' HELO:'bombadil.infradead.org'
	FROM:'mchehab@bombadil.infradead.org' RCPT:''
X-RedHat-Spam-Score: -2.047  (DKIM_SIGNED, DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS, LOTS_OF_MONEY, RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,
	SPF_NONE) 198.137.202.133 bombadil.infradead.org 198.137.202.133
	bombadil.infradead.org <mchehab@bombadil.infradead.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <snitzer@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@infradead.org>,
	linux-raid@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
	dm-devel@redhat.com, Mark Brown <broonie@kernel.org>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	Shaohua Li <shli@kernel.org>, Alasdair Kergon <agk@redhat.com>
Subject: [dm-devel] [PATCH v4 07/28] docs: convert docs to ReST and rename
	to *.rst
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Wed, 12 Jun 2019 17:59:23 +0000 (UTC)

The conversion is actually:
  - add blank lines and indentation in order to identify paragraphs;
  - fix tables markups;
  - add some lists markups;
  - mark literal blocks;
  - adjust title markups.

At its new index.rst, let's add a :orphan: while this is not linked to
the main index.rst file, in order to avoid build warnings.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Acked-by: Mark Brown <broonie@kernel.org>
---
 ...{cache-policies.txt => cache-policies.rst} |  24 +-
 .../device-mapper/{cache.txt => cache.rst}    | 206 +++++++++-------
 .../device-mapper/{delay.txt => delay.rst}    |  29 ++-
 .../{dm-crypt.txt => dm-crypt.rst}            |  57 +++--
 .../{dm-flakey.txt => dm-flakey.rst}          |  45 ++--
 .../{dm-init.txt => dm-init.rst}              |  75 +++---
 .../{dm-integrity.txt => dm-integrity.rst}    |  62 +++--
 .../device-mapper/{dm-io.txt => dm-io.rst}    |  14 +-
 .../device-mapper/{dm-log.txt => dm-log.rst}  |   5 +-
 ...m-queue-length.txt => dm-queue-length.rst} |  25 +-
 .../{dm-raid.txt => dm-raid.rst}              | 225 +++++++++++-------
 ...m-service-time.txt => dm-service-time.rst} |  68 +++---
 Documentation/device-mapper/dm-uevent.rst     | 110 +++++++++
 Documentation/device-mapper/dm-uevent.txt     |  97 --------
 .../{dm-zoned.txt => dm-zoned.rst}            |  10 +-
 .../device-mapper/{era.txt => era.rst}        |  36 +--
 Documentation/device-mapper/index.rst         |  44 ++++
 .../device-mapper/{kcopyd.txt => kcopyd.rst}  |  10 +-
 Documentation/device-mapper/linear.rst        |  63 +++++
 Documentation/device-mapper/linear.txt        |  61 -----
 .../{log-writes.txt => log-writes.rst}        |  91 +++----
 ...ersistent-data.txt => persistent-data.rst} |   4 +
 .../{snapshot.txt => snapshot.rst}            | 116 ++++-----
 .../{statistics.txt => statistics.rst}        |  62 ++---
 Documentation/device-mapper/striped.rst       |  61 +++++
 Documentation/device-mapper/striped.txt       |  57 -----
 .../device-mapper/{switch.txt => switch.rst}  |  47 ++--
 ...provisioning.txt => thin-provisioning.rst} |  68 ++++--
 .../{unstriped.txt => unstriped.rst}          | 111 +++++----
 .../device-mapper/{verity.txt => verity.rst}  |  20 +-
 .../{writecache.txt => writecache.rst}        |  13 +-
 .../device-mapper/{zero.txt => zero.rst}      |  14 +-
 .../filesystems/ubifs-authentication.md       |   4 +-
 drivers/md/Kconfig                            |   2 +-
 drivers/md/dm-init.c                          |   2 +-
 drivers/md/dm-raid.c                          |   2 +-
 36 files changed, 1134 insertions(+), 806 deletions(-)
 rename Documentation/device-mapper/{cache-policies.txt => cache-policies.rst} (94%)
 rename Documentation/device-mapper/{cache.txt => cache.rst} (61%)
 rename Documentation/device-mapper/{delay.txt => delay.rst} (53%)
 rename Documentation/device-mapper/{dm-crypt.txt => dm-crypt.rst} (87%)
 rename Documentation/device-mapper/{dm-flakey.txt => dm-flakey.rst} (60%)
 rename Documentation/device-mapper/{dm-init.txt => dm-init.rst} (69%)
 rename Documentation/device-mapper/{dm-integrity.txt => dm-integrity.rst} (90%)
 rename Documentation/device-mapper/{dm-io.txt => dm-io.rst} (92%)
 rename Documentation/device-mapper/{dm-log.txt => dm-log.rst} (90%)
 rename Documentation/device-mapper/{dm-queue-length.txt => dm-queue-length.rst} (76%)
 rename Documentation/device-mapper/{dm-raid.txt => dm-raid.rst} (71%)
 rename Documentation/device-mapper/{dm-service-time.txt => dm-service-time.rst} (60%)
 create mode 100644 Documentation/device-mapper/dm-uevent.rst
 delete mode 100644 Documentation/device-mapper/dm-uevent.txt
 rename Documentation/device-mapper/{dm-zoned.txt => dm-zoned.rst} (97%)
 rename Documentation/device-mapper/{era.txt => era.rst} (70%)
 create mode 100644 Documentation/device-mapper/index.rst
 rename Documentation/device-mapper/{kcopyd.txt => kcopyd.rst} (93%)
 create mode 100644 Documentation/device-mapper/linear.rst
 delete mode 100644 Documentation/device-mapper/linear.txt
 rename Documentation/device-mapper/{log-writes.txt => log-writes.rst} (61%)
 rename Documentation/device-mapper/{persistent-data.txt => persistent-data.rst} (98%)
 rename Documentation/device-mapper/{snapshot.txt => snapshot.rst} (62%)
 rename Documentation/device-mapper/{statistics.txt => statistics.rst} (87%)
 create mode 100644 Documentation/device-mapper/striped.rst
 delete mode 100644 Documentation/device-mapper/striped.txt
 rename Documentation/device-mapper/{switch.txt => switch.rst} (84%)
 rename Documentation/device-mapper/{thin-provisioning.txt => thin-provisioning.rst} (92%)
 rename Documentation/device-mapper/{unstriped.txt => unstriped.rst} (60%)
 rename Documentation/device-mapper/{verity.txt => verity.rst} (98%)
 rename Documentation/device-mapper/{writecache.txt => writecache.rst} (96%)
 rename Documentation/device-mapper/{zero.txt => zero.rst} (83%)

diff --git a/Documentation/device-mapper/cache-policies.txt b/Documentation/device-mapper/cache-policies.rst
similarity index 94%
rename from Documentation/device-mapper/cache-policies.txt
rename to Documentation/device-mapper/cache-policies.rst
index 86786d87d9a8..b17fe352fc41 100644
--- a/Documentation/device-mapper/cache-policies.txt
+++ b/Documentation/device-mapper/cache-policies.rst
@@ -1,3 +1,4 @@
+=============================
 Guidance for writing policies
 =============================
 
@@ -30,7 +31,7 @@ multiqueue (mq)
 
 This policy is now an alias for smq (see below).
 
-The following tunables are accepted, but have no effect:
+The following tunables are accepted, but have no effect::
 
 	'sequential_threshold <#nr_sequential_ios>'
 	'random_threshold <#nr_random_ios>'
@@ -56,7 +57,9 @@ mq policy's hints to be dropped.  Also, performance of the cache may
 degrade slightly until smq recalculates the origin device's hotspots
 that should be cached.
 
-Memory usage:
+Memory usage
+^^^^^^^^^^^^
+
 The mq policy used a lot of memory; 88 bytes per cache block on a 64
 bit machine.
 
@@ -69,7 +72,9 @@ cache block).
 All this means smq uses ~25bytes per cache block.  Still a lot of
 memory, but a substantial improvement nontheless.
 
-Level balancing:
+Level balancing
+^^^^^^^^^^^^^^^
+
 mq placed entries in different levels of the multiqueue structures
 based on their hit count (~ln(hit count)).  This meant the bottom
 levels generally had the most entries, and the top ones had very
@@ -94,7 +99,9 @@ is used to decide which blocks to promote.  If the hotspot queue is
 performing badly then it starts moving entries more quickly between
 levels.  This lets it adapt to new IO patterns very quickly.
 
-Performance:
+Performance
+^^^^^^^^^^^
+
 Testing smq shows substantially better performance than mq.
 
 cleaner
@@ -105,16 +112,19 @@ The cleaner writes back all dirty blocks in a cache to decommission it.
 Examples
 ========
 
-The syntax for a table is:
+The syntax for a table is::
+
 	cache <metadata dev> <cache dev> <origin dev> <block size>
 	<#feature_args> [<feature arg>]*
 	<policy> <#policy_args> [<policy arg>]*
 
-The syntax to send a message using the dmsetup command is:
+The syntax to send a message using the dmsetup command is::
+
 	dmsetup message <mapped device> 0 sequential_threshold 1024
 	dmsetup message <mapped device> 0 random_threshold 8
 
-Using dmsetup:
+Using dmsetup::
+
 	dmsetup create blah --table "0 268435456 cache /dev/sdb /dev/sdc \
 	    /dev/sdd 512 0 mq 4 sequential_threshold 1024 random_threshold 8"
 	creates a 128GB large mapped device named 'blah' with the
diff --git a/Documentation/device-mapper/cache.txt b/Documentation/device-mapper/cache.rst
similarity index 61%
rename from Documentation/device-mapper/cache.txt
rename to Documentation/device-mapper/cache.rst
index 8ae1cf8e94da..f15e5254d05b 100644
--- a/Documentation/device-mapper/cache.txt
+++ b/Documentation/device-mapper/cache.rst
@@ -1,3 +1,7 @@
+=====
+Cache
+=====
+
 Introduction
 ============
 
@@ -24,10 +28,13 @@ scenarios (eg. a vm image server).
 Glossary
 ========
 
-  Migration -  Movement of the primary copy of a logical block from one
+  Migration
+	       Movement of the primary copy of a logical block from one
 	       device to the other.
-  Promotion -  Migration from slow device to fast device.
-  Demotion  -  Migration from fast device to slow device.
+  Promotion
+	       Migration from slow device to fast device.
+  Demotion
+	       Migration from fast device to slow device.
 
 The origin device always contains a copy of the logical block, which
 may be out of date or kept in sync with the copy on the cache device
@@ -169,45 +176,53 @@ Target interface
 Constructor
 -----------
 
- cache <metadata dev> <cache dev> <origin dev> <block size>
-       <#feature args> [<feature arg>]*
-       <policy> <#policy args> [policy args]*
+  ::
 
- metadata dev    : fast device holding the persistent metadata
- cache dev	 : fast device holding cached data blocks
- origin dev	 : slow device holding original data blocks
- block size      : cache unit size in sectors
+   cache <metadata dev> <cache dev> <origin dev> <block size>
+         <#feature args> [<feature arg>]*
+         <policy> <#policy args> [policy args]*
 
- #feature args   : number of feature arguments passed
- feature args    : writethrough or passthrough (The default is writeback.)
+ ================ =======================================================
+ metadata dev     fast device holding the persistent metadata
+ cache dev	  fast device holding cached data blocks
+ origin dev	  slow device holding original data blocks
+ block size       cache unit size in sectors
 
- policy          : the replacement policy to use
- #policy args    : an even number of arguments corresponding to
-                   key/value pairs passed to the policy
- policy args     : key/value pairs passed to the policy
-		   E.g. 'sequential_threshold 1024'
-		   See cache-policies.txt for details.
+ #feature args    number of feature arguments passed
+ feature args     writethrough or passthrough (The default is writeback.)
+
+ policy           the replacement policy to use
+ #policy args     an even number of arguments corresponding to
+                  key/value pairs passed to the policy
+ policy args      key/value pairs passed to the policy
+		  E.g. 'sequential_threshold 1024'
+		  See cache-policies.txt for details.
+ ================ =======================================================
 
 Optional feature arguments are:
-   writethrough  : write through caching that prohibits cache block
-		   content from being different from origin block content.
-		   Without this argument, the default behaviour is to write
-		   back cache block contents later for performance reasons,
-		   so they may differ from the corresponding origin blocks.
 
-   passthrough	 : a degraded mode useful for various cache coherency
-		   situations (e.g., rolling back snapshots of
-		   underlying storage).	 Reads and writes always go to
-		   the origin.	If a write goes to a cached origin
-		   block, then the cache block is invalidated.
-		   To enable passthrough mode the cache must be clean.
 
-   metadata2	: use version 2 of the metadata.  This stores the dirty bits
-                  in a separate btree, which improves speed of shutting
-		  down the cache.
+   ==================== ========================================================
+   writethrough		write through caching that prohibits cache block
+			content from being different from origin block content.
+			Without this argument, the default behaviour is to write
+			back cache block contents later for performance reasons,
+			so they may differ from the corresponding origin blocks.
 
-   no_discard_passdown	: disable passing down discards from the cache
-			  to the origin's data device.
+   passthrough		a degraded mode useful for various cache coherency
+			situations (e.g., rolling back snapshots of
+			underlying storage).	 Reads and writes always go to
+			the origin.	If a write goes to a cached origin
+			block, then the cache block is invalidated.
+			To enable passthrough mode the cache must be clean.
+
+   metadata2		use version 2 of the metadata.  This stores the dirty
+			bits in a separate btree, which improves speed of
+			shutting down the cache.
+
+   no_discard_passdown	disable passing down discards from the cache
+			to the origin's data device.
+   ==================== ========================================================
 
 A policy called 'default' is always registered.  This is an alias for
 the policy we currently think is giving best all round performance.
@@ -218,54 +233,61 @@ the characteristics of a specific policy, always request it by name.
 Status
 ------
 
-<metadata block size> <#used metadata blocks>/<#total metadata blocks>
-<cache block size> <#used cache blocks>/<#total cache blocks>
-<#read hits> <#read misses> <#write hits> <#write misses>
-<#demotions> <#promotions> <#dirty> <#features> <features>*
-<#core args> <core args>* <policy name> <#policy args> <policy args>*
-<cache metadata mode>
+::
 
-metadata block size	 : Fixed block size for each metadata block in
-			     sectors
-#used metadata blocks	 : Number of metadata blocks used
-#total metadata blocks	 : Total number of metadata blocks
-cache block size	 : Configurable block size for the cache device
-			     in sectors
-#used cache blocks	 : Number of blocks resident in the cache
-#total cache blocks	 : Total number of cache blocks
-#read hits		 : Number of times a READ bio has been mapped
-			     to the cache
-#read misses		 : Number of times a READ bio has been mapped
-			     to the origin
-#write hits		 : Number of times a WRITE bio has been mapped
-			     to the cache
-#write misses		 : Number of times a WRITE bio has been
-			     mapped to the origin
-#demotions		 : Number of times a block has been removed
-			     from the cache
-#promotions		 : Number of times a block has been moved to
-			     the cache
-#dirty			 : Number of blocks in the cache that differ
-			     from the origin
-#feature args		 : Number of feature args to follow
-feature args		 : 'writethrough' (optional)
-#core args		 : Number of core arguments (must be even)
-core args		 : Key/value pairs for tuning the core
-			     e.g. migration_threshold
-policy name		 : Name of the policy
-#policy args		 : Number of policy arguments to follow (must be even)
-policy args		 : Key/value pairs e.g. sequential_threshold
-cache metadata mode      : ro if read-only, rw if read-write
-	In serious cases where even a read-only mode is deemed unsafe
-	no further I/O will be permitted and the status will just
-	contain the string 'Fail'.  The userspace recovery tools
-	should then be used.
-needs_check		 : 'needs_check' if set, '-' if not set
-	A metadata operation has failed, resulting in the needs_check
-	flag being set in the metadata's superblock.  The metadata
-	device must be deactivated and checked/repaired before the
-	cache can be made fully operational again.  '-' indicates
-	needs_check is not set.
+  <metadata block size> <#used metadata blocks>/<#total metadata blocks>
+  <cache block size> <#used cache blocks>/<#total cache blocks>
+  <#read hits> <#read misses> <#write hits> <#write misses>
+  <#demotions> <#promotions> <#dirty> <#features> <features>*
+  <#core args> <core args>* <policy name> <#policy args> <policy args>*
+  <cache metadata mode>
+
+
+========================= =====================================================
+metadata block size	  Fixed block size for each metadata block in
+			  sectors
+#used metadata blocks	  Number of metadata blocks used
+#total metadata blocks	  Total number of metadata blocks
+cache block size	  Configurable block size for the cache device
+			  in sectors
+#used cache blocks	  Number of blocks resident in the cache
+#total cache blocks	  Total number of cache blocks
+#read hits		  Number of times a READ bio has been mapped
+			  to the cache
+#read misses		  Number of times a READ bio has been mapped
+			  to the origin
+#write hits		  Number of times a WRITE bio has been mapped
+			  to the cache
+#write misses		  Number of times a WRITE bio has been
+			  mapped to the origin
+#demotions		  Number of times a block has been removed
+			  from the cache
+#promotions		  Number of times a block has been moved to
+			  the cache
+#dirty			  Number of blocks in the cache that differ
+			  from the origin
+#feature args		  Number of feature args to follow
+feature args		  'writethrough' (optional)
+#core args		  Number of core arguments (must be even)
+core args		  Key/value pairs for tuning the core
+			  e.g. migration_threshold
+policy name		  Name of the policy
+#policy args		  Number of policy arguments to follow (must be even)
+policy args		  Key/value pairs e.g. sequential_threshold
+cache metadata mode       ro if read-only, rw if read-write
+
+			  In serious cases where even a read-only mode is
+			  deemed unsafe no further I/O will be permitted and
+			  the status will just contain the string 'Fail'.
+			  The userspace recovery tools should then be used.
+needs_check		  'needs_check' if set, '-' if not set
+			  A metadata operation has failed, resulting in the
+			  needs_check flag being set in the metadata's
+			  superblock.  The metadata device must be
+			  deactivated and checked/repaired before the
+			  cache can be made fully operational again.
+			  '-' indicates	needs_check is not set.
+========================= =====================================================
 
 Messages
 --------
@@ -274,11 +296,12 @@ Policies will have different tunables, specific to each one, so we
 need a generic way of getting and setting these.  Device-mapper
 messages are used.  (A sysfs interface would also be possible.)
 
-The message format is:
+The message format is::
 
    <key> <value>
 
-E.g.
+E.g.::
+
    dmsetup message my_cache 0 sequential_threshold 1024
 
 
@@ -290,11 +313,12 @@ of values from 5 to 9.  Each cblock must be expressed as a decimal
 value, in the future a variant message that takes cblock ranges
 expressed in hexadecimal may be needed to better support efficient
 invalidation of larger caches.  The cache must be in passthrough mode
-when invalidate_cblocks is used.
+when invalidate_cblocks is used::
 
    invalidate_cblocks [<cblock>|<cblock begin>-<cblock end>]*
 
-E.g.
+E.g.::
+
    dmsetup message my_cache 0 invalidate_cblocks 2345 3456-4567 5678-6789
 
 Examples
@@ -304,8 +328,10 @@ The test suite can be found here:
 
 https://github.com/jthornber/device-mapper-test-suite
 
-dmsetup create my_cache --table '0 41943040 cache /dev/mapper/metadata \
-	/dev/mapper/ssd /dev/mapper/origin 512 1 writeback default 0'
-dmsetup create my_cache --table '0 41943040 cache /dev/mapper/metadata \
-	/dev/mapper/ssd /dev/mapper/origin 1024 1 writeback \
-	mq 4 sequential_threshold 1024 random_threshold 8'
+::
+
+  dmsetup create my_cache --table '0 41943040 cache /dev/mapper/metadata \
+	  /dev/mapper/ssd /dev/mapper/origin 512 1 writeback default 0'
+  dmsetup create my_cache --table '0 41943040 cache /dev/mapper/metadata \
+	  /dev/mapper/ssd /dev/mapper/origin 1024 1 writeback \
+	  mq 4 sequential_threshold 1024 random_threshold 8'
diff --git a/Documentation/device-mapper/delay.txt b/Documentation/device-mapper/delay.rst
similarity index 53%
rename from Documentation/device-mapper/delay.txt
rename to Documentation/device-mapper/delay.rst
index 6426c45273cb..917ba8c33359 100644
--- a/Documentation/device-mapper/delay.txt
+++ b/Documentation/device-mapper/delay.rst
@@ -1,10 +1,12 @@
+========
 dm-delay
 ========
 
 Device-Mapper's "delay" target delays reads and/or writes
 and maps them to different devices.
 
-Parameters:
+Parameters::
+
     <device> <offset> <delay> [<write_device> <write_offset> <write_delay>
 			       [<flush_device> <flush_offset> <flush_delay>]]
 
@@ -14,15 +16,16 @@ Delays are specified in milliseconds.
 
 Example scripts
 ===============
-[[
-#!/bin/sh
-# Create device delaying rw operation for 500ms
-echo "0 `blockdev --getsz $1` delay $1 0 500" | dmsetup create delayed
-]]
-
-[[
-#!/bin/sh
-# Create device delaying only write operation for 500ms and
-# splitting reads and writes to different devices $1 $2
-echo "0 `blockdev --getsz $1` delay $1 0 0 $2 0 500" | dmsetup create delayed
-]]
+
+::
+
+	#!/bin/sh
+	# Create device delaying rw operation for 500ms
+	echo "0 `blockdev --getsz $1` delay $1 0 500" | dmsetup create delayed
+
+::
+
+	#!/bin/sh
+	# Create device delaying only write operation for 500ms and
+	# splitting reads and writes to different devices $1 $2
+	echo "0 `blockdev --getsz $1` delay $1 0 0 $2 0 500" | dmsetup create delayed
diff --git a/Documentation/device-mapper/dm-crypt.txt b/Documentation/device-mapper/dm-crypt.rst
similarity index 87%
rename from Documentation/device-mapper/dm-crypt.txt
rename to Documentation/device-mapper/dm-crypt.rst
index 3b3e1de21c9c..8f4a3f889d43 100644
--- a/Documentation/device-mapper/dm-crypt.txt
+++ b/Documentation/device-mapper/dm-crypt.rst
@@ -1,5 +1,6 @@
+========
 dm-crypt
-=========
+========
 
 Device-Mapper's "crypt" target provides transparent encryption of block devices
 using the kernel crypto API.
@@ -7,15 +8,20 @@ using the kernel crypto API.
 For a more detailed description of supported parameters see:
 https://gitlab.com/cryptsetup/cryptsetup/wikis/DMCrypt
 
-Parameters: <cipher> <key> <iv_offset> <device path> \
+Parameters::
+
+	      <cipher> <key> <iv_offset> <device path> \
 	      <offset> [<#opt_params> <opt_params>]
 
 <cipher>
     Encryption cipher, encryption mode and Initial Vector (IV) generator.
 
-    The cipher specifications format is:
+    The cipher specifications format is::
+
        cipher[:keycount]-chainmode-ivmode[:ivopts]
-    Examples:
+
+    Examples::
+
        aes-cbc-essiv:sha256
        aes-xts-plain64
        serpent-xts-plain64
@@ -25,12 +31,17 @@ Parameters: <cipher> <key> <iv_offset> <device path> \
     as for the first format type.
     This format is mainly used for specification of authenticated modes.
 
-    The crypto API cipher specifications format is:
+    The crypto API cipher specifications format is::
+
         capi:cipher_api_spec-ivmode[:ivopts]
-    Examples:
+
+    Examples::
+
         capi:cbc(aes)-essiv:sha256
         capi:xts(aes)-plain64
-    Examples of authenticated modes:
+
+    Examples of authenticated modes::
+
         capi:gcm(aes)-random
         capi:authenc(hmac(sha256),xts(aes))-random
         capi:rfc7539(chacha20,poly1305)-random
@@ -142,21 +153,21 @@ LUKS (Linux Unified Key Setup) is now the preferred way to set up disk
 encryption with dm-crypt using the 'cryptsetup' utility, see
 https://gitlab.com/cryptsetup/cryptsetup
 
-[[
-#!/bin/sh
-# Create a crypt device using dmsetup
-dmsetup create crypt1 --table "0 `blockdev --getsz $1` crypt aes-cbc-essiv:sha256 babebabebabebabebabebabebabebabe 0 $1 0"
-]]
+::
 
-[[
-#!/bin/sh
-# Create a crypt device using dmsetup when encryption key is stored in keyring service
-dmsetup create crypt2 --table "0 `blockdev --getsize $1` crypt aes-cbc-essiv:sha256 :32:logon:my_prefix:my_key 0 $1 0"
-]]
+	#!/bin/sh
+	# Create a crypt device using dmsetup
+	dmsetup create crypt1 --table "0 `blockdev --getsz $1` crypt aes-cbc-essiv:sha256 babebabebabebabebabebabebabebabe 0 $1 0"
 
-[[
-#!/bin/sh
-# Create a crypt device using cryptsetup and LUKS header with default cipher
-cryptsetup luksFormat $1
-cryptsetup luksOpen $1 crypt1
-]]
+::
+
+	#!/bin/sh
+	# Create a crypt device using dmsetup when encryption key is stored in keyring service
+	dmsetup create crypt2 --table "0 `blockdev --getsize $1` crypt aes-cbc-essiv:sha256 :32:logon:my_prefix:my_key 0 $1 0"
+
+::
+
+	#!/bin/sh
+	# Create a crypt device using cryptsetup and LUKS header with default cipher
+	cryptsetup luksFormat $1
+	cryptsetup luksOpen $1 crypt1
diff --git a/Documentation/device-mapper/dm-flakey.txt b/Documentation/device-mapper/dm-flakey.rst
similarity index 60%
rename from Documentation/device-mapper/dm-flakey.txt
rename to Documentation/device-mapper/dm-flakey.rst
index 9f0e247d0877..86138735879d 100644
--- a/Documentation/device-mapper/dm-flakey.txt
+++ b/Documentation/device-mapper/dm-flakey.rst
@@ -1,3 +1,4 @@
+=========
 dm-flakey
 =========
 
@@ -15,17 +16,26 @@ underlying devices.
 
 Table parameters
 ----------------
+
+::
+
   <dev path> <offset> <up interval> <down interval> \
     [<num_features> [<feature arguments>]]
 
 Mandatory parameters:
-    <dev path>: Full pathname to the underlying block-device, or a
-                "major:minor" device-number.
-    <offset>: Starting sector within the device.
-    <up interval>: Number of seconds device is available.
-    <down interval>: Number of seconds device returns errors.
+
+    <dev path>:
+        Full pathname to the underlying block-device, or a
+        "major:minor" device-number.
+    <offset>:
+        Starting sector within the device.
+    <up interval>:
+        Number of seconds device is available.
+    <down interval>:
+        Number of seconds device returns errors.
 
 Optional feature parameters:
+
   If no feature parameters are present, during the periods of
   unreliability, all I/O returns errors.
 
@@ -41,17 +51,24 @@ Optional feature parameters:
 	During <down interval>, replace <Nth_byte> of the data of
 	each matching bio with <value>.
 
-    <Nth_byte>: The offset of the byte to replace.
-		Counting starts at 1, to replace the first byte.
-    <direction>: Either 'r' to corrupt reads or 'w' to corrupt writes.
-		 'w' is incompatible with drop_writes.
-    <value>: The value (from 0-255) to write.
-    <flags>: Perform the replacement only if bio->bi_opf has all the
-	     selected flags set.
+    <Nth_byte>:
+	The offset of the byte to replace.
+	Counting starts at 1, to replace the first byte.
+    <direction>:
+	Either 'r' to corrupt reads or 'w' to corrupt writes.
+	'w' is incompatible with drop_writes.
+    <value>:
+	The value (from 0-255) to write.
+    <flags>:
+	Perform the replacement only if bio->bi_opf has all the
+	selected flags set.
 
 Examples:
+
+Replaces the 32nd byte of READ bios with the value 1::
+
   corrupt_bio_byte 32 r 1 0
-	- replaces the 32nd byte of READ bios with the value 1
+
+Replaces the 224th byte of REQ_META (=32) bios with the value 0::
 
   corrupt_bio_byte 224 w 0 32
-	- replaces the 224th byte of REQ_META (=32) bios with the value 0
diff --git a/Documentation/device-mapper/dm-init.txt b/Documentation/device-mapper/dm-init.rst
similarity index 69%
rename from Documentation/device-mapper/dm-init.txt
rename to Documentation/device-mapper/dm-init.rst
index 130b3c3679c5..e5242ff17e9b 100644
--- a/Documentation/device-mapper/dm-init.txt
+++ b/Documentation/device-mapper/dm-init.rst
@@ -1,5 +1,6 @@
+================================
 Early creation of mapped devices
-====================================
+================================
 
 It is possible to configure a device-mapper device to act as the root device for
 your system in two ways.
@@ -12,15 +13,17 @@ The second is to create one or more device-mappers using the module parameter
 
 The format is specified as a string of data separated by commas and optionally
 semi-colons, where:
+
  - a comma is used to separate fields like name, uuid, flags and table
    (specifies one device)
  - a semi-colon is used to separate devices.
 
-So the format will look like this:
+So the format will look like this::
 
  dm-mod.create=<name>,<uuid>,<minor>,<flags>,<table>[,<table>+][;<name>,<uuid>,<minor>,<flags>,<table>[,<table>+]+]
 
-Where,
+Where::
+
 	<name>		::= The device name.
 	<uuid>		::= xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx | ""
 	<minor>		::= The device minor number | ""
@@ -29,7 +32,7 @@ Where,
 	<target_type>	::= "verity" | "linear" | ... (see list below)
 
 The dm line should be equivalent to the one used by the dmsetup tool with the
---concise argument.
+`--concise` argument.
 
 Target types
 ============
@@ -38,32 +41,34 @@ Not all target types are available as there are serious risks in allowing
 activation of certain DM targets without first using userspace tools to check
 the validity of associated metadata.
 
-	"cache":		constrained, userspace should verify cache device
-	"crypt":		allowed
-	"delay":		allowed
-	"era":			constrained, userspace should verify metadata device
-	"flakey":		constrained, meant for test
-	"linear":		allowed
-	"log-writes":		constrained, userspace should verify metadata device
-	"mirror":		constrained, userspace should verify main/mirror device
-	"raid":			constrained, userspace should verify metadata device
-	"snapshot":		constrained, userspace should verify src/dst device
-	"snapshot-origin":	allowed
-	"snapshot-merge":	constrained, userspace should verify src/dst device
-	"striped":		allowed
-	"switch":		constrained, userspace should verify dev path
-	"thin":			constrained, requires dm target message from userspace
-	"thin-pool":		constrained, requires dm target message from userspace
-	"verity":		allowed
-	"writecache":		constrained, userspace should verify cache device
-	"zero":			constrained, not meant for rootfs
+======================= =======================================================
+`cache`			constrained, userspace should verify cache device
+`crypt`			allowed
+`delay`			allowed
+`era`			constrained, userspace should verify metadata device
+`flakey`		constrained, meant for test
+`linear`		allowed
+`log-writes`		constrained, userspace should verify metadata device
+`mirror`		constrained, userspace should verify main/mirror device
+`raid`			constrained, userspace should verify metadata device
+`snapshot`		constrained, userspace should verify src/dst device
+`snapshot-origin`	allowed
+`snapshot-merge`	constrained, userspace should verify src/dst device
+`striped`		allowed
+`switch`		constrained, userspace should verify dev path
+`thin`			constrained, requires dm target message from userspace
+`thin-pool`		constrained, requires dm target message from userspace
+`verity`		allowed
+`writecache`		constrained, userspace should verify cache device
+`zero`			constrained, not meant for rootfs
+======================= =======================================================
 
 If the target is not listed above, it is constrained by default (not tested).
 
 Examples
 ========
 An example of booting to a linear array made up of user-mode linux block
-devices:
+devices::
 
   dm-mod.create="lroot,,,rw, 0 4096 linear 98:16 0, 4096 4096 linear 98:32 0" root=/dev/dm-0
 
@@ -71,8 +76,8 @@ This will boot to a rw dm-linear target of 8192 sectors split across two block
 devices identified by their major:minor numbers.  After boot, udev will rename
 this target to /dev/mapper/lroot (depending on the rules). No uuid was assigned.
 
-An example of multiple device-mappers, with the dm-mod.create="..." contents is shown here
-split on multiple lines for readability:
+An example of multiple device-mappers, with the dm-mod.create="..." contents
+is shown here split on multiple lines for readability::
 
   dm-linear,,1,rw,
     0 32768 linear 8:1 0,
@@ -84,30 +89,36 @@ split on multiple lines for readability:
 
 Other examples (per target):
 
-"crypt":
+"crypt"::
+
   dm-crypt,,8,ro,
     0 1048576 crypt aes-xts-plain64
     babebabebabebabebabebabebabebabebabebabebabebabebabebabebabebabe 0
     /dev/sda 0 1 allow_discards
 
-"delay":
+"delay"::
+
   dm-delay,,4,ro,0 409600 delay /dev/sda1 0 500
 
-"linear":
+"linear"::
+
   dm-linear,,,rw,
     0 32768 linear /dev/sda1 0,
     32768 1024000 linear /dev/sda2 0,
     1056768 204800 linear /dev/sda3 0,
     1261568 512000 linear /dev/sda4 0
 
-"snapshot-origin":
+"snapshot-origin"::
+
   dm-snap-orig,,4,ro,0 409600 snapshot-origin 8:2
 
-"striped":
+"striped"::
+
   dm-striped,,4,ro,0 1638400 striped 4 4096
   /dev/sda1 0 /dev/sda2 0 /dev/sda3 0 /dev/sda4 0
 
-"verity":
+"verity"::
+
   dm-verity,,4,ro,
     0 1638400 verity 1 8:1 8:2 4096 4096 204800 1 sha256
     fb1a5a0f00deb908d8b53cb270858975e76cf64105d412ce764225d53b8f3cfd
diff --git a/Documentation/device-mapper/dm-integrity.txt b/Documentation/device-mapper/dm-integrity.rst
similarity index 90%
rename from Documentation/device-mapper/dm-integrity.txt
rename to Documentation/device-mapper/dm-integrity.rst
index d63d78ffeb73..a30aa91b5fbe 100644
--- a/Documentation/device-mapper/dm-integrity.txt
+++ b/Documentation/device-mapper/dm-integrity.rst
@@ -1,3 +1,7 @@
+============
+dm-integrity
+============
+
 The dm-integrity target emulates a block device that has additional
 per-sector tags that can be used for storing integrity information.
 
@@ -35,15 +39,16 @@ zeroes. If the superblock is neither valid nor zeroed, the dm-integrity
 target can't be loaded.
 
 To use the target for the first time:
+
 1. overwrite the superblock with zeroes
 2. load the dm-integrity target with one-sector size, the kernel driver
-	will format the device
+   will format the device
 3. unload the dm-integrity target
 4. read the "provided_data_sectors" value from the superblock
 5. load the dm-integrity target with the the target size
-	"provided_data_sectors"
+   "provided_data_sectors"
 6. if you want to use dm-integrity with dm-crypt, load the dm-crypt target
-	with the size "provided_data_sectors"
+   with the size "provided_data_sectors"
 
 
 Target arguments:
@@ -51,17 +56,20 @@ Target arguments:
 1. the underlying block device
 
 2. the number of reserved sector at the beginning of the device - the
-	dm-integrity won't read of write these sectors
+   dm-integrity won't read of write these sectors
 
 3. the size of the integrity tag (if "-" is used, the size is taken from
-	the internal-hash algorithm)
+   the internal-hash algorithm)
 
 4. mode:
-	D - direct writes (without journal) - in this mode, journaling is
+
+	D - direct writes (without journal)
+		in this mode, journaling is
 		not used and data sectors and integrity tags are written
 		separately. In case of crash, it is possible that the data
 		and integrity tag doesn't match.
-	J - journaled writes - data and integrity tags are written to the
+	J - journaled writes
+		data and integrity tags are written to the
 		journal and atomicity is guaranteed. In case of crash,
 		either both data and tag or none of them are written. The
 		journaled mode degrades write throughput twice because the
@@ -178,9 +186,12 @@ and the reloaded target would be non-functional.
 
 
 The layout of the formatted block device:
-* reserved sectors (they are not used by this target, they can be used for
-  storing LUKS metadata or for other purpose), the size of the reserved
-  area is specified in the target arguments
+
+* reserved sectors
+    (they are not used by this target, they can be used for
+    storing LUKS metadata or for other purpose), the size of the reserved
+    area is specified in the target arguments
+
 * superblock (4kiB)
 	* magic string - identifies that the device was formatted
 	* version
@@ -192,40 +203,55 @@ The layout of the formatted block device:
 	  metadata and padding). The user of this target should not send
 	  bios that access data beyond the "provided data sectors" limit.
 	* flags
-	  SB_FLAG_HAVE_JOURNAL_MAC - a flag is set if journal_mac is used
-	  SB_FLAG_RECALCULATING - recalculating is in progress
-	  SB_FLAG_DIRTY_BITMAP - journal area contains the bitmap of dirty
-		blocks
+	    SB_FLAG_HAVE_JOURNAL_MAC
+		- a flag is set if journal_mac is used
+	    SB_FLAG_RECALCULATING
+		- recalculating is in progress
+	    SB_FLAG_DIRTY_BITMAP
+		- journal area contains the bitmap of dirty
+		  blocks
 	* log2(sectors per block)
 	* a position where recalculating finished
 * journal
 	The journal is divided into sections, each section contains:
+
 	* metadata area (4kiB), it contains journal entries
-	  every journal entry contains:
+
+	  - every journal entry contains:
+
 		* logical sector (specifies where the data and tag should
 		  be written)
 		* last 8 bytes of data
 		* integrity tag (the size is specified in the superblock)
-	    every metadata sector ends with
+
+	  - every metadata sector ends with
+
 		* mac (8-bytes), all the macs in 8 metadata sectors form a
 		  64-byte value. It is used to store hmac of sector
 		  numbers in the journal section, to protect against a
 		  possibility that the attacker tampers with sector
 		  numbers in the journal.
 		* commit id
+
 	* data area (the size is variable; it depends on how many journal
 	  entries fit into the metadata area)
-	    every sector in the data area contains:
+
+	    - every sector in the data area contains:
+
 		* data (504 bytes of data, the last 8 bytes are stored in
 		  the journal entry)
 		* commit id
+
 	To test if the whole journal section was written correctly, every
 	512-byte sector of the journal ends with 8-byte commit id. If the
 	commit id matches on all sectors in a journal section, then it is
 	assumed that the section was written correctly. If the commit id
 	doesn't match, the section was written partially and it should not
 	be replayed.
-* one or more runs of interleaved tags and data. Each run contains:
+
+* one or more runs of interleaved tags and data.
+    Each run contains:
+
 	* tag area - it contains integrity tags. There is one tag for each
 	  sector in the data area
 	* data area - it contains data sectors. The number of data sectors
diff --git a/Documentation/device-mapper/dm-io.txt b/Documentation/device-mapper/dm-io.rst
similarity index 92%
rename from Documentation/device-mapper/dm-io.txt
rename to Documentation/device-mapper/dm-io.rst
index 3b5d9a52cdcf..d2492917a1f5 100644
--- a/Documentation/device-mapper/dm-io.txt
+++ b/Documentation/device-mapper/dm-io.rst
@@ -1,3 +1,4 @@
+=====
 dm-io
 =====
 
@@ -7,7 +8,7 @@ version.
 
 The user must set up an io_region structure to describe the desired location
 of the I/O. Each io_region indicates a block-device along with the starting
-sector and size of the region.
+sector and size of the region::
 
    struct io_region {
       struct block_device *bdev;
@@ -19,7 +20,7 @@ Dm-io can read from one io_region or write to one or more io_regions. Writes
 to multiple regions are specified by an array of io_region structures.
 
 The first I/O service type takes a list of memory pages as the data buffer for
-the I/O, along with an offset into the first page.
+the I/O, along with an offset into the first page::
 
    struct page_list {
       struct page_list *next;
@@ -35,7 +36,7 @@ the I/O, along with an offset into the first page.
 
 The second I/O service type takes an array of bio vectors as the data buffer
 for the I/O. This service can be handy if the caller has a pre-assembled bio,
-but wants to direct different portions of the bio to different devices.
+but wants to direct different portions of the bio to different devices::
 
    int dm_io_sync_bvec(unsigned int num_regions, struct io_region *where,
                        int rw, struct bio_vec *bvec,
@@ -47,7 +48,7 @@ but wants to direct different portions of the bio to different devices.
 The third I/O service type takes a pointer to a vmalloc'd memory buffer as the
 data buffer for the I/O. This service can be handy if the caller needs to do
 I/O to a large region but doesn't want to allocate a large number of individual
-memory pages.
+memory pages::
 
    int dm_io_sync_vm(unsigned int num_regions, struct io_region *where, int rw,
                      void *data, unsigned long *error_bits);
@@ -55,11 +56,11 @@ memory pages.
                       void *data, io_notify_fn fn, void *context);
 
 Callers of the asynchronous I/O services must include the name of a completion
-callback routine and a pointer to some context data for the I/O.
+callback routine and a pointer to some context data for the I/O::
 
    typedef void (*io_notify_fn)(unsigned long error, void *context);
 
-The "error" parameter in this callback, as well as the "*error" parameter in
+The "error" parameter in this callback, as well as the `*error` parameter in
 all of the synchronous versions, is a bitset (instead of a simple error value).
 In the case of an write-I/O to multiple regions, this bitset allows dm-io to
 indicate success or failure on each individual region.
@@ -72,4 +73,3 @@ always available in order to avoid unnecessary waiting while performing I/O.
 When the user is finished using the dm-io services, they should call
 dm_io_put() and specify the same number of pages that were given on the
 dm_io_get() call.
-
diff --git a/Documentation/device-mapper/dm-log.txt b/Documentation/device-mapper/dm-log.rst
similarity index 90%
rename from Documentation/device-mapper/dm-log.txt
rename to Documentation/device-mapper/dm-log.rst
index c155ac569c44..ba4fce39bc27 100644
--- a/Documentation/device-mapper/dm-log.txt
+++ b/Documentation/device-mapper/dm-log.rst
@@ -1,3 +1,4 @@
+=====================
 Device-Mapper Logging
 =====================
 The device-mapper logging code is used by some of the device-mapper
@@ -16,11 +17,13 @@ dm_dirty_log_type in include/linux/dm-dirty-log.h).  Various different
 logging implementations are available and provide different
 capabilities.  The list includes:
 
+==============	==============================================================
 Type		Files
-====		=====
+==============	==============================================================
 disk		drivers/md/dm-log.c
 core		drivers/md/dm-log.c
 userspace	drivers/md/dm-log-userspace* include/linux/dm-log-userspace.h
+==============	==============================================================
 
 The "disk" log type
 -------------------
diff --git a/Documentation/device-mapper/dm-queue-length.txt b/Documentation/device-mapper/dm-queue-length.rst
similarity index 76%
rename from Documentation/device-mapper/dm-queue-length.txt
rename to Documentation/device-mapper/dm-queue-length.rst
index f4db2562175c..d8e381c1cb02 100644
--- a/Documentation/device-mapper/dm-queue-length.txt
+++ b/Documentation/device-mapper/dm-queue-length.rst
@@ -1,3 +1,4 @@
+===============
 dm-queue-length
 ===============
 
@@ -6,12 +7,18 @@ which selects a path with the least number of in-flight I/Os.
 The path selector name is 'queue-length'.
 
 Table parameters for each path: [<repeat_count>]
+
+::
+
 	<repeat_count>: The number of I/Os to dispatch using the selected
 			path before switching to the next path.
 			If not given, internal default is used. To check
 			the default value, see the activated table.
 
 Status for each path: <status> <fail-count> <in-flight>
+
+::
+
 	<status>: 'A' if the path is active, 'F' if the path is failed.
 	<fail-count>: The number of path failures.
 	<in-flight>: The number of in-flight I/Os on the path.
@@ -29,11 +36,13 @@ Examples
 ========
 In case that 2 paths (sda and sdb) are used with repeat_count == 128.
 
-# echo "0 10 multipath 0 0 1 1 queue-length 0 2 1 8:0 128 8:16 128" \
-  dmsetup create test
-#
-# dmsetup table
-test: 0 10 multipath 0 0 1 1 queue-length 0 2 1 8:0 128 8:16 128
-#
-# dmsetup status
-test: 0 10 multipath 2 0 0 0 1 1 E 0 2 1 8:0 A 0 0 8:16 A 0 0
+::
+
+  # echo "0 10 multipath 0 0 1 1 queue-length 0 2 1 8:0 128 8:16 128" \
+    dmsetup create test
+  #
+  # dmsetup table
+  test: 0 10 multipath 0 0 1 1 queue-length 0 2 1 8:0 128 8:16 128
+  #
+  # dmsetup status
+  test: 0 10 multipath 2 0 0 0 1 1 E 0 2 1 8:0 A 0 0 8:16 A 0 0
diff --git a/Documentation/device-mapper/dm-raid.txt b/Documentation/device-mapper/dm-raid.rst
similarity index 71%
rename from Documentation/device-mapper/dm-raid.txt
rename to Documentation/device-mapper/dm-raid.rst
index 2355bef14653..2fe255b130fb 100644
--- a/Documentation/device-mapper/dm-raid.txt
+++ b/Documentation/device-mapper/dm-raid.rst
@@ -1,3 +1,4 @@
+=======
 dm-raid
 =======
 
@@ -8,49 +9,66 @@ interface.
 
 Mapping Table Interface
 -----------------------
-The target is named "raid" and it accepts the following parameters:
+The target is named "raid" and it accepts the following parameters::
 
   <raid_type> <#raid_params> <raid_params> \
     <#raid_devs> <metadata_dev0> <dev0> [.. <metadata_devN> <devN>]
 
 <raid_type>:
+
+  ============= ===============================================================
   raid0		RAID0 striping (no resilience)
   raid1		RAID1 mirroring
   raid4		RAID4 with dedicated last parity disk
   raid5_n 	RAID5 with dedicated last parity disk supporting takeover
 		Same as raid4
-		-Transitory layout
+
+		- Transitory layout
   raid5_la	RAID5 left asymmetric
+
 		- rotating parity 0 with data continuation
   raid5_ra	RAID5 right asymmetric
+
 		- rotating parity N with data continuation
   raid5_ls	RAID5 left symmetric
+
 		- rotating parity 0 with data restart
   raid5_rs 	RAID5 right symmetric
+
 		- rotating parity N with data restart
   raid6_zr	RAID6 zero restart
+
 		- rotating parity zero (left-to-right) with data restart
   raid6_nr	RAID6 N restart
+
 		- rotating parity N (right-to-left) with data restart
   raid6_nc	RAID6 N continue
+
 		- rotating parity N (right-to-left) with data continuation
   raid6_n_6	RAID6 with dedicate parity disks
+
 		- parity and Q-syndrome on the last 2 disks;
 		  layout for takeover from/to raid4/raid5_n
   raid6_la_6	Same as "raid_la" plus dedicated last Q-syndrome disk
+
 		- layout for takeover from raid5_la from/to raid6
   raid6_ra_6	Same as "raid5_ra" dedicated last Q-syndrome disk
+
 		- layout for takeover from raid5_ra from/to raid6
   raid6_ls_6	Same as "raid5_ls" dedicated last Q-syndrome disk
+
 		- layout for takeover from raid5_ls from/to raid6
   raid6_rs_6	Same as "raid5_rs" dedicated last Q-syndrome disk
+
 		- layout for takeover from raid5_rs from/to raid6
   raid10        Various RAID10 inspired algorithms chosen by additional params
 		(see raid10_format and raid10_copies below)
+
 		- RAID10: Striped Mirrors (aka 'Striping on top of mirrors')
 		- RAID1E: Integrated Adjacent Stripe Mirroring
 		- RAID1E: Integrated Offset Stripe Mirroring
-		-  and other similar RAID10 variants
+		- and other similar RAID10 variants
+  ============= ===============================================================
 
   Reference: Chapter 4 of
   http://www.snia.org/sites/default/files/SNIA_DDF_Technical_Position_v2.0.pdf
@@ -58,33 +76,41 @@ The target is named "raid" and it accepts the following parameters:
 <#raid_params>: The number of parameters that follow.
 
 <raid_params> consists of
+
     Mandatory parameters:
-        <chunk_size>: Chunk size in sectors.  This parameter is often known as
+        <chunk_size>:
+		      Chunk size in sectors.  This parameter is often known as
 		      "stripe size".  It is the only mandatory parameter and
 		      is placed first.
 
     followed by optional parameters (in any order):
-	[sync|nosync]   Force or prevent RAID initialization.
+	[sync|nosync]
+		Force or prevent RAID initialization.
 
-	[rebuild <idx>]	Rebuild drive number 'idx' (first drive is 0).
+	[rebuild <idx>]
+		Rebuild drive number 'idx' (first drive is 0).
 
 	[daemon_sleep <ms>]
 		Interval between runs of the bitmap daemon that
 		clear bits.  A longer interval means less bitmap I/O but
 		resyncing after a failure is likely to take longer.
 
-	[min_recovery_rate <kB/sec/disk>]  Throttle RAID initialization
-	[max_recovery_rate <kB/sec/disk>]  Throttle RAID initialization
-	[write_mostly <idx>]		   Mark drive index 'idx' write-mostly.
-	[max_write_behind <sectors>]       See '--write-behind=' (man mdadm)
-	[stripe_cache <sectors>]           Stripe cache size (RAID 4/5/6 only)
+	[min_recovery_rate <kB/sec/disk>]
+		Throttle RAID initialization
+	[max_recovery_rate <kB/sec/disk>]
+		Throttle RAID initialization
+	[write_mostly <idx>]
+		Mark drive index 'idx' write-mostly.
+	[max_write_behind <sectors>]
+		See '--write-behind=' (man mdadm)
+	[stripe_cache <sectors>]
+		Stripe cache size (RAID 4/5/6 only)
 	[region_size <sectors>]
 		The region_size multiplied by the number of regions is the
 		logical size of the array.  The bitmap records the device
 		synchronisation state for each region.
 
-        [raid10_copies   <# copies>]
-        [raid10_format   <near|far|offset>]
+        [raid10_copies   <# copies>], [raid10_format   <near|far|offset>]
 		These two options are used to alter the default layout of
 		a RAID10 configuration.  The number of copies is can be
 		specified, but the default is 2.  There are also three
@@ -93,13 +119,17 @@ The target is named "raid" and it accepts the following parameters:
 		respect to mirroring.  If these options are left unspecified,
 		or 'raid10_copies 2' and/or 'raid10_format near' are given,
 		then the layouts for 2, 3 and 4 devices	are:
+
+		========	 ==========	   ==============
 		2 drives         3 drives          4 drives
-		--------         ----------        --------------
+		========	 ==========	   ==============
 		A1  A1           A1  A1  A2        A1  A1  A2  A2
 		A2  A2           A2  A3  A3        A3  A3  A4  A4
 		A3  A3           A4  A4  A5        A5  A5  A6  A6
 		A4  A4           A5  A6  A6        A7  A7  A8  A8
 		..  ..           ..  ..  ..        ..  ..  ..  ..
+		========	 ==========	   ==============
+
 		The 2-device layout is equivalent 2-way RAID1.  The 4-device
 		layout is what a traditional RAID10 would look like.  The
 		3-device layout is what might be called a 'RAID1E - Integrated
@@ -107,8 +137,10 @@ The target is named "raid" and it accepts the following parameters:
 
 		If 'raid10_copies 2' and 'raid10_format far', then the layouts
 		for 2, 3 and 4 devices are:
+
+		========	     ============	  ===================
 		2 drives             3 drives             4 drives
-		--------             --------------       --------------------
+		========	     ============	  ===================
 		A1  A2               A1   A2   A3         A1   A2   A3   A4
 		A3  A4               A4   A5   A6         A5   A6   A7   A8
 		A5  A6               A7   A8   A9         A9   A10  A11  A12
@@ -117,11 +149,14 @@ The target is named "raid" and it accepts the following parameters:
 		A4  A3               A6   A4   A5         A6   A5   A8   A7
 		A6  A5               A9   A7   A8         A10  A9   A12  A11
 		..  ..               ..   ..   ..         ..   ..   ..   ..
+		========	     ============	  ===================
 
 		If 'raid10_copies 2' and 'raid10_format offset', then the
 		layouts for 2, 3 and 4 devices are:
+
+		========       ==========         ================
 		2 drives       3 drives           4 drives
-		--------       ------------       -----------------
+		========       ==========         ================
 		A1  A2         A1  A2  A3         A1  A2  A3  A4
 		A2  A1         A3  A1  A2         A2  A1  A4  A3
 		A3  A4         A4  A5  A6         A5  A6  A7  A8
@@ -129,6 +164,8 @@ The target is named "raid" and it accepts the following parameters:
 		A5  A6         A7  A8  A9         A9  A10 A11 A12
 		A6  A5         A9  A7  A8         A10 A9  A12 A11
 		..  ..         ..  ..  ..         ..  ..  ..  ..
+		========       ==========         ================
+
 		Here we see layouts closely akin to 'RAID1E - Integrated
 		Offset Stripe Mirroring'.
 
@@ -190,22 +227,25 @@ The target is named "raid" and it accepts the following parameters:
 
 Example Tables
 --------------
-# RAID4 - 4 data drives, 1 parity (no metadata devices)
-# No metadata devices specified to hold superblock/bitmap info
-# Chunk size of 1MiB
-# (Lines separated for easy reading)
 
-0 1960893648 raid \
-        raid4 1 2048 \
-        5 - 8:17 - 8:33 - 8:49 - 8:65 - 8:81
+::
 
-# RAID4 - 4 data drives, 1 parity (with metadata devices)
-# Chunk size of 1MiB, force RAID initialization,
-#       min recovery rate at 20 kiB/sec/disk
+  # RAID4 - 4 data drives, 1 parity (no metadata devices)
+  # No metadata devices specified to hold superblock/bitmap info
+  # Chunk size of 1MiB
+  # (Lines separated for easy reading)
 
-0 1960893648 raid \
-        raid4 4 2048 sync min_recovery_rate 20 \
-        5 8:17 8:18 8:33 8:34 8:49 8:50 8:65 8:66 8:81 8:82
+  0 1960893648 raid \
+          raid4 1 2048 \
+          5 - 8:17 - 8:33 - 8:49 - 8:65 - 8:81
+
+  # RAID4 - 4 data drives, 1 parity (with metadata devices)
+  # Chunk size of 1MiB, force RAID initialization,
+  #       min recovery rate at 20 kiB/sec/disk
+
+  0 1960893648 raid \
+          raid4 4 2048 sync min_recovery_rate 20 \
+          5 8:17 8:18 8:33 8:34 8:49 8:50 8:65 8:66 8:81 8:82
 
 
 Status Output
@@ -219,41 +259,58 @@ Arguments that can be repeated are ordered by value.
 
 'dmsetup status' yields information on the state and health of the array.
 The output is as follows (normally a single line, but expanded here for
-clarity):
-1: <s> <l> raid \
-2:      <raid_type> <#devices> <health_chars> \
-3:      <sync_ratio> <sync_action> <mismatch_cnt>
+clarity)::
+
+  1: <s> <l> raid \
+  2:      <raid_type> <#devices> <health_chars> \
+  3:      <sync_ratio> <sync_action> <mismatch_cnt>
 
 Line 1 is the standard output produced by device-mapper.
-Line 2 & 3 are produced by the raid target and are best explained by example:
+
+Line 2 & 3 are produced by the raid target and are best explained by example::
+
         0 1960893648 raid raid4 5 AAAAA 2/490221568 init 0
+
 Here we can see the RAID type is raid4, there are 5 devices - all of
 which are 'A'live, and the array is 2/490221568 complete with its initial
 recovery.  Here is a fuller description of the individual fields:
+
+	=============== =========================================================
 	<raid_type>     Same as the <raid_type> used to create the array.
-	<health_chars>  One char for each device, indicating: 'A' = alive and
-			in-sync, 'a' = alive but not in-sync, 'D' = dead/failed.
+	<health_chars>  One char for each device, indicating:
+
+			- 'A' = alive and in-sync
+			- 'a' = alive but not in-sync
+			- 'D' = dead/failed.
 	<sync_ratio>    The ratio indicating how much of the array has undergone
 			the process described by 'sync_action'.  If the
 			'sync_action' is "check" or "repair", then the process
 			of "resync" or "recover" can be considered complete.
 	<sync_action>   One of the following possible states:
-			idle    - No synchronization action is being performed.
-			frozen  - The current action has been halted.
-			resync  - Array is undergoing its initial synchronization
+
+			idle
+				- No synchronization action is being performed.
+			frozen
+				- The current action has been halted.
+			resync
+				- Array is undergoing its initial synchronization
 				  or is resynchronizing after an unclean shutdown
 				  (possibly aided by a bitmap).
-			recover - A device in the array is being rebuilt or
+			recover
+				- A device in the array is being rebuilt or
 				  replaced.
-			check   - A user-initiated full check of the array is
+			check
+				- A user-initiated full check of the array is
 				  being performed.  All blocks are read and
 				  checked for consistency.  The number of
 				  discrepancies found are recorded in
 				  <mismatch_cnt>.  No changes are made to the
 				  array by this action.
-			repair  - The same as "check", but discrepancies are
+			repair
+				- The same as "check", but discrepancies are
 				  corrected.
-			reshape - The array is undergoing a reshape.
+			reshape
+				- The array is undergoing a reshape.
 	<mismatch_cnt>  The number of discrepancies found between mirror copies
 			in RAID1/10 or wrong parity values found in RAID4/5/6.
 			This value is valid only after a "check" of the array
@@ -261,10 +318,11 @@ recovery.  Here is a fuller description of the individual fields:
 	<data_offset>   The current data offset to the start of the user data on
 			each component device of a raid set (see the respective
 			raid parameter to support out-of-place reshaping).
-	<journal_char>	'A' - active write-through journal device.
-			'a' - active write-back journal device.
-			'D' - dead journal device.
-			'-' - no journal device.
+	<journal_char>	- 'A' - active write-through journal device.
+			- 'a' - active write-back journal device.
+			- 'D' - dead journal device.
+			- '-' - no journal device.
+	=============== =========================================================
 
 
 Message Interface
@@ -272,12 +330,15 @@ Message Interface
 The dm-raid target will accept certain actions through the 'message' interface.
 ('man dmsetup' for more information on the message interface.)  These actions
 include:
-	"idle"   - Halt the current sync action.
-	"frozen" - Freeze the current sync action.
-	"resync" - Initiate/continue a resync.
-	"recover"- Initiate/continue a recover process.
-	"check"  - Initiate a check (i.e. a "scrub") of the array.
-	"repair" - Initiate a repair of the array.
+
+	========= ================================================
+	"idle"    Halt the current sync action.
+	"frozen"  Freeze the current sync action.
+	"resync"  Initiate/continue a resync.
+	"recover" Initiate/continue a recover process.
+	"check"   Initiate a check (i.e. a "scrub") of the array.
+	"repair"  Initiate a repair of the array.
+	========= ================================================
 
 
 Discard Support
@@ -307,48 +368,52 @@ increasingly whitelisted in the kernel and can thus be trusted.
 
 For trusted devices, the following dm-raid module parameter can be set
 to safely enable discard support for RAID 4/5/6:
+
     'devices_handle_discards_safely'
 
 
 Version History
 ---------------
-1.0.0	Initial version.  Support for RAID 4/5/6
-1.1.0	Added support for RAID 1
-1.2.0	Handle creation of arrays that contain failed devices.
-1.3.0	Added support for RAID 10
-1.3.1	Allow device replacement/rebuild for RAID 10
-1.3.2   Fix/improve redundancy checking for RAID10
-1.4.0	Non-functional change.  Removes arg from mapping function.
-1.4.1   RAID10 fix redundancy validation checks (commit 55ebbb5).
-1.4.2   Add RAID10 "far" and "offset" algorithm support.
-1.5.0   Add message interface to allow manipulation of the sync_action.
+
+::
+
+ 1.0.0	Initial version.  Support for RAID 4/5/6
+ 1.1.0	Added support for RAID 1
+ 1.2.0	Handle creation of arrays that contain failed devices.
+ 1.3.0	Added support for RAID 10
+ 1.3.1	Allow device replacement/rebuild for RAID 10
+ 1.3.2	Fix/improve redundancy checking for RAID10
+ 1.4.0	Non-functional change.  Removes arg from mapping function.
+ 1.4.1	RAID10 fix redundancy validation checks (commit 55ebbb5).
+ 1.4.2	Add RAID10 "far" and "offset" algorithm support.
+ 1.5.0	Add message interface to allow manipulation of the sync_action.
 	New status (STATUSTYPE_INFO) fields: sync_action and mismatch_cnt.
-1.5.1   Add ability to restore transiently failed devices on resume.
-1.5.2   'mismatch_cnt' is zero unless [last_]sync_action is "check".
-1.6.0   Add discard support (and devices_handle_discard_safely module param).
-1.7.0   Add support for MD RAID0 mappings.
-1.8.0   Explicitly check for compatible flags in the superblock metadata
+ 1.5.1	Add ability to restore transiently failed devices on resume.
+ 1.5.2	'mismatch_cnt' is zero unless [last_]sync_action is "check".
+ 1.6.0	Add discard support (and devices_handle_discard_safely module param).
+ 1.7.0	Add support for MD RAID0 mappings.
+ 1.8.0	Explicitly check for compatible flags in the superblock metadata
 	and reject to start the raid set if any are set by a newer
 	target version, thus avoiding data corruption on a raid set
 	with a reshape in progress.
-1.9.0   Add support for RAID level takeover/reshape/region size
+ 1.9.0	Add support for RAID level takeover/reshape/region size
 	and set size reduction.
-1.9.1   Fix activation of existing RAID 4/10 mapped devices
-1.9.2   Don't emit '- -' on the status table line in case the constructor
+ 1.9.1	Fix activation of existing RAID 4/10 mapped devices
+ 1.9.2	Don't emit '- -' on the status table line in case the constructor
 	fails reading a superblock. Correctly emit 'maj:min1 maj:min2' and
 	'D' on the status line.  If '- -' is passed into the constructor, emit
 	'- -' on the table line and '-' as the status line health character.
-1.10.0  Add support for raid4/5/6 journal device
-1.10.1  Fix data corruption on reshape request
-1.11.0  Fix table line argument order
+ 1.10.0	Add support for raid4/5/6 journal device
+ 1.10.1	Fix data corruption on reshape request
+ 1.11.0	Fix table line argument order
 	(wrong raid10_copies/raid10_format sequence)
-1.11.1  Add raid4/5/6 journal write-back support via journal_mode option
-1.12.1  Fix for MD deadlock between mddev_suspend() and md_write_start() available
-1.13.0  Fix dev_health status at end of "recover" (was 'a', now 'A')
-1.13.1  Fix deadlock caused by early md_stop_writes().  Also fix size an
+ 1.11.1	Add raid4/5/6 journal write-back support via journal_mode option
+ 1.12.1	Fix for MD deadlock between mddev_suspend() and md_write_start() available
+ 1.13.0	Fix dev_health status at end of "recover" (was 'a', now 'A')
+ 1.13.1	Fix deadlock caused by early md_stop_writes().  Also fix size an
 	state races.
-1.13.2  Fix raid redundancy validation and avoid keeping raid set frozen
-1.14.0  Fix reshape race on small devices.  Fix stripe adding reshape
+ 1.13.2	Fix raid redundancy validation and avoid keeping raid set frozen
+ 1.14.0	Fix reshape race on small devices.  Fix stripe adding reshape
 	deadlock/potential data corruption.  Update superblock when
 	specific devices are requested via rebuild.  Fix RAID leg
 	rebuild errors.
diff --git a/Documentation/device-mapper/dm-service-time.txt b/Documentation/device-mapper/dm-service-time.rst
similarity index 60%
rename from Documentation/device-mapper/dm-service-time.txt
rename to Documentation/device-mapper/dm-service-time.rst
index fb1d4a0cf122..facf277fc13c 100644
--- a/Documentation/device-mapper/dm-service-time.txt
+++ b/Documentation/device-mapper/dm-service-time.rst
@@ -1,3 +1,4 @@
+===============
 dm-service-time
 ===============
 
@@ -12,25 +13,34 @@ in a path-group, and it can be specified as a table argument.
 
 The path selector name is 'service-time'.
 
-Table parameters for each path: [<repeat_count> [<relative_throughput>]]
-	<repeat_count>: The number of I/Os to dispatch using the selected
+Table parameters for each path:
+
+    [<repeat_count> [<relative_throughput>]]
+	<repeat_count>:
+			The number of I/Os to dispatch using the selected
 			path before switching to the next path.
 			If not given, internal default is used.  To check
 			the default value, see the activated table.
-	<relative_throughput>: The relative throughput value of the path
+	<relative_throughput>:
+			The relative throughput value of the path
 			among all paths in the path-group.
 			The valid range is 0-100.
 			If not given, minimum value '1' is used.
 			If '0' is given, the path isn't selected while
 			other paths having a positive value are available.
 
-Status for each path: <status> <fail-count> <in-flight-size> \
-		      <relative_throughput>
-	<status>: 'A' if the path is active, 'F' if the path is failed.
-	<fail-count>: The number of path failures.
-	<in-flight-size>: The size of in-flight I/Os on the path.
-	<relative_throughput>: The relative throughput value of the path
-			among all paths in the path-group.
+Status for each path:
+
+    <status> <fail-count> <in-flight-size> <relative_throughput>
+	<status>:
+		'A' if the path is active, 'F' if the path is failed.
+	<fail-count>:
+		The number of path failures.
+	<in-flight-size>:
+		The size of in-flight I/Os on the path.
+	<relative_throughput>:
+		The relative throughput value of the path
+		among all paths in the path-group.
 
 
 Algorithm
@@ -39,7 +49,7 @@ Algorithm
 dm-service-time adds the I/O size to 'in-flight-size' when the I/O is
 dispatched and subtracts when completed.
 Basically, dm-service-time selects a path having minimum service time
-which is calculated by:
+which is calculated by::
 
 	('in-flight-size' + 'size-of-incoming-io') / 'relative_throughput'
 
@@ -67,25 +77,25 @@ Examples
 ========
 In case that 2 paths (sda and sdb) are used with repeat_count == 128
 and sda has an average throughput 1GB/s and sdb has 4GB/s,
-'relative_throughput' value may be '1' for sda and '4' for sdb.
+'relative_throughput' value may be '1' for sda and '4' for sdb::
 
-# echo "0 10 multipath 0 0 1 1 service-time 0 2 2 8:0 128 1 8:16 128 4" \
-  dmsetup create test
-#
-# dmsetup table
-test: 0 10 multipath 0 0 1 1 service-time 0 2 2 8:0 128 1 8:16 128 4
-#
-# dmsetup status
-test: 0 10 multipath 2 0 0 0 1 1 E 0 2 2 8:0 A 0 0 1 8:16 A 0 0 4
+  # echo "0 10 multipath 0 0 1 1 service-time 0 2 2 8:0 128 1 8:16 128 4" \
+    dmsetup create test
+  #
+  # dmsetup table
+  test: 0 10 multipath 0 0 1 1 service-time 0 2 2 8:0 128 1 8:16 128 4
+  #
+  # dmsetup status
+  test: 0 10 multipath 2 0 0 0 1 1 E 0 2 2 8:0 A 0 0 1 8:16 A 0 0 4
 
 
-Or '2' for sda and '8' for sdb would be also true.
+Or '2' for sda and '8' for sdb would be also true::
 
-# echo "0 10 multipath 0 0 1 1 service-time 0 2 2 8:0 128 2 8:16 128 8" \
-  dmsetup create test
-#
-# dmsetup table
-test: 0 10 multipath 0 0 1 1 service-time 0 2 2 8:0 128 2 8:16 128 8
-#
-# dmsetup status
-test: 0 10 multipath 2 0 0 0 1 1 E 0 2 2 8:0 A 0 0 2 8:16 A 0 0 8
+  # echo "0 10 multipath 0 0 1 1 service-time 0 2 2 8:0 128 2 8:16 128 8" \
+    dmsetup create test
+  #
+  # dmsetup table
+  test: 0 10 multipath 0 0 1 1 service-time 0 2 2 8:0 128 2 8:16 128 8
+  #
+  # dmsetup status
+  test: 0 10 multipath 2 0 0 0 1 1 E 0 2 2 8:0 A 0 0 2 8:16 A 0 0 8
diff --git a/Documentation/device-mapper/dm-uevent.rst b/Documentation/device-mapper/dm-uevent.rst
new file mode 100644
index 000000000000..4a8ee8d069c9
--- /dev/null
+++ b/Documentation/device-mapper/dm-uevent.rst
@@ -0,0 +1,110 @@
+====================
+device-mapper uevent
+====================
+
+The device-mapper uevent code adds the capability to device-mapper to create
+and send kobject uevents (uevents).  Previously device-mapper events were only
+available through the ioctl interface.  The advantage of the uevents interface
+is the event contains environment attributes providing increased context for
+the event avoiding the need to query the state of the device-mapper device after
+the event is received.
+
+There are two functions currently for device-mapper events.  The first function
+listed creates the event and the second function sends the event(s)::
+
+  void dm_path_uevent(enum dm_uevent_type event_type, struct dm_target *ti,
+                      const char *path, unsigned nr_valid_paths)
+
+  void dm_send_uevents(struct list_head *events, struct kobject *kobj)
+
+
+The variables added to the uevent environment are:
+
+Variable Name: DM_TARGET
+------------------------
+:Uevent Action(s): KOBJ_CHANGE
+:Type: string
+:Description:
+:Value: Name of device-mapper target that generated the event.
+
+Variable Name: DM_ACTION
+------------------------
+:Uevent Action(s): KOBJ_CHANGE
+:Type: string
+:Description:
+:Value: Device-mapper specific action that caused the uevent action.
+	PATH_FAILED - A path has failed;
+	PATH_REINSTATED - A path has been reinstated.
+
+Variable Name: DM_SEQNUM
+------------------------
+:Uevent Action(s): KOBJ_CHANGE
+:Type: unsigned integer
+:Description: A sequence number for this specific device-mapper device.
+:Value: Valid unsigned integer range.
+
+Variable Name: DM_PATH
+----------------------
+:Uevent Action(s): KOBJ_CHANGE
+:Type: string
+:Description: Major and minor number of the path device pertaining to this
+	      event.
+:Value: Path name in the form of "Major:Minor"
+
+Variable Name: DM_NR_VALID_PATHS
+--------------------------------
+:Uevent Action(s): KOBJ_CHANGE
+:Type: unsigned integer
+:Description:
+:Value: Valid unsigned integer range.
+
+Variable Name: DM_NAME
+----------------------
+:Uevent Action(s): KOBJ_CHANGE
+:Type: string
+:Description: Name of the device-mapper device.
+:Value: Name
+
+Variable Name: DM_UUID
+----------------------
+:Uevent Action(s): KOBJ_CHANGE
+:Type: string
+:Description: UUID of the device-mapper device.
+:Value: UUID. (Empty string if there isn't one.)
+
+An example of the uevents generated as captured by udevmonitor is shown
+below
+
+1.) Path failure::
+
+	UEVENT[1192521009.711215] change@/block/dm-3
+	ACTION=change
+	DEVPATH=/block/dm-3
+	SUBSYSTEM=block
+	DM_TARGET=multipath
+	DM_ACTION=PATH_FAILED
+	DM_SEQNUM=1
+	DM_PATH=8:32
+	DM_NR_VALID_PATHS=0
+	DM_NAME=mpath2
+	DM_UUID=mpath-35333333000002328
+	MINOR=3
+	MAJOR=253
+	SEQNUM=1130
+
+2.) Path reinstate::
+
+	UEVENT[1192521132.989927] change@/block/dm-3
+	ACTION=change
+	DEVPATH=/block/dm-3
+	SUBSYSTEM=block
+	DM_TARGET=multipath
+	DM_ACTION=PATH_REINSTATED
+	DM_SEQNUM=2
+	DM_PATH=8:32
+	DM_NR_VALID_PATHS=1
+	DM_NAME=mpath2
+	DM_UUID=mpath-35333333000002328
+	MINOR=3
+	MAJOR=253
+	SEQNUM=1131
diff --git a/Documentation/device-mapper/dm-uevent.txt b/Documentation/device-mapper/dm-uevent.txt
deleted file mode 100644
index 07edbd85c714..000000000000
--- a/Documentation/device-mapper/dm-uevent.txt
+++ /dev/null
@@ -1,97 +0,0 @@
-The device-mapper uevent code adds the capability to device-mapper to create
-and send kobject uevents (uevents).  Previously device-mapper events were only
-available through the ioctl interface.  The advantage of the uevents interface
-is the event contains environment attributes providing increased context for
-the event avoiding the need to query the state of the device-mapper device after
-the event is received.
-
-There are two functions currently for device-mapper events.  The first function
-listed creates the event and the second function sends the event(s).
-
-void dm_path_uevent(enum dm_uevent_type event_type, struct dm_target *ti,
-                    const char *path, unsigned nr_valid_paths)
-
-void dm_send_uevents(struct list_head *events, struct kobject *kobj)
-
-
-The variables added to the uevent environment are:
-
-Variable Name: DM_TARGET
-Uevent Action(s): KOBJ_CHANGE
-Type: string
-Description:
-Value: Name of device-mapper target that generated the event.
-
-Variable Name: DM_ACTION
-Uevent Action(s): KOBJ_CHANGE
-Type: string
-Description:
-Value: Device-mapper specific action that caused the uevent action.
-	PATH_FAILED - A path has failed.
-	PATH_REINSTATED - A path has been reinstated.
-
-Variable Name: DM_SEQNUM
-Uevent Action(s): KOBJ_CHANGE
-Type: unsigned integer
-Description: A sequence number for this specific device-mapper device.
-Value: Valid unsigned integer range.
-
-Variable Name: DM_PATH
-Uevent Action(s): KOBJ_CHANGE
-Type: string
-Description: Major and minor number of the path device pertaining to this
-event.
-Value: Path name in the form of "Major:Minor"
-
-Variable Name: DM_NR_VALID_PATHS
-Uevent Action(s): KOBJ_CHANGE
-Type: unsigned integer
-Description:
-Value: Valid unsigned integer range.
-
-Variable Name: DM_NAME
-Uevent Action(s): KOBJ_CHANGE
-Type: string
-Description: Name of the device-mapper device.
-Value: Name
-
-Variable Name: DM_UUID
-Uevent Action(s): KOBJ_CHANGE
-Type: string
-Description: UUID of the device-mapper device.
-Value: UUID. (Empty string if there isn't one.)
-
-An example of the uevents generated as captured by udevmonitor is shown
-below.
-
-1.) Path failure.
-UEVENT[1192521009.711215] change@/block/dm-3
-ACTION=change
-DEVPATH=/block/dm-3
-SUBSYSTEM=block
-DM_TARGET=multipath
-DM_ACTION=PATH_FAILED
-DM_SEQNUM=1
-DM_PATH=8:32
-DM_NR_VALID_PATHS=0
-DM_NAME=mpath2
-DM_UUID=mpath-35333333000002328
-MINOR=3
-MAJOR=253
-SEQNUM=1130
-
-2.) Path reinstate.
-UEVENT[1192521132.989927] change@/block/dm-3
-ACTION=change
-DEVPATH=/block/dm-3
-SUBSYSTEM=block
-DM_TARGET=multipath
-DM_ACTION=PATH_REINSTATED
-DM_SEQNUM=2
-DM_PATH=8:32
-DM_NR_VALID_PATHS=1
-DM_NAME=mpath2
-DM_UUID=mpath-35333333000002328
-MINOR=3
-MAJOR=253
-SEQNUM=1131
diff --git a/Documentation/device-mapper/dm-zoned.txt b/Documentation/device-mapper/dm-zoned.rst
similarity index 97%
rename from Documentation/device-mapper/dm-zoned.txt
rename to Documentation/device-mapper/dm-zoned.rst
index 736fcc78d193..07f56ebc1730 100644
--- a/Documentation/device-mapper/dm-zoned.txt
+++ b/Documentation/device-mapper/dm-zoned.rst
@@ -1,3 +1,4 @@
+========
 dm-zoned
 ========
 
@@ -133,12 +134,13 @@ A zoned block device must first be formatted using the dmzadm tool. This
 will analyze the device zone configuration, determine where to place the
 metadata sets on the device and initialize the metadata sets.
 
-Ex:
+Ex::
 
-dmzadm --format /dev/sdxx
+	dmzadm --format /dev/sdxx
 
 For a formatted device, the target can be created normally with the
 dmsetup utility. The only parameter that dm-zoned requires is the
-underlying zoned block device name. Ex:
+underlying zoned block device name. Ex::
 
-echo "0 `blockdev --getsize ${dev}` zoned ${dev}" | dmsetup create dmz-`basename ${dev}`
+	echo "0 `blockdev --getsize ${dev}` zoned ${dev}" | \
+	dmsetup create dmz-`basename ${dev}`
diff --git a/Documentation/device-mapper/era.txt b/Documentation/device-mapper/era.rst
similarity index 70%
rename from Documentation/device-mapper/era.txt
rename to Documentation/device-mapper/era.rst
index 3c6d01be3560..90dd5c670b9f 100644
--- a/Documentation/device-mapper/era.txt
+++ b/Documentation/device-mapper/era.rst
@@ -1,3 +1,7 @@
+======
+dm-era
+======
+
 Introduction
 ============
 
@@ -14,12 +18,14 @@ coherency after rolling back a vendor snapshot.
 Constructor
 ===========
 
- era <metadata dev> <origin dev> <block size>
+era <metadata dev> <origin dev> <block size>
 
- metadata dev    : fast device holding the persistent metadata
- origin dev	 : device holding data blocks that may change
- block size      : block size of origin data device, granularity that is
-		     tracked by the target
+ ================ ======================================================
+ metadata dev     fast device holding the persistent metadata
+ origin dev	  device holding data blocks that may change
+ block size       block size of origin data device, granularity that is
+		  tracked by the target
+ ================ ======================================================
 
 Messages
 ========
@@ -49,14 +55,16 @@ Status
 <metadata block size> <#used metadata blocks>/<#total metadata blocks>
 <current era> <held metadata root | '-'>
 
-metadata block size	 : Fixed block size for each metadata block in
-			     sectors
-#used metadata blocks	 : Number of metadata blocks used
-#total metadata blocks	 : Total number of metadata blocks
-current era		 : The current era
-held metadata root	 : The location, in blocks, of the metadata root
-			     that has been 'held' for userspace read
-			     access. '-' indicates there is no held root
+========================= ==============================================
+metadata block size	  Fixed block size for each metadata block in
+			  sectors
+#used metadata blocks	  Number of metadata blocks used
+#total metadata blocks	  Total number of metadata blocks
+current era		  The current era
+held metadata root	  The location, in blocks, of the metadata root
+			  that has been 'held' for userspace read
+			  access. '-' indicates there is no held root
+========================= ==============================================
 
 Detailed use case
 =================
@@ -88,7 +96,7 @@ Memory usage
 
 The target uses a bitset to record writes in the current era.  It also
 has a spare bitset ready for switching over to a new era.  Other than
-that it uses a few 4k blocks for updating metadata.
+that it uses a few 4k blocks for updating metadata::
 
    (4 * nr_blocks) bytes + buffers
 
diff --git a/Documentation/device-mapper/index.rst b/Documentation/device-mapper/index.rst
new file mode 100644
index 000000000000..105e253bc231
--- /dev/null
+++ b/Documentation/device-mapper/index.rst
@@ -0,0 +1,44 @@
+:orphan:
+
+=============
+Device Mapper
+=============
+
+.. toctree::
+    :maxdepth: 1
+
+    cache-policies
+    cache
+    delay
+    dm-crypt
+    dm-flakey
+    dm-init
+    dm-integrity
+    dm-io
+    dm-log
+    dm-queue-length
+    dm-raid
+    dm-service-time
+    dm-uevent
+    dm-zoned
+    era
+    kcopyd
+    linear
+    log-writes
+    persistent-data
+    snapshot
+    statistics
+    striped
+    switch
+    thin-provisioning
+    unstriped
+    verity
+    writecache
+    zero
+
+.. only::  subproject and html
+
+   Indices
+   =======
+
+   * :ref:`genindex`
diff --git a/Documentation/device-mapper/kcopyd.txt b/Documentation/device-mapper/kcopyd.rst
similarity index 93%
rename from Documentation/device-mapper/kcopyd.txt
rename to Documentation/device-mapper/kcopyd.rst
index 820382c4cecf..7651d395127f 100644
--- a/Documentation/device-mapper/kcopyd.txt
+++ b/Documentation/device-mapper/kcopyd.rst
@@ -1,3 +1,4 @@
+======
 kcopyd
 ======
 
@@ -7,7 +8,7 @@ notification. It is used by dm-snapshot and dm-mirror.
 
 Users of kcopyd must first create a client and indicate how many memory pages
 to set aside for their copy jobs. This is done with a call to
-kcopyd_client_create().
+kcopyd_client_create()::
 
    int kcopyd_client_create(unsigned int num_pages,
                             struct kcopyd_client **result);
@@ -16,7 +17,7 @@ To start a copy job, the user must set up io_region structures to describe
 the source and destinations of the copy. Each io_region indicates a
 block-device along with the starting sector and size of the region. The source
 of the copy is given as one io_region structure, and the destinations of the
-copy are given as an array of io_region structures.
+copy are given as an array of io_region structures::
 
    struct io_region {
       struct block_device *bdev;
@@ -26,7 +27,7 @@ copy are given as an array of io_region structures.
 
 To start the copy, the user calls kcopyd_copy(), passing in the client
 pointer, pointers to the source and destination io_regions, the name of a
-completion callback routine, and a pointer to some context data for the copy.
+completion callback routine, and a pointer to some context data for the copy::
 
    int kcopyd_copy(struct kcopyd_client *kc, struct io_region *from,
                    unsigned int num_dests, struct io_region *dests,
@@ -41,7 +42,6 @@ write error occurred during the copy.
 
 When a user is done with all their copy jobs, they should call
 kcopyd_client_destroy() to delete the kcopyd client, which will release the
-associated memory pages.
+associated memory pages::
 
    void kcopyd_client_destroy(struct kcopyd_client *kc);
-
diff --git a/Documentation/device-mapper/linear.rst b/Documentation/device-mapper/linear.rst
new file mode 100644
index 000000000000..9d17fc6e64a9
--- /dev/null
+++ b/Documentation/device-mapper/linear.rst
@@ -0,0 +1,63 @@
+=========
+dm-linear
+=========
+
+Device-Mapper's "linear" target maps a linear range of the Device-Mapper
+device onto a linear range of another device.  This is the basic building
+block of logical volume managers.
+
+Parameters: <dev path> <offset>
+    <dev path>:
+	Full pathname to the underlying block-device, or a
+        "major:minor" device-number.
+    <offset>:
+	Starting sector within the device.
+
+
+Example scripts
+===============
+
+::
+
+  #!/bin/sh
+  # Create an identity mapping for a device
+  echo "0 `blockdev --getsz $1` linear $1 0" | dmsetup create identity
+
+::
+
+  #!/bin/sh
+  # Join 2 devices together
+  size1=`blockdev --getsz $1`
+  size2=`blockdev --getsz $2`
+  echo "0 $size1 linear $1 0
+  $size1 $size2 linear $2 0" | dmsetup create joined
+
+::
+
+  #!/usr/bin/perl -w
+  # Split a device into 4M chunks and then join them together in reverse order.
+
+  my $name = "reverse";
+  my $extent_size = 4 * 1024 * 2;
+  my $dev = $ARGV[0];
+  my $table = "";
+  my $count = 0;
+
+  if (!defined($dev)) {
+          die("Please specify a device.\n");
+  }
+
+  my $dev_size = `blockdev --getsz $dev`;
+  my $extents = int($dev_size / $extent_size) -
+                (($dev_size % $extent_size) ? 1 : 0);
+
+  while ($extents > 0) {
+          my $this_start = $count * $extent_size;
+          $extents--;
+          $count++;
+          my $this_offset = $extents * $extent_size;
+
+          $table .= "$this_start $extent_size linear $dev $this_offset\n";
+  }
+
+  `echo \"$table\" | dmsetup create $name`;
diff --git a/Documentation/device-mapper/linear.txt b/Documentation/device-mapper/linear.txt
deleted file mode 100644
index 7cb98d89d3f8..000000000000
--- a/Documentation/device-mapper/linear.txt
+++ /dev/null
@@ -1,61 +0,0 @@
-dm-linear
-=========
-
-Device-Mapper's "linear" target maps a linear range of the Device-Mapper
-device onto a linear range of another device.  This is the basic building
-block of logical volume managers.
-
-Parameters: <dev path> <offset>
-    <dev path>: Full pathname to the underlying block-device, or a
-                "major:minor" device-number.
-    <offset>: Starting sector within the device.
-
-
-Example scripts
-===============
-[[
-#!/bin/sh
-# Create an identity mapping for a device
-echo "0 `blockdev --getsz $1` linear $1 0" | dmsetup create identity
-]]
-
-
-[[
-#!/bin/sh
-# Join 2 devices together
-size1=`blockdev --getsz $1`
-size2=`blockdev --getsz $2`
-echo "0 $size1 linear $1 0
-$size1 $size2 linear $2 0" | dmsetup create joined
-]]
-
-
-[[
-#!/usr/bin/perl -w
-# Split a device into 4M chunks and then join them together in reverse order.
-
-my $name = "reverse";
-my $extent_size = 4 * 1024 * 2;
-my $dev = $ARGV[0];
-my $table = "";
-my $count = 0;
-
-if (!defined($dev)) {
-        die("Please specify a device.\n");
-}
-
-my $dev_size = `blockdev --getsz $dev`;
-my $extents = int($dev_size / $extent_size) -
-              (($dev_size % $extent_size) ? 1 : 0);
-
-while ($extents > 0) {
-        my $this_start = $count * $extent_size;
-        $extents--;
-        $count++;
-        my $this_offset = $extents * $extent_size;
-
-        $table .= "$this_start $extent_size linear $dev $this_offset\n";
-}
-
-`echo \"$table\" | dmsetup create $name`;
-]]
diff --git a/Documentation/device-mapper/log-writes.txt b/Documentation/device-mapper/log-writes.rst
similarity index 61%
rename from Documentation/device-mapper/log-writes.txt
rename to Documentation/device-mapper/log-writes.rst
index b638d124be6a..23141f2ffb7c 100644
--- a/Documentation/device-mapper/log-writes.txt
+++ b/Documentation/device-mapper/log-writes.rst
@@ -1,3 +1,4 @@
+=============
 dm-log-writes
 =============
 
@@ -25,11 +26,11 @@ completed WRITEs, at the time the REQ_PREFLUSH is issued, are added in order to
 simulate the worst case scenario with regard to power failures.  Consider the
 following example (W means write, C means complete):
 
-W1,W2,W3,C3,C2,Wflush,C1,Cflush
+	W1,W2,W3,C3,C2,Wflush,C1,Cflush
 
-The log would show the following
+The log would show the following:
 
-W3,W2,flush,W1....
+	W3,W2,flush,W1....
 
 Again this is to simulate what is actually on disk, this allows us to detect
 cases where a power failure at a particular point in time would create an
@@ -42,11 +43,11 @@ Any REQ_OP_DISCARD requests are treated like WRITE requests.  Otherwise we would
 have all the DISCARD requests, and then the WRITE requests and then the FLUSH
 request.  Consider the following example:
 
-WRITE block 1, DISCARD block 1, FLUSH
+	WRITE block 1, DISCARD block 1, FLUSH
 
-If we logged DISCARD when it completed, the replay would look like this
+If we logged DISCARD when it completed, the replay would look like this:
 
-DISCARD 1, WRITE 1, FLUSH
+	DISCARD 1, WRITE 1, FLUSH
 
 which isn't quite what happened and wouldn't be caught during the log replay.
 
@@ -57,15 +58,19 @@ i) Constructor
 
    log-writes <dev_path> <log_dev_path>
 
-   dev_path	: Device that all of the IO will go to normally.
-   log_dev_path : Device where the log entries are written to.
+   ============= ==============================================
+   dev_path	 Device that all of the IO will go to normally.
+   log_dev_path  Device where the log entries are written to.
+   ============= ==============================================
 
 ii) Status
 
     <#logged entries> <highest allocated sector>
 
-    #logged entries	       : Number of logged entries
-    highest allocated sector   : Highest allocated sector
+    =========================== ========================
+    #logged entries	        Number of logged entries
+    highest allocated sector    Highest allocated sector
+    =========================== ========================
 
 iii) Messages
 
@@ -75,15 +80,15 @@ iii) Messages
 	For example say you want to fsck a file system after every
 	write, but first you need to replay up to the mkfs to make sure
 	we're fsck'ing something reasonable, you would do something like
-	this:
+	this::
 
 	  mkfs.btrfs -f /dev/mapper/log
 	  dmsetup message log 0 mark mkfs
 	  <run test>
 
-	  This would allow you to replay the log up to the mkfs mark and
-	  then replay from that point on doing the fsck check in the
-	  interval that you want.
+	This would allow you to replay the log up to the mkfs mark and
+	then replay from that point on doing the fsck check in the
+	interval that you want.
 
 	Every log has a mark at the end labeled "dm-log-writes-end".
 
@@ -97,42 +102,42 @@ Example usage
 =============
 
 Say you want to test fsync on your file system.  You would do something like
-this:
+this::
 
-TABLE="0 $(blockdev --getsz /dev/sdb) log-writes /dev/sdb /dev/sdc"
-dmsetup create log --table "$TABLE"
-mkfs.btrfs -f /dev/mapper/log
-dmsetup message log 0 mark mkfs
+  TABLE="0 $(blockdev --getsz /dev/sdb) log-writes /dev/sdb /dev/sdc"
+  dmsetup create log --table "$TABLE"
+  mkfs.btrfs -f /dev/mapper/log
+  dmsetup message log 0 mark mkfs
 
-mount /dev/mapper/log /mnt/btrfs-test
-<some test that does fsync at the end>
-dmsetup message log 0 mark fsync
-md5sum /mnt/btrfs-test/foo
-umount /mnt/btrfs-test
+  mount /dev/mapper/log /mnt/btrfs-test
+  <some test that does fsync at the end>
+  dmsetup message log 0 mark fsync
+  md5sum /mnt/btrfs-test/foo
+  umount /mnt/btrfs-test
 
-dmsetup remove log
-replay-log --log /dev/sdc --replay /dev/sdb --end-mark fsync
-mount /dev/sdb /mnt/btrfs-test
-md5sum /mnt/btrfs-test/foo
-<verify md5sum's are correct>
+  dmsetup remove log
+  replay-log --log /dev/sdc --replay /dev/sdb --end-mark fsync
+  mount /dev/sdb /mnt/btrfs-test
+  md5sum /mnt/btrfs-test/foo
+  <verify md5sum's are correct>
 
-Another option is to do a complicated file system operation and verify the file
-system is consistent during the entire operation.  You could do this with:
+  Another option is to do a complicated file system operation and verify the file
+  system is consistent during the entire operation.  You could do this with:
 
-TABLE="0 $(blockdev --getsz /dev/sdb) log-writes /dev/sdb /dev/sdc"
-dmsetup create log --table "$TABLE"
-mkfs.btrfs -f /dev/mapper/log
-dmsetup message log 0 mark mkfs
+  TABLE="0 $(blockdev --getsz /dev/sdb) log-writes /dev/sdb /dev/sdc"
+  dmsetup create log --table "$TABLE"
+  mkfs.btrfs -f /dev/mapper/log
+  dmsetup message log 0 mark mkfs
 
-mount /dev/mapper/log /mnt/btrfs-test
-<fsstress to dirty the fs>
-btrfs filesystem balance /mnt/btrfs-test
-umount /mnt/btrfs-test
-dmsetup remove log
+  mount /dev/mapper/log /mnt/btrfs-test
+  <fsstress to dirty the fs>
+  btrfs filesystem balance /mnt/btrfs-test
+  umount /mnt/btrfs-test
+  dmsetup remove log
 
-replay-log --log /dev/sdc --replay /dev/sdb --end-mark mkfs
-btrfsck /dev/sdb
-replay-log --log /dev/sdc --replay /dev/sdb --start-mark mkfs \
+  replay-log --log /dev/sdc --replay /dev/sdb --end-mark mkfs
+  btrfsck /dev/sdb
+  replay-log --log /dev/sdc --replay /dev/sdb --start-mark mkfs \
 	--fsck "btrfsck /dev/sdb" --check fua
 
 And that will replay the log until it sees a FUA request, run the fsck command
diff --git a/Documentation/device-mapper/persistent-data.txt b/Documentation/device-mapper/persistent-data.rst
similarity index 98%
rename from Documentation/device-mapper/persistent-data.txt
rename to Documentation/device-mapper/persistent-data.rst
index a333bcb3a6c2..2065c3c5a091 100644
--- a/Documentation/device-mapper/persistent-data.txt
+++ b/Documentation/device-mapper/persistent-data.rst
@@ -1,3 +1,7 @@
+===============
+Persistent data
+===============
+
 Introduction
 ============
 
diff --git a/Documentation/device-mapper/snapshot.txt b/Documentation/device-mapper/snapshot.rst
similarity index 62%
rename from Documentation/device-mapper/snapshot.txt
rename to Documentation/device-mapper/snapshot.rst
index b8bbb516f989..4c53304e72f1 100644
--- a/Documentation/device-mapper/snapshot.txt
+++ b/Documentation/device-mapper/snapshot.rst
@@ -1,15 +1,16 @@
+==============================
 Device-mapper snapshot support
 ==============================
 
 Device-mapper allows you, without massive data copying:
 
-*) To create snapshots of any block device i.e. mountable, saved states of
-the block device which are also writable without interfering with the
-original content;
-*) To create device "forks", i.e. multiple different versions of the
-same data stream.
-*) To merge a snapshot of a block device back into the snapshot's origin
-device.
+-  To create snapshots of any block device i.e. mountable, saved states of
+   the block device which are also writable without interfering with the
+   original content;
+-  To create device "forks", i.e. multiple different versions of the
+   same data stream.
+-  To merge a snapshot of a block device back into the snapshot's origin
+   device.
 
 In the first two cases, dm copies only the chunks of data that get
 changed and uses a separate copy-on-write (COW) block device for
@@ -22,7 +23,7 @@ the origin device.
 There are three dm targets available:
 snapshot, snapshot-origin, and snapshot-merge.
 
-*) snapshot-origin <origin>
+-  snapshot-origin <origin>
 
 which will normally have one or more snapshots based on it.
 Reads will be mapped directly to the backing device. For each write, the
@@ -30,7 +31,7 @@ original data will be saved in the <COW device> of each snapshot to keep
 its visible content unchanged, at least until the <COW device> fills up.
 
 
-*) snapshot <origin> <COW device> <persistent?> <chunksize>
+-  snapshot <origin> <COW device> <persistent?> <chunksize>
 
 A snapshot of the <origin> block device is created. Changed chunks of
 <chunksize> sectors will be stored on the <COW device>.  Writes will
@@ -83,25 +84,25 @@ When you create the first LVM2 snapshot of a volume, four dm devices are used:
    source volume), whose table is replaced by a "snapshot-origin" mapping
    from device #1.
 
-A fixed naming scheme is used, so with the following commands:
+A fixed naming scheme is used, so with the following commands::
 
-lvcreate -L 1G -n base volumeGroup
-lvcreate -L 100M --snapshot -n snap volumeGroup/base
+  lvcreate -L 1G -n base volumeGroup
+  lvcreate -L 100M --snapshot -n snap volumeGroup/base
 
-we'll have this situation (with volumes in above order):
+we'll have this situation (with volumes in above order)::
 
-# dmsetup table|grep volumeGroup
+  # dmsetup table|grep volumeGroup
 
-volumeGroup-base-real: 0 2097152 linear 8:19 384
-volumeGroup-snap-cow: 0 204800 linear 8:19 2097536
-volumeGroup-snap: 0 2097152 snapshot 254:11 254:12 P 16
-volumeGroup-base: 0 2097152 snapshot-origin 254:11
+  volumeGroup-base-real: 0 2097152 linear 8:19 384
+  volumeGroup-snap-cow: 0 204800 linear 8:19 2097536
+  volumeGroup-snap: 0 2097152 snapshot 254:11 254:12 P 16
+  volumeGroup-base: 0 2097152 snapshot-origin 254:11
 
-# ls -lL /dev/mapper/volumeGroup-*
-brw-------  1 root root 254, 11 29 ago 18:15 /dev/mapper/volumeGroup-base-real
-brw-------  1 root root 254, 12 29 ago 18:15 /dev/mapper/volumeGroup-snap-cow
-brw-------  1 root root 254, 13 29 ago 18:15 /dev/mapper/volumeGroup-snap
-brw-------  1 root root 254, 10 29 ago 18:14 /dev/mapper/volumeGroup-base
+  # ls -lL /dev/mapper/volumeGroup-*
+  brw-------  1 root root 254, 11 29 ago 18:15 /dev/mapper/volumeGroup-base-real
+  brw-------  1 root root 254, 12 29 ago 18:15 /dev/mapper/volumeGroup-snap-cow
+  brw-------  1 root root 254, 13 29 ago 18:15 /dev/mapper/volumeGroup-snap
+  brw-------  1 root root 254, 10 29 ago 18:14 /dev/mapper/volumeGroup-base
 
 
 How snapshot-merge is used by LVM2
@@ -114,27 +115,28 @@ merging snapshot after it completes.  The "snapshot" that hands over its
 COW device to the "snapshot-merge" is deactivated (unless using lvchange
 --refresh); but if it is left active it will simply return I/O errors.
 
-A snapshot will merge into its origin with the following command:
+A snapshot will merge into its origin with the following command::
 
-lvconvert --merge volumeGroup/snap
+  lvconvert --merge volumeGroup/snap
 
-we'll now have this situation:
+we'll now have this situation::
 
-# dmsetup table|grep volumeGroup
+  # dmsetup table|grep volumeGroup
 
-volumeGroup-base-real: 0 2097152 linear 8:19 384
-volumeGroup-base-cow: 0 204800 linear 8:19 2097536
-volumeGroup-base: 0 2097152 snapshot-merge 254:11 254:12 P 16
+  volumeGroup-base-real: 0 2097152 linear 8:19 384
+  volumeGroup-base-cow: 0 204800 linear 8:19 2097536
+  volumeGroup-base: 0 2097152 snapshot-merge 254:11 254:12 P 16
 
-# ls -lL /dev/mapper/volumeGroup-*
-brw-------  1 root root 254, 11 29 ago 18:15 /dev/mapper/volumeGroup-base-real
-brw-------  1 root root 254, 12 29 ago 18:16 /dev/mapper/volumeGroup-base-cow
-brw-------  1 root root 254, 10 29 ago 18:16 /dev/mapper/volumeGroup-base
+  # ls -lL /dev/mapper/volumeGroup-*
+  brw-------  1 root root 254, 11 29 ago 18:15 /dev/mapper/volumeGroup-base-real
+  brw-------  1 root root 254, 12 29 ago 18:16 /dev/mapper/volumeGroup-base-cow
+  brw-------  1 root root 254, 10 29 ago 18:16 /dev/mapper/volumeGroup-base
 
 
 How to determine when a merging is complete
 ===========================================
 The snapshot-merge and snapshot status lines end with:
+
   <sectors_allocated>/<total_sectors> <metadata_sectors>
 
 Both <sectors_allocated> and <total_sectors> include both data and metadata.
@@ -142,35 +144,37 @@ During merging, the number of sectors allocated gets smaller and
 smaller.  Merging has finished when the number of sectors holding data
 is zero, in other words <sectors_allocated> == <metadata_sectors>.
 
-Here is a practical example (using a hybrid of lvm and dmsetup commands):
+Here is a practical example (using a hybrid of lvm and dmsetup commands)::
 
-# lvs
-  LV      VG          Attr   LSize Origin  Snap%  Move Log Copy%  Convert
-  base    volumeGroup owi-a- 4.00g
-  snap    volumeGroup swi-a- 1.00g base  18.97
+  # lvs
+    LV      VG          Attr   LSize Origin  Snap%  Move Log Copy%  Convert
+    base    volumeGroup owi-a- 4.00g
+    snap    volumeGroup swi-a- 1.00g base  18.97
 
-# dmsetup status volumeGroup-snap
-0 8388608 snapshot 397896/2097152 1560
-                                  ^^^^ metadata sectors
+  # dmsetup status volumeGroup-snap
+  0 8388608 snapshot 397896/2097152 1560
+                                    ^^^^ metadata sectors
 
-# lvconvert --merge -b volumeGroup/snap
-  Merging of volume snap started.
+  # lvconvert --merge -b volumeGroup/snap
+    Merging of volume snap started.
 
-# lvs volumeGroup/snap
-  LV      VG          Attr   LSize Origin  Snap%  Move Log Copy%  Convert
-  base    volumeGroup Owi-a- 4.00g          17.23
+  # lvs volumeGroup/snap
+    LV      VG          Attr   LSize Origin  Snap%  Move Log Copy%  Convert
+    base    volumeGroup Owi-a- 4.00g          17.23
 
-# dmsetup status volumeGroup-base
-0 8388608 snapshot-merge 281688/2097152 1104
+  # dmsetup status volumeGroup-base
+  0 8388608 snapshot-merge 281688/2097152 1104
 
-# dmsetup status volumeGroup-base
-0 8388608 snapshot-merge 180480/2097152 712
+  # dmsetup status volumeGroup-base
+  0 8388608 snapshot-merge 180480/2097152 712
 
-# dmsetup status volumeGroup-base
-0 8388608 snapshot-merge 16/2097152 16
+  # dmsetup status volumeGroup-base
+  0 8388608 snapshot-merge 16/2097152 16
 
 Merging has finished.
 
-# lvs
-  LV      VG          Attr   LSize Origin  Snap%  Move Log Copy%  Convert
-  base    volumeGroup owi-a- 4.00g
+::
+
+  # lvs
+    LV      VG          Attr   LSize Origin  Snap%  Move Log Copy%  Convert
+    base    volumeGroup owi-a- 4.00g
diff --git a/Documentation/device-mapper/statistics.txt b/Documentation/device-mapper/statistics.rst
similarity index 87%
rename from Documentation/device-mapper/statistics.txt
rename to Documentation/device-mapper/statistics.rst
index 170ac02a1f50..3d80a9f850cc 100644
--- a/Documentation/device-mapper/statistics.txt
+++ b/Documentation/device-mapper/statistics.rst
@@ -1,3 +1,4 @@
+=============
 DM statistics
 =============
 
@@ -11,7 +12,7 @@ Individual statistics will be collected for each step-sized area within
 the range specified.
 
 The I/O statistics counters for each step-sized area of a region are
-in the same format as /sys/block/*/stat or /proc/diskstats (see:
+in the same format as `/sys/block/*/stat` or `/proc/diskstats` (see:
 Documentation/iostats.txt).  But two extra counters (12 and 13) are
 provided: total time spent reading and writing.  When the histogram
 argument is used, the 14th parameter is reported that represents the
@@ -32,40 +33,45 @@ on each other's data.
 The creation of DM statistics will allocate memory via kmalloc or
 fallback to using vmalloc space.  At most, 1/4 of the overall system
 memory may be allocated by DM statistics.  The admin can see how much
-memory is used by reading
-/sys/module/dm_mod/parameters/stats_current_allocated_bytes
+memory is used by reading:
+
+	/sys/module/dm_mod/parameters/stats_current_allocated_bytes
 
 Messages
 ========
 
-    @stats_create <range> <step>
-		[<number_of_optional_arguments> <optional_arguments>...]
-		[<program_id> [<aux_data>]]
-
+    @stats_create <range> <step> [<number_of_optional_arguments> <optional_arguments>...] [<program_id> [<aux_data>]]
 	Create a new region and return the region_id.
 
 	<range>
-	  "-" - whole device
-	  "<start_sector>+<length>" - a range of <length> 512-byte sectors
-				      starting with <start_sector>.
+	  "-"
+		whole device
+	  "<start_sector>+<length>"
+		a range of <length> 512-byte sectors
+		starting with <start_sector>.
 
 	<step>
-	  "<area_size>" - the range is subdivided into areas each containing
-			  <area_size> sectors.
-	  "/<number_of_areas>" - the range is subdivided into the specified
-				 number of areas.
+	  "<area_size>"
+		the range is subdivided into areas each containing
+		<area_size> sectors.
+	  "/<number_of_areas>"
+		the range is subdivided into the specified
+		number of areas.
 
 	<number_of_optional_arguments>
 	  The number of optional arguments
 
 	<optional_arguments>
-	  The following optional arguments are supported
-	  precise_timestamps - use precise timer with nanosecond resolution
+	  The following optional arguments are supported:
+
+	  precise_timestamps
+		use precise timer with nanosecond resolution
 		instead of the "jiffies" variable.  When this argument is
 		used, the resulting times are in nanoseconds instead of
 		milliseconds.  Precise timestamps are a little bit slower
 		to obtain than jiffies-based timestamps.
-	  histogram:n1,n2,n3,n4,... - collect histogram of latencies.  The
+	  histogram:n1,n2,n3,n4,...
+		collect histogram of latencies.  The
 		numbers n1, n2, etc are times that represent the boundaries
 		of the histogram.  If precise_timestamps is not used, the
 		times are in milliseconds, otherwise they are in
@@ -96,21 +102,18 @@ Messages
 	  @stats_list message, but it doesn't use this value for anything.
 
     @stats_delete <region_id>
-
 	Delete the region with the specified id.
 
 	<region_id>
 	  region_id returned from @stats_create
 
     @stats_clear <region_id>
-
 	Clear all the counters except the in-flight i/o counters.
 
 	<region_id>
 	  region_id returned from @stats_create
 
     @stats_list [<program_id>]
-
 	List all regions registered with @stats_create.
 
 	<program_id>
@@ -127,7 +130,6 @@ Messages
 	if they were specified when creating the region.
 
     @stats_print <region_id> [<starting_line> <number_of_lines>]
-
 	Print counters for each step-sized area of a region.
 
 	<region_id>
@@ -143,10 +145,11 @@ Messages
 
 	Output format for each step-sized area of a region:
 
-	  <start_sector>+<length> counters
+	  <start_sector>+<length>
+		counters
 
 	  The first 11 counters have the same meaning as
-	  /sys/block/*/stat or /proc/diskstats.
+	  `/sys/block/*/stat or /proc/diskstats`.
 
 	  Please refer to Documentation/iostats.txt for details.
 
@@ -163,11 +166,11 @@ Messages
 	  11. the weighted number of milliseconds spent doing I/Os
 
 	  Additional counters:
+
 	  12. the total time spent reading in milliseconds
 	  13. the total time spent writing in milliseconds
 
     @stats_print_clear <region_id> [<starting_line> <number_of_lines>]
-
 	Atomically print and then clear all the counters except the
 	in-flight i/o counters.	 Useful when the client consuming the
 	statistics does not want to lose any statistics (those updated
@@ -185,7 +188,6 @@ Messages
 	  If omitted, all lines are printed and then cleared.
 
     @stats_set_aux <region_id> <aux_data>
-
 	Store auxiliary data aux_data for the specified region.
 
 	<region_id>
@@ -201,23 +203,23 @@ Examples
 ========
 
 Subdivide the DM device 'vol' into 100 pieces and start collecting
-statistics on them:
+statistics on them::
 
   dmsetup message vol 0 @stats_create - /100
 
 Set the auxiliary data string to "foo bar baz" (the escape for each
-space must also be escaped, otherwise the shell will consume them):
+space must also be escaped, otherwise the shell will consume them)::
 
   dmsetup message vol 0 @stats_set_aux 0 foo\\ bar\\ baz
 
-List the statistics:
+List the statistics::
 
   dmsetup message vol 0 @stats_list
 
-Print the statistics:
+Print the statistics::
 
   dmsetup message vol 0 @stats_print 0
 
-Delete the statistics:
+Delete the statistics::
 
   dmsetup message vol 0 @stats_delete 0
diff --git a/Documentation/device-mapper/striped.rst b/Documentation/device-mapper/striped.rst
new file mode 100644
index 000000000000..e9a8da192ae1
--- /dev/null
+++ b/Documentation/device-mapper/striped.rst
@@ -0,0 +1,61 @@
+=========
+dm-stripe
+=========
+
+Device-Mapper's "striped" target is used to create a striped (i.e. RAID-0)
+device across one or more underlying devices. Data is written in "chunks",
+with consecutive chunks rotating among the underlying devices. This can
+potentially provide improved I/O throughput by utilizing several physical
+devices in parallel.
+
+Parameters: <num devs> <chunk size> [<dev path> <offset>]+
+    <num devs>:
+	Number of underlying devices.
+    <chunk size>:
+	Size of each chunk of data. Must be at least as
+        large as the system's PAGE_SIZE.
+    <dev path>:
+	Full pathname to the underlying block-device, or a
+	"major:minor" device-number.
+    <offset>:
+	Starting sector within the device.
+
+One or more underlying devices can be specified. The striped device size must
+be a multiple of the chunk size multiplied by the number of underlying devices.
+
+
+Example scripts
+===============
+
+::
+
+  #!/usr/bin/perl -w
+  # Create a striped device across any number of underlying devices. The device
+  # will be called "stripe_dev" and have a chunk-size of 128k.
+
+  my $chunk_size = 128 * 2;
+  my $dev_name = "stripe_dev";
+  my $num_devs = @ARGV;
+  my @devs = @ARGV;
+  my ($min_dev_size, $stripe_dev_size, $i);
+
+  if (!$num_devs) {
+          die("Specify at least one device\n");
+  }
+
+  $min_dev_size = `blockdev --getsz $devs[0]`;
+  for ($i = 1; $i < $num_devs; $i++) {
+          my $this_size = `blockdev --getsz $devs[$i]`;
+          $min_dev_size = ($min_dev_size < $this_size) ?
+                          $min_dev_size : $this_size;
+  }
+
+  $stripe_dev_size = $min_dev_size * $num_devs;
+  $stripe_dev_size -= $stripe_dev_size % ($chunk_size * $num_devs);
+
+  $table = "0 $stripe_dev_size striped $num_devs $chunk_size";
+  for ($i = 0; $i < $num_devs; $i++) {
+          $table .= " $devs[$i] 0";
+  }
+
+  `echo $table | dmsetup create $dev_name`;
diff --git a/Documentation/device-mapper/striped.txt b/Documentation/device-mapper/striped.txt
deleted file mode 100644
index 07ec492cceee..000000000000
--- a/Documentation/device-mapper/striped.txt
+++ /dev/null
@@ -1,57 +0,0 @@
-dm-stripe
-=========
-
-Device-Mapper's "striped" target is used to create a striped (i.e. RAID-0)
-device across one or more underlying devices. Data is written in "chunks",
-with consecutive chunks rotating among the underlying devices. This can
-potentially provide improved I/O throughput by utilizing several physical
-devices in parallel.
-
-Parameters: <num devs> <chunk size> [<dev path> <offset>]+
-    <num devs>: Number of underlying devices.
-    <chunk size>: Size of each chunk of data. Must be at least as
-                  large as the system's PAGE_SIZE.
-    <dev path>: Full pathname to the underlying block-device, or a
-                "major:minor" device-number.
-    <offset>: Starting sector within the device.
-
-One or more underlying devices can be specified. The striped device size must
-be a multiple of the chunk size multiplied by the number of underlying devices.
-
-
-Example scripts
-===============
-
-[[
-#!/usr/bin/perl -w
-# Create a striped device across any number of underlying devices. The device
-# will be called "stripe_dev" and have a chunk-size of 128k.
-
-my $chunk_size = 128 * 2;
-my $dev_name = "stripe_dev";
-my $num_devs = @ARGV;
-my @devs = @ARGV;
-my ($min_dev_size, $stripe_dev_size, $i);
-
-if (!$num_devs) {
-        die("Specify at least one device\n");
-}
-
-$min_dev_size = `blockdev --getsz $devs[0]`;
-for ($i = 1; $i < $num_devs; $i++) {
-        my $this_size = `blockdev --getsz $devs[$i]`;
-        $min_dev_size = ($min_dev_size < $this_size) ?
-                        $min_dev_size : $this_size;
-}
-
-$stripe_dev_size = $min_dev_size * $num_devs;
-$stripe_dev_size -= $stripe_dev_size % ($chunk_size * $num_devs);
-
-$table = "0 $stripe_dev_size striped $num_devs $chunk_size";
-for ($i = 0; $i < $num_devs; $i++) {
-        $table .= " $devs[$i] 0";
-}
-
-`echo $table | dmsetup create $dev_name`;
-]]
-
diff --git a/Documentation/device-mapper/switch.txt b/Documentation/device-mapper/switch.rst
similarity index 84%
rename from Documentation/device-mapper/switch.txt
rename to Documentation/device-mapper/switch.rst
index 5bd4831db4a8..7dde06be1a4f 100644
--- a/Documentation/device-mapper/switch.txt
+++ b/Documentation/device-mapper/switch.rst
@@ -1,3 +1,4 @@
+=========
 dm-switch
 =========
 
@@ -67,27 +68,25 @@ b-tree can achieve.
 Construction Parameters
 =======================
 
-    <num_paths> <region_size> <num_optional_args> [<optional_args>...]
-    [<dev_path> <offset>]+
+    <num_paths> <region_size> <num_optional_args> [<optional_args>...] [<dev_path> <offset>]+
+	<num_paths>
+	    The number of paths across which to distribute the I/O.
 
-<num_paths>
-    The number of paths across which to distribute the I/O.
+	<region_size>
+	    The number of 512-byte sectors in a region. Each region can be redirected
+	    to any of the available paths.
 
-<region_size>
-    The number of 512-byte sectors in a region. Each region can be redirected
-    to any of the available paths.
+	<num_optional_args>
+	    The number of optional arguments. Currently, no optional arguments
+	    are supported and so this must be zero.
 
-<num_optional_args>
-    The number of optional arguments. Currently, no optional arguments
-    are supported and so this must be zero.
+	<dev_path>
+	    The block device that represents a specific path to the device.
 
-<dev_path>
-    The block device that represents a specific path to the device.
-
-<offset>
-    The offset of the start of data on the specific <dev_path> (in units
-    of 512-byte sectors). This number is added to the sector number when
-    forwarding the request to the specific path. Typically it is zero.
+	<offset>
+	    The offset of the start of data on the specific <dev_path> (in units
+	    of 512-byte sectors). This number is added to the sector number when
+	    forwarding the request to the specific path. Typically it is zero.
 
 Messages
 ========
@@ -122,17 +121,21 @@ Example
 Assume that you have volumes vg1/switch0 vg1/switch1 vg1/switch2 with
 the same size.
 
-Create a switch device with 64kB region size:
+Create a switch device with 64kB region size::
+
     dmsetup create switch --table "0 `blockdev --getsz /dev/vg1/switch0`
 	switch 3 128 0 /dev/vg1/switch0 0 /dev/vg1/switch1 0 /dev/vg1/switch2 0"
 
 Set mappings for the first 7 entries to point to devices switch0, switch1,
-switch2, switch0, switch1, switch2, switch1:
+switch2, switch0, switch1, switch2, switch1::
+
     dmsetup message switch 0 set_region_mappings 0:0 :1 :2 :0 :1 :2 :1
 
-Set repetitive mapping. This command:
+Set repetitive mapping. This command::
+
     dmsetup message switch 0 set_region_mappings 1000:1 :2 R2,10
-is equivalent to:
+
+is equivalent to::
+
     dmsetup message switch 0 set_region_mappings 1000:1 :2 :1 :2 :1 :2 :1 :2 \
 	:1 :2 :1 :2 :1 :2 :1 :2 :1 :2
-
diff --git a/Documentation/device-mapper/thin-provisioning.txt b/Documentation/device-mapper/thin-provisioning.rst
similarity index 92%
rename from Documentation/device-mapper/thin-provisioning.txt
rename to Documentation/device-mapper/thin-provisioning.rst
index 883e7ca5f745..bafebf79da4b 100644
--- a/Documentation/device-mapper/thin-provisioning.txt
+++ b/Documentation/device-mapper/thin-provisioning.rst
@@ -1,3 +1,7 @@
+=================
+Thin provisioning
+=================
+
 Introduction
 ============
 
@@ -95,6 +99,8 @@ previously.)
 Using an existing pool device
 -----------------------------
 
+::
+
     dmsetup create pool \
 	--table "0 20971520 thin-pool $metadata_dev $data_dev \
 		 $data_block_size $low_water_mark"
@@ -154,7 +160,7 @@ Thin provisioning
 i) Creating a new thinly-provisioned volume.
 
   To create a new thinly- provisioned volume you must send a message to an
-  active pool device, /dev/mapper/pool in this example.
+  active pool device, /dev/mapper/pool in this example::
 
     dmsetup message /dev/mapper/pool 0 "create_thin 0"
 
@@ -164,7 +170,7 @@ i) Creating a new thinly-provisioned volume.
 
 ii) Using a thinly-provisioned volume.
 
-  Thinly-provisioned volumes are activated using the 'thin' target:
+  Thinly-provisioned volumes are activated using the 'thin' target::
 
     dmsetup create thin --table "0 2097152 thin /dev/mapper/pool 0"
 
@@ -181,6 +187,8 @@ i) Creating an internal snapshot.
   must suspend it before creating the snapshot to avoid corruption.
   This is NOT enforced at the moment, so please be careful!
 
+  ::
+
     dmsetup suspend /dev/mapper/thin
     dmsetup message /dev/mapper/pool 0 "create_snap 1 0"
     dmsetup resume /dev/mapper/thin
@@ -198,14 +206,14 @@ ii) Using an internal snapshot.
   activating or removing them both.  (This differs from conventional
   device-mapper snapshots.)
 
-  Activate it exactly the same way as any other thinly-provisioned volume:
+  Activate it exactly the same way as any other thinly-provisioned volume::
 
     dmsetup create snap --table "0 2097152 thin /dev/mapper/pool 1"
 
 External snapshots
 ------------------
 
-You can use an external _read only_ device as an origin for a
+You can use an external **read only** device as an origin for a
 thinly-provisioned volume.  Any read to an unprovisioned area of the
 thin device will be passed through to the origin.  Writes trigger
 the allocation of new blocks as usual.
@@ -223,11 +231,13 @@ i) Creating a snapshot of an external device
   This is the same as creating a thin device.
   You don't mention the origin at this stage.
 
+  ::
+
     dmsetup message /dev/mapper/pool 0 "create_thin 0"
 
 ii) Using a snapshot of an external device.
 
-  Append an extra parameter to the thin target specifying the origin:
+  Append an extra parameter to the thin target specifying the origin::
 
     dmsetup create snap --table "0 2097152 thin /dev/mapper/pool 0 /dev/image"
 
@@ -240,6 +250,8 @@ Deactivation
 All devices using a pool must be deactivated before the pool itself
 can be.
 
+::
+
     dmsetup remove thin
     dmsetup remove snap
     dmsetup remove pool
@@ -252,25 +264,32 @@ Reference
 
 i) Constructor
 
-    thin-pool <metadata dev> <data dev> <data block size (sectors)> \
-	      <low water mark (blocks)> [<number of feature args> [<arg>]*]
+    ::
+
+      thin-pool <metadata dev> <data dev> <data block size (sectors)> \
+	        <low water mark (blocks)> [<number of feature args> [<arg>]*]
 
     Optional feature arguments:
 
-      skip_block_zeroing: Skip the zeroing of newly-provisioned blocks.
+      skip_block_zeroing:
+	Skip the zeroing of newly-provisioned blocks.
 
-      ignore_discard: Disable discard support.
+      ignore_discard:
+	Disable discard support.
 
-      no_discard_passdown: Don't pass discards down to the underlying
-			   data device, but just remove the mapping.
+      no_discard_passdown:
+	Don't pass discards down to the underlying
+	data device, but just remove the mapping.
 
-      read_only: Don't allow any changes to be made to the pool
+      read_only:
+		 Don't allow any changes to be made to the pool
 		 metadata.  This mode is only available after the
 		 thin-pool has been created and first used in full
 		 read/write mode.  It cannot be specified on initial
 		 thin-pool creation.
 
-      error_if_no_space: Error IOs, instead of queueing, if no space.
+      error_if_no_space:
+	Error IOs, instead of queueing, if no space.
 
     Data block size must be between 64KB (128 sectors) and 1GB
     (2097152 sectors) inclusive.
@@ -278,10 +297,12 @@ i) Constructor
 
 ii) Status
 
-    <transaction id> <used metadata blocks>/<total metadata blocks>
-    <used data blocks>/<total data blocks> <held metadata root>
-    ro|rw|out_of_data_space [no_]discard_passdown [error|queue]_if_no_space
-    needs_check|- metadata_low_watermark
+    ::
+
+      <transaction id> <used metadata blocks>/<total metadata blocks>
+      <used data blocks>/<total data blocks> <held metadata root>
+      ro|rw|out_of_data_space [no_]discard_passdown [error|queue]_if_no_space
+      needs_check|- metadata_low_watermark
 
     transaction id:
 	A 64-bit number used by userspace to help synchronise with metadata
@@ -336,13 +357,11 @@ ii) Status
 iii) Messages
 
     create_thin <dev id>
-
 	Create a new thinly-provisioned device.
 	<dev id> is an arbitrary unique 24-bit identifier chosen by
 	the caller.
 
     create_snap <dev id> <origin id>
-
 	Create a new snapshot of another thinly-provisioned device.
 	<dev id> is an arbitrary unique 24-bit identifier chosen by
 	the caller.
@@ -350,11 +369,9 @@ iii) Messages
 	of which the new device will be a snapshot.
 
     delete <dev id>
-
 	Deletes a thin device.  Irreversible.
 
     set_transaction_id <current id> <new id>
-
 	Userland volume managers, such as LVM, need a way to
 	synchronise their external metadata with the internal metadata of the
 	pool target.  The thin-pool target offers to store an
@@ -364,14 +381,12 @@ iii) Messages
 	compare-and-swap message.
 
     reserve_metadata_snap
-
         Reserve a copy of the data mapping btree for use by userland.
         This allows userland to inspect the mappings as they were when
         this message was executed.  Use the pool's status command to
         get the root block associated with the metadata snapshot.
 
     release_metadata_snap
-
         Release a previously reserved copy of the data mapping btree.
 
 'thin' target
@@ -379,7 +394,9 @@ iii) Messages
 
 i) Constructor
 
-    thin <pool dev> <dev id> [<external origin dev>]
+    ::
+
+        thin <pool dev> <dev id> [<external origin dev>]
 
     pool dev:
 	the thin-pool device, e.g. /dev/mapper/my_pool or 253:0
@@ -401,8 +418,7 @@ provisioned as and when needed.
 
 ii) Status
 
-     <nr mapped sectors> <highest mapped sector>
-
+    <nr mapped sectors> <highest mapped sector>
 	If the pool has encountered device errors and failed, the status
 	will just contain the string 'Fail'.  The userspace recovery
 	tools should then be used.
diff --git a/Documentation/device-mapper/unstriped.txt b/Documentation/device-mapper/unstriped.rst
similarity index 60%
rename from Documentation/device-mapper/unstriped.txt
rename to Documentation/device-mapper/unstriped.rst
index 0b2a306c54ee..0a8d3eb3f072 100644
--- a/Documentation/device-mapper/unstriped.txt
+++ b/Documentation/device-mapper/unstriped.rst
@@ -1,3 +1,7 @@
+================================
+Device-mapper "unstriped" target
+================================
+
 Introduction
 ============
 
@@ -34,46 +38,46 @@ striped target to combine the 4 devices into one.  It then will use
 the unstriped target ontop of the striped device to access the
 individual backing loop devices.  We write data to the newly exposed
 unstriped devices and verify the data written matches the correct
-underlying device on the striped array.
-
-#!/bin/bash
-
-MEMBER_SIZE=$((128 * 1024 * 1024))
-NUM=4
-SEQ_END=$((${NUM}-1))
-CHUNK=256
-BS=4096
-
-RAID_SIZE=$((${MEMBER_SIZE}*${NUM}/512))
-DM_PARMS="0 ${RAID_SIZE} striped ${NUM} ${CHUNK}"
-COUNT=$((${MEMBER_SIZE} / ${BS}))
-
-for i in $(seq 0 ${SEQ_END}); do
-  dd if=/dev/zero of=member-${i} bs=${MEMBER_SIZE} count=1 oflag=direct
-  losetup /dev/loop${i} member-${i}
-  DM_PARMS+=" /dev/loop${i} 0"
-done
-
-echo $DM_PARMS | dmsetup create raid0
-for i in $(seq 0 ${SEQ_END}); do
-  echo "0 1 unstriped ${NUM} ${CHUNK} ${i} /dev/mapper/raid0 0" | dmsetup create set-${i}
-done;
-
-for i in $(seq 0 ${SEQ_END}); do
-  dd if=/dev/urandom of=/dev/mapper/set-${i} bs=${BS} count=${COUNT} oflag=direct
-  diff /dev/mapper/set-${i} member-${i}
-done;
-
-for i in $(seq 0 ${SEQ_END}); do
-  dmsetup remove set-${i}
-done
-
-dmsetup remove raid0
-
-for i in $(seq 0 ${SEQ_END}); do
-  losetup -d /dev/loop${i}
-  rm -f member-${i}
-done
+underlying device on the striped array::
+
+  #!/bin/bash
+
+  MEMBER_SIZE=$((128 * 1024 * 1024))
+  NUM=4
+  SEQ_END=$((${NUM}-1))
+  CHUNK=256
+  BS=4096
+
+  RAID_SIZE=$((${MEMBER_SIZE}*${NUM}/512))
+  DM_PARMS="0 ${RAID_SIZE} striped ${NUM} ${CHUNK}"
+  COUNT=$((${MEMBER_SIZE} / ${BS}))
+
+  for i in $(seq 0 ${SEQ_END}); do
+    dd if=/dev/zero of=member-${i} bs=${MEMBER_SIZE} count=1 oflag=direct
+    losetup /dev/loop${i} member-${i}
+    DM_PARMS+=" /dev/loop${i} 0"
+  done
+
+  echo $DM_PARMS | dmsetup create raid0
+  for i in $(seq 0 ${SEQ_END}); do
+    echo "0 1 unstriped ${NUM} ${CHUNK} ${i} /dev/mapper/raid0 0" | dmsetup create set-${i}
+  done;
+
+  for i in $(seq 0 ${SEQ_END}); do
+    dd if=/dev/urandom of=/dev/mapper/set-${i} bs=${BS} count=${COUNT} oflag=direct
+    diff /dev/mapper/set-${i} member-${i}
+  done;
+
+  for i in $(seq 0 ${SEQ_END}); do
+    dmsetup remove set-${i}
+  done
+
+  dmsetup remove raid0
+
+  for i in $(seq 0 ${SEQ_END}); do
+    losetup -d /dev/loop${i}
+    rm -f member-${i}
+  done
 
 Another example
 ---------------
@@ -81,7 +85,7 @@ Another example
 Intel NVMe drives contain two cores on the physical device.
 Each core of the drive has segregated access to its LBA range.
 The current LBA model has a RAID 0 128k chunk on each core, resulting
-in a 256k stripe across the two cores:
+in a 256k stripe across the two cores::
 
    Core 0:       Core 1:
   __________    __________
@@ -108,17 +112,24 @@ Example dmsetup usage
 
 unstriped ontop of Intel NVMe device that has 2 cores
 -----------------------------------------------------
-dmsetup create nvmset0 --table '0 512 unstriped 2 256 0 /dev/nvme0n1 0'
-dmsetup create nvmset1 --table '0 512 unstriped 2 256 1 /dev/nvme0n1 0'
+
+::
+
+  dmsetup create nvmset0 --table '0 512 unstriped 2 256 0 /dev/nvme0n1 0'
+  dmsetup create nvmset1 --table '0 512 unstriped 2 256 1 /dev/nvme0n1 0'
 
 There will now be two devices that expose Intel NVMe core 0 and 1
-respectively:
-/dev/mapper/nvmset0
-/dev/mapper/nvmset1
+respectively::
+
+  /dev/mapper/nvmset0
+  /dev/mapper/nvmset1
 
 unstriped ontop of striped with 4 drives using 128K chunk size
 --------------------------------------------------------------
-dmsetup create raid_disk0 --table '0 512 unstriped 4 256 0 /dev/mapper/striped 0'
-dmsetup create raid_disk1 --table '0 512 unstriped 4 256 1 /dev/mapper/striped 0'
-dmsetup create raid_disk2 --table '0 512 unstriped 4 256 2 /dev/mapper/striped 0'
-dmsetup create raid_disk3 --table '0 512 unstriped 4 256 3 /dev/mapper/striped 0'
+
+::
+
+  dmsetup create raid_disk0 --table '0 512 unstriped 4 256 0 /dev/mapper/striped 0'
+  dmsetup create raid_disk1 --table '0 512 unstriped 4 256 1 /dev/mapper/striped 0'
+  dmsetup create raid_disk2 --table '0 512 unstriped 4 256 2 /dev/mapper/striped 0'
+  dmsetup create raid_disk3 --table '0 512 unstriped 4 256 3 /dev/mapper/striped 0'
diff --git a/Documentation/device-mapper/verity.txt b/Documentation/device-mapper/verity.rst
similarity index 98%
rename from Documentation/device-mapper/verity.txt
rename to Documentation/device-mapper/verity.rst
index b3d2e4a42255..a4d1c1476d72 100644
--- a/Documentation/device-mapper/verity.txt
+++ b/Documentation/device-mapper/verity.rst
@@ -1,5 +1,6 @@
+=========
 dm-verity
-==========
+=========
 
 Device-Mapper's "verity" target provides transparent integrity checking of
 block devices using a cryptographic digest provided by the kernel crypto API.
@@ -7,6 +8,9 @@ This target is read-only.
 
 Construction Parameters
 =======================
+
+::
+
     <version> <dev> <hash_dev>
     <data_block_size> <hash_block_size>
     <num_data_blocks> <hash_start_block>
@@ -160,7 +164,9 @@ calculating the parent node.
 
 The tree looks something like:
 
-alg = sha256, num_blocks = 32768, block_size = 4096
+	alg = sha256, num_blocks = 32768, block_size = 4096
+
+::
 
                                  [   root    ]
                                 /    . . .    \
@@ -189,6 +195,7 @@ block boundary) are the hash blocks which are stored a depth at a time
 
 The full specification of kernel parameters and on-disk metadata format
 is available at the cryptsetup project's wiki page
+
   https://gitlab.com/cryptsetup/cryptsetup/wikis/DMVerity
 
 Status
@@ -198,7 +205,8 @@ If any check failed, C (for Corruption) is returned.
 
 Example
 =======
-Set up a device:
+Set up a device::
+
   # dmsetup create vroot --readonly --table \
     "0 2097152 verity 1 /dev/sda1 /dev/sda2 4096 4096 262144 1 sha256 "\
     "4392712ba01368efdf14b05c76f9e4df0d53664630b5d48632ed17a137f39076 "\
@@ -209,11 +217,13 @@ the hash tree or activate the kernel device. This is available from
 the cryptsetup upstream repository https://gitlab.com/cryptsetup/cryptsetup/
 (as a libcryptsetup extension).
 
-Create hash on the device:
+Create hash on the device::
+
   # veritysetup format /dev/sda1 /dev/sda2
   ...
   Root hash: 4392712ba01368efdf14b05c76f9e4df0d53664630b5d48632ed17a137f39076
 
-Activate the device:
+Activate the device::
+
   # veritysetup create vroot /dev/sda1 /dev/sda2 \
     4392712ba01368efdf14b05c76f9e4df0d53664630b5d48632ed17a137f39076
diff --git a/Documentation/device-mapper/writecache.txt b/Documentation/device-mapper/writecache.rst
similarity index 96%
rename from Documentation/device-mapper/writecache.txt
rename to Documentation/device-mapper/writecache.rst
index 01532b3008ae..d3d7690f5e8d 100644
--- a/Documentation/device-mapper/writecache.txt
+++ b/Documentation/device-mapper/writecache.rst
@@ -1,3 +1,7 @@
+=================
+Writecache target
+=================
+
 The writecache target caches writes on persistent memory or on SSD. It
 doesn't cache reads because reads are supposed to be cached in page cache
 in normal RAM.
@@ -6,15 +10,18 @@ When the device is constructed, the first sector should be zeroed or the
 first sector should contain valid superblock from previous invocation.
 
 Constructor parameters:
+
 1. type of the cache device - "p" or "s"
-	p - persistent memory
-	s - SSD
+
+	- p - persistent memory
+	- s - SSD
 2. the underlying device that will be cached
 3. the cache device
 4. block size (4096 is recommended; the maximum block size is the page
    size)
 5. the number of optional parameters (the parameters with an argument
    count as two)
+
 	start_sector n		(default: 0)
 		offset from the start of cache device in 512-byte sectors
 	high_watermark n	(default: 50)
@@ -43,6 +50,7 @@ Constructor parameters:
 		applicable only to persistent memory - don't use the FUA
 		flag when writing back data and send the FLUSH request
 		afterwards
+
 		- some underlying devices perform better with fua, some
 		  with nofua. The user should test it
 
@@ -60,6 +68,7 @@ Messages:
 		flush the cache device on next suspend. Use this message
 		when you are going to remove the cache device. The proper
 		sequence for removing the cache device is:
+
 		1. send the "flush_on_suspend" message
 		2. load an inactive table with a linear target that maps
 		   to the underlying device
diff --git a/Documentation/device-mapper/zero.txt b/Documentation/device-mapper/zero.rst
similarity index 83%
rename from Documentation/device-mapper/zero.txt
rename to Documentation/device-mapper/zero.rst
index 20fb38e7fa7e..11fb5cf4597c 100644
--- a/Documentation/device-mapper/zero.txt
+++ b/Documentation/device-mapper/zero.rst
@@ -1,3 +1,4 @@
+=======
 dm-zero
 =======
 
@@ -18,20 +19,19 @@ filesystem limitations.
 
 To create a sparse device, start by creating a dm-zero device that's the
 desired size of the sparse device. For this example, we'll assume a 10TB
-sparse device.
+sparse device::
 
-TEN_TERABYTES=`expr 10 \* 1024 \* 1024 \* 1024 \* 2`   # 10 TB in sectors
-echo "0 $TEN_TERABYTES zero" | dmsetup create zero1
+  TEN_TERABYTES=`expr 10 \* 1024 \* 1024 \* 1024 \* 2`   # 10 TB in sectors
+  echo "0 $TEN_TERABYTES zero" | dmsetup create zero1
 
 Then create a snapshot of the zero device, using any available block-device as
 the COW device. The size of the COW device will determine the amount of real
 space available to the sparse device. For this example, we'll assume /dev/sdb1
-is an available 10GB partition.
+is an available 10GB partition::
 
-echo "0 $TEN_TERABYTES snapshot /dev/mapper/zero1 /dev/sdb1 p 128" | \
-   dmsetup create sparse1
+  echo "0 $TEN_TERABYTES snapshot /dev/mapper/zero1 /dev/sdb1 p 128" | \
+     dmsetup create sparse1
 
 This will create a 10TB sparse device called /dev/mapper/sparse1 that has
 10GB of actual storage space available. If more than 10GB of data is written
 to this device, it will start returning I/O errors.
-
diff --git a/Documentation/filesystems/ubifs-authentication.md b/Documentation/filesystems/ubifs-authentication.md
index 028b3e2e25f9..23e698167141 100644
--- a/Documentation/filesystems/ubifs-authentication.md
+++ b/Documentation/filesystems/ubifs-authentication.md
@@ -417,9 +417,9 @@ will then have to be provided beforehand in the normal way.
 
 [DMC-CBC-ATTACK]     http://www.jakoblell.com/blog/2013/12/22/practical-malleability-attack-against-cbc-encrypted-luks-partitions/
 
-[DM-INTEGRITY]       https://www.kernel.org/doc/Documentation/device-mapper/dm-integrity.txt
+[DM-INTEGRITY]       https://www.kernel.org/doc/Documentation/device-mapper/dm-integrity.rst
 
-[DM-VERITY]          https://www.kernel.org/doc/Documentation/device-mapper/verity.txt
+[DM-VERITY]          https://www.kernel.org/doc/Documentation/device-mapper/verity.rst
 
 [FSCRYPT-POLICY2]    https://www.spinics.net/lists/linux-ext4/msg58710.html
 
diff --git a/drivers/md/Kconfig b/drivers/md/Kconfig
index 45254b3ef715..5ccac0b77f17 100644
--- a/drivers/md/Kconfig
+++ b/drivers/md/Kconfig
@@ -453,7 +453,7 @@ config DM_INIT
 	Enable "dm-mod.create=" parameter to create mapped devices at init time.
 	This option is useful to allow mounting rootfs without requiring an
 	initramfs.
-	See Documentation/device-mapper/dm-init.txt for dm-mod.create="..."
+	See Documentation/device-mapper/dm-init.rst for dm-mod.create="..."
 	format.
 
 	If unsure, say N.
diff --git a/drivers/md/dm-init.c b/drivers/md/dm-init.c
index 352e803f566e..a58d0944f592 100644
--- a/drivers/md/dm-init.c
+++ b/drivers/md/dm-init.c
@@ -25,7 +25,7 @@ static char *create;
  * Format: dm-mod.create=<name>,<uuid>,<minor>,<flags>,<table>[,<table>+][;<name>,<uuid>,<minor>,<flags>,<table>[,<table>+]+]
  * Table format: <start_sector> <num_sectors> <target_type> <target_args>
  *
- * See Documentation/device-mapper/dm-init.txt for dm-mod.create="..." format
+ * See Documentation/device-mapper/dm-init.rst for dm-mod.create="..." format
  * details.
  */
 
diff --git a/drivers/md/dm-raid.c b/drivers/md/dm-raid.c
index 9fdef6897316..7a87a640f8ba 100644
--- a/drivers/md/dm-raid.c
+++ b/drivers/md/dm-raid.c
@@ -3558,7 +3558,7 @@ static void raid_status(struct dm_target *ti, status_type_t type,
 		 * v1.5.0+:
 		 *
 		 * Sync action:
-		 *   See Documentation/device-mapper/dm-raid.txt for
+		 *   See Documentation/device-mapper/dm-raid.rst for
 		 *   information on each of these states.
 		 */
 		DMEMIT(" %s", sync_action);
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
