Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 6042419DC7D
	for <lists+dm-devel@lfdr.de>; Fri,  3 Apr 2020 19:16:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585934175;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IsAAS5/5tK2zapXbU56wwNCOqGR7bVxQqCdpFBmc6tU=;
	b=gWAwvk0V5sC/MYNvIqpPZryFsi8m/sZtZOIdZbvRnKeBujT3WpdA6Ln/vZhmKY1a/H0HrN
	WAlvp6QqlDIR1B9xBFl6iGAWXgmP3IyVlnHv7yym7ivbikriiju1ioZyB+KCmYolACM84P
	2hehbJoujnaUjN+XVXV6MZ9I5w8gzS4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-vtHhrIclOe-c5MBAkB9KeA-1; Fri, 03 Apr 2020 13:16:12 -0400
X-MC-Unique: vtHhrIclOe-c5MBAkB9KeA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 338F2107ACCA;
	Fri,  3 Apr 2020 17:16:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A23A60BF1;
	Fri,  3 Apr 2020 17:16:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CCF544E44E;
	Fri,  3 Apr 2020 17:16:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 033HFr8C002609 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 3 Apr 2020 13:15:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6F1482022EA7; Fri,  3 Apr 2020 17:15:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AC562022EA4
	for <dm-devel@redhat.com>; Fri,  3 Apr 2020 17:15:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2C3D8FF67D
	for <dm-devel@redhat.com>; Fri,  3 Apr 2020 17:15:50 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-246-JHqYe9NsMWKU0ByTleczSg-1; Fri, 03 Apr 2020 13:15:46 -0400
X-MC-Unique: JHqYe9NsMWKU0ByTleczSg-1
Received: by mail-qk1-f195.google.com with SMTP id z15so2585965qki.7;
	Fri, 03 Apr 2020 10:15:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to;
	bh=fUWELD5SV8bxPQCRNQ9kZEOE/DoXXWPQ2inGCUBvAoI=;
	b=C/mx+E7BuXOIvSnRs7uVaJ4FiA9qyoDOcY6riBblbbXEnBZhs5U3o9YutMMlmi7+8l
	pemonsD0lD3wpcNwCPZCeEX86zWcYty2EnydthuhnP/6s7VLQaWQvoZQaHjjv3jggrJS
	r8P/8y2Cw3EbllNMeE8KFjSMbT2sKGqV34/spX/bPg47ZFjRShUig3fzn7MPyQvS7yqH
	OIQEK3XNPg7/yLyS0AVAO/VzCQMQJ8q3+837Vpz7qX8wTvW6dfOJsoDo2/SH94wD1lKP
	cMRte3ZqBDQIS7E43yv/7mwOnWbo0UPplE0HajwogxFZdL4yoEeQ3Py95VBmLADSCWCm
	VpYg==
X-Gm-Message-State: AGi0Pub5Od7gVe2F40Dyf/EYPfYgMLc2yC714WkKffe0peHxTY1CC18a
	MWgjp0rpEaBv7JFuSN7vgU8=
X-Google-Smtp-Source: APiQypLx7cZ5QXGUPKBpKJm5QxHmon+RGMr5vp8vQGDLg+jiCPXE4jJM5Pepu9xZN17NdXj9NL8jUQ==
X-Received: by 2002:a05:620a:1f1:: with SMTP id
	x17mr10203564qkn.60.1585934145987; 
	Fri, 03 Apr 2020 10:15:45 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52])
	by smtp.gmail.com with ESMTPSA id v1sm7025822qtc.30.2020.04.03.10.15.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 03 Apr 2020 10:15:45 -0700 (PDT)
Date: Fri, 3 Apr 2020 13:15:43 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20200403171543.GA92499@lobo>
References: <20200403154213.GA18386@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200403154213.GA18386@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 033HFr8C002609
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>, Alasdair G Kergon <agk@redhat.com>
Subject: [dm-devel] [git pull v2] device mapper fixes for 5.7
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Linus,

I updated the tag after my initial pull request to include one more
fix from Mikulas.

The following changes since commit 81d5553d1288c2ec0390f02f84d71ca0f0f9f137:

  dm clone metadata: Fix return type of dm_clone_nr_of_hydrated_regions() (2020-03-27 14:42:51 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.7/dm-fixes

for you to fetch changes up to 8267d8fb4819afa76b2a54dca48efdda6f0b1910:

  dm integrity: fix logic bug in integrity tag testing (2020-04-03 13:07:41 -0400)

Please pull, thanks!
Mike

----------------------------------------------------------------
- Fix excessive bio splitting that caused performance regressions.

- Fix logic bug in DM integrity discard support's integrity tag
  testing.

- Fix DM integrity warning on ppc64le due to missing cast.

----------------------------------------------------------------
Mike Snitzer (2):
      dm integrity: fix ppc64le warning
      Revert "dm: always call blk_queue_split() in dm_process_bio()"

Mikulas Patocka (1):
      dm integrity: fix logic bug in integrity tag testing

 drivers/md/dm-integrity.c | 4 ++--
 drivers/md/dm.c           | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

