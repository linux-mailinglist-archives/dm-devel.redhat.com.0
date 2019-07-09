Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF57636E0
	for <lists+dm-devel@lfdr.de>; Tue,  9 Jul 2019 15:25:39 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4403A308792F;
	Tue,  9 Jul 2019 13:25:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C05E51C68;
	Tue,  9 Jul 2019 13:25:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5AA2A1833004;
	Tue,  9 Jul 2019 13:24:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x69DMiMU006670 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 9 Jul 2019 09:22:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E017895A59; Tue,  9 Jul 2019 13:22:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB09C5C2F0
	for <dm-devel@redhat.com>; Tue,  9 Jul 2019 13:22:42 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 51535C05B03F
	for <dm-devel@redhat.com>; Tue,  9 Jul 2019 13:22:28 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id p17so9850266wrf.11
	for <dm-devel@redhat.com>; Tue, 09 Jul 2019 06:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4G+jRC+EC9e/KVmmiXvmsg0Zi3cMg8CUY8CschsuKQA=;
	b=gsXFvetHSnIsmNU4E1IOFvnDeEoZQJi5K20Hx2T8alJg+KR0vVTL1sInO+K+NMPRfA
	oJA+aH/M9hVGpw1CfcjhyXCgSnbZJaYKj98QGvYToRfUEomeOiAKZSMiQAhm3W308P0x
	kJKy4tz77adTHN6WbPMkkpkznJReuIkuLxbSgI6YZZoKDJfWCPorhgmBC6qE9yWSZD3x
	T70J7572oCl54ycNc+Z2vJhEtMotVe/EVZSwMi8V2mu7PNlrQvgL/7uDaVAafV4fubdg
	FLc407SIKlTOPcIRVW4ajwQDm47RkhoxDG2En//vsnuW3Vn8G5VRVPGiEFcCzJXOHh+E
	vtCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4G+jRC+EC9e/KVmmiXvmsg0Zi3cMg8CUY8CschsuKQA=;
	b=c70iSdIIEh0pVA6FlhjrFx1Oo5gNNFs6Oh32djNvDVQjGTfy/gLeYNGBJ7tXe/2gb5
	OLc6lk4FIShTSZIYkC50boxK8lOz2z5DvjdQAStOKiNpMG/DaRTNoNGOdxI8UoIJNw5W
	76gCOktxvHerG11yymB8nLaCQzXnalCmn7A4WnI5xj1Ry/dC9U0hVGOcSmFYCiymjeKy
	2tWjpOt4TQTeRxUWyMKUT6/kq1SRfwzT76Rh9GcqDgCcBk6TS9FHzfT0koACD9LOscNR
	39TeuIDgSWOt3HUXPplkLhhDJ+0m0rKYg7G694E1X0ztTEVMADTPSMgqpFo57BO4YhRW
	yZLQ==
X-Gm-Message-State: APjAAAUxyyGS6XOXVQ2ixJTRyrkPesfR90n/4ZVTFbLfrsUWz7eG5FdG
	VVSO6NpUwFNEbuevA0Xs6d7SZ/aCPuk=
X-Google-Smtp-Source: APXvYqysaTDr9Apot1xQB04/DCGITLrKOVXT1l+fNdMbxB8w2PX8NaxLbi80xoh+skNc0/OKRqsREg==
X-Received: by 2002:adf:f84a:: with SMTP id d10mr24700580wrq.319.1562678546751;
	Tue, 09 Jul 2019 06:22:26 -0700 (PDT)
Received: from merlot.mazyland.net (nat-pool-brq-t.redhat.com. [213.175.37.10])
	by smtp.googlemail.com with ESMTPSA id
	z25sm3533319wmf.38.2019.07.09.06.22.25
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 09 Jul 2019 06:22:26 -0700 (PDT)
From: Milan Broz <gmazyland@gmail.com>
To: dm-devel@redhat.com
Date: Tue,  9 Jul 2019 15:22:12 +0200
Message-Id: <20190709132214.3905-1-gmazyland@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 09 Jul 2019 13:22:28 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Tue, 09 Jul 2019 13:22:28 +0000 (UTC) for IP:'209.85.221.68'
	DOMAIN:'mail-wr1-f68.google.com' HELO:'mail-wr1-f68.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: 1.194 * (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, PDS_NO_HELO_DNS, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.68 mail-wr1-f68.google.com 209.85.221.68
	mail-wr1-f68.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 09 Jul 2019 09:24:28 -0400
Cc: Milan Broz <gmazyland@gmail.com>
Subject: [dm-devel] [PATCH v2 1/3] dm-crypt: Wipe private IV struct after
	key invalid flag is set.
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Tue, 09 Jul 2019 13:25:37 +0000 (UTC)

If a private IV wipe function fails, the code does not set the key
invalid flag. This patch moves code after the flag is set and
prevents the device resume in an inconsistent state.

Also, it allows using of a randomized key in private wipe function
(to be used later patches).

Signed-off-by: Milan Broz <gmazyland@gmail.com>
---
 drivers/md/dm-crypt.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 0fd3ca9bfe54..0e24079e97da 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -2158,6 +2158,14 @@ static int crypt_wipe_key(struct crypt_config *cc)
 
 	clear_bit(DM_CRYPT_KEY_VALID, &cc->flags);
 	get_random_bytes(&cc->key, cc->key_size);
+
+	/* Wipe IV private keys */
+	if (cc->iv_gen_ops && cc->iv_gen_ops->wipe) {
+		r = cc->iv_gen_ops->wipe(cc);
+		if (r)
+			return r;
+	}
+
 	kzfree(cc->key_string);
 	cc->key_string = NULL;
 	r = crypt_setkey(cc);
@@ -3050,14 +3058,8 @@ static int crypt_message(struct dm_target *ti, unsigned argc, char **argv,
 				memset(cc->key, 0, cc->key_size * sizeof(u8));
 			return ret;
 		}
-		if (argc == 2 && !strcasecmp(argv[1], "wipe")) {
-			if (cc->iv_gen_ops && cc->iv_gen_ops->wipe) {
-				ret = cc->iv_gen_ops->wipe(cc);
-				if (ret)
-					return ret;
-			}
+		if (argc == 2 && !strcasecmp(argv[1], "wipe"))
 			return crypt_wipe_key(cc);
-		}
 	}
 
 error:
-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
