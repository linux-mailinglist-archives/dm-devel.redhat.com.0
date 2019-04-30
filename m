Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D2010326
	for <lists+dm-devel@lfdr.de>; Wed,  1 May 2019 01:11:40 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8AC9BC058CA4;
	Tue, 30 Apr 2019 23:11:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BDCAE18979;
	Tue, 30 Apr 2019 23:11:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 805373FA46;
	Tue, 30 Apr 2019 23:11:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3UNBP00023946 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 30 Apr 2019 19:11:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 18DF5629BF; Tue, 30 Apr 2019 23:11:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1399A62964
	for <dm-devel@redhat.com>; Tue, 30 Apr 2019 23:11:22 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 53EAF3084242
	for <dm-devel@redhat.com>; Tue, 30 Apr 2019 23:11:22 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id x15so7435157pln.9
	for <dm-devel@redhat.com>; Tue, 30 Apr 2019 16:11:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:in-reply-to
	:references:date:mime-version:content-transfer-encoding;
	bh=FXARXwM4QgylrliYg9gnUX5NvhFipcGymsRDeHVQDJI=;
	b=VH9gy8xp+gv2fw6xCXEyxWlkyVXQ8CtvxMYSTn7RxJgXG4d9UFcNqN8VDgCW7NGv+B
	bcfZI0Eb1Yhr8+w+tY6SGxjgtqJD2WgY/xBUEdyBfV4nDnpmaWuqW4EA/y6Rpxu6JtKR
	qMZw9SkPaDThmhoPtoW7eLawuxDqAK8SEUHZG3PGCCc1b4fTy8SiYZuTIqsBS6GI8xIv
	Fnzab9bCppb8sPQJ2ykXGPw+tys0IjusMnL9lwKzS+vw1R818SaWBUgVC2j43kkKmeU0
	TCfRc+3TmFxFWnAKugzwH6beuokeuHCS7/Sjsfz/2Xk1Msr5bldINoI81jBTTRLdRLaH
	2CJw==
X-Gm-Message-State: APjAAAVIrtAzXYxmYAhJ7UxzZeuAfIjLL5e8zTMIVCZwCczZr6RQt4fx
	LITnR/gDdHk+QLYCXiWZZVk=
X-Google-Smtp-Source: APXvYqys1BucDtRUXPE4Fmk0HX7m44pS+2KC6COLjJjMw17jqNuDtWeHvo+lbF0SCeqblFlEPlmj1g==
X-Received: by 2002:a17:902:b715:: with SMTP id
	d21mr73635351pls.103.1556665881547; 
	Tue, 30 Apr 2019 16:11:21 -0700 (PDT)
Received: from ?IPv6:2620:15c:2cd:203:5cdc:422c:7b28:ebb5?
	([2620:15c:2cd:203:5cdc:422c:7b28:ebb5])
	by smtp.gmail.com with ESMTPSA id
	f63sm62903342pfc.180.2019.04.30.16.11.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 30 Apr 2019 16:11:20 -0700 (PDT)
Message-ID: <1556664925.161891.183.camel@acm.org>
From: Bart Van Assche <bvanassche@acm.org>
To: "Guilherme G. Piccoli" <gpiccoli@canonical.com>,
	linux-block@vger.kernel.org, linux-raid@vger.kernel.org
In-Reply-To: <20190430223722.20845-1-gpiccoli@canonical.com>
References: <20190430223722.20845-1-gpiccoli@canonical.com>
Date: Tue, 30 Apr 2019 15:55:25 -0700
Mime-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Tue, 30 Apr 2019 23:11:22 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Tue, 30 Apr 2019 23:11:22 +0000 (UTC) for IP:'209.85.214.195'
	DOMAIN:'mail-pl1-f195.google.com'
	HELO:'mail-pl1-f195.google.com' FROM:'bart.vanassche@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.118  (FREEMAIL_FORGED_FROMDOMAIN, FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL,
	SPF_PASS) 209.85.214.195 mail-pl1-f195.google.com 209.85.214.195
	mail-pl1-f195.google.com <bart.vanassche@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, kernel@gpiccoli.net, stable@vger.kernel.org,
	dm-devel@redhat.com, jay.vosburgh@canonical.com, gavin.guo@canonical.com
Subject: Re: [dm-devel] [PATCH 1/2] block: Fix a NULL pointer dereference in
 generic_make_request()
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
Content-Type: multipart/mixed; boundary="===============4376574408094216326=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Tue, 30 Apr 2019 23:11:39 +0000 (UTC)

--===============4376574408094216326==
Content-Type: text/plain; charset="UTF-7"
Content-Transfer-Encoding: 7bit

On Tue, 2019-04-30 at 19:37 -0300, Guilherme G. Piccoli wrote:
+AD4 Commit 37f9579f4c31 (+ACI-blk-mq: Avoid that submitting a bio concurrently
+AD4 with device removal triggers a crash+ACI) introduced a NULL pointer
+AD4 dereference in generic+AF8-make+AF8-request(). The patch sets q to NULL and
+AD4 enter+AF8-succeeded to false+ADs right after, there's an 'if (enter+AF8-succeeded)'
+AD4 which is not taken, and then the 'else' will dereference q in
+AD4 blk+AF8-queue+AF8-dying(q).
+AD4 
+AD4 This patch just moves the 'q +AD0 NULL' to a point in which it won't trigger
+AD4 the oops, although the semantics of this NULLification remains untouched.
+AD4 
+AD4 A simple test case/reproducer is as follows:
+AD4 a) Build kernel v5.1-rc7 with CONFIG+AF8-BLK+AF8-CGROUP+AD0-n.
+AD4 
+AD4 b) Create a raid0 md array with 2 NVMe devices as members, and mount it
+AD4 with an ext4 filesystem.
+AD4 
+AD4 c) Run the following oneliner (supposing the raid0 is mounted in /mnt):
+AD4 (dd of+AD0-/mnt/tmp if+AD0-/dev/zero bs+AD0-1M count+AD0-999 +ACY)+ADs sleep 0.3+ADs
+AD4 echo 1 +AD4 /sys/block/nvme0n1/device/device/remove
+AD4 (whereas nvme0n1 is the 2nd array member)

Reviewed-by: Bart Van Assche +ADw-bvanassche+AEA-acm.org+AD4



--===============4376574408094216326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============4376574408094216326==--
