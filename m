Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D40C412290
	for <lists+dm-devel@lfdr.de>; Thu,  2 May 2019 21:28:53 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B0A5E307D962;
	Thu,  2 May 2019 19:28:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E98035C1B4;
	Thu,  2 May 2019 19:28:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E11F518089CA;
	Thu,  2 May 2019 19:28:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x42JQPNm017763 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 May 2019 15:26:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A0F279CC8; Thu,  2 May 2019 19:26:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4516C423D;
	Thu,  2 May 2019 19:26:23 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9BB93307D978;
	Thu,  2 May 2019 19:26:22 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id e9so4975447wrc.1;
	Thu, 02 May 2019 12:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xGGGtkbSpab2fonwxC7mM4OWAA6cmmYUnKpgSA30iaM=;
	b=JwejC6TwvOd7y6c+i0pTNThXwpqinC53TTXjKGTvVUTNz5xvIZhgKx7l4nuvrfedP/
	18W9vUk2Sp0vkFa8pMey4lYuJ3pTaknLMppG7cSpNHLxqtG3Ou+wW43s+oobmHI5ewP8
	a5bULNwHKZ2kavRdvmDuyzH6RqNTPEpoBYWJk7p/LQBbPgs9X508jv9/7EQ7FzfolZ7E
	PBhcdhxsQhFVpoShSNlCR71tCmHPsA7tl+T34DMFdBGJ0VYOYqXRPV2/pMsHpBszaFgR
	jP3ZvWJh3oNllB56k37UAIyRlp7TU5SHKFsZUv5BMw21f3tWTfHrgZ5Xjdf6FOBAtQYy
	JpBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xGGGtkbSpab2fonwxC7mM4OWAA6cmmYUnKpgSA30iaM=;
	b=tkTPEeWQJLcD7867vetMO8ec43MIxFfm+kymoezrXtRIPfSiLXcK4TQRnr6meoshZj
	bEKVVCvc94e+US37RHQeF01EScbBNBf4G5gvbepoZcEk6t9e8nZw0c4df26V79UiqC56
	C08LrE+9Jqo8vFQvH810wysjpxdViXNU/KDLKeTzipYgg5PYvY6UR32jvNfxH5gVYz6q
	/Gk/eMZ1ddeOGThHfyjZzl+rJSuP07Eo1DJCxbQwm9stbvoPofwTOKVdBhdtl6JnOjrG
	nyWgcuQ2VuOQOo30b72dEEG/yRfNDvoIswTIBmrGkITJSnmCAjIRHqK8gLRD9QZDx27t
	zQoQ==
X-Gm-Message-State: APjAAAWmQn5TeHwE9BRUFB3Ecjpe4yX2oqundDHRdAuwImcH5GowZ9iy
	d3+1eC0nDvyqy9/jM6cCTA==
X-Google-Smtp-Source: APXvYqyNGYF9e+CWBpW9fZmarB6+Cw1MQVtvJdh51hhMqTSM1og7fcqwMrTgqzOCSuMZte3YFHpG4g==
X-Received: by 2002:adf:ec06:: with SMTP id x6mr3883915wrn.80.1556825181147;
	Thu, 02 May 2019 12:26:21 -0700 (PDT)
Received: from localhost (101.red-83-33-153.dynamicip.rima-tde.net.
	[83.33.153.101])
	by smtp.gmail.com with ESMTPSA id s6sm65260wmh.22.2019.05.02.12.26.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 02 May 2019 12:26:20 -0700 (PDT)
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
To: 
Date: Thu,  2 May 2019 21:26:19 +0200
Message-Id: <20190502192619.31264-1-xose.vazquez@gmail.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Thu, 02 May 2019 19:26:22 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Thu, 02 May 2019 19:26:22 +0000 (UTC) for IP:'209.85.221.65'
	DOMAIN:'mail-wr1-f65.google.com' HELO:'mail-wr1-f65.google.com'
	FROM:'xose.vazquez@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.11  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	SPF_PASS) 209.85.221.65 mail-wr1-f65.google.com 209.85.221.65
	mail-wr1-f65.google.com <xose.vazquez@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Xose Vazquez Perez <xose.vazquez@gmail.com>,
	DM-DEVEL ML <dm-devel@redhat.com>
Subject: [dm-devel] [PATCH] multipath-tools: document missing multipathd
	option at man page
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Thu, 02 May 2019 19:28:52 +0000 (UTC)

 -w was added in 2858c60a34527401381ea6b13cf316c3e5064383

Cc: Benjamin Marzinski <bmarzins@redhat.com>
Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
Cc: DM-DEVEL ML <dm-devel@redhat.com>
Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
---
 multipathd/multipathd.8 | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/multipathd/multipathd.8 b/multipathd/multipathd.8
index 94c3f97..edac7a9 100644
--- a/multipathd/multipathd.8
+++ b/multipathd/multipathd.8
@@ -25,6 +25,7 @@ multipathd \- Multipath daemon.
 .RB [\| \-v\ \c
 .IR verbosity \|]
 .RB [\| \-B \|]
+.RB [\| \-w \|]
 .
 .
 .\" ----------------------------------------------------------------------------
@@ -77,6 +78,12 @@ be viewed by entering '\fIhelp\fR'. When you are finished entering commands, pre
 multipathd. See
 .BR multipath.conf(5).
 .
+.TP
+.B \-w
+Since kernel 4.14 a new device-mapper event polling interface is used for updating
+multipath devices on dmevents. Use this flag to force it to use the old event
+waiting method, based on creating a seperate thread for each device.
+.
 .
 .
 .\" ----------------------------------------------------------------------------
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
