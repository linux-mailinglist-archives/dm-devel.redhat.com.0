Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id BD23F4C842
	for <lists+dm-devel@lfdr.de>; Thu, 20 Jun 2019 09:22:26 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6D92EA7F8;
	Thu, 20 Jun 2019 07:22:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DB905D9E5;
	Thu, 20 Jun 2019 07:22:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E07CD1806B0F;
	Thu, 20 Jun 2019 07:21:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5J83h1s006746 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Jun 2019 04:03:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8242F60FDE; Wed, 19 Jun 2019 08:03:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 762E05C2E8
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 08:03:41 +0000 (UTC)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F27B83086213
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 08:03:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id A2BEAAF68;
	Wed, 19 Jun 2019 08:03:25 +0000 (UTC)
From: Qu Wenruo <wqu@suse.com>
To: dm-devel@redhat.com
Date: Wed, 19 Jun 2019 16:03:12 +0800
Message-Id: <20190619080312.11549-3-wqu@suse.com>
In-Reply-To: <20190619080312.11549-1-wqu@suse.com>
References: <20190619080312.11549-1-wqu@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.42]); Wed, 19 Jun 2019 08:03:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Wed, 19 Jun 2019 08:03:29 +0000 (UTC) for IP:'195.135.220.15'
	DOMAIN:'mx2.suse.de' HELO:'mx1.suse.de' FROM:'wqu@suse.com' RCPT:''
X-RedHat-Spam-Score: -2.299  (RCVD_IN_DNSWL_MED,
	SPF_NONE) 195.135.220.15 mx2.suse.de 195.135.220.15
	mx2.suse.de <wqu@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 20 Jun 2019 03:21:43 -0400
Cc: linux-btrfs@vger.kernel.org
Subject: [dm-devel] [PATCH 2/2] dm log writes: Introduce dump_type= message
	type to change dump_type on the fly
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Thu, 20 Jun 2019 07:22:20 +0000 (UTC)

The new message format is:
dump_type=<new dump type>

The parameter of dump_type= follows the same one of constructor.
This allows us to change dump_type on the fly, making the following use
case possible:
  # dmsetup create log --table 0 10485760 log-writes \
    /dev/tests/dest /dev/test/log dump_type=ALL
  # mkfs.btrfs -f /dev/mapper/log
  # dmsetup suspend log
  # dmsetup message log dm_dump_type=METADATA|FLUSH|FUA|DISCARD|MARK
  # mount /dev/mapper/log
  # <do some writes>
  # umount /dev/mapper/log

The log device will record the full mkfs bios (as user space write can't
generate bios with METADATA flag), then switch to only log METADATA FUA
FLUSH DISCARD writes.

Signed-off-by: Qu Wenruo <wqu@suse.com>
---
 drivers/md/dm-log-writes.c | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/md/dm-log-writes.c b/drivers/md/dm-log-writes.c
index 9edf0bdcae39..80e872c7dcd3 100644
--- a/drivers/md/dm-log-writes.c
+++ b/drivers/md/dm-log-writes.c
@@ -980,7 +980,8 @@ static int log_writes_iterate_devices(struct dm_target *ti,
 
 /*
  * Messages supported:
- *   mark <mark data> - specify the marked data.
+ *   mark <mark data>	    - specify the marked data.
+ *   dump_type=<type flags> - change dump type on the fly, suspend recommended
  */
 static int log_writes_message(struct dm_target *ti, unsigned argc, char **argv,
 			      char *result, unsigned maxlen)
@@ -988,15 +989,35 @@ static int log_writes_message(struct dm_target *ti, unsigned argc, char **argv,
 	int r = -EINVAL;
 	struct log_writes_c *lc = ti->private;
 
-	if (argc != 2) {
-		DMWARN("Invalid log-writes message arguments, expect 2 arguments, got %d", argc);
+	if (argc < 1) {
+		DMWARN(
+"Invalid log-writes message arguments, expect at least one argument, got %d",
+			argc);
 		return r;
 	}
 
-	if (!strcasecmp(argv[0], "mark"))
+	if (!strcasecmp(argv[0], "mark")) {
+		if (argc != 2) {
+			DMWARN(
+"Invalid log-writes message arguments, expect 2 arguments for mark, got %d",
+				argc);
+			return r;
+		}
 		r = log_mark(lc, argv[1]);
-	else
+	} else if (!strncasecmp(argv[0], "dump_type=", strlen("dump_type="))) {
+		if (argc != 1) {
+			DMWARN(
+"Invalid log-writes message arguments, expect 1 argument for dump_type, got %d",
+				argc);
+			return r;
+		}
+		r = parse_dump_types(lc, argv[0] + strlen("dump_type="));
+		if (r < 0) {
+			ti->error = "Bad dump type";
+		}
+	} else {
 		DMWARN("Unrecognised log writes target message received: %s", argv[0]);
+	}
 
 	return r;
 }
-- 
2.22.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
