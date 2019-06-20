Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8A14E162
	for <lists+dm-devel@lfdr.de>; Fri, 21 Jun 2019 09:52:57 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2035E2F8BCD;
	Fri, 21 Jun 2019 07:52:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB9D760BFB;
	Fri, 21 Jun 2019 07:52:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B2AE0206D2;
	Fri, 21 Jun 2019 07:51:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5KHpSgk021124 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 20 Jun 2019 13:51:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8F99719C5B; Thu, 20 Jun 2019 17:51:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7143E19C4F;
	Thu, 20 Jun 2019 17:51:24 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9A01F85363;
	Thu, 20 Jun 2019 17:51:06 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id b11so3074405lfa.5;
	Thu, 20 Jun 2019 10:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AsRTx4UMMXAfahNHVbziSWvG8kO/9PcJpiP01Kyu5Js=;
	b=tzB/GDzWW4jmxpmIFCkF95zygclqgkxQJoRNoMuLL/EegtZpxURbz6ZhhwfpYvw2Mn
	OOFzJuzbx+t4wIabY1fafDcWapP8wR4H++suVOEVSASIpqlo7kjhSOTz37k2t4DV3mhK
	1OFtMS7nVO3YmC5LYPmKX/ZOrwyqsqKHkQNWeiSMmVgN+iWDVgh1+B20FG2kXQFNsphi
	aDtbsTIVgKLs5K8nXbk6czH2pJlyQES4YmPjXv6d8NF4U8WeCLQigA/muZQuMQnnyp+9
	TCqBs7O4xS2goCMn+iYpbeRM7mvLgR7820spsONideUN2vcR84H9/58pV/k5h2B0moZE
	7wEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AsRTx4UMMXAfahNHVbziSWvG8kO/9PcJpiP01Kyu5Js=;
	b=cjDDdXgaHWONffW509R+XOjiL0VxJXl8CeDPJOAIhxrvQpQrXcRXiE56XiTEykDRLh
	bbD7UH57psp8ErPDDqTDbE1HvOc3qShKbW3vzNJ+GWjf6vT1P22BSKfHsdgzUEcfh3ph
	j7IOMEMquG+4K7VB1ts4j01KxOhrYVu5LJXaaO1xg+AvhZ0LrvOwQfwXaBaJmpGVU/R9
	Lelm8UqrK/ROO5FXvLtAkuLIoaxkAQvuIt6FalVAjkPagk72SMVcfXM0hBt8PX+RpyDa
	/S1H1AYRcUOjdt3iRmuYoYPj5RlG0GkgI7i0aQnNM1MGLq4W7fbO0rj3wWW5kf4On0sD
	Tj6Q==
X-Gm-Message-State: APjAAAWk8wMq4VGU8VjL9VolKWTo9K+0hY0dD5umOrmAvkZVnXMaXcvO
	F9s2QzPJjJn8Lyogqq3cobMs6XMkS4E=
X-Google-Smtp-Source: APXvYqyqJWJnaIZUD++ayUZE/WMaQlPYn3FaFe+T+Uomi2M9CfPKiUcqIQS6VpKQDy2uBV4oww56AA==
X-Received: by 2002:ac2:4152:: with SMTP id c18mr15303553lfi.144.1561053064829;
	Thu, 20 Jun 2019 10:51:04 -0700 (PDT)
Received: from localhost.localdomain
	(mm-56-110-44-37.mgts.dynamic.pppoe.byfly.by. [37.44.110.56])
	by smtp.gmail.com with ESMTPSA id d5sm44341lfc.96.2019.06.20.10.51.03
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 20 Jun 2019 10:51:04 -0700 (PDT)
From: "Pavel Begunkov (Silence)" <asml.silence@gmail.com>
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com, linux-kernel@vger.kernel.org
Date: Thu, 20 Jun 2019 20:50:50 +0300
Message-Id: <08f06799d0336322ae85b3f8ba3acfb68180a96d.1561052999.git.asml.silence@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 20 Jun 2019 17:51:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Thu, 20 Jun 2019 17:51:06 +0000 (UTC) for IP:'209.85.167.67'
	DOMAIN:'mail-lf1-f67.google.com' HELO:'mail-lf1-f67.google.com'
	FROM:'asml.silence@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.107  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_NONE) 209.85.167.67 mail-lf1-f67.google.com 209.85.167.67
	mail-lf1-f67.google.com <asml.silence@gmail.com>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 21 Jun 2019 03:51:06 -0400
Cc: Pavel Begunkov <asml.silence@gmail.com>
Subject: [dm-devel] [PATCH 1/1] dm: Update comment
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Fri, 21 Jun 2019 07:52:56 +0000 (UTC)

From: Pavel Begunkov <asml.silence@gmail.com>

Since Commit a1ce35fa49852db60fc6e268 ("block: remove dead elevator
code") blk_end_request() has been replaced with blk_mq_end_request().
Update comment

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 drivers/md/dm-rq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-rq.c b/drivers/md/dm-rq.c
index 5f7063f05ae0..c9e44ac1f9a6 100644
--- a/drivers/md/dm-rq.c
+++ b/drivers/md/dm-rq.c
@@ -115,7 +115,7 @@ static void end_clone_bio(struct bio *clone)
 
 	/*
 	 * Update the original request.
-	 * Do not use blk_end_request() here, because it may complete
+	 * Do not use blk_mq_end_request() here, because it may complete
 	 * the original request before the clone, and break the ordering.
 	 */
 	if (is_last)
-- 
2.22.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
