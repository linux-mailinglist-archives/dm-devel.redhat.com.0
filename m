Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F397A2A1
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jul 2019 09:55:52 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2A41530C1E1B;
	Tue, 30 Jul 2019 07:55:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD6231001B07;
	Tue, 30 Jul 2019 07:55:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 70DB01972D;
	Tue, 30 Jul 2019 07:55:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6TKW9jl028601 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jul 2019 16:32:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 651065C1B4; Mon, 29 Jul 2019 20:32:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DD465C1A1
	for <dm-devel@redhat.com>; Mon, 29 Jul 2019 20:32:07 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 86ACD4E82F
	for <dm-devel@redhat.com>; Mon, 29 Jul 2019 20:32:06 +0000 (UTC)
Received: from mail-pg1-f200.google.com ([209.85.215.200])
	by youngberry.canonical.com with esmtps
	(TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <gpiccoli@canonical.com>) id 1hsCJR-0001qG-8G
	for dm-devel@redhat.com; Mon, 29 Jul 2019 20:32:05 +0000
Received: by mail-pg1-f200.google.com with SMTP id n3so29134412pgh.12
	for <dm-devel@redhat.com>; Mon, 29 Jul 2019 13:32:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VMfAWDCqrjBeE42rbQCRmwqZEuUIVCeOcgzSaEx81J8=;
	b=YQXLOpz8C+/J24qX+h9kS/hy+aBS7HG+9w2mM9b8Lk8oY7qHBIHCQnVF0hcw9qbShr
	UGocEyL7JymS2mjVQoZRsY2B0wZGODZ0ReVLwjyxGzqzx2drVr6ra7GlEGRtskUXzOid
	jmwMYvMPfACm8Pc+6/ws9Kvilz0k9u0fThCR1lI2Ak8uSt+mHjJ9zivPAEcuvI8GcpJC
	aPHUMQdheGM7MINeNmgbjFGD2DK6Ob96SLeMQmtARecIhwVzj+R05FBk8999s8N4laCj
	M+WzyE20KB0f6+NYAUrAdq3py15XlQBO5qxb0rHj8pPU6rCcqF/9ft0n3StaVG2jUKvv
	vQIg==
X-Gm-Message-State: APjAAAVjPt9Xq8p24iBYBd4aDAx5mNeVXmdMww1mTEjVOmQOI10IA8c8
	9BCccISDDJVcmrJO5mSAJsEfO7+J6cHMkMBuPYTpbluUZb/EHIncW600T5X8jzHT/ewPHvZ/RNW
	yrzI83PsSCiw/r1RW4JL5XEHuRnX2vA==
X-Received: by 2002:a17:902:788f:: with SMTP id
	q15mr113783956pll.236.1564432324027; 
	Mon, 29 Jul 2019 13:32:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy5CwXyWbTEeZiJ87HQ6jaOLVqakwH/nw+0O+WCPiV0SFTLFFtXdaAewFJs6dO9mSgODGZ6tA==
X-Received: by 2002:a17:902:788f:: with SMTP id
	q15mr113783942pll.236.1564432323845; 
	Mon, 29 Jul 2019 13:32:03 -0700 (PDT)
Received: from localhost ([152.254.214.186]) by smtp.gmail.com with ESMTPSA id
	i74sm122266922pje.16.2019.07.29.13.32.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Jul 2019 13:32:02 -0700 (PDT)
From: "Guilherme G. Piccoli" <gpiccoli@canonical.com>
To: linux-raid@vger.kernel.org
Date: Mon, 29 Jul 2019 17:31:33 -0300
Message-Id: <20190729203135.12934-1-gpiccoli@canonical.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.38]); Mon, 29 Jul 2019 20:32:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Mon, 29 Jul 2019 20:32:06 +0000 (UTC) for IP:'91.189.89.112'
	DOMAIN:'youngberry.canonical.com'
	HELO:'youngberry.canonical.com' FROM:'gpiccoli@canonical.com'
	RCPT:''
X-RedHat-Spam-Score: -4.998  (RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_NONE) 91.189.89.112 youngberry.canonical.com
	91.189.89.112 youngberry.canonical.com <gpiccoli@canonical.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 30 Jul 2019 03:55:28 -0400
Cc: songliubraving@fb.com, gpiccoli@canonical.com, neilb@suse.com,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	jay.vosburgh@canonical.com
Subject: [dm-devel] [PATCH 0/2] Introduce new raid0 state 'broken'
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Tue, 30 Jul 2019 07:55:50 +0000 (UTC)

Currently the md/raid0 device behaves quite differently of other block
devices when it comes to failure. While other md levels contain vast
logic to deal with failures, and other non-md devices like scsi disks
or nvme rely on a dying queue when they fail, md/raid0 for instance
does not signal failures if an array member is removed while the array
is mounted; in that case, udev signals the device removal but mdadm
cannot succeed in the STOP_ARRAY ioctl, since it's mounted.

This behavior was tentatively changed in the past to match the scsi/nvme
devices (see [0]), but this attempt was quite complex, it had some corner
cases and (the few) community reviews weren't generally positive.
So, we are trying again with a simpler approach this time.

This series introduces a new array state 'broken' (for raid0 only), which
mimics the state 'clean'. The main goal for this new state is a way to
signal the user that something is wrong with the array. We also included a
warn_once-style message in kernel log to alert the user when the array has
one failed member.

The series encompass changes in the kernel and in mdadm tool. To get the
'broken' state completely functional one requires both changes, but mdadm
and kernel can live without their counterpart changes (in case some users
gets an updated mdadm for example, but keeps using an old kernel).

This series does not affect at all the way md/raid0 will react to I/O
failures. It was discussed in [0] that it should be better if raid0 could
fail faster in case it gets a member removed; we just proposed a change in
that realm too (see [1]), but it seems better to have them reviewed/treated
separately.

This series was tested with raid0 arrays holding both an ext4 and xfs
filesystems. Thanks in advance for the reviews/feedbacks.
Cheers,


Guilherme


[0] lore.kernel.org/linux-block/20190418220448.7219-1-gpiccoli@canonical.com
[1] lore.kernel.org/linux-block/20190729193359.11040-1-gpiccoli@canonical.com


Guilherme G. Piccoli (1):
  md/raid0: Introduce new array state 'broken' for raid0

[kernel part]
 drivers/md/md.c    | 23 +++++++++++++++++++----
 drivers/md/md.h    |  2 ++
 drivers/md/raid0.c | 26 ++++++++++++++++++++++++++
 3 files changed, 47 insertions(+), 4 deletions(-)

[mdadm]
 Detail.c  | 16 ++++++++++++++--
 Monitor.c |  9 +++++++--
 maps.c    |  1 +
 mdadm.h   |  1 +
 mdmon.h   |  2 +-
 monitor.c |  4 ++--
 6 files changed, 26 insertions(+), 7 deletions(-)

-- 
2.22.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
