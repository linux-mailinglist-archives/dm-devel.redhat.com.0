Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B372734FD2
	for <lists+dm-devel@lfdr.de>; Tue,  4 Jun 2019 20:29:34 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F28CE882FB;
	Tue,  4 Jun 2019 18:29:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 383C660C91;
	Tue,  4 Jun 2019 18:29:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C23F81806B15;
	Tue,  4 Jun 2019 18:28:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x54ISFer003849 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 4 Jun 2019 14:28:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ADE0B52E9; Tue,  4 Jun 2019 18:28:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C71382BE79;
	Tue,  4 Jun 2019 18:28:02 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 561AFC18B2C0;
	Tue,  4 Jun 2019 18:27:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: koike) with ESMTPSA id 6F0C326B37F
From: Helen Koike <helen.koike@collabora.com>
To: dm-devel@redhat.com, swboyd@chromium.org
Date: Tue,  4 Jun 2019 15:27:19 -0300
Message-Id: <20190604182719.15944-1-helen.koike@collabora.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.31]); Tue, 04 Jun 2019 18:27:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Tue, 04 Jun 2019 18:27:53 +0000 (UTC) for IP:'46.235.227.227'
	DOMAIN:'bhuna.collabora.co.uk' HELO:'bhuna.collabora.co.uk'
	FROM:'helen.koike@collabora.com' RCPT:''
X-RedHat-Spam-Score: -0.01  (RCVD_IN_DNSWL_NONE, SPF_HELO_PASS,
	UNPARSEABLE_RELAY) 46.235.227.227 bhuna.collabora.co.uk
	46.235.227.227 bhuna.collabora.co.uk
	<helen.koike@collabora.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: wad@chromium.org, keescook@chromium.org, snitzer@redhat.com,
	linux-doc@vger.kernel.org, richard.weinberger@gmail.com,
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
	Helen Koike <helen.koike@collabora.com>, linux-lvm@redhat.com,
	enric.balletbo@collabora.com, kernel@collabora.com, agk@redhat.com
Subject: [dm-devel] [PATCH] Documentation/dm-init: fix multi device example
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Tue, 04 Jun 2019 18:29:33 +0000 (UTC)

The example in the docs regarding multiple device-mappers is invalid (it
has a wrong number of arguments), it's a left over from previous
versions of the patch.
Replace the example with an valid and tested one.

Signed-off-by: Helen Koike <helen.koike@collabora.com>

---

 Documentation/device-mapper/dm-init.txt | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/device-mapper/dm-init.txt b/Documentation/device-mapper/dm-init.txt
index 8464ee7c01b8..130b3c3679c5 100644
--- a/Documentation/device-mapper/dm-init.txt
+++ b/Documentation/device-mapper/dm-init.txt
@@ -74,13 +74,13 @@ this target to /dev/mapper/lroot (depending on the rules). No uuid was assigned.
 An example of multiple device-mappers, with the dm-mod.create="..." contents is shown here
 split on multiple lines for readability:
 
-  vroot,,,ro,
-    0 1740800 verity 254:0 254:0 1740800 sha1
-      76e9be054b15884a9fa85973e9cb274c93afadb6
-      5b3549d54d6c7a3837b9b81ed72e49463a64c03680c47835bef94d768e5646fe;
-  vram,,,rw,
-    0 32768 linear 1:0 0,
-    32768 32768 linear 1:1 0
+  dm-linear,,1,rw,
+    0 32768 linear 8:1 0,
+    32768 1024000 linear 8:2 0;
+  dm-verity,,3,ro,
+    0 1638400 verity 1 /dev/sdc1 /dev/sdc2 4096 4096 204800 1 sha256
+    ac87db56303c9c1da433d7209b5a6ef3e4779df141200cbd7c157dcb8dd89c42
+    5ebfe87f7df3235b80a117ebc4078e44f55045487ad4a96581d1adb564615b51
 
 Other examples (per target):
 
-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
