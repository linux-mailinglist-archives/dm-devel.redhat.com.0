Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0D7B0EAC
	for <lists+dm-devel@lfdr.de>; Thu, 12 Sep 2019 14:14:36 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 323ED302C076;
	Thu, 12 Sep 2019 12:14:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EF7B5C22F;
	Thu, 12 Sep 2019 12:14:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B938283541;
	Thu, 12 Sep 2019 12:14:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8CCBxwG007982 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 12 Sep 2019 08:11:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0F5906017E; Thu, 12 Sep 2019 12:11:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx27.extmail.prod.ext.phx2.redhat.com
	[10.5.110.68])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 087F66013A
	for <dm-devel@redhat.com>; Thu, 12 Sep 2019 12:11:56 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 58D568BA2DA
	for <dm-devel@redhat.com>; Thu, 12 Sep 2019 12:11:55 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id t16so28181990wra.6
	for <dm-devel@redhat.com>; Thu, 12 Sep 2019 05:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arrikto-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=xfqQeVuNFaNpXY3l2Qf2SV2rS45gt/EwiQdF/MMFQ+8=;
	b=p2g/c5MbCbCtGlsqVjgliicekZ3AVqhnqprPPmWPyujLN+LeLooJzhkayI/VHdsOP3
	6ZJK1oKiF9x0Hl3d6MleUzizzvBZd2lt288T0KtdyCvFrKfBW5dHymwpyu978zRYDXwf
	P4/GagrK0vEm+Ar2pwo5oCoONL52PDjBc0/q12ZmmgTBclakSI0ODdPhxt/xwwvJAcxp
	X0uUu2RhyYyDg6nX7Rzc6sTm0D8bamxk4J4Jc3VSExj8+ofNofvHlnUu2B+XFS8JfIE5
	iRGZv6EapU24httJE+BV7OIu707zwzzzcdH7raVAHc12yFevL8o5Yv/TJp54hy3eldSu
	jDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xfqQeVuNFaNpXY3l2Qf2SV2rS45gt/EwiQdF/MMFQ+8=;
	b=NdtyyNBRtBzOTRtAr+ZvfJN7GrAhUPvs1Z6QLk3/1Ug75t0hOpfu5aIu4c1ooPNOwQ
	xJ38gl3peUu/8Sjv0gSMOrGx97W6nZeBt7+CHQC9Br8ZmP1N0F5VcrCBwOkKwoUQ/zCK
	QK4yCqRr7jnbX4Xo02iUy0AXjLZ5iL0RNIWHk+/FTm3h2L+2bpysdo+vbysaBYFGV8m7
	hy5yDkT5k6vdHma+cwQL6oMeAqyhCT8ITAsUb2LQmjZhJU54C+QN01UHDcV8j0JFShXy
	oBpDQ/omWvVWTK0c6xm29Gts9nbVs3SoqZV/nKsIrcqfWvIFkSWO/4U8GTpX2BkkRaAN
	ROGQ==
X-Gm-Message-State: APjAAAXqbUlkgWFmU50ikHDue8L422Rt9H20OanlnqEgdC2N2b7/CKMP
	EEiGS37LZZ9FeGPBd3mYedX1/g==
X-Google-Smtp-Source: APXvYqxyIdHKR3Xj8sare9atbFzKSw8Fa0kwDNaCxVSKUxKYPQoaYtLhkvVWeGYxDHvUmawReaeEJw==
X-Received: by 2002:adf:db0f:: with SMTP id s15mr14829477wri.120.1568290313031;
	Thu, 12 Sep 2019 05:11:53 -0700 (PDT)
Received: from snf-864.vm.snf.arr ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id
	v8sm38636526wra.79.2019.09.12.05.11.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Sep 2019 05:11:52 -0700 (PDT)
From: Nikos Tsironis <ntsironis@arrikto.com>
To: snitzer@redhat.com, agk@redhat.com, dm-devel@redhat.com
Date: Thu, 12 Sep 2019 15:11:35 +0300
Message-Id: <20190912121137.26567-1-ntsironis@arrikto.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.68]);
	Thu, 12 Sep 2019 12:11:55 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]);
	Thu, 12 Sep 2019 12:11:55 +0000 (UTC) for IP:'209.85.221.65'
	DOMAIN:'mail-wr1-f65.google.com' HELO:'mail-wr1-f65.google.com'
	FROM:'ntsironis@arrikto.com' RCPT:''
X-RedHat-Spam-Score: -0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.65 mail-wr1-f65.google.com 209.85.221.65
	mail-wr1-f65.google.com <ntsironis@arrikto.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.68
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: vkoukis@arrikto.com, ntsironis@arrikto.com, iliastsi@arrikto.com
Subject: [dm-devel] [PATCH 0/2] dm clone: Minor fixes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Thu, 12 Sep 2019 12:14:35 +0000 (UTC)

Hi Mike,

I examined the diff between v3 of dm-clone and the staged version and it
looks fine.

This patch set includes some minor fixes to fold in:

  - Rename 'md' to 'cmd' also in dm-clone-metadata.h, to be consistent
    with the changes in dm-clone-metadata.c

  - Explicitly include the header file for kvmalloc(). This is not
    strictly required, as the header file is included indirectly by
    other header files, but I think it's safer to include it anyway.

Thanks,
Nikos

Nikos Tsironis (2):
  dm clone metadata: Rename md to cmd
  dm clone: Explicitly include header file for kvmalloc()

 drivers/md/dm-clone-metadata.c |  1 +
 drivers/md/dm-clone-metadata.h | 36 ++++++++++++++++++------------------
 drivers/md/dm-clone-target.c   |  1 +
 3 files changed, 20 insertions(+), 18 deletions(-)

-- 
2.11.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
