Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B51F1C8
	for <lists+dm-devel@lfdr.de>; Tue, 30 Apr 2019 10:08:49 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A0EE33086201;
	Tue, 30 Apr 2019 08:08:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D38027A5EA;
	Tue, 30 Apr 2019 08:08:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C9EE418089CB;
	Tue, 30 Apr 2019 08:08:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3U2APE9020103 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Apr 2019 22:10:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CB34670462; Tue, 30 Apr 2019 02:10:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9698017C5D;
	Tue, 30 Apr 2019 02:10:21 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A58033091784;
	Tue, 30 Apr 2019 02:10:20 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id m4so10862614edd.8;
	Mon, 29 Apr 2019 19:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=o3WWnlW4MRHlRUIjLliUfdlV+X8N+PBcU00t4S/qq+k=;
	b=Nkub5VvunDX3oygwdkrT0Num7DhRohElM9ScJixU6FRsrOiNzKltAmIL8/5TKDrjwA
	JetuTPszU8XpZUIvFldDh103U8wFt3LjL/NhIAJxmyhIbM+Wmx98NbHap/nncpVBzZtR
	gZZVH1ZTnT4M6RYJh/tFqti+PDTCezfyalPWUqJcdxAr/Zt7sOUbOxkbVh185N65EhFQ
	lkk1F6L9gv+Nfq+fTAipSd5+feVhnz03yRgdHHJpmQIzD6gYn5wwIp4acxVU4wmVZMKW
	hOzl6jPC6gcxMjMauxmdePvw0FRxsjOW/ZpXICMrQWqVicDWjv47WL1TbornkTWA3s7N
	jMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=o3WWnlW4MRHlRUIjLliUfdlV+X8N+PBcU00t4S/qq+k=;
	b=YQG6w4EhPpiVJoMm7nRIoCcX2A8wFMm6LsOzmqd1okN8+Iougl9nhyshqgvRuSZLk4
	PkgQ3EFf+iLwr3BPr7NAA2TLHtsd9TQhmK1yUT6WiQlXhGl2Qz/hbB1YGRxbs3nfAFn9
	NsUeI6t1B957MD9g8Iy6k/fhgcoNFdzcAX4htu76W4WNORhM/Bn3ClNKM3l1j80pg09U
	g4JvIGSqaZiWUKKnvYJj000/GQ3mWcRFONapEoR4kwuT8OzZQelpdFuwjfH8K3lTCsZd
	DkG5Hnp7MlQ0hxEmRZvC6m25xA1AYGRTGLjeXNtyf2c5rPBBEmR9HFZxRpks729XmSQ7
	V/jQ==
X-Gm-Message-State: APjAAAUi/r2/0HqlTKjtECuKknveyf1YTO2sme1HTDN9Cff6OyXxT2K1
	lYyDrTigtti4vTR5EDn37lv5/DTf/hk=
X-Google-Smtp-Source: APXvYqwsnp+fG3RX1ErO00dwIoXW2/fQzV+CNFMXWPamoghLI6TjxloobzSzWt4cItU1LlZYbyw1iQ==
X-Received: by 2002:a50:90db:: with SMTP id d27mr2493360eda.50.1556590219009; 
	Mon, 29 Apr 2019 19:10:19 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:2b:2b84::2])
	by smtp.gmail.com with ESMTPSA id
	w40sm6062863edb.50.2019.04.29.19.10.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Apr 2019 19:10:18 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Date: Mon, 29 Apr 2019 19:10:10 -0700
Message-Id: <20190430021010.25151-1-natechancellor@gmail.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Tue, 30 Apr 2019 02:10:20 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Tue, 30 Apr 2019 02:10:20 +0000 (UTC) for IP:'209.85.208.68'
	DOMAIN:'mail-ed1-f68.google.com' HELO:'mail-ed1-f68.google.com'
	FROM:'natechancellor@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.11  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	SPF_PASS) 209.85.208.68 mail-ed1-f68.google.com 209.85.208.68
	mail-ed1-f68.google.com <natechancellor@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 30 Apr 2019 04:08:25 -0400
Cc: Nathan Chancellor <natechancellor@gmail.com>,
	clang-built-linux@googlegroups.com, dm-devel@redhat.com,
	Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org
Subject: [dm-devel] [PATCH] dm dust: Convert an 'else if' into an 'else' in
	dust_map
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Tue, 30 Apr 2019 08:08:47 +0000 (UTC)

When building with -Wsometimes-uninitialized, Clang warns:

drivers/md/dm-dust.c:216:11: warning: variable 'ret' is used
uninitialized whenever 'if' condition is false
[-Wsometimes-uninitialized]
        else if (bio_data_dir(bio) == WRITE)
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/bio.h:69:2: note: expanded from macro 'bio_data_dir'
        (op_is_write(bio_op(bio)) ? WRITE : READ)
        ^
drivers/md/dm-dust.c:219:9: note: uninitialized use occurs here
        return ret;
               ^~~
drivers/md/dm-dust.c:216:7: note: remove the 'if' if its condition is
always true
        else if (bio_data_dir(bio) == WRITE)
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/md/dm-dust.c:209:9: note: initialize the variable 'ret' to
silence this warning
        int ret;
               ^
                = 0
1 warning generated.

It isn't wrong; however, bio_data_dir will only ever return READ and
WRITE so the second 'else if' can really become an 'else' to silence
this warning and not change the final meaning of the code.

Link: https://github.com/ClangBuiltLinux/linux/issues/462
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/md/dm-dust.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-dust.c b/drivers/md/dm-dust.c
index 997830984893..5baeb56679ed 100644
--- a/drivers/md/dm-dust.c
+++ b/drivers/md/dm-dust.c
@@ -213,7 +213,7 @@ static int dust_map(struct dm_target *ti, struct bio *bio)
 
 	if (bio_data_dir(bio) == READ)
 		ret = dust_map_read(dd, bio->bi_iter.bi_sector, dd->fail_read_on_bb);
-	else if (bio_data_dir(bio) == WRITE)
+	else
 		ret = dust_map_write(dd, bio->bi_iter.bi_sector, dd->fail_read_on_bb);
 
 	return ret;
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
