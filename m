Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 741EB20CD1B
	for <lists+dm-devel@lfdr.de>; Mon, 29 Jun 2020 10:03:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593417804;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pGxRULzMkBLgUntGElzgj0INdQ0y6IsFeVd19odiGHw=;
	b=dkKfq1anf0JfaO8AvI3TPtlhGEYGVGSBIGIRJWzeQHuGMxX3Vn06w/UILPKGO4g/4Y1kIc
	lf9jEU55oWXgj3AaKbzTldLOW1E+OqKo1pMhvv8F76ZYyO4oHgUz3Bk6d97+MnqGWVJ+ZV
	Eb55FG6QSa7wBjUJlFWSiRTWPxl5xOY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-zcojCxyxN6aFfZMjO0WMDg-1; Mon, 29 Jun 2020 04:03:22 -0400
X-MC-Unique: zcojCxyxN6aFfZMjO0WMDg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CD9E107ACCD;
	Mon, 29 Jun 2020 08:03:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 94E549CFEC;
	Mon, 29 Jun 2020 08:03:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EF3548788E;
	Mon, 29 Jun 2020 08:03:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05RAbSBB022979 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 27 Jun 2020 06:37:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6D5E72156A4C; Sat, 27 Jun 2020 10:37:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 699142156A4A
	for <dm-devel@redhat.com>; Sat, 27 Jun 2020 10:37:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16A7A185A78B
	for <dm-devel@redhat.com>; Sat, 27 Jun 2020 10:37:26 +0000 (UTC)
Received: from smtp.al2klimov.de (smtp.al2klimov.de [78.46.175.9]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-391-c6npf6A6PEe0xiX0wifz1w-1; Sat, 27 Jun 2020 06:37:23 -0400
X-MC-Unique: c6npf6A6PEe0xiX0wifz1w-1
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by smtp.al2klimov.de (Postfix) with ESMTPA id 2C328BC193;
	Sat, 27 Jun 2020 10:31:48 +0000 (UTC)
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
To: agk@redhat.com, snitzer@redhat.com, dm-devel@redhat.com, corbet@lwn.net,
	song@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org
Date: Sat, 27 Jun 2020 12:31:38 +0200
Message-Id: <20200627103138.71885-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam-Level: *****
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05RAbSBB022979
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 29 Jun 2020 04:02:53 -0400
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [dm-devel] [PATCH] Replace HTTP links with HTTPS ones: LVM
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

Rationale:
Reduces attack surface on kernel devs opening the links for MITM
as HTTPS traffic is much harder to manipulate.

Deterministic algorithm:
For each file:
  If not .svg:
    For each line:
      If doesn't contain `\bxmlns\b`:
        For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
          If both the HTTP and HTTPS versions
          return 200 OK and serve the same content:
            Replace HTTP with HTTPS.

Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 If there are any URLs to be removed completely or at least not HTTPSified:
 Just clearly say so and I'll *undo my change*.
 See also https://lkml.org/lkml/2020/6/27/64

 If there are any valid, but yet not changed URLs:
 See https://lkml.org/lkml/2020/6/26/837

 Documentation/admin-guide/device-mapper/dm-raid.rst  | 2 +-
 Documentation/admin-guide/device-mapper/dm-zoned.rst | 2 +-
 drivers/md/Kconfig                                   | 8 ++++----
 drivers/md/dm-crypt.c                                | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/admin-guide/device-mapper/dm-raid.rst b/Documentation/admin-guide/device-mapper/dm-raid.rst
index 695a2ea1d1ae..7ef9fe63b3d4 100644
--- a/Documentation/admin-guide/device-mapper/dm-raid.rst
+++ b/Documentation/admin-guide/device-mapper/dm-raid.rst
@@ -71,7 +71,7 @@ The target is named "raid" and it accepts the following parameters::
   ============= ===============================================================
 
   Reference: Chapter 4 of
-  http://www.snia.org/sites/default/files/SNIA_DDF_Technical_Position_v2.0.pdf
+  https://www.snia.org/sites/default/files/SNIA_DDF_Technical_Position_v2.0.pdf
 
 <#raid_params>: The number of parameters that follow.
 
diff --git a/Documentation/admin-guide/device-mapper/dm-zoned.rst b/Documentation/admin-guide/device-mapper/dm-zoned.rst
index 553752ea2521..e635041351bc 100644
--- a/Documentation/admin-guide/device-mapper/dm-zoned.rst
+++ b/Documentation/admin-guide/device-mapper/dm-zoned.rst
@@ -14,7 +14,7 @@ host-aware zoned block devices.
 For a more detailed description of the zoned block device models and
 their constraints see (for SCSI devices):
 
-http://www.t10.org/drafts.htm#ZBC_Family
+https://www.t10.org/drafts.htm#ZBC_Family
 
 and (for ATA devices):
 
diff --git a/drivers/md/Kconfig b/drivers/md/Kconfig
index 921888df6764..30ba3573626c 100644
--- a/drivers/md/Kconfig
+++ b/drivers/md/Kconfig
@@ -27,7 +27,7 @@ config BLK_DEV_MD
 
 	  More information about Software RAID on Linux is contained in the
 	  Software RAID mini-HOWTO, available from
-	  <http://www.tldp.org/docs.html#howto>. There you will also learn
+	  <https://www.tldp.org/docs.html#howto>. There you will also learn
 	  where to get the supporting user space utilities raidtools.
 
 	  If unsure, say N.
@@ -71,7 +71,7 @@ config MD_RAID0
 
 	  Information about Software RAID on Linux is contained in the
 	  Software-RAID mini-HOWTO, available from
-	  <http://www.tldp.org/docs.html#howto>. There you will also
+	  <https://www.tldp.org/docs.html#howto>. There you will also
 	  learn where to get the supporting user space utilities raidtools.
 
 	  To compile this as a module, choose M here: the module
@@ -93,7 +93,7 @@ config MD_RAID1
 
 	  Information about Software RAID on Linux is contained in the
 	  Software-RAID mini-HOWTO, available from
-	  <http://www.tldp.org/docs.html#howto>.  There you will also
+	  <https://www.tldp.org/docs.html#howto>.  There you will also
 	  learn where to get the supporting user space utilities raidtools.
 
 	  If you want to use such a RAID-1 set, say Y.  To compile this code
@@ -148,7 +148,7 @@ config MD_RAID456
 
 	  Information about Software RAID on Linux is contained in the
 	  Software-RAID mini-HOWTO, available from
-	  <http://www.tldp.org/docs.html#howto>. There you will also
+	  <https://www.tldp.org/docs.html#howto>. There you will also
 	  learn where to get the supporting user space utilities raidtools.
 
 	  If you want to use such a RAID-4/RAID-5/RAID-6 set, say Y.  To
diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 000ddfab5ba0..4704a16e637c 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -300,7 +300,7 @@ static struct crypto_aead *any_tfm_aead(struct crypt_config *cc)
  * elephant: The extended version of eboiv with additional Elephant diffuser
  *           used with Bitlocker CBC mode.
  *           This mode was used in older Windows systems
- *           http://download.microsoft.com/download/0/2/3/0238acaf-d3bf-4a6d-b3d6-0a0be4bbb36e/bitlockercipher200608.pdf
+ *           https://download.microsoft.com/download/0/2/3/0238acaf-d3bf-4a6d-b3d6-0a0be4bbb36e/bitlockercipher200608.pdf
  */
 
 static int crypt_iv_plain_gen(struct crypt_config *cc, u8 *iv,
-- 
2.27.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

