Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F81FB127
	for <lists+dm-devel@lfdr.de>; Sat, 27 Apr 2019 01:13:40 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6AF46C08C6EB;
	Fri, 26 Apr 2019 23:13:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 57F615DED5;
	Fri, 26 Apr 2019 23:13:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 84A20181AC90;
	Fri, 26 Apr 2019 23:13:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3QNDDZi000612 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 26 Apr 2019 19:13:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E452C1001E6D; Fri, 26 Apr 2019 23:13:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E7BB1001DD9;
	Fri, 26 Apr 2019 23:13:09 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0D85C3174678;
	Fri, 26 Apr 2019 23:13:08 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Apr 2019 16:13:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,399,1549958400"; d="scan'208";a="146206131"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
	by fmsmga007.fm.intel.com with ESMTP; 26 Apr 2019 16:13:05 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
	(envelope-from <lkp@intel.com>)
	id 1hKA1h-000Gwa-G6; Sat, 27 Apr 2019 07:13:05 +0800
Date: Sat, 27 Apr 2019 07:12:48 +0800
From: kbuild test robot <lkp@intel.com>
To: Bryan Gurney <bgurney@redhat.com>
Message-ID: <20190426231248.GA44578@ivb42>
References: <201904270727.g6e3MBmi%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <201904270727.g6e3MBmi%lkp@intel.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.41]); Fri, 26 Apr 2019 23:13:08 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Fri, 26 Apr 2019 23:13:08 +0000 (UTC) for IP:'134.134.136.20'
	DOMAIN:'mga02.intel.com' HELO:'mga02.intel.com'
	FROM:'lkp@intel.com' RCPT:''
X-RedHat-Spam-Score: -2.301  (RCVD_IN_DNSWL_MED,
	SPF_PASS) 134.134.136.20 mga02.intel.com 134.134.136.20
	mga02.intel.com <lkp@intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, kbuild-all@01.org, Mike Snitzer <snitzer@redhat.com>
Subject: [dm-devel] [RFC PATCH dm] dm: dust_rb_search() can be static
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Fri, 26 Apr 2019 23:13:39 +0000 (UTC)


Fixes: cefb8eb074c8 ("dm: add dust target")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 dm-dust.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/md/dm-dust.c b/drivers/md/dm-dust.c
index f5434ada..dd56284 100644
--- a/drivers/md/dm-dust.c
+++ b/drivers/md/dm-dust.c
@@ -32,7 +32,7 @@ struct dust_device {
 	bool quiet_mode:1;
 };
 
-struct badblock *dust_rb_search(struct rb_root *root, sector_t blk)
+static struct badblock *dust_rb_search(struct rb_root *root, sector_t blk)
 {
 	struct rb_node *node = root->rb_node;
 
@@ -50,7 +50,7 @@ struct badblock *dust_rb_search(struct rb_root *root, sector_t blk)
 	return NULL;
 }
 
-bool dust_rb_insert(struct rb_root *root, struct badblock *new)
+static bool dust_rb_insert(struct rb_root *root, struct badblock *new)
 {
 	struct badblock *bblk;
 	struct rb_node **link = &root->rb_node, *parent = NULL;
@@ -492,7 +492,7 @@ static struct target_type dust_target = {
 	.prepare_ioctl = dust_prepare_ioctl,
 };
 
-int __init dm_dust_init(void)
+static int __init dm_dust_init(void)
 {
 	int result = dm_register_target(&dust_target);
 
@@ -502,7 +502,7 @@ int __init dm_dust_init(void)
 	return result;
 }
 
-void __exit dm_dust_exit(void)
+static void __exit dm_dust_exit(void)
 {
 	dm_unregister_target(&dust_target);
 }

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
